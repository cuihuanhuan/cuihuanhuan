 case 1 "IOT(溢出表)：建立" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1
              ( id      char(2)          constraint country_id_nn not null
              , name    varchar2(40)
              , curr_nam varchar2(25)
              , curr_sym varchar2(3)
              , region   varchar2(15)
              , constraint    country_c_id_pk
                              primary key (id ) )
              organization  index
              including     name
              pctthreshold  2
                       storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              overflow storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
          /


 case 2 "IOT(溢出表)：INSERT" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1
              ( id      char(2)          constraint country_id_nn not null
              , name    varchar2(40)
              , curr_nam varchar2(25)
              , curr_sym varchar2(3)
              , region   varchar2(15)
              , constraint    country_c_id_pk
                              primary key (id ) )
              organization  index
              including     name
              pctthreshold  2
                       storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              overflow storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
          /
          insert into test_iot1 values ( 1, 'China', 'Chinese yuan', 'CNY', 'ASIA' )
          /
          insert into test_iot1 values ( 2, 'Amercan', 'US Dollar', 'USD', 'America' )
          /
          commit
          /


 case 3 "IOT(溢出表:主键字段在一般字段后面)：建立" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                name    varchar2(40)
              , curr_nam varchar2(25)
              , curr_sym varchar2(3)
              , id      char(2)          constraint country_id_nn not null
              , region   varchar2(15)
              , constraint    country_c_id_pk
                              primary key (id ) )
              organization  index
              including     name
              pctthreshold  2
                       storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              overflow storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
          /


 case 4 "IOT(溢出表:主键字段在一般字段后面)：INSERT" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                name    varchar2(40)
              , curr_nam varchar2(25)
              , curr_sym varchar2(3)
              , id      char(2)          constraint country_id_nn not null
              , region   varchar2(15)
              , constraint    country_c_id_pk
                              primary key (id ) )
              organization  index
              including     name
              pctthreshold  2
                       storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              overflow storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
          /
          insert into test_iot1 values ( 'China', 'Chinese yuan', 'CNY',1, 'ASIA' )
          /
          insert into test_iot1 values ( 'Amercan', 'US Dollar', 'USD', 10,'America' )
          /


 case 5 "IOT(溢出表:分区表)：建立" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                name    varchar2(40)
              , curr_nam varchar2(25)
              , curr_sym varchar2(3)
              , id       int             constraint country_id_nn not null
              , region   varchar2(15)
              , constraint    country_c_id_pk
                              primary key (id ) )
              organization  index
              including     name
              pctthreshold  2
                       storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              overflow storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              partition by range (id) ( partition p1 values less than (100),
                                        partition P2 values less than (200),
                                        partition P3 values less than (MAXVALUE) )
          /


 case 6 "IOT(溢出表:分区表)：INSERT" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                name    varchar2(40)
              , curr_nam varchar2(25)
              , curr_sym varchar2(3)
              , id       int             constraint country_id_nn not null
              , region   varchar2(15)
              , constraint    country_c_id_pk
                              primary key (id ) )
              organization  index
              including     name
              pctthreshold  2
                       storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              overflow storage ( initial 4K  next 2K  pctincrease 0  minextents 1  maxextents 1 )
              partition by range (id) ( partition p1 values less than (100),
                                        partition P2 values less than (200),
                                        partition P3 values less than (MAXVALUE) )
          
          insert into test_iot1 values ( 'China', 'Chinese yuan', 'CNY',1, 'ASIA' )
          /
          insert into test_iot1 values ( 'Amercan', 'US Dollar', 'USD', 10,'America' )
          /


 case 7 "IOT(溢出表:众多字段)：建立" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /


 case 8 "IOT(溢出表:众多字段)：INSERT" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /


 case 9 "IOT(溢出表:众多字段)：DELETE" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          delete from test_iot1 where f100='A00'
          /


 case 10 "IOT(溢出表:众多字段)：UPDATE" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          update test_iot1 set f002='F02', f003='F03', f008='F08', F012='F12', F022='F22', f032='F32' where f100='100'
          /
          update test_iot1 set f002='x02', f003='x03', f008='x08',F012='x12',F022='x22',f032='x32',F150='XYZ',F250='xyz'
                 where f100='100'
          /


 case 11 "IOT(溢出表:众多字段)：UPDATE(2)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          update test_iot1 set f002='bbb', f003='ccc', f008='hhh', F012='xxx', F022='yyy', f032='zzz' where f100='100'
          /


 case 12 "IOT(溢出表:众多字段)：UPDATE(3)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          update test_iot1 set f002='x02', f003='x03', f008='x08', F012='x12', F022='x22',
                               f032='x32', F150='ABC', F250='abc' where f100='100'
          /


 case 13 "IOT(溢出表:众多字段)：UPDATE(4)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          update test_iot1 set f002='F02',f003='F03',f008='F08',F012='F12',F022='F22',f032='F32' where f100='100'
          /
          update test_iot1 set f002='P02',f003='r03',f008='d08',F012='s12',F022='v22',f032='g32', F150='xYz', F250='XyZ'
                 where f100='100'
          /


 case 14 "IOT(溢出表:众多字段)：UPDATE(5) - 主键不变，其他值也不变" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
        f000 char(3), f001 char(3), f002 char(3), f003 char(3), f004 char(3),
        f005 char(3), f006 char(3), f007 char(3), f008 char(3), f009 char(3),
        f010 char(3), f011 char(3), f012 char(3), f013 char(3), f014 char(3),
        f015 char(3), f016 char(3), f017 char(3), f018 char(3), f019 char(3),
        f020 char(3), f021 char(3), f022 char(3), f023 char(3), f024 char(3),
        f025 char(3), f026 char(3), f027 char(3), f028 char(3), f029 char(3),
        f030 char(3), f031 char(3), f032 char(3), f033 char(3), f034 char(3),
        f035 char(3), f036 char(3), f037 char(3), f038 char(3), f039 char(3),
        f040 char(3), f041 char(3), f042 char(3), f043 char(3), f044 char(3),
        f045 char(3), f046 char(3), f047 char(3), f048 char(3), f049 char(3),
        f050 char(3) not null, f051 char(3), f052 char(3), f053 char(3), f054 char(3),
        f055 char(3), f056 char(3), f057 char(3), f058 char(3), f059 char(3),
        f060 char(3), f061 char(3), f062 char(3), f063 char(3), f064 char(3),
        f065 char(3), f066 char(3), f067 char(3), f068 char(3), f069 char(3),
        f070 char(3), f071 char(3), f072 char(3), f073 char(3), f074 char(3),
        f075 char(3), f076 char(3), f077 char(3), f078 char(3), f079 char(3),
        f080 char(3), f081 char(3), f082 char(3), f083 char(3), f084 char(3),
        f085 char(3), f086 char(3), f087 char(3), f088 char(3), f089 char(3),
        f090 char(3), f091 char(3), f092 char(3), f093 char(3), f094 char(3),
        f095 char(3), f096 char(3), f097 char(3), f098 char(3), f099 char(3),
        f100 char(3) not null, f101 char(3), f102 char(3), f103 char(3), f104 char(3),
        f105 char(3), f106 char(3), f107 char(3), f108 char(3), f109 char(3),
        f110 char(3), f111 char(3), f112 char(3), f113 char(3), f114 char(3),
        f115 char(3), f116 char(3), f117 char(3), f118 char(3), f119 char(3),
        f120 char(3), f121 char(3), f122 char(3), f123 char(3), f124 char(3),
        f125 char(3), f126 char(3), f127 char(3), f128 char(3), f129 char(3),
        f130 char(3), f131 char(3), f132 char(3), f133 char(3), f134 char(3),
        f135 char(3), f136 char(3), f137 char(3), f138 char(3), f139 char(3),
        f140 char(3), f141 char(3), f142 char(3), f143 char(3), f144 char(3),
        f145 char(3), f146 char(3), f147 char(3), f148 char(3), f149 char(3),
        f150 char(3) not null, f151 char(3), f152 char(3), f153 char(3), f154 char(3),
        f155 char(3), f156 char(3), f157 char(3), f158 char(3), f159 char(3),
        f160 char(3), f161 char(3), f162 char(3), f163 char(3), f164 char(3),
        f165 char(3), f166 char(3), f167 char(3), f168 char(3), f169 char(3),
        f170 char(3), f171 char(3), f172 char(3), f173 char(3), f174 char(3),
        f175 char(3), f176 char(3), f177 char(3), f178 char(3), f179 char(3),
        f180 char(3), f181 char(3), f182 char(3), f183 char(3), f184 char(3),
        f185 char(3), f186 char(3), f187 char(3), f188 char(3), f189 char(3),
        f190 char(3), f191 char(3), f192 char(3), f193 char(3), f194 char(3),
        f195 char(3), f196 char(3), f197 char(3), f198 char(3), f199 char(3),
        f200 char(3) not null, f201 char(3), f202 char(3), f203 char(3), f204 char(3),
        f205 char(3), f206 char(3), f207 char(3), f208 char(3), f209 char(3),
        f210 char(3), f211 char(3), f212 char(3), f213 char(3), f214 char(3),
        f215 char(3), f216 char(3), f217 char(3), f218 char(3), f219 char(3),
        f220 char(3), f221 char(3), f222 char(3), f223 char(3), f224 char(3),
        f225 char(3), f226 char(3), f227 char(3), f228 char(3), f229 char(3),
        f230 char(3), f231 char(3), f232 char(3), f233 char(3), f234 char(3),
        f235 char(3), f236 char(3), f237 char(3), f238 char(3), f239 char(3),
        f240 char(3), f241 char(3), f242 char(3), f243 char(3), f244 char(3),
        f245 char(3), f246 char(3), f247 char(3), f248 char(3), f249 char(3),
        f250 char(3) not null, f251 char(3), f252 char(3), f253 char(3), f254 char(3),
        f255 char(3), f256 char(3), f257 char(3), f258 char(3), f259 char(3),
        f260 char(3), f261 char(3), f262 char(3), f263 char(3), f264 char(3),
        f265 char(3), f266 char(3), f267 char(3), f268 char(3), f269 char(3),
        f270 char(3), f271 char(3), f272 char(3), f273 char(3), f274 char(3),
        f275 char(3), f276 char(3), f277 char(3), f278 char(3), f279 char(3),
        f280 char(3), f281 char(3), f282 char(3), f283 char(3), f284 char(3),
        f285 char(3), f286 char(3), f287 char(3), f288 char(3), f289 char(3),
        f290 char(3), f291 char(3), f292 char(3), f293 char(3), f294 char(3),
        f295 char(3), f296 char(3), f297 char(3), f298 char(3), f299 char(3),
        f300 char(3) not null
          , constraint table_iot3_pk primary key (f100,f150,f200,f250,f300 ) )
            organization index including   f010 pctthreshold 2
                    storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
           overflow storage ( initial  4K next  2K pctincrease 0 minextents 1 maxextents 1 )
          /

          insert into test_iot1 values (
            '000', '001', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            '100', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'A00', 'B01', '002', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'A00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          insert into test_iot1 values (
            'x00', 'y01', 'z02', '003', '004', '005', '006', '007', '008', '009',
            '010', '011', '012', '013', '014', '015', '016', '017', '018', '019',
            '020', '021', '022', '023', '024', '025', '026', '027', '028', '029',
            '030', '031', '032', '033', '034', '035', '036', '037', '038', '039',
            '040', '041', '042', '043', '044', '045', '046', '047', '048', '049',
            '050', '051', '052', '053', '054', '055', '056', '057', '058', '059',
            '060', '061', '062', '063', '064', '065', '066', '067', '068', '069',
            '070', '071', '072', '073', '074', '075', '076', '077', '078', '079',
            '080', '081', '082', '083', '084', '085', '086', '087', '088', '089',
            '090', '091', '092', '093', '094', '095', '096', '097', '098', '099',
            'Z00', '101', '102', '103', '104', '105', '106', '107', '108', '109',
            '110', '111', '112', '113', '114', '115', '116', '117', '118', '119',
            '120', '121', '122', '123', '124', '125', '126', '127', '128', '129',
            '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
            '140', '141', '142', '143', '144', '145', '146', '147', '148', '149',
            '150', '151', '152', '153', '154', '155', '156', '157', '158', '159',
            '160', '161', '162', '163', '164', '165', '166', '167', '168', '169',
            '170', '171', '172', '173', '174', '175', '176', '177', '178', '179',
            '180', '181', '182', '183', '184', '185', '186', '187', '188', '189',
            '190', '191', '192', '193', '194', '195', '196', '197', '198', '199',
            '200', '201', '202', '203', '204', '205', '206', '207', '208', '209',
            '210', '211', '212', '213', '214', '215', '216', '217', '218', '219',
            '220', '221', '222', '223', '224', '225', '226', '227', '228', '229',
            '230', '231', '232', '233', '234', '235', '236', '237', '238', '239',
            '240', '241', '242', '243', '244', '245', '246', '247', '248', '249',
            '250', '251', '252', '253', '254', '255', '256', '257', '258', '259',
            '260', '261', '262', '263', '264', '265', '266', '267', '268', '269',
            '270', '271', '272', '273', '274', '275', '276', '277', '278', '279',
            '280', '281', '282', '283', '284', '285', '286', '287', '288', '289',
            '290', '291', '292', '293', '294', '295', '296', '297', '298', '299',
            '300' )
          /
          update test_iot1 set f002='P02',f003='r03',f008='d08',F012='s12',F022='v22',f032='g32', F150='xYz', F250='XyZ'
                 where f100='100'
          /


 case 15 "IOT：UPDATE - 值更改为空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int primary key, f2 int ) organization index
          /
          insert into test_iot1 values (1,1)
          /
          insert into test_iot1 values (2,2)
          /
          update test_iot1 set f2=null
          /


 case 16 "IOT：UPDATE - 空值操作" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /


 case 17 "IOT：TRUNCATE" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /


 case 18 "IOT：大批量INSERT" 0
      src_sql:
          drop table swap_t
          /
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /

          create table swap_t as select * from test_iot1 where 1=0
          /
          insert into swap_t values ( 11,12,13,14,15,16,17 )
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          insert into swap_t select * from swap_t
          /
          update swap_t set f1=rownum+10000, f2=rownum, f3=rownum, f4=rownum, f5=rownum, f6=rownum, f7=rownum
          /
          insert into test_iot1 select * from swap_t
          /


 case 19 "IOT：大批量UPDATE(表有7个字段，2个非主键字段(f4,f6)从有值修改为空)" 0
      src_sql:
          drop table swap_t
          /
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f4=null, f6=null
          /


 case 20 "IOT：大批量UPDATE(表有7个字段，更新全部7个字段)" 0
      src_sql:
            drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f1=rownum, f2=2, f3=3, f4=4, f5=rownum, f6=6, f7=7
          /


 case 21 "IOT：大批量UPDATE(表有7个字段，更新溢出表的最后一个字段为空值)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f7=null
          /


 case 22 "IOT：大批量UPDATE(表有7个字段，更新溢出表的倒数第二个字段为空值)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f6=null
          /


 case 23 "IOT：大批量UPDATE(表有7个字段，更新溢出表的最后一个字段: 空值更新为有值)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f7=rownum
          /


 case 24 "IOT：大批量UPDATE(表有7个字段，更新溢出表的倒数第二个字段: 空值更新为有值)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f6=rownum
          /


 case 25 "IOT：增加字段" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          alter table test_iot1 add ( f9 int )
          /


 case 26 "IOT：大批量UPDATE: 修改增加字段后原来最后一个字段" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f7=7000+rownum
          /


 case 27 "IOT：大批量UPDATE: 修改增加的字段" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f9=9000000+rownum
          /


 case 28 "IOT：大批量UPDATE: 修改增加的字段和其他字段" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f6=6000000+rownum, f7=8000000+rownum, f9=90000000+rownum
          /
          commit
          /


 case 29 "IOT：大批量UPDATE: 修改增加的字段和其他字段(数值缩小)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f6=6, f7=7, f9=9
          /


 case 30 "IOT：大批量UPDATE: 修改增加的字段和其他字段(数值扩大F7)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f7=8000000000+rownum
          /


 case 31 "IOT：大批量UPDATE: 修改增加的字段和其他字段(数值扩大F9)" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 ( f1 int not null, f2 int, f3 int, f4 int, f5 int, f6 int, f7 int,
                                   primary key (f1,f2,f3 ) ) organization index including f5 pctthreshold 2
                      storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
             overflow storage ( initial  4k next  2k pctincrease 0 minextents 1 maxextents 1 )
          /
          insert into test_iot1 values ( 11,12,13,null,null,null, 17 )
          /
          insert into test_iot1 (f1,f2,f3) values (21,22,23)
          /
          insert into test_iot1 values ( 31,32,33,34,35,null,null )
          /
          insert into test_iot1 values ( 41,42,43,null,null,46,47 )
          /
          update test_iot1 set f2=120, f3=130, f5=15, f6=16, f7=170 where f1=11
          /
          update test_iot1 set f2=12, f3=13, f4=null, f5=null, f6=16, f7=null where f1=11
          /
          truncate table test_iot1
          /
          update test_iot1 set f9=90000000000+rownum
          /


 case 32 "IOT：INSERT，极少字段有值" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /


 case 33 "IOT：UPDATE，极少字段有值-1" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /
          update test_iot1 set b=null
          /


 case 34 "IOT：UPDATE，极少字段有值-2" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /
          update test_iot1 set c=null
          /


 case 35 "IOT：UPDATE，极少字段有值-3" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /
          update test_iot1 set d=null
          /


 case 36 "IOT：UPDATE，极少字段有值-4" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /
          update test_iot1 set e=null
          /


 case 37 "IOT：UPDATE，极少字段有值-5" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /
          update test_iot1 set b='B2', c='C3'
          /
          commit
          /


 case 38 "IOT：UPDATE，极少字段有值-6" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30),
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', null, null, null, null )
          /
          insert into test_iot1 values ( '1', 'b', null, null, null )
          /
          insert into test_iot1 values ( '2', null, 'c', null, null )
          /
          insert into test_iot1 values ( '3', null, null, 'd', null )
          /
          insert into test_iot1 values ( '4', null, null, null, 'e' )
          /
          update test_iot1 set b='b2', d='D4'
          /
          commit
          /


 case 39 "IOT：溢出表首字段为空，其他所有字段非空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30) not null,
                 e   varchar2(30) not null,
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', null, 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', null, 'd2', 'e2' )
          /

 case 40 "IOT：溢出表首字段为空，其他所有字段非空: UPDATE 溢出字段d" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30) not null,
                 e   varchar2(30) not null,
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', null, 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', null, 'd2', 'e2' )
          /

          update test_iot1 set d='D_'||a
          /


 case 41 "IOT：溢出表首字段为空，其他所有字段非空: UPDATE 溢出字段e" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30) not null,
                 e   varchar2(30) not null,
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', null, 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', null, 'd2', 'e2' )
          /

          update test_iot1 set e='E_'||a
          /


 case 42 "IOT：溢出所有首字段为空，溢出字段均为空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, null, null )
          /
          insert into test_iot1 values ( '1', 'b1', null, null, null )
          /
          insert into test_iot1 values ( '2', 'b2', null, null, null )
          /


 case 43 "IOT：溢出表所有字段为空，其他所有字段非空: UPDATE 三个溢出字段的中间一个为非空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, null, null )
          /
          insert into test_iot1 values ( '1', 'b1', null, null, null )
          /
          insert into test_iot1 values ( '2', 'b2', null, null, null )
          /

          update test_iot1 set d='D_'||a
          /


 case 44 "IOT：溢出表所有字段为空，其他所有字段非空: UPDATE 三个溢出字段的第一个为非空" 0
      src_sql:
         drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, null, null )
          /
          insert into test_iot1 values ( '1', 'b1', null, null, null )
          /
          insert into test_iot1 values ( '2', 'b2', null, null, null )
          /

          update test_iot1 set c='E_'||a
          /


 case 45 "IOT：溢出表所有字段为空，其他所有字段非空: UPDATE 三个溢出字段的最后一个为非空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', null, null, null )
          /
          insert into test_iot1 values ( '1', 'b1', null, null, null )
          /
          insert into test_iot1 values ( '2', 'b2', null, null, null )
          /

          update test_iot1 set e='E_'||a
          /


 case 46 "IOT：溢出表所有字段非空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', 'c0', 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', 'c1', 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', 'c2', 'd2', 'e2' )
          /


 case 47 "IOT：溢出表所有字段非空，UPDATE 三个溢出字段的中间一个为空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', 'c0', 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', 'c1', 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', 'c2', 'd2', 'e2' )
          /
          update test_iot1 set d=null
          /


 case 48 "IOT：溢出表所有字段非空，UPDATE 三个溢出字段的第一个为空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', 'c0', 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', 'c1', 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', 'c2', 'd2', 'e2' )
          /
          update test_iot1 set c=null
          /


 case 49 "IOT：溢出表所有字段非空，UPDATE 三个溢出字段的最后一个为空" 0
      src_sql:
          drop table test_iot1
          /
          create table test_iot1 (
                 a   varchar2(30) not null,
                 b   varchar2(30) not null,
                 c   varchar2(30),
                 d   varchar2(30),
                 e   varchar2(30),
                 primary key   (a)
          ) organization index overflow including b
          /
          insert into test_iot1 values ( '0', 'b0', 'c0', 'd0', 'e0' )
          /
          insert into test_iot1 values ( '1', 'b1', 'c1', 'd1', 'e1' )
          /
          insert into test_iot1 values ( '2', 'b2', 'c2', 'd2', 'e2' )
          /
          update test_iot1 set e=null
          /
