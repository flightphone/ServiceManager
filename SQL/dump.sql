truncate table t_ntusers;
truncate table t_usergroup;
truncate table t_accessreport;
truncate table t_mnmainmenu;
truncate table t_rpdeclare;
truncate table t_sysfieldmap;
truncate table t_sysparams;
truncate table t_sysstatus;

----------------------------------------------------

insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('sa','sa',null,null,'1',null,null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('User','User 1','CH,FB,PsgSQL','Operators','123','sdasd',null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('Admin','Администратор',null,null,'123',null,null,null);

insert into t_usergroup(groupname,type,caption)
values ('Operators',null,'Операторы');
insert into t_usergroup(groupname,type,caption)
values ('Administrators','4','Администраторы');

insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Administrators','Admin','Admin','Admin','0','1dc3cdec-c91c-11eb-907c-3fa681425964');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Administrators','Administrators','Группа пользователей','4','1dc89341-c91c-11eb-9092-af06b9544ab2');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Operators','Operators','Группа AD','4','9bf22f52-0515-11ed-9f9e-7fb0ce53f084');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Коннекторы','Administrators','Administrators','Группа AD','4','5933c6cc-05b4-11ed-9835-bfae8681b582');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Тест API','Administrators','Administrators','Группа AD','4','f5566d28-05b6-11ed-a660-9778159247aa');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Запросы2','Operators','Operators','Группа AD','4','c5c18d02-0e46-11ed-89df-2ffa835d1eb6');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Запросы','Administrators','Administrators','Группа AD','4','e6fac9b6-05c2-11ed-abeb-dffc0ed72d7f');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Operators','User','User','User','0','7d692eb6-0e4b-11ed-84df-836871db6601');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Агенты','Administrators','Administrators','Группа AD','4','0435c9de-0e58-11ed-ad92-f7ae15f955ed');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Тест API','Operators','Operators','Группа AD','4','566745d2-0d5b-11ed-8ec7-e7f34fa12cc6');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Operators','User233','User233','User233','0','8f7fc80a-0d9f-11ed-922e-97cdc881b190');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Administrators','User23','User23','User23','0','1cc61b38-0da0-11ed-849d-8362f0fc94a2');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('MtfUsers','Administrators','Administrators','Группа AD','4','441c927a-0da0-11ed-bdc4-f705edc4455b');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Administrators','Ivanov','Ivanov','Ivanov','0','08fd3db0-0da1-11ed-be7a-9bf4aea6a765');

insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('92','800','Источники данных',null,'ALL','Bureau.Finder','Коннекторы','146',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('97','810','Запросы (Admin)',null,'ALL','Declare','Запросы','149',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('108','815','Запросы (Operators)',null,'ALL','Declare','Запросы2','168',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('94','820','Тест API',null,'ALL','test_api','Тест API',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('107','830','Пользователи',null,'ALL','Bureau.Finder','MtfUsers','167',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('109','840','Агенты',null,'ALL','Bureau.Finder','Агенты','169',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('19','1000','Настройки/Пользователи','1','ALL','Bureau.Finder','Пользователи','120',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('32','1005','Настройки/Группы','1','ALL','Bureau.Finder','Группы пользователей','121',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('96','1010','Настройки/Пользователи и группы',null,'ALL','Bureau.Finder','Группы','116',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('89','1011','Настройки/Права доступа',null,'ALL','Bureau.Finder','Права доступа','117',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('29','1031','Настройки/Папки','1','ALL','Bureau.Finder','Пункты меню','10',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('30','1032','Настройки/Таблицы','1','ALL','Declare','Колонки таблиц','75',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('103','1033','Настройки/Таблицы НСИ',null,'ALL','Declare','Таблицы НСИ','129',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('74','1037','Настройки/Списки выбора','1','ALL','Bureau.Finder','Списки','127',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('71','1040','Настройки/Images','1','ALL','Bureau.Finder','Картинки','126',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('20','1040','Настройки/Права доступа (форма)','1','ALL','Bureau.Access','Права доступа Old',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('83','1040','Настройки/Перечисления',null,'ALL','Bureau.Finder','Списки значений','124',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('64','1045','Настройки/Резервное копирование',null,'ALL','Bureau.BackBase','Резервное копирование',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('73','1046','Настройки/Setup',null,'ALL','Bureau.Setup','Setup',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('99','1051','Настройки/Услуги UTG',null,'ALL','Bureau.Finder','test','151',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('105','1052','Настройки/ТипыВС',null,'ALL','Bureau.Finder','test','156',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('106','1053','Настройки/AirLines (remote)',null,'ALL','Bureau.Finder','test','157',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('75','2000','Настройки/SqlAdmin',null,'ALL','/sqladmin.html','sqladmin',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('84','2000','Справка',null,'ALL','/help.pdf','Справка',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('90','1000000','Выход',null,'ALL','exit','exit',null,null,null);

insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('10','t_mnMainMenu','Папки','30','select * from t_mnmainmenu order by ordmenu','idmenu','caption',null,null,null,null,'0',null,null,'t_mnMainMenu','p_t_mnMainMenu_edit','p_t_mnMainMenu_del',null,'idmenu,ordmenu,caption,link,link1,params,mnemo,app,web,silver');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('75','t_rpDeclare','Таблицы','7','select * from t_rpdeclare order by iddeclare desc','iddeclare','decname','76','Bureau.FindDeclare',null,null,'0',null,null,null,'p_rpDeclare_edit','p_rpDeclare_del',null,'iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('76','t_columns','Колонки таблицы','500','select * from t_columns where iddeclare = [iddeclare] order by ordc','idcolumn','fieldname',null,null,null,null,null,null,null,null,'p_t_columns_edit','p_t_columns_del',null,'idcolumn,iddeclare,ordc,visible,fieldname,fieldcaption,displayformat,width');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('116','ObjectAccess','Группы пользователей','30','select * from v_object where objcod = 4 order by objectname','objectname','objectname','118',null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('117','ObjectAccess','Права доступа','100','select * from v_object  order by objcod, objectname','objectname','objectname','118',null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('118','t_AccessReport','Пользователи в группе','7','select *, grp objectname from t_accessreport where grp = ''[objectname]'' order by account','ac_pk','account',null,null,null,null,'0',null,'GRP','t_accessreport','p_t_accessreport_edit','p_t_accessreport_del',null,'ac_pk,objectname,account,fullname,email,type');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('119','FreeAccount','Свободные логины','7','select * from fn_freeaccount (''[grp]'') order by account','account','account',null,null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('120','sysUsers','Пользователи','7','select * from t_ntusers order by username','username','username',null,null,null,null,null,null,null,'t_NTUsers','p_ntusers_edit','p_ntusers_del',null,'username,fullname,description,orgs,pass,email,icq,skype');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('121','t_UserGroup','Группы','7','select * from t_usergroup order by groupname','groupname','groupname',null,null,null,null,'0',null,null,'t_UserGroup','p_t_UserGroup_EDIT','p_t_UserGroup_DEL',null,'groupname,type,caption');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('124','t_sysStatusType','Списки значений','7','SELECT * FROM t_sysstatus order by idstatus;','idstatus','statusname',null,null,null,null,null,null,null,'t_sysStatus','p_t_sysStatus_EDIT','p_t_sysStatus_DEL',null,'idstatus,statustype,statusname,color,sortorder,comment,image_bmp');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('126','t_sysMenuImage','Images','7','select * from t_sysmenuimage order by idimage','idimage','caption',null,null,null,null,'0',null,null,'t_sysMenuImage','p_t_sysMenuImage_EDIT','p_t_sysMenuImage_DEL',null,'idimage,caption,image_bmp,mnemo');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('127','t_sysFieldMap','Списки выбора','7','select * from t_sysfieldmap order by idmap','idmap','idmap',null,null,null,null,'0',null,null,'t_sysFieldMap','p_t_sysFieldMap_EDIT','p_t_sysFieldMap_DEL',null,'idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('128','FreeAccount','Свободные логины 2','100','select * from fn_freeaccount (''[objectname]'') order by account','account','account',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('129','t_rpDeclareNCI','Таблицы НСИ','50','select * from t_rpdeclare order by iddeclare','iddeclare','decname',null,null,null,null,null,null,null,null,'p_rpdeclare2_edit','p_rpdeclare_del',null,'iddeclare,decname,descr,dectype,keyfield,dispfield');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('145','contype','Тип коннектора','17','select * from contype order by cn_id','cn_id','cn_typedb',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('146','v_connectors','Доступные источники НСИ','30','select * from v_connectors order by name /*__external__*/','name','name',null,null,null,null,null,null,null,null,'p_connectors_edit','p_connectors_del',null,'name,username,password,address,dbname,typedb');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('149','querys','Запросы','30','select * from querys order by name /*__external__*/','name','name','152',null,null,null,null,null,null,null,'p_querys_edit','p_querys_del',null,'name,userid,command,dbconnectorname');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('151','testcolumn','тест колонок (Услуги)','30','/*__external__*/',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('152','queryexecute','Результаты запроса','30','/*__external__*/',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('156','ACTypes','Типы ВС 2','30','select * from ACTypes (nolock) order by AT_UTG','AT_PK','AT_NameEn',null,null,null,null,null,'MSSQL@data source=localhost\SQLEXPRESS8;User ID=sa;Password=aA12345678;database=uFlights',null,null,'p_ACTypes_EDIT','p_ACTypes_DEL',null,'AT_PK,AT_UTG,AT_IATA,AT_ICAO,AT_STC,AT_NameEn,AT_NameRu,AT_FullNameEn,AT_FullNameRu,AT_Type,AT_Category,AT_MTOW,AT_Note,AT_F,AT_C,AT_M,AT_Y,AT_Category_DME');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('157','Airlines','Авиакомпании','30','select * from Airlines order by AL_UTG','AL_PK','AL_NameRu',null,null,null,null,null,'MSSQL@data source=51.250.44.37;User ID=sa;Password=aA12345678$;database=test',null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('158','TARIF788','TARIF788','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('159','CHTEST','CHTEST','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('160','TARIF','TARIF','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('161','PSG','PSG','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('162','TARIF70','TARIF70','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('163','AIR','AIR','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('164','PHONES','PHONES','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('167','mftusers','Пользователи','7','select username, pass, orgs, email, description 
from t_ntusers 
where username <> ''Admin'' order by  username','username','username',null,null,null,null,null,null,null,null,'p_mtfusers_edit','p_ntusers_del',null,'username,pass,orgs,email,description');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('168','querys','Запросы','30','select * from querys order by name /*__external__*/','name','name','152',null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('169','agents','Агенты','30','select * from agents order by ag_id','ag_id','ag_name',null,null,null,null,null,null,null,null,'p_agents_edit','p_agents_del',null,'ag_id,ag_name,ag_comment,ag_serificate');

insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('23','t_AccessReport','fullname','fullname',null,null,'FreeAccount',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('24','t_AccessReport','email','email',null,null,'FreeAccount',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('25','t_AccessReport','type','type',null,null,'FreeAccount',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('2','t_sysFieldMap','iddeclare','iddeclare','75','Bureau.Finder','t_rpDeclare','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('3','t_sysFieldMap','groupdec','decname',null,null,'t_rpDeclare',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('1','t_sysFieldMap','decname','decname','75','Bureau.Finder','t_rpDeclare0',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('27','v_connectors','typedb','cn_id',null,null,'contype','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('26','v_connectors','cn_typedb','cn_typedb','145','Bureau.GridCombo','contype',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('28','querys','dbconnectorname','name','146','Bureau.Finder','v_connectors','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('22','t_AccessReport','account','account','119','Bureau.Finder','FreeAccount','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('30','mftusers','orgs','groupname','121','Bureau.GridCombo','t_UserGroup','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('33','mftusers','email','dbname','146','CheckList','v_connectors','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('32','mftusers','description','name','146',null,'v_connectors',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('4','t_mnMainMenu','params','iddeclare','75','Bureau.Finder','t_rpDeclare','1');

insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_AccessReport','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="account" FieldCaption = "Логин" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="fullname" FieldCaption = "Имя" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="email" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="grp" FieldCaption = "GRP" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "Type" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_AccessReport','Sun, 03 Jun 2018 15:51:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindObjectAccess','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="objectname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="objecttype" FieldCaption = "Тип" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Описание" DisplayFormat = "" Width = "250" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="objcod" FieldCaption = "ObjCod" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="idtmpnum" FieldCaption = "IDTMPNUM" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindObjectAccess','Sun, 03 Jun 2018 16:24:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindFreeAccount','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="account" FieldCaption = "Логин" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="fullname" FieldCaption = "Имя" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="email" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "TYPE" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="idtmpnum" FieldCaption = "IDTMPNUM" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindFreeAccount','Sun, 03 Jun 2018 16:24:39 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_sysMenuImage','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="idimage" FieldCaption = "№" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Путь" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="mnemo" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="image_bmp" FieldCaption = "Картинка" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysMenuImage','Sun, 03 Jun 2018 16:27:13 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_UserGroup','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="groupname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "Тип" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_UserGroup','Sun, 03 Jun 2018 16:29:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_sysFieldMap','<GRID FROZENCOLS="" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="idmap" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="decname" FieldCaption = "DecName" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dstfield" FieldCaption = "dstField" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="srcfield" FieldCaption = "srcField" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="iddeclare" FieldCaption = "idDeclare" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="classname" FieldCaption = "ClassName" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="groupdec" FieldCaption = "GroupDec" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyfield" FieldCaption = "KeyField" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysFieldMap','Sun, 03 Jun 2018 16:27:44 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindCHTEST','','GridFindCHTEST','Sun, 24 Jul 2022 09:12:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_rpDeclare','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="iddeclare" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decname" FieldCaption="Название" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descr" FieldCaption="Описание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dectype" FieldCaption="Число записей" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyfield" FieldCaption="Ключевое поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispfield" FieldCaption="Отображаемое поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyvalue" FieldCaption="Детали" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyparamname" FieldCaption="KeyParamName" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispparamname" FieldCaption="Параметры" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="isbasename" FieldCaption="IsBaseName" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decsql" FieldCaption="Запрос" DisplayFormat="text" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="tablename" FieldCaption="Таблица" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="editproc" FieldCaption="Функция обновления" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="delproc" FieldCaption="Функция удаления" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="image_bmp" FieldCaption="Картинка" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="savefieldlist" FieldCaption="Список полей" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispvalue" FieldCaption="dispvalue" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="addkeys" FieldCaption="addkeys" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descript" FieldCaption="Драйвер, строка подключения" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_rpDeclare','Thu, 28 Jul 2022 00:48:46 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindcontype','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="cn_id" FieldCaption = "ID" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="cn_typedb" FieldCaption = "Тип коннектора" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindcontype','Sun, 17 Jul 2022 08:57:41 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindv_connectors','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="name" FieldCaption = "Имя коннектора" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="username" FieldCaption = "Имя входа БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="password" FieldCaption = "Пароль к БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="address" FieldCaption = "Адрес БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dbname" FieldCaption = "Имя БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="typedb" FieldCaption = "typedb" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="cn_typedb" FieldCaption = "Тип коннектора" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindv_connectors','Sun, 17 Jul 2022 09:49:01 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindsysUsers','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="username" FieldCaption="Логин" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="fullname" FieldCaption="Имя" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="email" FieldCaption="Email" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="description" FieldCaption="Описание" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="orgs" FieldCaption="Компания" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="icq" FieldCaption="Icq" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="skype" FieldCaption="Skype" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="pass" FieldCaption="Пароль" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindsysUsers','Fri, 22 Jul 2022 11:12:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_columns','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="idcolumn" FieldCaption="idcolumn" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="iddeclare" FieldCaption="iddeclare" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ordc" FieldCaption="N" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="visible" FieldCaption="Visible" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="fieldname" FieldCaption="Поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="fieldcaption" FieldCaption="Заголовок" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="displayformat" FieldCaption="Формат" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="width" FieldCaption="Ширина" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_columns','Sat, 23 Jul 2022 08:10:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindquerys','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="name" FieldCaption="Имя запроса" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="userid" FieldCaption="Пользователь НСИ" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="command" FieldCaption="Текст SQL" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dbconnectorname" FieldCaption="Коннектор" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="iddeclare" FieldCaption="iddeclare" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decname" FieldCaption="decname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descr" FieldCaption="descr" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dectype" FieldCaption="dectype" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decsql" FieldCaption="decsql" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyfield" FieldCaption="keyfield" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispfield" FieldCaption="dispfield" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyvalue" FieldCaption="keyvalue" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispvalue" FieldCaption="dispvalue" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyparamname" FieldCaption="keyparamname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispparamname" FieldCaption="dispparamname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="isbasename" FieldCaption="isbasename" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descript" FieldCaption="descript" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="addkeys" FieldCaption="addkeys" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="tablename" FieldCaption="tablename" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="editproc" FieldCaption="editproc" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="delproc" FieldCaption="delproc" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="image_bmp" FieldCaption="image_bmp" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="savefieldlist" FieldCaption="savefieldlist" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindquerys','Thu, 28 Jul 2022 03:36:43 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_mnMainMenu','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="idmenu" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="ordmenu" FieldCaption = "NN" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Путь" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link" FieldCaption = "На главной форме" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="app" FieldCaption = "Приложение" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link1" FieldCaption = "Компонент" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="mnemo" FieldCaption = "Доступ" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="params" FieldCaption = "Параметры" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="web" FieldCaption = "Иконка" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="silver" FieldCaption = "silver" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_mnMainMenu','Fri, 22 Jul 2022 00:08:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindAIR','','GridFindAIR','Thu, 28 Jul 2022 01:08:00 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_sysStatusType','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="idstatus" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="statustype" FieldCaption="Группа" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="statusname" FieldCaption="Название" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="color" FieldCaption="Цвет" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="sortorder" FieldCaption="Order" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="comment" FieldCaption="Значение1" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="image_bmp" FieldCaption="Значение2" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysStatusType','Fri, 22 Jul 2022 19:04:28 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_rpDeclareNCI','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="iddeclare" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decname" FieldCaption="Наименование" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descr" FieldCaption="Описание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dectype" FieldCaption="Число записей" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyfield" FieldCaption="Ключевое поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispfield" FieldCaption="Отображаемое поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_rpDeclareNCI','Sat, 23 Jul 2022 07:43:38 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindDDD','','GridFindDDD','Sat, 23 Jul 2022 08:06:07 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindmftusers','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="username" FieldCaption="Логин" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="pass" FieldCaption="Пароль" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="orgs" FieldCaption="Роль" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="email" FieldCaption="Примечание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="description" FieldCaption="Источники" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindmftusers','Wed, 27 Jul 2022 17:57:45 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindAirlines','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="AL_IATA" FieldCaption="AL_IATA" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_ICAO" FieldCaption="AL_ICAO" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_NameRu" FieldCaption="Название" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_NameEn" FieldCaption="Название (en)" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_FullNameRu" FieldCaption="AL_FullNameRu" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_FullNameEn" FieldCaption="AL_FullNameEn" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_CityCode" FieldCaption="AL_CityCode" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_IsRegular" FieldCaption="AL_IsRegular" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_IsIntern" FieldCaption="AL_IsIntern" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_Note" FieldCaption="AL_Note" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_Strong" FieldCaption="AL_Strong" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_DME_Code" FieldCaption="AL_DME_Code" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_RF" FieldCaption="AL_RF" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_UTG" FieldCaption="UTG" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_STC" FieldCaption="AL_STC" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_PK" FieldCaption="AL_PK" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_ICAO_Ru" FieldCaption="AL_ICAO_Ru" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_DesCode" FieldCaption="AL_DesCode" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindAirlines','Thu, 28 Jul 2022 03:16:44 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindtestcolumn','','GridFindtestcolumn','Wed, 27 Jul 2022 06:14:16 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindACTypes','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="AT_PK" FieldCaption="AT_PK" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_UTG" FieldCaption="AT_UTG" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_IATA" FieldCaption="AT_IATA" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_ICAO" FieldCaption="AT_ICAO" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_STC" FieldCaption="AT_STC" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_NameEn" FieldCaption="Название11(En)" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_NameRu" FieldCaption="Название(Ru)" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_FullNameEn" FieldCaption="AT_FullNameEn" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_FullNameRu" FieldCaption="AT_FullNameRu" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_Type" FieldCaption="AT_Type" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_Category" FieldCaption="AT_Category" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_MTOW" FieldCaption="AT_MTOW" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_Note" FieldCaption="AT_Note" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_F" FieldCaption="AT_F" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_C" FieldCaption="AT_C" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_M" FieldCaption="AT_M" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_Y" FieldCaption="AT_Y" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AT_Category_DME" FieldCaption="AT_Category_DME" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="IDTMPNUM" FieldCaption="IDTMPNUM" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindACTypes','Wed, 27 Jul 2022 14:23:33 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindTARIF','','GridFindTARIF','Thu, 28 Jul 2022 07:56:38 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindagents','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="ag_id" FieldCaption="Код" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_name" FieldCaption="Название" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_comment" FieldCaption="Примечание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_serificate" FieldCaption="Сертификат" DisplayFormat="text" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindagents','Thu, 28 Jul 2022 09:22:45 GMT');

insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('1','Driver','MSSQL',null,'0',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('2','Driver','FireBird',null,'1',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('3','Driver','ClickHouse',null,'2',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('5','MSSQL','USMART',null,'0','data source=localhost\SQLEXPRESS8;User ID=sa;Password=aA12345678;database=uFlights',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('4','Driver','PGSQL',null,'3',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('6','PGSQL','TARIFS',null,'1','Host=localhost;Username=postgres;Password=aA12345678;Database=uflights',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('7','PGSQL','SERVMAN',null,'2','Host=localhost;Username=postgres;Password=aA12345678;Database=servman',null);

----------------------------------------------------
select setval('t_mnmainmenu_idmenu_seq', max(idmenu)) from t_mnmainmenu;
select setval('t_sysfieldmap_idmap_seq', max(idmap)) from t_sysfieldmap;
select setval('t_sysstatus_idstatus_seq', max(idstatus)) from t_sysstatus;
