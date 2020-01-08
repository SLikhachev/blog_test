#import os
from datetime import datetime
#from pathlib import Path
from flask import request, current_app, g
#from werkzeug import secure_filename
from poly.reestr.task import RestTask
from poly.utils.fields import month_field
from poly.utils.exept import printException
from poly.reestr.xml.pack.sql_xml import make_xml
from poly.reestr.xml.pack import config_sql

class MakeXml(RestTask):

    def post(self):

        # here yar field is used
        self.get_task = config_sql.GET_XML_TASK
        self.set_task = config_sql.SET_XML_TASK

        time1 = datetime.now()

        year, month = month_field( request.form.get('month', '') )

        #  YAR field as flag
        if self.open_task(year):
            return self.out('', 'Расчет уже запущен', False)

        # pack number
        pack = request.form.get('pack', '01')
        
        ### if CHECK is  'check' then checlk only if 'ignore' then make reestr ignore errors 
        # if chek is True to check only, else make reestr ignore errors
        check= False
        if request.form.get('check', '') == 'check':
            check= True
        #if not check in ['check', 'ignore']:
        #    check= None

        # if SENT is None ignore already sent, produce full pack
        sent= False
        if request.form.get('sent', '') == 'sent':
            sent= True
        #current_app.logger.debug(year, month, pack, sent)
        try:
            ph, lm, file, errors = make_xml(current_app, year, month, pack, check, sent)
            # if check is check, file is csv errors file
            # if check is None, ignore, file is pack.zip
        except Exception as e:
            raise e
            #ex= printException()
            current_app.logger.debug( e )
            return self.close_task ('', f'Исключение: {e}', False)
        
        t= f'Время: {(datetime.now() - time1)}'
        z= f'H записей: {ph}, L записей: {lm} '
        if errors > 0:
            msg = f'{z}, НАЙДЕНО ОШИБОК: {errors}. {t}'
            done = False
            # file -> zip if check is False else error_pack.csv
        else:
            if check: # == 'check':
                file= ''
            # file is NONE if no errors found and no request for pack to make 
            
            msg = f'{z}. {t}'
            done= True
            
        return self.close_task (file, msg, done)
