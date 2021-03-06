
from poly.reestr.xml.pack.xml_class.mixTags import HdrMix, TagMix


def pmData(data):
    # here we set additional attrs
    # 1 - invoice
    # 2 - by soul
    setattr(data, 'type_pay', 1)
    return data


class PmUsl:
    """ -- data
        usl.date_usl,
        usl.code_usl, 
        usl.kol_usl, 
        usl.exec_spec as spec, 
        usl.exec_doc as doc,
        usl.exec_podr as podr,
        tal.npr_mo,
        tal.npr_spec,
        tar.tarif as sumv_usl
    """

    def __init__(self, mo, tal, ntuple):
        for name, value in ntuple._asdict().items():
            setattr(self, name, value)
        self.mo = mo

        # as for 495 paper disabled
        '''
        assert self.spec and self.podr, \
            f'{tal.idcase}-Нет PODR (подразделиния), SPEC (специалиста) в ПМУ {self.code_usl}'
        self.executor = self.fmt_000(
            mo) + self.fmt_000(self.podr) + self.fmt_000(self.spec)
        
        if tal.naprlech:
            assert self.npr_mo and self.npr_spec, \
                f'{tal.idcase}-Нет NPR_MO (МО направления), NPR_SPEC (Специалиста направления)'
            self.ex_spec = self.fmt_000(
                self.npr_mo) + self.fmt_000(self.npr_spec)
        '''

# posechenue obraschenie


class PmUsp:
    """ USP
        tal.open_date as date_usl,
        prof.one_visit as code_usl1,
        prof.two_visit as code_usl2,
        1 as kol_usl, 
        prof.podr as podr, 
        tal.doc_spec as spec,
        tal.doc_code as doc,
    """

    def __init__(self, mo, ntuple, ex_spec=None):
        for name, value in ntuple._asdict().items():
            setattr(self, name, value)
        self.mo = mo

        # as for 495 paper disabled
        '''
        self.executor = self.fmt_000(
            mo) + self.fmt_000(self.podr) + self.fmt_000(self.spec)
        self.ex_spec = ex_spec
        '''


class PmHdr(HdrMix):

    def __init__(self, mo, year, month, pack, sd_z=None, summ=None):
        super().__init__(mo, year, month, pack)
        self.filename = self.p_file
        self.filename1 = self.h_file
        # print(self.endTag)
        self.zglv_tags = (
            'data',
            'filename',
            'filename1',
        )
        self.zglv = ('ZGLV', self.zglv_tags)
        self.schet_tags = (
            'year',
            'month',
            'code_mo',
            'lpu'
        )
        self.schet = ('SCHET', self.schet_tags)


class PmSluch(TagMix):

    def __init__(self, mo):
        super().__init__(mo)
        self.usl = None
        self.stom = None
        self.sl_id = 1
        # PM type pay
        # 1 - invoice
        # 2 - by soul
        self.type_pay = 1  # yet

        self.usl_tags = (
            'idserv',
            # 'executor',  # self.executor # del as 495 paper
            # 'ex_spec',  # self.ex_spec # del as 495 paper
            'rl'  # ignore
        )
        self.stom_tags = (
            'idstom',
            'code_usl',
            'zub',
            'kol_viz',
            'uet_fakt'
        )
        self.sluch_tags = (
            # 'SL',
            'sl_id',  # self..sl_id
            'idcase',  # tal.tal_num
            'card',  # tal.crd_num
            'from_firm',  # tal.npr_mo
            'purp',  # tal.purp
            'visit_pol',  # tal.vsit_pol
            'visit_hom',  # tal.visit_home
            'nsndhosp',  # tal.nsndhosp
            # 'specfic',  # tal.doc_spec # del as 495 paper
            'type_pay',  # self.type_pay
            'd_type',  # tal.d_type
            'naprlech',  # tal.naprlech
            ('usl', self.usl_tags, 'list'),
            ('stom', self.stom_tags, 'list')
        )
        self.sluch = (('SL', self.sluch_tags))

        self.ignore = (
            # 'stom',
            'rl'
        )
        # dummy counted tags
        self.cnt = (
            'idserv',
            'idstom',
        )
        self.required = (

        )

    def set_usl(self, tag, tal, usl_list, usp):

        if not isinstance(usl_list, list):
            _u = [usl_list]
        else:
            _u = usl_list
        u_list = [PmUsl(self.mo, tal, u) for u in _u]

        # as for 495 paper disabled
        '''
        if len(u_list) == 0:  # no PMU
            ex_spec = None
        else:
            # last ex_spec if any
            ex_spec = getattr(u_list[-1], 'ex_spec', None)
        '''

        # append posesh obrasch codes
        u_list.append(PmUsp(self.mo, usp))  # last arg deleted default None

        setattr(self, tag, u_list)
        return self

    def get_sluch(self, data):
        return self.make_el(self.sluch, data)
