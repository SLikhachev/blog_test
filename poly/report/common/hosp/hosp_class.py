import re, hashlib
from . import hosp_config as config
from datetime import date

class Hasher(object):
    def __init__(self):
        self.md5 = hashlib.md5()

    def __call__(self, o):
        self.md5.update(o.encode())
        _hash = self.md5.hexdigest()
        self.md5 = hashlib.md5()
        return _hash


class HospEir:
    
    CLEAR_TABLE = 'TRUNCATE TABLE %s'
        
    def __init__(self, db, logger):
        self.table = 'hospital'
        # self func return native python objects
        self.logger = logger
        self.none = lambda _ : None
        self.mo = dict()
        self.hash = Hasher()
        
        self.fields = (
            ("nap_num",  self.to_int), 
            ("nap_date", self.to_date),
            #("for_pom", self.get_for_pom),
            ("for_pom", self.none),
            #("usl_ok", self.get_usl_ok),
            ("usl_ok", self.get_usl),
            #("to_mo", self.get_mo),
            ("to_mo", self.get_mo_hash),
            ("date_hosp", self.to_date),
            ("p_ser", self.to_str),
            ("p_num", self.to_str),
            ("smo", self.get_smo),
            ("fam", self.to_str),
            ("im", self.to_str), 
            ("ot", self.to_str),
            ("date_birth", self.to_date),
            ("ds", self.get_ds),
            ("prof", self.none),
            ("hosp_stat", self.to_int),
            ("ann_stat", self.to_int),
            ("nap_hospl", self.to_int),
            ("date_hospl", self.to_date),
            #("mo_hospl", self.get_mo),
            ("mo_hospl", self.get_mo_hash),
            ("act_date_hospl", self.to_date),
            ("for_pom_hospl", self.get_pom),
            ("specfic", self.get_doc)
        )
        
        self.cols = ', '.join( [ '"%s"' % c for c, _ in self.fields] )
        self.vals = ', '.join( [ '%s' for _, _ in self.fields] )
        self.qonn = db
        self.qurs = db.cursor()
        self.napr= set()
        self.doctor = self.get_doctor()
        
    def clear_tbl(self):
        self.qurs.execute(HospEir.CLEAR_TABLE % self.table)
        self.qonn.commit()
        #print(' table truncated ')
        if self.logger:
            self.logger.info('table truncated')

    def get_doctor(self):
        self.qurs.execute(config.GET_DOCTOR)
        d = dict()
        for r in self.qurs.fetchall():
            spec, code, scode, fam = r
            d[scode] = (f'{spec}.{code}', fam)
        return d
        
    def to_str(self, val):
        if val == '':
            return None
        return val
    
    def to_int(self, val):
        if val == '':
            return None
        try:
            return int(val)
        except ValueError:
            return None
    
    def to_date(self, val):
        if val == '':
            return None
        try:
            d, m, y = val.split('.')
            return date(int(y), int(m), int(d))
        except Exception:
            return None
            
    def get_from_db(self, q):
        try:
            self.qurs.execute(q)
            v = self.qurs.fetchone()
            #print(v)
            if len(v) == 0:
                return None
            return v[0]
        except Exception:
            return None
    
    def get_for_pom(self, val):
        q = "select id from public.for_pom where name ilike '%s'" % val
        print(q)
        return self.get_from_db(q)
    
    def get_pom(self, val):
        try:
            return config.FOR_POM.index(val)
        except Exception:
            return 0
    
    def get_usl_ok(self, val):
        q = "select id from public.usl_ok where name ilike '%s'" % val
        return self.get_from_db(q)
    
    def get_usl(self, val):
        try:
            return config.USL.index(val)
        except Exception:
            return 0
    
    def get_mo_hash(self, val):
        hash = self.hash(val)
        mo = self.mo.get(hash, None)
        if mo is None:
            self.mo[hash] = val
        return hash
        
    def get_mo(self, val):
        q = "select scode from public.mo_local where similarity (name, '%s') > 0.9" % val
        #print(q)
        return self.get_from_db(q)
    
    def get_smo(self, val):
        return config.SMO.get(val, None)
    
    def get_ds(self, val):
        q = "select code from public.mkb10 where name ilike '%s'" % val 
        return self.get_from_db(q)
    
    def _get_doc(self, val):
        if val == '' or len(val) < 4:
            return None
        d= re.search('(^\d+)([ ,./])*(\d+$)', val)
        if d is None:
            return None
        if d.group(2) is not None:
            spec, code = int(d.group(1)), int(d.group(3))
        else:    
            p= len(d.group(0)) # min 2
            spec, code = int(d.group(0)[:p-1]), int(d.group(0)[p-1:])
        q = 'select family from doctor where spec = %i and code = %i' % (spec, code) 
        if self.get_from_db(q) is not None:
            return '%i.%i' % (spec, code) 
        return None
    
    def get_doc(self, val):
        if val == '':
            return None
        d= re.search('(^\d+)([ ,./])*(\d+$)', val)
        if d is None:
            return None
        scode = f'{d.group(1)}{d.group(3)}' \
            if d.group(2) is not None \
            else d.group(0)
        doc = self.doctor.get(scode, None)
        return doc[1] if doc is not None else val
        
    def getData(self, data):
        # data arr of strings filds
        '''
        for f, val in enumerate(data):
            print(val)
            vv = self.fields[f][1](val)
            print(vv)
        return []
        '''
        data_length = len(self.fields)
        #print(data_length)
        #return ', '.join( [ self.fields[ f[1](val) ]  for f, val in enumerate(data) ] )
        s = [ self.fields[f][1](val) for f, val in enumerate(data) if f < data_length ]
        if s[0] is None or s[0] in self.napr: # nap num must be int and uniq
            return None
        self.napr.add(s[0])
        return s
        
    def close(self):
        self.qurs.close()
        
        
        
        
        