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
values ('sa',null,'Airlines,local','Operators','1',null,null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('Guest','Guest123','local','Guests','Guest',null,null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('Admin','Admin',null,null,'123',null,null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('User','User','Airlines,CH,ConnName11,FB,MSSQL,PsgSQL','Operators','123',null,null,null);

insert into t_usergroup(groupname,type,caption)
values ('Operators',null,'Операторы');
insert into t_usergroup(groupname,type,caption)
values ('Administrators','4','Администраторы');
insert into t_usergroup(groupname,type,caption)
values ('Guests',null,'тест');

insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Administrators','Administrators','Группа пользователей','4','1dc89341-c91c-11eb-9092-af06b9544ab2');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Operators','Operators','Группа AD','4','9bf22f52-0515-11ed-9f9e-7fb0ce53f084');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Коннекторы','Administrators','Administrators','Группа AD','4','5933c6cc-05b4-11ed-9835-bfae8681b582');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Агенты','Administrators','Administrators','Группа AD','4','0435c9de-0e58-11ed-ad92-f7ae15f955ed');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('MtfUsers','Administrators','Administrators','Группа AD','4','441c927a-0da0-11ed-bdc4-f705edc4455b');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Запросы','Administrators','Administrators','Группа AD','4','96c4f354-1b1b-11ed-a564-9301529159b0');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Агенты','Guests','Guests','Группа AD','4','9b6f4cf0-1b1c-11ed-8504-3b51dc5b21f6');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Авиакомпании','Guests','Guests','Группа AD','4','e87daaae-1b1d-11ed-87cb-eb73a758c367');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Operators','sa','sa','sa','0','062e7c78-1bc7-11ed-b515-0338490a2dc9');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Guests','Guest','Guest','Guest','0','1dc588c2-1bc7-11ed-b518-7b0d9a757105');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Administrators','Admin','Admin','user','0','484ae4c0-1c94-11ed-8f2f-7fb339fc139c');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Operators','User','User','User','0','88008002-1c94-11ed-b0ab-672b9608df75');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Запросы2','Operators','Operators','Группа AD','4','36dce4e8-1cd7-11ed-9675-f78f3ee9fb19');

insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('110','110','Авиакомпании',null,'ALL','Bureau.Finder','Авиакомпании','170',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('109','800','Агенты',null,'ALL','Bureau.Finder','Агенты','169',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('92','805','Источники НСИ',null,'ALL','Bureau.Finder','Коннекторы','146',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('97','810','Запросы',null,'ALL','Declare','Запросы','149',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('108','815','Запрoсы',null,'ALL','Declare','Запросы2','168',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('107','830','Пользователи',null,'ALL','Bureau.Finder','MtfUsers','167',null,null);
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
values ('74','1037','Настройки/Списки выбора','1','ALL','Bureau.Finder','Списки','127',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('20','1040','Настройки/Права доступа (форма)','1','ALL','Bureau.Access','Права доступа Old',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('83','1040','Настройки/Перечисления',null,'ALL','Bureau.Finder','Списки значений','124',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('64','1045','Настройки/Резервное копирование',null,'ALL','Bureau.BackBase','Резервное копирование',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('73','1046','Настройки/Setup',null,'ALL','Bureau.Setup','Setup',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('75','2000','Настройки/SqlAdmin',null,'ALL','/sqladmin.html','sqladmin',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('84','2000','Справка',null,'ALL','/help.pdf','Справка',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('90','1000000','Выход',null,'ALL','exit','exit',null,null,null);

insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('10','t_mnMainMenu','Папки','30','select * from t_mnmainmenu order by ordmenu','idmenu','caption',null,null,null,null,'0',null,null,'t_mnMainMenu','p_t_mnMainMenu_edit','p_t_mnMainMenu_del',null,'idmenu,ordmenu,caption,link,link1,params,mnemo,app,web,silver');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('75','t_rpDeclare','Таблицы','7','select * from t_rpdeclare order by iddeclare desc','iddeclare','decname','76','Bureau.FindDeclare',null,null,'0',null,null,'t_rpdeclare','p_rpDeclare_edit','p_rpDeclare_del',null,'iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('76','t_columns','Колонки таблицы','500','select * from t_columns where iddeclare = [iddeclare] order by ordc','idcolumn','fieldname',null,null,null,null,null,null,null,null,'p_t_columns_edit','p_t_columns_del',null,'idcolumn,iddeclare,ordc,visible,fieldname,fieldcaption,displayformat,width');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('116','ObjectAccess','Группы пользователей','30','select * from v_object where objcod = 4 order by objectname','objectname','objectname','118',null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('117','ObjectAccess','Права доступа','100','select * from v_object  order by objcod, objectname','objectname','objectname','118',null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('118','t_AccessReport','Пользователи в группе','7','select *, grp objectname from t_accessreport where grp = ''[objectname]'' order by account','ac_pk','account',null,null,null,null,'0',null,null,'t_accessreport','p_t_accessreport_edit','p_t_accessreport_del',null,'ac_pk,objectname,account,fullname,email,type');
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
values ('145','contype','Тип коннектора','17','select * from contype order by cn_id','cn_id','cn_typedb',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('146','v_connectors','Источники НСИ','30','select * from v_connectors order by name /*__external__*/','name','name',null,null,null,null,null,null,null,'connectors','p_connectors_edit','p_connectors_del',null,'name,username,password,address,dbname,typedb');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('149','querys','Запросы','30','select * from querys order by name /*__external__*/','name',null,null,null,null,null,null,null,null,'querys','p_querys_edit','p_querys_del',null,'name,userid,command,dbconnectorname,keyfield,savefieldlist,tablename');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('151','testcolumn','тест колонок (Услуги)','30','/*__external__*/',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('152','queryexecute','Результаты запроса','30','/*__external__*/',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('156','ACTypes','Типы ВС 2','30','select * from ACTypes (nolock) order by AT_UTG','AT_PK','AT_NameEn',null,null,null,null,null,'MSSQL@data source=localhost\SQLEXPRESS8;User ID=sa;Password=aA12345678;database=uFlights',null,null,'p_ACTypes_EDIT','p_ACTypes_DEL',null,'AT_PK,AT_UTG,AT_IATA,AT_ICAO,AT_STC,AT_NameEn,AT_NameRu,AT_FullNameEn,AT_FullNameRu,AT_Type,AT_Category,AT_MTOW,AT_Note,AT_F,AT_C,AT_M,AT_Y,AT_Category_DME');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('157','Airlines','Авиакомпании','30','select * from Airlines order by AL_UTG','AL_PK','AL_NameRu',null,null,null,null,null,'MSSQL@data source=51.250.46.206;User ID=sa;Password=aA12345678$;database=test',null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('167','mftusers','Пользователи','7','select username, pass, orgs, email, description from t_ntusers where username <> ''Admin'' order by  username','username','username',null,null,null,null,null,null,null,null,'p_mtfusers_edit','p_ntusers_del',null,'username,pass,orgs,email,description');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('168','querys','Запросы','30','select * from querys order by name /*__external__*/','name','name',null,null,null,null,null,null,null,'querys',null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('169','agents','Агенты','30','select * from v_agents order by ag_id','ag_id','ag_name','183',null,null,null,null,null,'ag_file',null,'p_agents_edit','p_agents_del',null,'ag_id,ag_name,ag_comment,ag_serificate,ag_file');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('170','AIR','Авиакомпании','30','select * from Airlines order by AL_UTG','AL_PK','AL_NameRu',null,null,null,null,'1',null,null,'Airlines','p_Airlines_EDIT','p_Airlines_DEL',null,'AL_PK,AL_UTG,AL_STC,AL_IATA,AL_ICAO,AL_ICAO_Ru,AL_DME_Code,AL_DesCode,AL_NameRu,AL_NameEn,AL_FullNameRu,AL_FullNameEn,AL_CityCode,AL_IsRegular,AL_IsIntern,AL_Note,AL_Strong,AL_RF');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('171','CHTEST','CHTEST','30','/*__external__*/',null,null,null,null,null,null,'15',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('172','PHONES','PHONES','30','__external__',null,null,null,null,null,null,'16',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('173','PSG','PSG','30','__external__','card_number','card_number',null,null,null,null,null,null,null,'blacklist','p_auto_edit','p_auto_del',null,'card_number,block_date_time,unblock_date_time,reason');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('174','TARIF','TARIF','30','__external__','id',null,null,null,null,null,'15',null,null,'ServiceTariff','p_auto_edit','p_auto_del',null,'id,number,card_type,card_sub_type,descrip_card,reserve1,reserve2,cost_card,transport_type,StartDate,blockdata');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('175','TARIF70','TARIF70','30','__external__',null,null,null,null,null,null,'16',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('176','TARIF788','TARIF788','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('177','AAA','AAA','30','__external__',null,null,null,null,null,null,'1',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('178','TEST','TEST','30','__external__',null,null,null,null,null,null,'123',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('179','TARIF3007','TARIF3007','30','__external__',null,null,null,null,null,null,'16',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('180','TARIF111','TARIF111','30','__external__',null,null,null,null,null,null,'16',null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('181','ConnectorsAccess','Источники НСИ','100','select * from v_connectors order by name','name','name',null,null,null,null,null,null,null,'connectors',null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('182','SertifStatus','Статус','30','select ''Действует'' status union select ''Отозван'' status order by status','status','status',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('183','querysAccess','Запросы НСИ','30','select * from v_querys where userid = [ag_id] order by name','name','name',null,null,null,null,null,null,null,'querys',null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('184','querysAccess','Запросы НСИ','1000','select * from querys order by name','name','name',null,null,null,null,null,null,null,'querys',null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('185','test','test','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('186','TARIF510','TARIF510','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('187','TEST501','TEST501','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('188','MYTEST','MYTEST','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('189','USERQ1','USERQ1','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('190','CHTABLE','CHTABLE','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('191','TARIF10','TARIF10','30','__external__',null,null,null,null,null,null,null,null,null,null,'p_auto_edit','p_auto_del',null,null);

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
values ('4','t_mnMainMenu','params','iddeclare','75','Bureau.Finder','t_rpDeclare','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('34','querys','ag_name','ag_name','169','Bureau.Finder','agents',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('35','querys','userid','ag_id',null,null,'agents','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('33','mftusers','email','dbname','181','CheckList','ConnectorsAccess','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('32','mftusers','description','name','181',null,'ConnectorsAccess',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('36','agents','ag_serificate','status','182','Bureau.GridCombo','SertifStatus','1');
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('39','agents','ag_comment','dbname','184','List','querysAccess',null);
insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('40','agents','agents_query','name','184',null,'querysAccess','1');

insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_AccessReport','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="account" FieldCaption = "Логин" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="fullname" FieldCaption = "Имя" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="email" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="grp" FieldCaption = "GRP" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "Type" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_AccessReport','Sun, 03 Jun 2018 09:51:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindObjectAccess','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="objectname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="objecttype" FieldCaption = "Тип" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Описание" DisplayFormat = "" Width = "250" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="objcod" FieldCaption = "ObjCod" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="idtmpnum" FieldCaption = "IDTMPNUM" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindObjectAccess','Sun, 03 Jun 2018 10:24:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindFreeAccount','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="account" FieldCaption = "Логин" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="fullname" FieldCaption = "Имя" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="email" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "TYPE" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="idtmpnum" FieldCaption = "IDTMPNUM" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindFreeAccount','Sun, 03 Jun 2018 10:24:39 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_sysMenuImage','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="idimage" FieldCaption = "№" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Путь" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="mnemo" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="image_bmp" FieldCaption = "Картинка" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysMenuImage','Sun, 03 Jun 2018 10:27:13 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_UserGroup','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="groupname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "Тип" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_UserGroup','Sun, 03 Jun 2018 10:29:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_sysFieldMap','<GRID FROZENCOLS="" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="idmap" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="decname" FieldCaption = "DecName" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dstfield" FieldCaption = "dstField" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="srcfield" FieldCaption = "srcField" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="iddeclare" FieldCaption = "idDeclare" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="classname" FieldCaption = "ClassName" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="groupdec" FieldCaption = "GroupDec" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyfield" FieldCaption = "KeyField" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysFieldMap','Sun, 03 Jun 2018 10:27:44 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindCHTEST','','GridFindCHTEST','Sun, 24 Jul 2022 03:12:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindcontype','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="cn_id" FieldCaption = "ID" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="cn_typedb" FieldCaption = "Тип коннектора" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindcontype','Sun, 17 Jul 2022 02:57:41 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindsysUsers','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="username" FieldCaption="Логин" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="fullname" FieldCaption="Имя" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="email" FieldCaption="Email" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="description" FieldCaption="Описание" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="orgs" FieldCaption="Компания" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="icq" FieldCaption="Icq" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="skype" FieldCaption="Skype" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="pass" FieldCaption="Пароль" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindsysUsers','Fri, 22 Jul 2022 05:12:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_columns','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="idcolumn" FieldCaption="idcolumn" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="iddeclare" FieldCaption="iddeclare" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ordc" FieldCaption="N" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="visible" FieldCaption="Visible" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="fieldname" FieldCaption="Поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="fieldcaption" FieldCaption="Заголовок" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="displayformat" FieldCaption="Формат" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="width" FieldCaption="Ширина" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_columns','Sat, 23 Jul 2022 02:10:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_mnMainMenu','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="idmenu" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="ordmenu" FieldCaption = "NN" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Путь" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link" FieldCaption = "На главной форме" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="app" FieldCaption = "Приложение" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link1" FieldCaption = "Компонент" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="mnemo" FieldCaption = "Доступ" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="params" FieldCaption = "Параметры" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="web" FieldCaption = "Иконка" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="silver" FieldCaption = "silver" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_mnMainMenu','Thu, 21 Jul 2022 18:08:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_sysStatusType','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="idstatus" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="statustype" FieldCaption="Группа" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="statusname" FieldCaption="Название" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="color" FieldCaption="Цвет" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="sortorder" FieldCaption="Order" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="comment" FieldCaption="Значение1" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="image_bmp" FieldCaption="Значение2" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysStatusType','Fri, 22 Jul 2022 13:04:28 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_rpDeclareNCI','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="iddeclare" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decname" FieldCaption="Наименование" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descr" FieldCaption="Описание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dectype" FieldCaption="Число записей" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyfield" FieldCaption="Ключевое поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispfield" FieldCaption="Отображаемое поле" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_rpDeclareNCI','Sat, 23 Jul 2022 01:43:38 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindDDD','','GridFindDDD','Sat, 23 Jul 2022 02:06:07 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindtestcolumn','','GridFindtestcolumn','Wed, 27 Jul 2022 00:14:16 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindTARIF70','','GridFindTARIF70','Thu, 28 Jul 2022 04:35:10 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindAirlines','','GridFindAirlines','Sun, 31 Jul 2022 08:33:38 GMT');
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
<COLUMN FieldName="AT_Category_DME" FieldCaption="AT_Category_DME" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindACTypes','Sun, 14 Aug 2022 11:47:41 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindAIR','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="AL_PK" FieldCaption="AL_PK" DisplayFormat="disabled" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_UTG" FieldCaption="AL_UTG" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_STC" FieldCaption="AL_STC" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_IATA" FieldCaption="AL_IATA" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_ICAO" FieldCaption="AL_ICAO" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_ICAO_Ru" FieldCaption="AL_ICAO_Ru" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_DesCode" FieldCaption="AL_DesCode" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_NameRu" FieldCaption="AL_NameRu" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_NameEn" FieldCaption="AL_NameEn" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_FullNameRu" FieldCaption="AL_FullNameRu" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_FullNameEn" FieldCaption="AL_FullNameEn" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_CityCode" FieldCaption="AL_CityCode" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_IsRegular" FieldCaption="AL_IsRegular" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_IsIntern" FieldCaption="AL_IsIntern" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_Note" FieldCaption="AL_Note" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_Strong" FieldCaption="AL_Strong" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_DME_Code" FieldCaption="AL_DME_Code" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="AL_RF" FieldCaption="AL_RF" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindAIR','Mon, 15 Aug 2022 20:14:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindmftusers','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="username" FieldCaption="Логин" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="pass" FieldCaption="Пароль" DisplayFormat="password" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="orgs" FieldCaption="Роль" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="email" FieldCaption="Примечание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="description" FieldCaption="Источники" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindmftusers','Thu, 28 Jul 2022 14:45:30 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindv_connectors','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="name" FieldCaption="Имя источника" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="username" FieldCaption="Имя входа БД" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="password" FieldCaption="Пароль к БД" DisplayFormat="password" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="address" FieldCaption="Адрес БД" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dbname" FieldCaption="Имя БД" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="typedb" FieldCaption="typedb" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="cn_typedb" FieldCaption="Тип базы" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindv_connectors','Sun, 31 Jul 2022 02:54:46 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindagents','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="ag_id" FieldCaption="Код" DisplayFormat="disabled" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_name" FieldCaption="Название" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_comment" FieldCaption="Примечание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_serificate" FieldCaption="Сертификат" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_file" FieldCaption="ag_file" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="agents_query" FieldCaption="agents_query" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindagents','Mon, 01 Aug 2022 04:02:11 GMT');
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
<COLUMN FieldName="isbasename" FieldCaption="IsBaseName" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decsql" FieldCaption="Запрос" DisplayFormat="text" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="tablename" FieldCaption="Таблица" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="editproc" FieldCaption="Функция обновления" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="delproc" FieldCaption="Функция удаления" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="image_bmp" FieldCaption="Картинка" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="savefieldlist" FieldCaption="Список полей" DisplayFormat="hide" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispvalue" FieldCaption="dispvalue" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="addkeys" FieldCaption="Файлы (колонка)" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descript" FieldCaption="Драйвер, строка подключения" DisplayFormat="hide" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_rpDeclare','Mon, 01 Aug 2022 04:10:21 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindTARIF','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="id" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="number" FieldCaption="Номер" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="card_type" FieldCaption="Тип" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="card_sub_type" FieldCaption="Класс" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descrip_card" FieldCaption="Описание" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="reserve1" FieldCaption="reserve1" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="reserve2" FieldCaption="reserve2" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="cost_card" FieldCaption="Стоимость" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="transport_type" FieldCaption="Транспорт" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="StartDate" FieldCaption="Начало" DisplayFormat="dd.MM.yyyy" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="blockdata" FieldCaption="Окончание" DisplayFormat="dd.MM.yyyy" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindTARIF','Fri, 29 Jul 2022 03:33:13 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindConnectorsAccess','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="name" FieldCaption="Имя источника" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="username" FieldCaption="username" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="password" FieldCaption="password" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="address" FieldCaption="Адрес БД" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dbname" FieldCaption="Имя БД" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="typedb" FieldCaption="typedb" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="cn_typedb" FieldCaption="Тип базы" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindConnectorsAccess','Sat, 30 Jul 2022 10:52:23 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindSertifStatus','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="status" FieldCaption="Статус" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindSertifStatus','Sat, 30 Jul 2022 11:01:21 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindquerysAccess','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="name" FieldCaption="Наименование" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="userid" FieldCaption="userid" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="command" FieldCaption="Текст запроса" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dbconnectorname" FieldCaption="dbconnectorname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="iddeclare" FieldCaption="iddeclare" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_name" FieldCaption="ag_name" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindquerysAccess','Sun, 31 Jul 2022 03:45:11 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindPSG','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="card_number" FieldCaption="card_number" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="block_date_time" FieldCaption="block_date_time" DisplayFormat="dd.MM.yyyy" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="unblock_date_time" FieldCaption="unblock_date_time" DisplayFormat="dd.MM.yyyy" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="reason" FieldCaption="reason" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindPSG','Wed, 17 Aug 2022 03:53:11 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindquerys','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="name" FieldCaption="Имя запроса" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="userid" FieldCaption="userid" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="ag_name" FieldCaption="Агент" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="command" FieldCaption="Текст запроса" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dbconnectorname" FieldCaption="Источник данных" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyfield" FieldCaption="Ключевое поле" DisplayFormat="hide" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispfield" FieldCaption="Поле поиска" DisplayFormat="hide" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="savefieldlist" FieldCaption="Список полей" DisplayFormat="hide" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="tablename" FieldCaption="Таблица" DisplayFormat="hide" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dectype" FieldCaption="dectype" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decsql" FieldCaption="decsql" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyvalue" FieldCaption="keyvalue" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispvalue" FieldCaption="dispvalue" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="keyparamname" FieldCaption="keyparamname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="dispparamname" FieldCaption="dispparamname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="isbasename" FieldCaption="isbasename" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descript" FieldCaption="descript" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="addkeys" FieldCaption="addkeys" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="editproc" FieldCaption="editproc" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="delproc" FieldCaption="delproc" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="image_bmp" FieldCaption="image_bmp" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="iddeclare" FieldCaption="iddeclare" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="decname" FieldCaption="decname" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descr" FieldCaption="descr" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindquerys','Wed, 17 Aug 2022 04:34:37 GMT');

insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('1','Driver','MSSQL',null,'0',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('2','Driver','FireBird',null,'1',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('3','Driver','ClickHouse',null,'2',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('4','Driver','PGSQL',null,'3',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('6','PGSQL','TARIFS',null,'1','Host=localhost;Username=postgres;Password=aA12345678;Database=uflights',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('7','PGSQL','SERVMAN',null,'2','Host=localhost;Username=postgres;Password=aA12345678;Database=servman',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('8','Connect','local',null,'1','MSSQL@data source=localhost\SQLEXPRESS8;User ID=sa;Password=aA12345678;database=uFlights',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('5','Connect','Airlines',null,'0','MSSQL@data source=51.250.39.249;User ID=sa;Password=aA12345678$;database=test',null);

----------------------------------------------------
select setval('t_mnmainmenu_idmenu_seq', max(idmenu)) from t_mnmainmenu;
select setval('t_sysfieldmap_idmap_seq', max(idmap)) from t_sysfieldmap;
select setval('t_sysstatus_idstatus_seq', max(idstatus)) from t_sysstatus;
