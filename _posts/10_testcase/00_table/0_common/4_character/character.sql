case 67 "字符集:英文" 0
        src_sql:
            drop table t_character
            /
            create table t_character (
                c_character1  varchar2(100)
            )
            /
            insert into t_character values('abcdefghijklmnopqrstuvwxyz')
            /
            insert into t_character values('ABCDEFGHIJKLMNOPTRSQUVWXYZ')
            /
tgt_sql:
select * from t_character
/



case 68 "字符集:中文" 0
        src_sql:
            drop table t_character
            /
            create table t_character (
                c_character1  varchar2(100)
            )
            /
            insert into t_character values('上海英方软件股份有限公司简体字')
            /
            insert into t_character values('上海英方軟件股份有限公司繁體字')
            /
 tgt_sql:
select * from t_character
/           /


case 69 "字符集:数字" 0
        src_sql:
            drop table t_character
            /
            create table t_character (
                c_character1  varchar2(100)
            )
            /
            insert into t_character values('0123456789')
            /
tgt_sql:
select * from t_character
/


case 70 "字符集:符号" 0
        src_sql:
            drop table t_character
            /
            create table t_character (
                c_character1  varchar2(100)
            )
            /
            insert into t_character values('~!@#$%^&*_+{}|:<>?-=[]\;,./︵︷︹︿︽﹁﹃︻︗/|︶︸︺﹀︾︾﹄︼︘／｜＼')
            /
            insert into t_character values('~！@#￥%……&*（）——+{}|：“《》？·-=【】、；’，。、_＿﹏﹍﹎`¦¡^­¨ˊ¯￣﹋﹉﹊ˋ︴¿ˇ')
            /
            insert into t_character values('ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹ①②③④⑤⑥⑦⑧⑨⑩')
            /
            insert into t_character values('㎎㎏μm㎜㎝㎞′¥$€฿￡㎡㎥㏄mlmol㏕″￥£￠₠㏒㏑%‰％℃℉∵∴∷±≈≡≠≧≦×')
            /
tgt_sql:
select * from t_character
/