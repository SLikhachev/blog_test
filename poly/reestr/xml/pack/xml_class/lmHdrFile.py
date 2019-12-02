
from poly.reestr.xml.pack.xml_class.mixTags import HdrMix, TagMix
from poly.reestr.xml.pack.xml_class.utils import DataObject


class LmData(DataObject):
    def __init__(self, ntuple):
        super().__init__(ntuple)
        # polis in talon
        if self.polis_type is not None and self.polis_num is not None:
            self.id_pac= self.polis_num
        try:
            self.id_pac= int(self.id_pac)
        except:
            raise ValueError(f'{self.idcase}-ID_PAC (номер полиса) не целое число')
        
        self.doc=['doctype', 'docnum', 'docser', 'docdate', 'docorg']
        self.dost= []
        self.calc = (
            self._pol,
            self._dost,
            self._doc
        )

        for func in self.calc:
            func()

    def _pol(self):
        try:
            self.w= ['м', 'ж'].index(self.pol.lower()) + 1
        except Exception as e :
            print(e)

    def _dost(self):
        if not bool(self.ot):
            self.dost.append(1)
        if not bool(self.fam):
            self.dost.append(2)
        if not (self.im):
            self.dost.append(3)
    
    def _doc(self):
        if not bool(self.docnum) or len(self.docnum) == 0:
            for d in self.doc:
                setattr(self, d, None)
        
class LmHdr(HdrMix):
    
    def __init__(self, mo, year, month, pack, sd_z=None, summ=None):
        super().__init__(mo, year, month, pack)
        self.startTag = '%s\n<PERS_LIST>' % self.xmlVer
        self.endTag = '</PERS_LIST>'
        self.filename = self.l_file
        self.filename1 = self.h_file
        self.version='3.1'

        self.zglv_tags= (
            'version',
            'data',
            'filename',
            'filename1',
        )
        self.zglv = ('ZGLV', self.zglv_tags)

    def get_schet(self, data):
        return None

class LmPers(TagMix):
    
    def __init__(self, mo):
        super().__init__(mo)
        self.dubl=[]
        self.uniq= set()
        self.pers_tags = (
            'id_pac',
            'fam',
            'im',
            'ot',
            'w',
            'dr',
            'dost',
            'tel',
            'fam_p',
            'im_p',
            'ot_p',
            'w_p',
            'dr_p',
            'dost_p',
            'mr',
            'doctype',
            'docser',
            'docnum',
            #'docdate',
            #'docorg',
            'snils',
            'okatog',
            'okatop',
            'commentp',
        )
        self.ignore = (
            'mr',
            'snils',
            'okatog',
            'okatop',
            'commentp',
        )
        self.pers=('pers', self.pers_tags)


    def get_pers(self, data):

        if data.id_pac in self.uniq:
            self.dubl.append(data.id_pac)
            return None

        self.uniq.add(data.id_pac)
        return self.make_el(self.pers, data)
