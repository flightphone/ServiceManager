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
values ('Admin','Администратор',null,null,'34',null,null,null);
insert into t_ntusers(username,fullname,description,orgs,pass,email,icq,skype)
values ('User','Оператор','USER','USER','-','USER',null,null);

insert into t_usergroup(groupname,type,caption)
values ('Operators',null,'Операторы');
insert into t_usergroup(groupname,type,caption)
values ('Administrators','4','Администраторы');

insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Administrators','Admin','Admin','Admin','0','1dc3cdec-c91c-11eb-907c-3fa681425964');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Пользователи','Administrators','Administrators','Группа пользователей','4','1dc3cdf1-c91c-11eb-9081-736bd439d1ac');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Administrators','Administrators','Группа пользователей','4','1dc89341-c91c-11eb-9092-af06b9544ab2');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Права доступа','Administrators','Administrators','Группа пользователей','4','c2777560-e167-11eb-a0cf-1ba7827fa23e');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Справка','Operators','Operators','Группа AD','4','9bf22f52-0515-11ed-9f9e-7fb0ce53f084');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('Operators','User','User','user','0','36e16ad6-0517-11ed-ac0d-fbb84b978a92');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('exit','Administrators','Administrators','Группа AD','4','27809396-058a-11ed-baa9-ffa23f05a3c2');
insert into t_accessreport(grp,account,fullname,email,type,ac_pk)
values ('exit','Operators','Operators','Группа AD','4','2894edfe-058a-11ed-a4ac-8b41673bbae0');

insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('84','100','Справка',null,'ALL','/help.html','Справка',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('83','998','Настройки/Списки значений',null,'ALL','Bureau.Finder','Списки значений','124',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('29','999','Настройки/Папки','1','ALL','Bureau.Finder','Пункты меню','10',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('19','1000','Настройки/Пользователи','1','ALL','Bureau.Finder','Пользователи','120',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('32','1005','Настройки/Роли','1','ALL','Bureau.Finder','Группы пользователей','121',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('20','1010','Настройки/Права доступа (форма)','1','ALL','Bureau.Access','Права доступа Old',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('89','1011','Настройки/Права доступа',null,'ALL','Bureau.Finder','Права доступа','117',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('64','1015','Настройки/Резервное копирование',null,'ALL','Bureau.BackBase','Резервное копирование',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('30','1030','Настройки/Таблицы','1','ALL','Bureau.Finder','Колонки таблиц','75',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('73','1036','Настройки/Setup',null,'ALL','Bureau.Setup','Setup',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('74','1037','Настройки/LookUp','1','ALL','Bureau.Finder','Списки','127',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('71','1040','Настройки/Images','1','ALL','Bureau.Finder','Картинки','126',null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('75','2000','Настройки/SqlAdmin',null,'ALL','/sqladmin.html','sqladmin',null,null,null);
insert into t_mnmainmenu(idmenu,ordmenu,caption,link,app,link1,mnemo,params,web,silver)
values ('90','1000000','Выход',null,'ALL','exit','exit',null,null,null);

insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('10','t_mnMainMenu','Папки','7','select * from t_mnmainmenu order by ordmenu','idmenu','idmenu',null,null,null,null,'0',null,null,'t_mnMainMenu','p_t_mnMainMenu_edit','p_t_mnMainMenu_del',null,'idmenu,ordmenu,caption,link,link1,params,mnemo,app,web,silver');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('75','t_rpDeclare','Таблицы','7','select * from t_rpdeclare order by iddeclare','iddeclare','decname',null,'Bureau.FindDeclare',null,null,'0',null,null,null,'p_rpDeclare_edit','p_rpDeclare_del',null,'iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('117','ObjectAccess','Права доступа','100','select * from v_object order by objectname','objectname','objectname','118',null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('118','t_AccessReport','Пользователи в группе','7','select *, grp objectname from t_accessreport where grp = ''[objectname]'' order by account','ac_pk','account',null,null,null,null,'0',null,'GRP','t_accessreport','p_t_accessreport_edit','p_t_accessreport_del',null,'ac_pk,objectname,account,fullname,email,type');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('119','FreeAccount','Свободные логины','7','select * from fn_freeaccount (''[grp]'') order by account','account','account',null,null,null,null,'0',null,null,null,null,null,null,null);
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('120','sysUsers','Пользователи','7','select * from t_ntusers order by username','username','username',null,null,null,null,null,null,null,'t_NTUsers','p_ntusers_edit','p_ntusers_del',null,'username,fullname,description,orgs,pass,email,icq,skype');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('121','t_UserGroup','Роли','7','select * from t_usergroup','groupname','groupname',null,null,null,null,'0',null,null,'t_UserGroup','p_t_UserGroup_EDIT','p_t_UserGroup_DEL',null,'groupname,type,caption');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('124','t_sysStatusType','Списки значений','7','select * from t_sysstatus order by idstatus','idstatus','idstatus',null,null,null,null,null,null,null,'t_sysStatus','p_t_sysStatus_EDIT','p_t_sysStatus_DEL',null,'idstatus,statustype,statusname,color,sortorder,comment,image_bmp');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('126','t_sysMenuImage','Images','7','select * from t_sysmenuimage order by idimage','idimage','caption',null,null,null,null,'0',null,null,'t_sysMenuImage','p_t_sysMenuImage_EDIT','p_t_sysMenuImage_DEL',null,'idimage,caption,image_bmp,mnemo');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('127','t_sysFieldMap','LookUp','7','select * from t_sysfieldmap 
order by idmap','idmap','idmap',null,null,null,null,'0',null,null,'t_sysFieldMap','p_t_sysFieldMap_EDIT','p_t_sysFieldMap_DEL',null,'idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield');
insert into t_rpdeclare(iddeclare,decname,descr,dectype,decsql,keyfield,dispfield,keyvalue,dispvalue,keyparamname,dispparamname,isbasename,descript,addkeys,tablename,editproc,delproc,image_bmp,savefieldlist)
values ('144','FreeAccount','Свободные логины 2','100','select * from fn_freeaccount (''[objectname]'') order by account','account','account',null,null,null,null,null,null,null,null,null,null,null,null);

insert into t_sysfieldmap(idmap,decname,dstfield,srcfield,iddeclare,classname,groupdec,keyfield)
values ('4','t_mnMainMenu','params','iddeclare','75','Bureau.Finder','t_rpDeclare','1');
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
values ('22','t_AccessReport','account','account','144','Bureau.Finder','FreeAccount','1');

insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_AccessReport','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="account" FieldCaption = "Логин" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="fullname" FieldCaption = "Имя" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="email" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="grp" FieldCaption = "GRP" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="type" FieldCaption = "Type" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_AccessReport','Sun, 03 Jun 2018 15:51:25 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_rpDeclare','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="iddeclare" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="decname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="descr" FieldCaption = "Описание" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dectype" FieldCaption = "DecType" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyfield" FieldCaption = "Ключевое поле" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dispfield" FieldCaption = "Отображаемое поле" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyvalue" FieldCaption = "KeyValue" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dispvalue" FieldCaption = "DispValue" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="keyparamname" FieldCaption = "KeyParamName" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="dispparamname" FieldCaption = "DispParamName" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="isbasename" FieldCaption = "IsBaseName" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="addkeys" FieldCaption = "AddKeys" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="decsql" FieldCaption = "DecSQL" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="descript" FieldCaption = "Descript" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="tablename" FieldCaption = "TableName" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="editproc" FieldCaption = "EditProc" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="delproc" FieldCaption = "DelProc" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="image_bmp" FieldCaption = "Картинка" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="savefieldlist" FieldCaption = "SaveFieldList" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_rpDeclare','Sun, 03 Jun 2018 16:23:45 GMT');
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
values ('GridFindt_sysStatusType','<GRID FROZENCOLS="" SumFields = "" LabelField = "" LabelText = "Итого:"><COLUMN FieldName="idstatus" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="statustype" FieldCaption = "Группа" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="statusname" FieldCaption = "Название" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="color" FieldCaption = "Цвет" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="sortorder" FieldCaption = "NN" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="comment" FieldCaption = "Коментарий" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="image_bmp" FieldCaption = "Картинка" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_sysStatusType','Sun, 03 Jun 2018 16:26:43 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindt_mnMainMenu','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="idmenu" FieldCaption = "id" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="ordmenu" FieldCaption = "NN" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="caption" FieldCaption = "Путь" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link" FieldCaption = "На главной форме" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="app" FieldCaption = "Приложение" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="link1" FieldCaption = "Страница" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="mnemo" FieldCaption = "Объект" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="params" FieldCaption = "Параметры" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="web" FieldCaption = "Иконка" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="silver" FieldCaption = "silver" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindt_mnMainMenu','Fri, 26 Jun 2020 19:54:47 GMT');
insert into t_sysparams(paramname,paramvalue,paramdescription,dateparam)
values ('GridFindsysUsers','<GRID FROZENCOLS="0" SumFields = "" LabelField = "" LabelText = ""><COLUMN FieldName="username" FieldCaption = "Логин" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="fullname" FieldCaption = "Имя" DisplayFormat = "" Width = "100" Visible = "1" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="description" FieldCaption = "Описание" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="orgs" FieldCaption = "Компания" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="email" FieldCaption = "Комментарий" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="icq" FieldCaption = "Icq" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="skype" FieldCaption = "Skype" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><COLUMN FieldName="pass" FieldCaption = "Пароль" DisplayFormat = "" Width = "100" Visible = "0" group = "" Sum = "0"  ColSort="1" /><SAFEDEF SAFEDEF="1"/></GRID>','GridFindsysUsers','Sun, 17 Jul 2022 00:57:41 GMT');


----------------------------------------------------
select setval('t_mnmainmenu_idmenu_seq', max(idmenu)) from t_mnmainmenu;
select setval('t_sysfieldmap_idmap_seq', max(idmap)) from t_sysfieldmap;
select setval('t_sysstatus_idstatus_seq', max(idstatus)) from t_sysstatus;
