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
values ('Admin','Администратор',null,null,'123',null,null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('User','Петров','USER','USER','123','USER@mail.ru',null,null);

insert into t_usergroup(groupname,type,caption)
values ('Operators',null,'Операторы');
insert into t_usergroup(groupname,type,caption)
values ('Administrators','4','Администраторы');
insert into t_usergroup(groupname,type,caption)
values ('Manager',null,'Менеджеры');

insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Administrators','Admin','Admin','Admin','0','1dc3cdec-c91c-11eb-907c-3fa681425964');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Пользователи','Administrators','Administrators','Группа пользователей','4','1dc3cdf1-c91c-11eb-9081-736bd439d1ac');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Administrators','Administrators','Группа пользователей','4','1dc89341-c91c-11eb-9092-af06b9544ab2');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Operators','Operators','Группа AD','4','9bf22f52-0515-11ed-9f9e-7fb0ce53f084');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Operators','User','User','user','0','36e16ad6-0517-11ed-ac0d-fbb84b978a92');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Коннекторы','Administrators','Administrators','Группа AD','4','5933c6cc-05b4-11ed-9835-bfae8681b582');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Тест API','Administrators','Administrators','Группа AD','4','f5566d28-05b6-11ed-a660-9778159247aa');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Группы','Administrators','Administrators','Группа AD','4','568afe96-05bd-11ed-b095-cfd6861f3022');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Запросы','Administrators','Administrators','Группа AD','4','e6fac9b6-05c2-11ed-abeb-dffc0ed72d7f');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Авиакомпании','Administrators','Administrators','Группа AD','4','0cdd4e8a-0954-11ed-bdb9-fb0be5ea9f4c');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Авиакомпании','Operators','Operators','Группа AD','4','115ecf56-0954-11ed-a09e-0313e84a8577');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Тарифы','Administrators','Administrators','Группа AD','4','392967fc-0955-11ed-a867-53d6197e357b');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Тарифы','Operators','Operators','Группа AD','4','3c899ca0-0955-11ed-a868-47dda1ca502c');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Права доступа','Administrators','Administrators','Группа AD','4','e4f99174-0955-11ed-8fb8-f75115080350');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Группы пользователей','Administrators','Administrators','Группа AD','4','f6fca37a-0955-11ed-8fb9-b3fff89ec0d5');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Пункты меню','Administrators','Administrators','Группа AD','4','36e0451e-0956-11ed-84c1-cfaee9a1fc5b');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Manager','User','Петров','user','0','26b46cf4-0958-11ed-ae1d-67881626bf94');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Карты','Administrators','Administrators','Группа AD','4','7206cefa-09b1-11ed-b31e-cb2406fa944d');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Карты','Operators','Operators','Группа AD','4','7614a12a-09b1-11ed-b31f-eb4e77f06699');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Таблицы НСИ','Administrators','Administrators','Группа AD','4','93ee8428-0a5a-11ed-adca-57c55b4f4d34');

insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('100','50','Справочники/Авиакомпании',null,'ALL','Bureau.Finder','Авиакомпании','153',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('101','51','Справочники/Тарифы',null,'ALL','Bureau.Finder','Тарифы','154',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('102','52','Справочники/Карты',null,'ALL','Bureau.Finder','Карты','155',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('84','500','Справка',null,'ALL','/help.pdf','Справка',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('92','800','Сервис НСИ/Коннекторы',null,'ALL','Bureau.Finder','Коннекторы','146',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('97','801','Сервис НСИ/Запросы',null,'ALL','Bureau.Finder','Запросы','149',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('94','802','Сервис НСИ/Тест API',null,'ALL','test_api','Тест API',null,null,null);
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
values ('30','1032','Настройки/Таблицы','1','ALL','Bureau.Finder','Колонки таблиц','75',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('103','1033','Настройки/Таблицы НСИ',null,'ALL','Bureau.Finder','Таблицы НСИ','129',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('74','1037','Настройки/Списки выбора','1','ALL','Bureau.Finder','Списки','127',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('71','1040','Настройки/Images','1','ALL','Bureau.Finder','Картинки','126',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('83','1040','Настройки/Перечисления',null,'ALL','Bureau.Finder','Списки значений','124',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('20','1040','Настройки/Права доступа (форма)','1','ALL','Bureau.Access','Права доступа Old',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('64','1045','Настройки/Резервное копирование',null,'ALL','Bureau.BackBase','Резервное копирование',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('73','1046','Настройки/Setup',null,'ALL','Bureau.Setup','Setup',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('99','1051','Настройки/тест колонок',null,'ALL','Bureau.Finder','test','151',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('75','2000','Настройки/SqlAdmin',null,'ALL','/sqladmin.html','sqladmin',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('90','1000000','Выход',null,'ALL','exit','exit',null,null,null);

insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('10','t_mnMainMenu','Папки','30','select * from t_mnmainmenu where ''[Account]'' = ''sa'' or (''[Account]'' <> ''sa''  and ordmenu < 800) order by ordmenu','idmenu','idmenu',null,null,null,null,'0',null,null,'t_mnMainMenu','p_t_mnMainMenu_edit','p_t_mnMainMenu_del',null,'idmenu,ordmenu,caption,link,link1,params,mnemo,app,web,silver');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('75','t_rpDeclare','Таблицы','7','select * from t_rpdeclare where ''[Account]'' = ''sa''  order by iddeclare','iddeclare','decname','76','Bureau.FindDeclare',null,null,'0',null,null,null,'p_rpDeclare_edit','p_rpDeclare_del',null,'iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('76','t_columns','Колонки таблиц','500','select * from t_columns where iddeclare = [iddeclare] order by ordc','idcolumn','fieldname',null,null,null,null,null,null,null,null,'p_t_columns_edit','p_t_columns_del',null,'idcolumn,iddeclare,ordc,visible,fieldname,fieldcaption,displayformat,width');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('116','ObjectAccess','Группы пользователей','30','select * from v_object where objcod = 4 order by objectname','objectname','objectname','118',null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('117','ObjectAccess','Права доступа','100','select * from v_object  where  ''[Account]'' = ''sa'' or (''[Account]'' <> ''sa''  and not (caption like ''Настройки/%'')) order by objcod, objectname','objectname','objectname','118',null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('118','t_AccessReport','Пользователи в группе','7','select *, grp objectname from t_accessreport where grp = ''[objectname]'' order by account','ac_pk','account',null,null,null,null,'0',null,'GRP','t_accessreport','p_t_accessreport_edit','p_t_accessreport_del',null,'ac_pk,objectname,account,fullname,email,type');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('119','FreeAccount','Свободные логины','7','select * from fn_freeaccount (''[grp]'') order by account','account','account',null,null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('120','sysUsers','Пользователи','7','select * from t_ntusers order by username','username','username',null,null,null,null,null,null,null,'t_NTUsers','p_ntusers_edit','p_ntusers_del',null,'username,fullname,description,orgs,pass,email,icq,skype');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('121','t_UserGroup','Группы','7','select * from t_usergroup','groupname','groupname',null,null,null,null,'0',null,null,'t_UserGroup','p_t_UserGroup_EDIT','p_t_UserGroup_DEL',null,'groupname,type,caption');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('124','t_sysStatusType','Списки значений','7','__external__','idstatus','statusname',null,null,null,null,null,null,null,'t_sysStatus','p_t_sysStatus_EDIT','p_t_sysStatus_DEL',null,'idstatus,statustype,statusname,color,sortorder,comment,image_bmp');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('126','t_sysMenuImage','Images','7','select * from t_sysmenuimage order by idimage','idimage','caption',null,null,null,null,'0',null,null,'t_sysMenuImage','p_t_sysMenuImage_EDIT','p_t_sysMenuImage_DEL',null,'idimage,caption,image_bmp,mnemo');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('127','t_sysFieldMap','Списки выбора','7','select * from t_sysfieldmap where ''[Account]'' = ''sa'' or (''[Account]'' <> ''sa''  and idmap > 25) order by idmap','idmap','idmap',null,null,null,null,'0',null,null,'t_sysFieldMap','p_t_sysFieldMap_EDIT','p_t_sysFieldMap_DEL',null,'idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('128','FreeAccount','Свободные логины 2','100','select * from fn_freeaccount (''[objectname]'') order by account','account','account',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('129','t_rpDeclareNCI','Таблицы НСИ','50','select * from t_rpdeclare where ''[Account]'' = ''sa'' or (''[Account]'' <> ''sa''  and decsql like ''%__external%'' and iddeclare > 152) order by iddeclare','iddeclare','decname','76',null,null,null,null,null,null,null,'p_rpdeclare2_edit','p_rpdeclare_del',null,'iddeclare,decname,descr,dectype,keyfield,dispfield');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('145','contype','Тип коннектора','17','select * from contype order by cn_id','cn_id','cn_typedb',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('146','v_connectors','Коннекторы','30','select * from v_connectors order by name /*__external__*/','name','name',null,null,null,null,null,null,null,null,'p_connectors_edit','p_connectors_del',null,'name,username,password,address,dbname,typedb');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('149','querys','Запросы','30','select * from querys order by name /*__external__*/','name','name','152',null,null,null,null,null,null,null,'p_querys_edit','p_querys_del',null,'name,userid,command,dbconnectorname');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('151','testcolumn','тест колонок','30','select * from utgservice','sv_pk','sv_caption',null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('152','queryexecute','Результаты запроса','30','/*__external__*/',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('153','AIR','Авиакомпании','40','/*__external__*/',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('154','TARIF','Тарифы','30','/*__external__*/',null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('155','CHTEST','Карты','30','__external__',null,null,null,null,null,null,null,null,null,null,null,null,null,null);

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
values ('4','t_mnMainMenu','params','iddeclare','129','Bureau.Finder','t_rpDeclareNCI','1');

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
values ('GridFindt_rpDeclare','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="iddeclare" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="decname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="descr" FieldCaption = "Описание" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dectype" FieldCaption = "Число записей" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyfield" FieldCaption = "Ключевое поле" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dispfield" FieldCaption = "Отображаемое поле" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyvalue" FieldCaption = "Детали" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dispvalue" FieldCaption = "DispValue" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyparamname" FieldCaption = "KeyParamName" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dispparamname" FieldCaption = "Параметры" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="isbasename" FieldCaption = "IsBaseName" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="addkeys" FieldCaption = "AddKeys" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="decsql" FieldCaption = "Запрос" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="descript" FieldCaption = "Descript" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="tablename" FieldCaption = "Таблица" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="editproc" FieldCaption = "Функция обновления" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="delproc" FieldCaption = "Функция удаления" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="image_bmp" FieldCaption = "Картинка" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="savefieldlist" FieldCaption = "Список полей" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_rpDeclare','Fri, 22 Jul 2022 00:00:13 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindcontype','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="cn_id" FieldCaption = "ID" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="cn_typedb" FieldCaption = "Тип коннектора" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindcontype','Sun, 17 Jul 2022 08:57:41 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindv_connectors','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="name" FieldCaption = "Имя коннектора" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="username" FieldCaption = "Имя входа БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="password" FieldCaption = "Пароль к БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="address" FieldCaption = "Адрес БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dbname" FieldCaption = "Имя БД" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="typedb" FieldCaption = "typedb" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="cn_typedb" FieldCaption = "Тип коннектора" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindv_connectors','Sun, 17 Jul 2022 09:49:01 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindquerys','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="name" FieldCaption = "Имя запроса" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="userid" FieldCaption = "Пользователь НСИ" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="command" FieldCaption = "Текст SQL" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dbconnectorname" FieldCaption = "Коннектор" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindquerys','Sun, 17 Jul 2022 11:19:57 GMT');
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
values ('GridFindt_mnMainMenu','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="idmenu" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="ordmenu" FieldCaption = "NN" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Путь" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link" FieldCaption = "На главной форме" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="app" FieldCaption = "Приложение" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link1" FieldCaption = "Компонент" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="mnemo" FieldCaption = "Доступ" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="params" FieldCaption = "Параметры" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="web" FieldCaption = "Иконка" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="silver" FieldCaption = "silver" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_mnMainMenu','Fri, 22 Jul 2022 00:08:09 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindAIR','','GridFindAIR','Sat, 23 Jul 2022 05:55:42 GMT');
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
values ('GridFindTARIF','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = "">
<COLUMN FieldName="id" FieldCaption="id" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="number" FieldCaption="Номер" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="card_type" FieldCaption="Тип карты" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="card_sub_type" FieldCaption="СубКарта" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="descrip_card" FieldCaption="Комментарий" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="reserve1" FieldCaption="reserve1" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="reserve2" FieldCaption="reserve2" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="cost_card" FieldCaption="Стоимость" DisplayFormat="" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="transport_type" FieldCaption="transport_type" DisplayFormat="" Width="100" Visible="0" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="StartDate" FieldCaption="Начало" DisplayFormat="dd.MM.yyyy" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="blockdata" FieldCaption="Окончание" DisplayFormat="dd.MM.yyyy" Width="100" Visible="1" group = "" Sum = "0"  ColSort="1" />
<COLUMN FieldName="__all__" FieldCaption="_" DisplayFormat="" Width="0" Visible="1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindTARIF','Fri, 22 Jul 2022 11:19:39 GMT');
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
values ('GridFindtestcolumn','','GridFindtestcolumn','Sat, 23 Jul 2022 05:54:28 GMT');

insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('1','Driver','MSSQL',null,'0',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('2','Driver','FireBird',null,'1',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('3','Driver','ClickHouse',null,'2',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('4','Driver','PostgreSQL',null,'3',null,null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('5','MSSQL','USMART',null,'0','data source=localhost\SQLEXPRESS8;User ID=sa;Password=aA12345678;database=uFlights',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('6','PostgreSQL','TARIFS',null,'1','Host=localhost;Username=postgres;Password=aA12345678;Database=uflights',null);
insert into t_sysstatus(idstatus,statustype,statusname,color,sortorder,comment,image_bmp)
values ('7','PostgreSQL','SERVMAN',null,'2','Host=localhost;Username=postgres;Password=aA12345678;Database=servman',null);

----------------------------------------------------
select setval('t_mnmainmenu_idmenu_seq', max(idmenu)) from t_mnmainmenu;
select setval('t_sysfieldmap_idmap_seq', max(idmap)) from t_sysfieldmap;
select setval('t_sysstatus_idstatus_seq', max(idstatus)) from t_sysstatus;
