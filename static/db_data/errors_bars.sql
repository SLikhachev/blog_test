--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: errors_bars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE errors_bars (
    id integer NOT NULL,
    num character varying(15),
    name character varying(511)
);


ALTER TABLE errors_bars OWNER TO postgres;

--
-- Name: errors_bars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE errors_bars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE errors_bars_id_seq OWNER TO postgres;

--
-- Name: errors_bars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE errors_bars_id_seq OWNED BY errors_bars.id;


--
-- Name: errors_bars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errors_bars ALTER COLUMN id SET DEFAULT nextval('errors_bars_id_seq'::regclass);


--
-- Data for Name: errors_bars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY errors_bars (id, num, name) FROM stdin;
1	0035	Для исправительного случая не найден основной
2	0036	У основного и исправительного случая не совпадает набор полей МО + номер иб/ат + пациент
3	0037	Для основного случая уже существует исправительный. Повторно исправлять основной случай недопустимо
4	0047	Основной случай не был отказан. Исправление невозможно.
5	10	Отсутствует страховщик или указан не корректно для застрах в Прим. крае
6	1118	Некорректно указан источник санкций (S_IST)
7	1121	Некорректно указан признак подозрения на злокачественное новообразование (DS_ONK).
8	1122	Некорректно указана дата направления на лечение (диагностику, консультацию, госпитализацию).
9	1125	Некорректно указаны сведения о случае лечения онкологического заболевания
10	1126	Некорректно указан "Вид направления" в сведении об оформлении направления
11	1127	Некорректно указан "Цель проведения консилиума" в сведении о проведении консилиума.
12	1128	Некорректно указана "Суммарная очаговая доза"
13	1129	Некорректно указан "Код диагностического показателя"
14	1130	Некорректно указан "Тип услуги" в сведении об услуге при лечении ЗНО
15	1134	Некорректно указан "Цикл лекарственной терапии" в сведении об услуге при лечении ЗНО
16	1138	Некорректно указан "Дата введения лекарственного препарата" (DATE_INJ).
17	1139	Некорректно указана "Сумма финансовой санкции" (S_SUM).
18	1140	Некорректно указан "Регистрационный номер лекарственного препарата"
19	1142	Некорректно указан "Код причины отказа (частичной) оплаты"
20	1143	Не указано поле "Дата акта МЭК, МЭЭ или ЭКМП" (DATE_ACT)
21	1144	Некорректно указан "Код эксперта качества медицинской помощи"
22	1145	Не указан номер акта МЭК, МЭЭ или ЭКМП (NUM_ACT).
23	1147	Некорректно указан "Дополнительный классификационный критерий" (DKK2).
24	1254	Некорректно указан номер позиции записи
25	1259	Код окато территории страхования не соответствует ни одному ТФОМС
26	126	Номер истории болезни не уникален для данного ЛПУ в текущем году
27	1265	Некорректно указан "Код МО, направившей на лечение"_mtr
28	1276	Диагноз основного заболевания указан не корректно
29	1315	Оказание услуги пациенту 18 лет и старше детским врачом11
30	1323	Несоответствие профиля оказанной мед.пом специальности врача
31	1345	Некорректно указана дата рождения пациента ПЦ - пакеты(пред.тк)
32	135	Скорая помощь не может быть плановой
33	1350	Некорректно указана дата рождения представителя пациента ПЦ - пакеты(предв-й ТК)
34	1356	Некорректно указан код места прописки/пребывания по ОКАТО ПЦ - пакеты(предв.тк)
35	136	Число дней законного представителя по уходу за ребенком превышается факт.число дней ребенка до четырех лет
36	142	Не соответствие номера услуги в основном файле реестра номеру услуги в файле стом услуг
37	143	Дата окончания лечения пациента не соответствует отчетному месяцу
38	153	Несоответствие объемам ОМС
39	16	Отсутствует код МКБ (ds3) диагноза или указан не корректно
40	16	Отсутствует код МКБ (ds2) диагноза или указан не корректно
41	16	МЭК. В качестве основного диагноза (ds1) указан вспомогательный
42	16	МЭК. Диагноз (ds1) Z01.3, R00-R99, Z01.7 указаны некорректно
43	16	МЭК. Диагноз (ds1) является неоплачиваемым или требует уточнение подрубрики
44	16	Отсутствует код МКБ диагноза или указан не корректно
45	16	В качестве основного диагноза (ds1) указан вспомогательный
46	16	Диагноз (ds1) является неоплачиваемым
47	16	МЭК. Диагноз (ds1) требует уточнение подрубрики
48	16	Диагноз (ds1) необходимо уточнение подрубрики
49	16	Возраст пациента не соответствует диагнозу (Z00.0, Z00.1,Z00.2,Z00.3, Z02.0)
50	16	Возраст пациента не соответствует диагнозу (Z00.0, Z00.1,Z00.2,Z00.3, Z02.0)
51	16	МЭК. Диагноз (ds1) отсутствует или указан некорректно
52	176	Некорректно заполнены поля FAM, IM, OT для ребенка в возрасте до 3-х месяцев
53	178	Код подразделения, направившего на мед. услугу не соответствует утвержденному списку
54	188	поле EXECUTOR не соответствует справочникам (Спец)
55	19	Отсут даты выпи или поступ или д.пост>д.вып или д.вып больше текущей даты или некорр длит лечения
56	2	Дублирование кода услуги в пакете
57	2	Отсутствует номер услуги или он не уникален в текущем реестре
58	20011	Некорректно указаны "Сведения о проведении консилиума" (CONS)
59	20011	Некорректно указаны "Сведения о проведении консилиума при лечении онкологического заболевания"_mtr
60	20013	Некорректно указаны "Сведения об услуге при лечении онкологического заболевания"_mtr
61	20043	Некорректно указаны Сведения об услуге (USL)
62	231	Травмпункт. Неверное заполнение полей.(178,91, PURP<>1, VISIT_HOM/HS<>0, VISIT_POL>1)
63	235	Нарушение сроков предоставленных выполненных объемов медицинских услуг
64	238	Некорректно выставлен код МКБ для целей 1, 2 и 3
65	244	МКБ Z,V,W,X,Y
66	246	Некорректное заполнение поля NUM_HIST (при DEP_OUT, начинающемуся с '3')
67	279	Более 1 записи в STOM на 1 IDCASE, MES и ZUB
68	28504	Двойники по диспансеризации и проф. осмотрам взрослого населения в текущем году
69	28506	Не указана схема лекарственной терапии (CODE_SH)
70	28506	Проверка заполнения Код схемы лекарственной терапии
71	28509	Некорректно заполнено или отсутствует значение поля PR_NOV
72	28511	Двойная нагрузка радиоактивными препаратами в один день
73	28514	Некорректное количество МРТ исследований
74	28515	Некорректно заполнено обязательное поле PRVS
75	29	Отсутствует номер карты
76	292	POL и SPECFIC не соответствуют друг другу
77	293	Болезни мужских половых органов у женщин
78	294	Гинекологические заболевания и акушерский профиль у мужчин
79	296	Не корректно указан код специалиста детского приема для взрослого или наоборот
80	3	Отсутствует номер истории болезни
81	3	Номер истории болезни не уникален в текущем реестре
82	302	Реанимация в дневном стационаре
83	31	Не указана цель обращения или указана не корректно
84	330	Дата проведения простой медицинской услуги заполнена некорректно
85	35	Не указан характер течения основного заболевания или указан не корректно или характер течения основного заболевания равен 6(здоров) и результат лечения равен 3(ухудшение)
86	36	Не указаны посещения или количество посещений превышает допустимое
87	362	Некорректно оформлена запись на амбулаторного пациента
88	373	Некорректно выставлена цель для спец 233,234
89	383	Двойники по операциям
90	39	Отсутствует номер направления при плановой госпитализции
91	4	Несоответствие заполнения полей: Фамилия пациента с полем DOST "Код надёжности идентификации пациента"
92	4	Несоответствие заполнения полей: имя пациента с полем DOST "Код надёжности идентификации пациента"
93	4	Несоответствие заполнения полей: отчество с полем DOST "Код надёжности идентификации пациента"
94	40	Не указана специальность врача, закончившего лечение, или указанна не корректно
95	42	Перекрывающиеся по времени услуги стационара пациенту в текущем реестре
96	424	Отсутствует параклиника в стационаре на дому
97	432	Цели 16,17 выставлены некорректно или не выставлены на нужных специалистов.
98	456	Некорректное(>2) число посещений к врачу центра здор. с динамич. целью.
99	471	Серия или номер полиса имеют нечисловое значение для застрахованных или это полис ДМС
100	480	Код диагноза заболевания пациента указан без подрубрики
101	482	Профилактические медицинские осмотры несовершеннолетних
102	482	Диспансеризация определённых групп взрослого населения от 40 до 64 лет включительно (1 этап)
103	482	Диспансеризация определённых групп взрослого населения 65 лет и старше (1 этап)
104	482	Профилактический медицинский осмотр
151	560	В пакете ВМП отсутствует метод ВМП
105	482	Диспансеризация определённых групп взрослого населения от 40 до 64 лет включительно (2 этап)
106	482	Диспансеризация определённых групп взрослого населения 65 лет и старше (2 этап)
107	482	Диспансеризация, пребывающих в стационарных учреждениях детей-сирот и детей кол-во не в полном объеме
108	482	Диспансеризация 2 этап не в полном объеме
109	482	Диспансеризация не в полном объеме
110	482	Диспансеризация детей-сирот и детей, оставшихся без попечения родителей кол-во услуг указано не в полном объеме
111	482	Диспансеризация определённых групп взрослого населения с периодичностью 1 раз в 2 года кол-во услуг указано не в полном объеме
112	490	Некорректно указано RSLT_D или поле не заполнено
113	491	Не корректно указано STAT_ZAN или поле не заполнено
114	492	Возраст пациента не соответствует диспансеризации
115	494	Некорректно оформлен 2-й этап ДД (Случай д.б. представлен c NAPRAV=1 и c DISP_E= 1 и 2
116	496	Нарушение сроков предоставленных выполненных объемов ДД
117	5000	На отделение указано одновременно "без дефектов" и дефект.
118	51	Перекрывающиеся по времени услуги пациенту
119	515	Поле VPOLIS <Тип документа, подтверждающего факт страхования по ОМС> обязательно для заполнения или не соответствует справочнику F008
120	517	Поле OS_SLUCH <Признак <Особый случай>> обязательно для заполнения или не соответствует справочнику
121	518	Поле PROFIL <Профиль> обязательно для заполнения или не соответствует справочнику V002
122	519	Поле DET заполнено некорректно (д.б. (0,1))
123	519	Поле DET в USL заполнено некорректно (д.б. (0,1))
124	520	Поле VIDPOM <Вид медицинской помощи> обязательно для заполнения или не соответствует справочнику V008
125	521	Поле PRVS не соответствует справочнику V021
126	522	Поле IDDOKT заполнено некорректно (д.б. не пусто и СНИЛС должен быть корректный)
127	523	Поле USL_OK «Условия оказания медицинской помощи» не соответствует справочнику V006
128	524	Поле ISHOD <Исход заболевания> не соответствует справочнику V012 или не соответствует полю RESULT_TRE
129	525	Поле RSLT <Результат обращения/госпитализации> обязательно для заполнения или не соответствует справочнику V009
130	527	Поле SMO_OK не соответствует справочнику OKATO или заполнено некорректно (предварительный тк)
131	527	Поле SMO_OK не соответствует справочнику OKATO или заполнено некорректно
132	528	В USL поле PRVS не соответствует справочнику V015
133	529	В USL поле CODE_MD заполнено некорректно (д.б. не пусто и заполнено корректно )
134	53	Неверное заполнение обязательных полей в файле стоматологических услуг (RS)
135	530	В USL поле PROFIL не соответствует справочнику V002
136	536	Номер и/или серия полиса некорректно заполнены в соответствии с его типом
137	537	У инокраевых документ(DOCSER, DOCNUM,DOCTYPE) или ЕНП(P_NUM,VPOLIS) должен быть заполнен
138	542	Недопустимый возраст для прохождения диспансеризации взрослого.
139	544	Некорректно заполнено поле RSLT(рез-т обращения) для целей 21,22,23,24
140	545_0	Недопустимый возраст для прохождения диспансеризации или начало лечения не соответствует времени действия услуги
141	548	Некорректно указан код МКБ для инокраевого
142	549	Некорректно указан код детского профиля в поле PROFIL при значении 1 в поле DET
143	551	Не залит файл RS при наличии стоматологических специалистов
144	555	Несоответствие условию оказания мед. помощи (СМП) коду специалиста, цели и типу услуги
145	556	Некорректно указаны цели 20, 21, 22, 23, 24, 25, 26, 28, 29 в файле P/SLUCH/PURP
146	557	Несоответствие условию оказания мед. помощи (дневной стационар) коду специалиста дневного стационара
147	558	Некорректно указана цель обращения для специалиста параклинической службы
148	559	Некорректно оформлена запись посещения в приёмном покое. Неверно указана форма медицинской помощи (URGENT). Должна быть неотложной
149	56	Номер направления не уникален
150	560	МО отсутствует в планах на оказание ВТМП или заполнено поле CODE_MES или поле Q_U<>1 (при заполненном поле VID_HMP)
152	561	Некорректное сочетание значений полей VID_HMP, METOD_HMP, DS1 для данного МО
153	562	СМП. значение одного из полей INC_TIME, BR_TIME, ARR_TIME, END_TIME не заполнено или не преобразуется в дату.
154	563	Поле PLACE <Место вызова> обязательно для заполнения или не соответствует справочнику
155	568	Поле FOR_POM <Форма оказания медицинской помощи не соответствует справочнику V014
156	569	Присутствует дублирующийся код ПМУ в рамках одного этапа диспансеризации.
157	573	Значения в полях SPECFIC, PROFIL, PRVS не соответствуют между собой
158	580	Значение в поле "Вид медицинской помощи" не корректно заполнено при значениях в полях "Вид ВТМП", "Метод ВТМП"
159	583	Нет лицензии на данный вид медицинской помощи (исп. поля USL_OK,PROFIL,VIDPOM)
160	584	Уточнить код диагноза, для детей - Z00.0 или для взрослых - Z00.1,.2,.3
161	585	Тип документа не соответствует возрасту
162	589	Значение поля CODE_USL в теге USL не соответствует справочнику
163	590	Цель для неотложной помощи указана некорректно и/или количество посещений > 1
164	591	Значение поля NOVOR у новорожденного заполнено некорректно: пациенту > 30 дней
165	591	Значение поля NOVOR у новорожденного заполнено некорректно
166	5912	Некорректно указано значение Metastasis (ONK_M) (sl)
167	5915	Некорректно указан Код противопоказания или отказа (PROT)
168	592	СМП. Нарушена логическая последовательность дат в SP
169	593	Тип пребывания СМП не соответствует цели
170	594	СМП. Даты поступления/выписки не соответствуют датам приёма/окончания вызова СМП
171	597	СМП. Неверно оформлена плановая транспортировка/экстренная транспортировка/дежурство на мероприятии
172	598	Неверно оформлен результат лечения для СМП
173	599	СМП. Посещения на дому/в поликлинике не соответствует месту вызова бригады
174	6	Не указан пол пациента или стоит недопустимый символ
175	602	Сочетание полей RSLT, ISHOD и USL_OK заполнено некорректно
176	606	Неверно указан код вида помощи для врача-специалиста (неотложная амбулаторная помощь).
177	607	ВМП. Медицинская организация не имеет плана на группу
178	614	Некорректно заполнена дата рождения представителя
179	614	Новорожденный ребенок прошел регистрацию
180	614	Некорректно заполнена имя представителя
181	614	Некорректно заполнена фамилия представителя
182	614	Некорректно заполнено отчество представителя
183	614	Некорректно заполнен пол представителя
184	617	МО неверно указала код зоны
185	618	Признак НСЗ не соответствует условию оказания
186	620	В ДД поле DS_CLIN "Код МКБ заключительного диагноза" обязательно для заполнения или не соответствует справочнику МКБ-10
187	627	Стоматологическое обследование проведено несколько раз
188	628	Неверный клинический диагноз и результат вызова
189	631	Несоответствие между собой полей USL_OK, VIDPOM
190	635	Неотложная помощь без ПМУ
191	652	Поле LPU в узле SLUCH не соответствует справочнику F003
192	653	Поле LPU_1 в узле SLUCH не соответствует региональному справочнику МО
193	654	Поле LPU в узле USL не соответствует справочнику F003
194	655	Поле LPU_1 в узле USL не соответствует региональному справочнику МО
195	656	Поле P_PER заполнено некорректно
196	657	Поле IDSP не соответствует справочнику V010
197	659	Поле NPR_MO не соответствует справочнику F003
198	660	Поле DS0 не соответствует справочнику МКБ
199	661	Поле VID_VME не соответствует справочнику ПМУ_2019
200	663	Поле DS не соответствует справочнику МКБ
201	664	Поле NPL заполнено некорректно
202	667	Поле SMO не соответствует справочнику F002
203	673	Неверное сочетание полей USL_OK и IDSP
204	674	Количество услуг диализа не соответствует рекомендованному
205	675	Поле PODR в USL не соответствует справочнику подразделений
206	675	Поле PODR не соответствует справочнику подразделений
207	681	Отсутствует или некорректно указан профиль койки
208	681	Несоответствие профиля койки профилю помощи
209	691	Поле “Специальность врача”-NAZ_SP пусто или не соответствует справочнику V021
210	692	Некорректно указан вид обследования в поле NAZ_V
211	693	Поле "Профиль медицинской помощи"-NAZ_PMP пусто или не соответствует справочнику V002
212	694	Поле "Профиль койки"-NAZ_PK пусто или не соответствует справочнику V020
213	698	Некорректно указан вес при рождении (пациент-мать)
214	7	Дата рождения равна дате начала лечения и признак особого случая не равен 3 (медицинская помощь оказана новорожденному)
215	7	Дата рождения внесена некорректно
216	705	Поле DOST или DOST_P содержит значение отличные от 1, 2, 3
217	705	Поле DOST содержит значение отличные от 1, 2, 3
218	717	Некорректное предоставление случая по ЭКО
219	719	Отказ по связанному случаю в стационаре и дневном стационаре
220	722	Дата регистрации противопоказания или отказа указана не корректно D_PROT (sl)
221	722	Двойники по проф. осмотрам в текущем году
222	73	Расхождения полиса
223	737	Не заполнено поле Дата направления на лечение (NPR_DATE) при указании кода МО, выдавшего направление
224	738	Неверно заполнены поля Дата начала лечения (DATE_Z_1) и Дата окончания лечения (DATE_Z_2)
225	738	Неверно заполнены поля Дата начала лечения (DATE_1) и Дата окончания лечения (DATE_2)
226	739	Некорректно указана продолжительность госпитализации
227	740	Неверно указан признак внутрибольничного перевода (VB_P)
228	742	Не заполнено поле Цель посещения (P_CEL) в случае оказания медицинской помощи в амбулаторных условиях или не соответствует справочнику V025
229	743	Неверно расчитано поле Продолжительность госпитализации (KD) в узле "сведения о случае"
230	744	Не заполнено поле Диспансерное наблюдение (DN) или заполнено некорректно
231	745	Некорректно заполнено поле Код классификатора медицинских специальностей (VERS_SPEC)
232	757	Некорректно указано поле NAZ_R в назначениях
233	759	Разные номера истории болезни у записей на один законченный случай
234	766	Некорректно заполнено поле тип документа DOCTYPE или тип документа не соответствует возрасту или справочнику
235	774	Не заполнен раздел "Сведения о случае лечения онкологического заболевания"(ONK_SL) в случае диагноза "C", D70
236	775	Поле "Стадия заболевания" (STAD) не соответствует справочнику N002
237	776	Поле "Значение Tumor" (ONK_T) не соответствует справочнику N003
238	777	Поле "Значение Nodus" (ONK_N) не соответствует справочнику N004
239	778	Поле "Значение Metastasis" (ONK_M) не соответствует справочнику N005
240	779	Поле "Признак выявления отдалённых метастазов" (MTSTZ) не заполнено, если поводом обращения (DS1_T) стал рецидив или прогрессирование заболевания
241	780	Некорректно заполнено поле "Суммарная очаговая доза" (SOD)
242	781	Поле "Тип диагностического показателя" (DIAG_TIP) заполнено не корректно
243	781	Некорректно указан "Тип диагностического показателя" (DIAG_TIP).
244	782	Поле "Код диагностического показателя" (DIAG_CODE) при проведении гистологического исследования не соответствуют справочнику N007, при проведении ИГХ не соответствует справочнику N010
245	783	Некорректно указан "Код результата диагностики" (DIAG_RSLT).
246	783	Поле "Код результата диагностики" (DIAG_RSLT) при проведении гистологического исследования не соответствуют справочнику N008, при проведении ИГХ не соответствует справочнику N011
247	784	Поле "Код противопоказания или отказа" (PROT) не соответствует справочнику N001
248	786	Поле "Вид направления" (NAPR_V) заполнено не корректно
249	788	Поле "Тип услуги" (USL_TIP) не соответствует справочнику N013
250	789	Некорректно указан признак подозрение на злокачественное новообразование DS_ONK (поле обязательно в файлах ('T','D','C')
251	790	Некорректно указано направление на МСЭ
252	791	Некорректно указан вес при рождении (пациент-ребёнок)
253	792	Некорректно указан Признак мобильной медицинской бригады
254	793	Некорректно указан признак отказа(в случае)
255	793	"Признак отказа" не может стоять на анкетировании при прохождении диспансеризации 1 этапа, или не представлена услуга с кодом A01.30.026 (анкетирование)
256	794	Некорректно указана Дата выдачи талона на ВМП
257	795	Некорректно указан номер талона на ВМП
258	796	Некорректно указана дата планируемой госпитализации
259	797	Некорректно указан характер заболевания
260	798	Некорректно указан группа инвалидности
261	799	Некорректно указан признак диспансерное наблюдение
262	800	Некорректно указаны cведения об оформлении направления (NAPR)
263	801	Некорректно указана дата направления в cведениях об оформлении направления (NAPR)
264	802	Некорректно указан Код МО в cведениях об оформлении направления (NAPR)
265	803	Некорректно указан "Метод диагностического исследования"
266	803	Некорректно указан Метод диагностического исследования в cведениях об оформлении направления (NAPR)
267	804	Некорректно указана "Медицинская услуга (код), указанная в направлении" (NAPR_USL).
268	804	Некорректно указана медицинская услуга (код) в сведении об оформлении направления
269	805	Некорректно указана цель проведения консилиума в сведениях о проведении консилиума.
270	806	Некорректно указана дата проведения консилиума (DT_CONS)
271	806	Некорректно указана дата проведения консилиума в сведениях о проведении консилиума.
272	806	Некорректно указана "Дата проведения консилиума" (DT_CONS).
273	807	Некорректно указан Повод обращения в сведениях о случае лечения онк. заболевания
274	808	Некорректно указана "Дата взятия материала" (DIAG_DATE).
275	808	Некорректно указана дата взятия материала в диагностическом блоке
276	809	Некорректно указан признак получения результата диагностики в диагностическом блоке
277	810	Некорректно указана дата регистрации противопоказания или отказа
278	811	Некорректно указан "Тип хирургического лечения" (HIR_TIP).
279	811	Некорректно указано значение в поле тип хирургического лечения
280	812	Некорректно указана "Линия лекарственной терапии" (LEK_TIP_L).
281	812	Некорректно указано значение в поле линия лекарственной терапии
282	813	Некорректно указано значение в поле цикл лекарственной терапии
283	814	Не указан номер телефона в файлах по диспансеризации или указан некорректно
284	815	Некорректно указано значение в поле тип лучевой терапии
285	815	Некорректно указан "Тип лучевой терапии" (LUCH_TIP).
286	816	Некорректно указан "Сведения о введенном противоопухолевом лекарственном препарате" (LEK_PR).
287	816	Некорректно указаны сведения о введенном противоопухолевом лекарственном препарате
288	817	Некорректно указан номер по порядку в назначения
289	818	Некорректно указана медицинская услуга в назначениях
290	819	Некорректно указана дата направления в назначениях
291	820	Некорректно указан код МО, куда оформлено направление
292	821	Некорректно указан СНИЛС пациента
293	822	Некорректно представлена информация по ЗНО
294	823	Повторное предоставление случая оказания медицинской помощи на оплату в поликлинике(дубль) внутри пакетаtest
295	823	Повторное предоставление случая оказания медицинской помощи на оплату в поликлинике(дубль) внутри пакета
296	823	Повторное предоставление случая оказания медицинской помощи на оплату в скорой (дубль) внутри пакета
297	823	Повторное предоставление случая оказания медицинской помощи на оплату в стационаре (дубль) внутри пакета
298	824	Повторное предоставление случая оказания медицинской помощи на оплату в стационаре (дубль) - хэш
299	824	Повторное предоставление случая оказания медицинской помощи на оплату в поликлинике (дубль) - хэш
300	824	Повторное предоставление случая оказания медицинской помощи на оплату в Скорой (дубль) - хэш
301	825	Не указаны мед.услуги при оказании медицинской помощи в амбулаторных условиях
302	827	Некорректно указаны сведения проведении консилиума
303	828	Некорректно указаны сведения в поле «Количество фракций проведения лучевой терапии» (мтр)
304	828	Некорректно указаны сведения в поле «Количество фракций проведения лучевой терапии» (K_FR)
305	829	Некорректно указаны сведения в поле Масса тела (кг) (WEI) мтр
306	829	Некорректно указаны сведения в поле Масса тела (кг) (WEI)
307	830	Не заполнен или заполнена некорректно "Рост (см)" (HEI)
308	830	Некорректно указаны сведения в поле Рост (см) (HEI)
309	831	Некорректно указаны сведения в поле Площадь поверхности тела (BSA)
310	832	Некорректно указаны сведения об услуге при лечении онкологического заболевания (ONK_USL)
311	833	Некорректно указан признак проведения профилактики тошноты и рвотного рефлекса (PPTR)
312	833	Некорректно указан признак проведения профилактики тошноты и рвотного рефлекса
313	835	Лечение ЗНО не соответствует профилю "Онкология" или "Детская онкология"
314	836	Некорректно укзаано значение в specfic
315	837	Некорректно указаны диагнозы для схемы sh903 и sh904
316	838	Способ оплаты некорректный для онкологии
317	839	Способ оплаты некорректный для СМП
318	840	Некорректно указаны сведения о введенном противоопухолевом лекарственном препарате(code_sh)
319	841	Сode_sh и regnum не соответствуют справочнику N021
320	842	Онкологические услуги могут быть поданы только с одним типом
321	843	Некорректно указан признак особый случай Z
322	844	Некорректно указано кол-во услуг (kol_usl)
323	845	Некорректно указан идентификатор лекарственного препарата KOD_MNN.
324	846	Некорректно указано поле Количество флаконов лекарственного препарата (KOL_LEK).
325	847	Несоответствие набора услуг приказу ДЗПК по антенатальному скринингу
326	90	КСГ поданная от МО отличается от КСГ, которую нашли в системе
327	90	Не определена группа КСГ для случая
328	902	МЭК. Некорректно указан способ оплаты для посещения и обращения
329	902	МЭК. Некорректно указан способ оплаты для застрахованного на другой территории
330	902	Некорректно указан способ оплаты случая: для КСГ должен быть 33, для ВМП - 32
331	902	Некорректно указан способ оплаты для застрахованного на другой территории
332	902	Некорректно указан способ оплаты для посещения и обращения
333	903	Отсутствует МО прикрепления или направления
334	904	Некорректно указан тип полиса
335	910	Пациент не идентифицирован в РС ЕРЗ
336	998	Не положено заливать меньше текущего года годы
337	999	Не положено заливать 2015 год
338	MEK_32	Срок госпитализации в стационаре 1 день
339	МТР_106	Несоответствие основного диагноза врачебной специальности (sl)
340	МТР_106	Несоответствие основного диагноза врачебной специальности11
341	МТР_108	Несоответствие способа оплаты условиям оказания или профилю медицинской помощи.
342	МТР_110	Неоплачиваемый профиль мед.помощи11.
343	МТР_110	Неоплачиваемый профиль мед.помощи (МТР - МЭК)
344	МТР_110	Неоплачиваемый профиль мед.помощи для услуги
345	МТР_111	Неоплачиваемая специальность врача.
346	МТР_111	Неоплачиваемая специальность врача(sl)
347	МТР_111	Неоплачиваемая специальность врача для услуги
348	МТР_12	Некорректно указан тип документа, подтверждающего факт страхования по ОМС (пациент МТР)
349	МТР_125	Неполное кодирование основного диагноза1 (sl)
350	МТР_125	Неполное кодирование основного диагноза1
351	МТР_126	Основной диагноз не соответствует возрасту пациента (sl)
352	МТР_126	Основной диагноз не соответствует возрасту пациента
353	МТР_13	Некорректно указан номер и/или серия и номер документа, подтверждающего факт страхования по ОМС (пациент МТР)
354	МТР_130	Неполное кодирование сопутствующего заболевания(sl)
355	МТР_130	Неполное кодирование сопутствующего заболевания
356	МТР_14	Некорректно указана фамилия пациента (пациент МТР)
357	МТР_15	Некорректно указано имя пациента (пациент МТР)
358	МТР_153	Некорректно указан код МО услуги
359	МТР_16	Некорректно указано отчество пациента (пациент МТР)
360	МТР_18	Некорректно указана дата рождения пациента (пациент МТР)
361	МТР_19	Некорректно указана фамилия представителя пациента (пациент МТР)
362	МТР_20	Некорректно указано имя представителя пациента (пациент МТР)
363	МТР_20010	Некорректно указан "Повод обращения"
364	МТР_20012	Некорректно указана "Дата направления" в сведении об оформлении направления.
365	МТР_201	Неполное кодирование диагноза для услуги
366	МТР_202	В качестве диагноза для услуги указан вспомогательный код заболевания
367	МТР_21	Некорректно указано отчество представителя пациента1
368	МТР_23	Некорректно указана дата рождения представителя пациента1
369	МТР_236	Пациент не застрахован на территории ПК
370	МТР_236	Пациент не идентифицирован в центральном сегменте
371	МТР_24	Некорректно указан тип документа, удостоверяющего личность пациента или представителя1
372	МТР_240	Некорректно заполнен Тип оплаты
373	МТР_243	Передано исправление на случай лечения принятый к оплате ранее
374	МТР_25	Некорректно указан номер и/или серия и номер документа, удостоверяющего личность1
375	МТР_29	Некорректно указан признак новорожденного
376	МТР_291	Некорректно указан код классификатора медицинских специальностей1(sl)
377	МТР_291	Некорректно указан код классификатора медицинских специальностей1
378	МТР_292	Некорректно указан диагноз осложнения заболевания1(sl)
379	МТР_292	Некорректно указан диагноз осложнения заболевания1
380	МТР_293	Код осложнения заболевания не соответствует полу пациента11(sl)
381	МТР_293	Код осложнения заболевания не соответствует полу пациента11
382	МТР_295	Некорректно указан код надёжности идентификации (пациент МТР)
383	МТР_296	Некорректно указан вес при рождении (пациент-ребёнок).
384	МТР_297	Некорректно указана форма оказания медицинской помощи1
385	МТР_299	Некорректно указан метод ВМП1
386	МТР_300	Некорректно указан код надёжности идентификации представителя1
387	МТР_301	Некорректно указан вид мед.вмешательства1
388	МТР_308	Некорректно выставлена сумма, принятая к оплате по случаю
389	МТР_309	Некорректно указан единый номер полиса
390	МТР_33	Некорректно указан № записи в реестре случаев1
391	МТР_335	Код способа оплаты не соответствует периоду лечения.
392	МТР_34	Некорректно указан код условий оказания медицинской помощи1
393	МТР_35	Некорректно указан вид помощи1
394	МТР_360	Некорректно указан вид ВМП1
395	МТР_361	Некорректно указан регион страхования
396	МТР_362	Не указан пол пациента, либо отчество пациента не соответствует его полу (пациент МТР)
397	МТР_363	Некорректно указан пол представителя пациента или отчество представителя пациента не соответствует его полу
398	МТР_364	Не заполнено ни ФИО представителя, ни ФИО пациента
399	МТР_37	Некорректно указан код МО лечения в реестре услуг1
400	МТР_37	Некорректно указан код МО лечения1
401	МТР_38	Некорректно указан профиль медицинской помощи1
402	МТР_39	Некорректно указан признак детского профиля
403	МТР_39	Некорректно указан признак детского профиля (sl)
404	МТР_40	Некорректно указан номер истории болезни
405	МТР_42	Некорректно указана дата начала лечения1
406	МТР_43	Некорректно указана дата окончания лечения1
407	МТР_44	Некорректно указан первичный диагноз1 (sl)
408	МТР_44	Некорректно указан первичный диагноз1
409	МТР_46	Неполное кодирование первичного диагноза (sl)
410	МТР_46	Неполное кодирование первичного диагноза
411	МТР_460	Вид медицинской помощи не соответствует условию оказания
412	МТР_461	Вида мед.помощи не соответствует специальности врача
413	МТР_462	Форма оказания МП не соотв-т направлению на госпитализацию
414	МТР_463	Форма оказания МП не соотв-т условию оказания
415	МТР_464	Для данного условия оказания ВМП не предусмотрено
416	МТР_465	Метод ВМП не соот-т виду ВМП (sl)
417	МТР_465	Метод ВМП не соот-т виду ВМП
418	МТР_466	Дата окончания лечения не соответствует отчётному периоду из заголовка счёта
419	МТР_468	Код первичного диагноза заболевания не соответствует полу пациента1 (sl)
420	МТР_468	Код первичного диагноза заболевания не соответствует полу пациента1
421	МТР_47	Некорректно указан основной диагноз(sl).
422	МТР_47	Некорректно указан основной диагноз1
423	МТР_470	Первичный диагноз не соответствует возрасту пациента (sl)
424	МТР_470	Первичный диагноз не соответствует возрасту пациента
425	МТР_475	Диагноз сопутствующего заболевания не соответствует возрасту пациента(sl)
426	МТР_475	Диагноз сопутствующего заболевания не соответствует возрасту пациента
427	МТР_476	Неполное кодирование осложнения заболевания
428	МТР_476	Неполное кодирование осложнения заболевания (sl)
429	МТР_477	Диагноз осложнения заболевания не соответствует возрасту пациента(случай)
430	МТР_477	Диагноз осложнения заболевания не соответствует возрасту пациента
431	МТР_478	Исход заболевания не соответсвует результату обращения
432	МТР_479	Недопустимая специальность врача для диспансеризаций и медосмотров(sl)
433	МТР_479	Недопустимая специальность врача для диспансеризаций и медосмотров
434	МТР_48	Код основного диагноза заболевания не соответствует полу пациента1 (sl)
435	МТР_48	Код основного диагноза заболевания не соответствует полу пациента1
436	МТР_481	Сумма МО,выставленная на оплату меньше стоимости мед.услуг случая
437	МТР_49	Неоплачиваемое заболевание.
438	МТР_49	Неоплачиваемое заболевание(sl)
439	МТР_49	Неоплачиваемое заболевание услуга
440	МТР_50	В качестве основного диагноза указан вспомогательный код заболевания(sl)
441	МТР_50	В качестве основного диагноза указан вспомогательный код заболевания1
442	МТР_54	Некорректно указан диагноз сопутствующего заболевания1 (sl)
443	МТР_54	Некорректно указан диагноз сопутствующего заболевания1
444	МТР_55	Код сопутствующего заболевания не соответствует полу пациента1(sl)
445	МТР_55	Код сопутствующего заболевания не соответствует полу пациента1
446	МТР_56	Некорректно указан результат обращения/госпитализации1
447	МТР_564	Основной диагноз случая не соответствует методу ВМП
448	МТР_566	Результат не соответствует условию оказания МП
449	МТР_568	Исход заболевания не соответствует условию оказания МП
450	МТР_569	Несоответствие основного диагноза врачебной специальности для услуги
451	МТР_57	Некорректно указан исход заболевания
452	МТР_572	Давность случая лечения превышает 2 года
453	МТР_58	Некорректно указана специальность врача1(sl)
454	МТР_58	Некорректно указана специальность врача1
455	МТР_59	Оказание услуги пациенту 18 лет и старше детским врачом.
456	МТР_59	Оказание услуги пациенту 18 лет и старше детским врачом (sl)
457	МТР_5900	Некорректно указан признак "Повод обращения (sl)
458	МТР_5903	Некорректно указан "Признак подозрения на злокачественное новообразование" (МТР - МЭК)
459	МТР_5906	Некорректно указаны "Сведения о проведении консилиума при лечении онкологического заболевания".
460	МТР_5911	Некорректно указан Код диагностического показателя
461	МТР_5913	Некорректно указан тип диагностического показателя (sl)
462	МТР_60	Некорректно указан код способа оплаты медицинской помощи
463	МТР_62	Некорректно указана сумма МО, выставленная к оплате
464	МТР_65	Дублирование оказания мед.помощи по стационару
465	МТР_66	Некорректно указан номер записи в реестре услуг1
466	МТР_67	Некорректно указан профиль медицинской помощи для услуги1
467	МТР_68	Некорректно указан признак детского профиля для услуги
468	МТР_69	Некорректно указана дата начала оказания услуги1
469	МТР_70	Некорректно указана дата окончания оказания услуги1
470	МТР_71	Некорректно указан диагноз для услуги1
471	МТР_72	Код диагноза для услуги не соответствует полу пациента1
472	МТР_720	Некорректно указаны сведения о случае лечения онкологического заболевания (sl)
473	МТР_722	Дата регистрации противопоказания или отказа указана не корректно (sl)
474	МТР_725	Некорректно указан Признак выявления отдалённых метастазов.
475	МТР_726	Некорректно указано Значение Nodus (МТР - МЭК)
476	МТР_727	Некорректно указано Значение Tumor (МТР-МЭК)
477	МТР_728	Некорректно указана Стадия заболевания (STAD).
478	МТР_73	Некорректно указано наименование услуги (услуга МТР)
479	МТР_74	Некорректно указано количество услуг1
480	МТР_75	Проверка тарифа услуги на неотрицательность
481	МТР_76	Некорректно указана стоимость медицинской услуги (услуга МТР)
482	МТР_77	Некорректно указана специальность врача, выполнившего услугу1
483	МТР_87	Несоответствие профиля оказанной мед.помощи специальности врача/ср.мед.работника.
484	МТР_87	Несоответствие профиля оказанной мед.помощи специальности врача/ср.мед.работника для услуги
485	МТР_89	Данный пациент не может иметь представителя(пациент не является новорожденным).
486	МТР_93	Некорректно заполнено количество единиц оплаты мед.помощи
487	МТР_93	Некорректно заполнено количество единиц оплаты мед.помощи (sl)
488	МТР100	Необходима оценка случая с ухудшением
489	МТР102	Необходима оценка удлинения или укорочения сроков лечения
490	МТР108	Несоответствие способа оплаты условиям оказания
491	МТР108	Несоответствие способа оплаты условиям оказания или профилю медицинской помощи
492	МТР109	Неуточнённый код МКБ-10
493	МТР110	Неоплачиваемый профиль мед.помощи11
494	МТР110	Неоплачиваемый профиль мед.помощи
495	МТР111	Неоплачиваемая специальность врача
496	МТР259	Пересечение вызова скорой помощи с периодом госпитализации в стационаре
497	МТР307	Некорректно указана "Сумма санкций по законченному случаю"(SANK_IT).
498	МТР308	Некорректно указана сумма выставленная к оплате (SUMV)
499	МТР335	Код способа оплаты не соответствует периоду лечения
500	МТР335	Код способа оплаты не соответствует периоду лечения1
501	МТР47	Некорректно указан основной диагноз1(sl)
502	МТР47	Основной диагноз указан из диапозона А50-A64
503	МТР47	Некорректно указан основной диагноз
504	МТР47	Основной диагноз указан из диапазона А50-A64.
505	МТР47	МЭК.Основной диагноз указан из диапазона А50-A64
506	МТР49	Неоплачиваемое заболевание 1
507	МТР80	Симптомы и признаки отклонения от нормы
508	МТР81	Пересечение посещений АПУ с периодом госпитализации в стационаре
509	МТР84	Необходима оценка летального исхода
510	МТР85	Одновременное заполнение сведений о пациенте и его представителе недопустимо
511	МТР85	Одновременное заполнение сведений о пациенте и его представителе недопустимо (пациент МТР)
512	МТР87	Несоответствие профиля оказанной мед.помощи специальности врача/ср.мед.работника
513	МТР88	Повторное посещение врача одной и той же специальности в один день
514	МТР89	Данный пациент не может иметь представителя(пациент не является новорожденным)
515	МТР98	Дублирование услуг
516	912	Указанный специалист не может вести самостоятельный приём
517	28517	Не соответствует наименование пакета (DP, DV, DO, DS, DU, DF) целям диспансеризация или профилактический осмотр
518	28522	Несоответствие признака подозрения на злокачественное новообразование и установленного онкологического заболевания
519	28519	Некорректное сочетание полей направление (NAPRAV) и этап диспансеризации (DISP_E)
520	331	У МО нет лицензии для работы на территории ПК. Приказ МЗ № 108н
521	28520	Несоответствие вида медицинской помощи специальности медицинского работника
522	28520	Несоответствие вида медицинской помощи специальности медицинского работника (ТК)
523	28521	Медицинская помощь не может быть оказана после 10.09.2019 для МО 250205 и МО 250206
524	28523	Указанный код отказа S_OSN отсутствует в F014 или Территориальном справочнике дефектов
525	782_2	Некорректно заполнено поле DIAG_RSLT
526	28516	Некорректно указана дата оказания услуги
527	МТР83	Срок госпитализации в стационаре 1 день
\.


--
-- Name: errors_bars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('errors_bars_id_seq', 527, true);


--
-- Name: errors_bars errors_bars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errors_bars
    ADD CONSTRAINT errors_bars_pkey PRIMARY KEY (id);


--
-- Name: errors_bars_num; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX errors_bars_num ON errors_bars USING btree (num);


--
-- PostgreSQL database dump complete
--

