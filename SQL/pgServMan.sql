CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE OR REPLACE FUNCTION public.getdate()
  RETURNS timestamp with time zone AS
'select current_timestamp'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.getdate()
  OWNER TO postgres;


CREATE TABLE t_accessreport
(
    grp varchar(50) COLLATE pg_catalog.default NOT NULL,
    account varchar(50) COLLATE pg_catalog.default NOT NULL,
    fullname varchar(255) COLLATE pg_catalog.default,
    email varchar(50) COLLATE pg_catalog.default,
    type integer,
    ac_pk uuid NOT NULL DEFAULT uuid_generate_v1(),
    CONSTRAINT PK_t_AccessReport PRIMARY KEY
    (
	grp,
	account
    )
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_accessreport
    OWNER to postgres;


CREATE TABLE t_mnmainmenu
(
    idmenu serial NOT NULL,
    ordmenu integer,
    caption varchar(255) COLLATE pg_catalog.default,
    link varchar(255) COLLATE pg_catalog.default,
    app varchar(255) COLLATE pg_catalog.default,
    link1 varchar(255) COLLATE pg_catalog.default,
    mnemo varchar(255) COLLATE pg_catalog.default,
    params varchar COLLATE pg_catalog.default,
    web varchar(250) COLLATE pg_catalog.default,
    silver varchar(250) COLLATE pg_catalog.default,
    CONSTRAINT PK_t_mnMainMenu PRIMARY KEY (idmenu)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_mnmainmenu
    OWNER to postgres;




CREATE TABLE t_ntusers
(
    username varchar(50) COLLATE pg_catalog.default NOT NULL,
    fullname varchar(250) COLLATE pg_catalog.default,
    description varchar(500) COLLATE pg_catalog.default,
    orgs varchar(50) COLLATE pg_catalog.default,
    pass varchar(50) COLLATE pg_catalog.default,
    email varchar(100) COLLATE pg_catalog.default,
    icq varchar(50) COLLATE pg_catalog.default,
    skype varchar(100) COLLATE pg_catalog.default,
    CONSTRAINT PK_t_ntusers PRIMARY KEY (username)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_ntusers
    OWNER to postgres;




CREATE TABLE t_rpdeclare
(
    iddeclare integer NOT NULL,
    decname varchar(255) COLLATE pg_catalog.default,
    descr varchar(255) COLLATE pg_catalog.default,
    dectype integer,
    decsql varchar COLLATE pg_catalog.default,
    keyfield varchar(50) COLLATE pg_catalog.default,
    dispfield varchar(50) COLLATE pg_catalog.default,
    keyvalue varchar(255) COLLATE pg_catalog.default,
    dispvalue varchar(255) COLLATE pg_catalog.default,
    keyparamname varchar(50) COLLATE pg_catalog.default,
    dispparamname varchar(50) COLLATE pg_catalog.default,
    isbasename integer,
    descript varchar COLLATE pg_catalog.default,
    addkeys varchar(500) COLLATE pg_catalog.default,
    tablename varchar(50) COLLATE pg_catalog.default,
    editproc varchar(50) COLLATE pg_catalog.default,
    delproc varchar(50) COLLATE pg_catalog.default,
    image_bmp varchar COLLATE pg_catalog.default,
    savefieldlist varchar COLLATE pg_catalog.default,
    CONSTRAINT pk_t_rpdeclare PRIMARY KEY (iddeclare)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_rpdeclare
    OWNER to postgres;



CREATE TABLE t_sysfieldmap
(
    idmap serial NOT NULL,
    decname varchar(255) COLLATE pg_catalog.default,
    dstfield varchar(50) COLLATE pg_catalog.default,
    srcfield varchar(50) COLLATE pg_catalog.default,
    iddeclare integer,
    classname varchar(250) COLLATE pg_catalog.default,
    groupdec varchar(50) COLLATE pg_catalog.default,
    keyfield integer,
    CONSTRAINT pk_t_sysfieldmap PRIMARY KEY (idmap)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_sysfieldmap
    OWNER to postgres;



CREATE TABLE t_sysmenuimage
(
    idimage serial NOT NULL,
    caption varchar(500) COLLATE pg_catalog.default,
    image_bmp varchar COLLATE pg_catalog.default,
    mnemo varchar(255) COLLATE pg_catalog.default,
    CONSTRAINT pk_t_sysmenuimage PRIMARY KEY (idimage)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_sysmenuimage
    OWNER to postgres;



CREATE TABLE t_sysparams
(
    paramname varchar(50) COLLATE pg_catalog.default NOT NULL,
    paramvalue varchar COLLATE pg_catalog.default,
    paramdescription varchar(255) COLLATE pg_catalog.default,
    dateparam timestamp without time zone,
    CONSTRAINT pk_t_sysparams PRIMARY KEY (paramname)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_sysparams
    OWNER to postgres;



CREATE TABLE t_sysstatus
(
    idstatus serial NOT NULL,
    statustype varchar(50) COLLATE pg_catalog.default,
    statusname varchar(50) COLLATE pg_catalog.default,
    color integer,
    sortorder integer,
    comment varchar COLLATE pg_catalog.default,
    image_bmp varchar COLLATE pg_catalog.default,
    CONSTRAINT pk_t_sysstatus PRIMARY KEY (idstatus)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_sysstatus
    OWNER to postgres;




CREATE TABLE t_sysstatustype
(
    idstatustype serial NOT NULL,
    statustype varchar(50) COLLATE pg_catalog.default,
    caption varchar(50) COLLATE pg_catalog.default,
    CONSTRAINT pk_t_sysstatustype PRIMARY KEY (idstatustype)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_sysstatustype
    OWNER to postgres;




CREATE TABLE t_usergroup
(
    groupname varchar(50) COLLATE pg_catalog.default NOT NULL,
    type integer,
    caption varchar(255) COLLATE pg_catalog.default,
    CONSTRAINT pk_t_usergroup PRIMARY KEY (groupname)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE t_usergroup
    OWNER to postgres;



----------------------------Views-----------------------------------------------



-- View: v_mnmainmenu

-- DROP VIEW v_mnmainmenu;

CREATE OR REPLACE VIEW v_mnmainmenu AS
 SELECT t_mnmainmenu.idmenu,
    t_mnmainmenu.ordmenu,
    t_mnmainmenu.caption,
    t_mnmainmenu.link,
    t_mnmainmenu.app
   FROM t_mnmainmenu;

ALTER TABLE v_mnmainmenu
    OWNER TO postgres;



-- View: v_object

-- DROP VIEW v_object;

CREATE OR REPLACE VIEW v_object AS
 SELECT a.objectname,
    a.objecttype,
    a.objcod,
    a.caption
   FROM ( SELECT t_usergroup.groupname AS objectname,
                CASE t_usergroup.type
                    WHEN 0 THEN 'Группа пользователей'::text
                    ELSE 'Группа AD'::text
                END AS objecttype,
            4 AS objcod,
            t_usergroup.caption
           FROM t_usergroup
        UNION ALL
         SELECT t_mnmainmenu.mnemo,
            'Пункт меню'::text AS objecttype,
            7 AS objcod,
            t_mnmainmenu.caption
           FROM t_mnmainmenu
        UNION ALL
         SELECT t_sysstatus.statusname AS mnemo,
            'Транзакция'::text AS objecttype,
            8 AS objcod,
            t_sysstatus.comment AS caption
           FROM t_sysstatus
          WHERE t_sysstatus.statustype::text = 'TRAN'::text) a;

ALTER TABLE v_object
    OWNER TO postgres;


-- View: v_sysmenuimage

-- DROP VIEW v_sysmenuimage;

CREATE OR REPLACE VIEW v_sysmenuimage AS
 SELECT t_sysmenuimage.idimage,
    'Root/'::text || t_sysmenuimage.caption::text AS caption,
    t_sysmenuimage.caption AS icaption,
    t_sysmenuimage.image_bmp,
    0 AS typeimg
   FROM t_sysmenuimage
UNION ALL
 SELECT i.idimage,
    'Root/'::text || m.caption::text AS caption,
    i.caption AS icaption,
    i.image_bmp,
    1 AS typeimg
   FROM t_mnmainmenu m
     JOIN t_sysmenuimage i ON m.caption::text ~~ (i.caption::text || '%'::text);

ALTER TABLE v_sysmenuimage
    OWNER TO postgres;


-- View: v_t_accessreport

-- DROP VIEW v_t_accessreport;

CREATE OR REPLACE VIEW v_t_accessreport AS
 SELECT t_accessreport.ac_pk,
    t_accessreport.grp,
    t_accessreport.account,
    t_accessreport.fullname,
    t_accessreport.email,
    t_accessreport.type,
    t_accessreport.grp AS objectname
   FROM t_accessreport;

ALTER TABLE v_t_accessreport
    OWNER TO postgres;
	
	
	
---------------------------------functions-----------------------
CREATE OR REPLACE FUNCTION fn_checkaccess(_grp varchar, _account varchar)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$



SELECT CASE 
WHEN _account = 'sa' THEN 1 
WHEN _grp = 'exit' THEN 1 
WHEN COALESCE((SELECT SUM(A.A)
FROM
(
SELECT 1::integer A, GRP FROM  t_AccessReport  WHERE GRP = _GRP AND ACCOUNT = _Account
UNION
SELECT 1::integer A, A1.GRP FROM  t_AccessReport A1
INNER JOIN
(
SELECT O.ObjectName GRP, COALESCE(A2.Account, '')  Account
 FROM
 v_Object O INNER JOIN  t_AccessReport A2
 ON A2.GRP = O.ObjectName AND A2.Account = _Account
) OO
ON
(OO.GRP = A1.Account)
WHERE A1.GRP = _GRP
) A), 0) > 0 THEN 1 ELSE 0 END;


$BODY$;

ALTER FUNCTION fn_checkaccess(_grp varchar, _account varchar)
    OWNER TO postgres;
CREATE FUNCTION fn_freeaccount(_grp varchar, OUT account varchar, OUT fullname varchar, OUT email varchar, OUT type integer)
    RETURNS SETOF record 
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$


SELECT
UserName Account,
FULLNAME,
'user' EMAIL,
0 as TYPE FROM t_NTUsers
WHERE UserName NOT IN (SELECT Account FROM t_AccessReport WHERE GRP = _GRP)
UNION ALL
SELECT 	ObjectName Account,
	ObjectName  FULLNAME,
	ObjectType EMAIL,
	ObjCod as TYPE
FROM v_Object WHERE
ObjectName NOT IN (SELECT Account FROM t_AccessReport WHERE GRP = _GRP)
AND ObjectName <> _GRP AND ObjCod = 4;


$BODY$;

ALTER FUNCTION fn_freeaccount(_grp varchar, OUT account varchar, OUT fullname varchar, OUT email varchar, OUT type integer)
    OWNER TO postgres;
CREATE FUNCTION fn_getmenuimage(caption_ varchar)
    RETURNS varchar
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

select COALESCE((select image_bmp from v_sysMenuImage
where Caption = Caption_
order by TypeImg, ICaption desc  LIMIT 1), '-')

$BODY$;

ALTER FUNCTION fn_getmenuimage(caption_ varchar)
    OWNER TO postgres;
CREATE FUNCTION fn_getmenuimageid(caption_ varchar)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

select COALESCE((select idimage from v_sysmenuimage
where Caption = Caption_
order by typeimg, icaption desc  limit 1), 0)

$BODY$;

ALTER FUNCTION fn_getmenuimageid(caption_ varchar)
    OWNER TO postgres;
CREATE FUNCTION fn_mainmenu(app_ varchar, account_ varchar, OUT idmenu integer, OUT ordmenu integer, OUT caption varchar, OUT link varchar, OUT link1 varchar, OUT mnemo varchar, OUT params varchar)
    RETURNS SETOF record 
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

SELECT
IDMenu,
ORDMEnu,
'Root/' || Caption Caption,
Link,
Link1,
mnemo,
Params
FROM t_mnMainMenu WHERE (App = App_  or App = 'ALL' or (App_ = 'ALL' and App <> 'TRAN'))
and fn_CheckAccess (mnemo, Account_) > 0

$BODY$;

ALTER FUNCTION fn_mainmenu(app_ varchar, account_ varchar, OUT idmenu integer, OUT ordmenu integer, OUT caption varchar, OUT link varchar, OUT link1 varchar, OUT mnemo varchar, OUT params varchar)
    OWNER TO postgres;

CREATE FUNCTION fn_split(parstring text, sep varchar, OUT nn integer, OUT id text)
    RETURNS SETOF record 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

DECLARE
   str text[];  
   n int;
BEGIN
   str := regexp_split_to_array(ParString, Sep);
   n := array_length(str, 1);
   FOR i IN 1..n LOOP
      NN := i;
      ID := str[i];
      RETURN NEXT;
   END LOOP;
END;

$BODY$;

ALTER FUNCTION fn_split(parstring text, sep varchar, OUT nn integer, OUT id text)
    OWNER TO postgres;

CREATE FUNCTION fn_webparser(parstring text, OUT nn integer, OUT id varchar, OUT val varchar)
    RETURNS SETOF record 
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

select NN, split_part(ID, '=', 1) ID, split_part(ID, '=', 2) VAL   from fn_split(ParString, '&');

$BODY$;

ALTER FUNCTION fn_webparser(parstring text, OUT nn integer, OUT id varchar, OUT val varchar)
    OWNER TO postgres;


CREATE FUNCTION isnull(anyelement, anyelement)
    RETURNS anyelement
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

SELECT COALESCE($1, $2);

$BODY$;

ALTER FUNCTION isnull(anyelement, anyelement)
    OWNER TO postgres;
CREATE FUNCTION newid()
    RETURNS uuid
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

select uuid_generate_v1()

$BODY$;

ALTER FUNCTION newid()
    OWNER TO postgres;
CREATE FUNCTION p_lbrsetparam(_paramname varchar, _paramvalue varchar, _paramdescription varchar)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

BEGIN
IF EXISTS(SELECT ParamName FROM t_sysParams 
			WHERE ParamName = _ParamName) THEN
UPDATE t_sysParams
SET ParamValue = _ParamValue,
	ParamDescription = _ParamDescription,
	DateParam = GetDate()
WHERE ParamName = _ParamName;
ELSE
INSERT INTO t_sysParams (ParamName, ParamValue, ParamDescription, DateParam)
VALUES (_ParamName, _ParamValue, _ParamDescription, GetDate());
END IF;
END;

$BODY$;

ALTER FUNCTION p_lbrsetparam(_paramname varchar, _paramvalue varchar, _paramdescription varchar)
    OWNER TO postgres;
CREATE FUNCTION p_ntusers_del(_username varchar)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_ntusers where username = _username;
end;

$BODY$;

ALTER FUNCTION p_ntusers_del(_username varchar)
    OWNER TO postgres;

--drop function p_ntusers_edit(_username varchar, _fullname varchar, _description varchar, _orgs varchar, _pass varchar, _email varchar, _icq varchar, _skype varchar)
CREATE OR REPLACE FUNCTION p_ntusers_edit(_username varchar, _fullname varchar, _description varchar, _orgs varchar, _pass varchar, _email varchar, _icq varchar, _skype varchar)
    RETURNS SETOF t_ntusers 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select username from t_ntusers where username = _username) then
    update t_ntusers
	set 
        fullname = _fullname 
        ,description = _description
        ,orgs = _orgs
        ,pass = '-' --_pass
        ,email = _email
        ,icq = _icq
        ,skype = _skype
            
    where	
	    username = _username;
 else
	if (_username is null ) then
		_username := '';
	end if;   
   insert into t_ntusers(
        username
        ,fullname 
        ,description 
        ,orgs 
        ,pass 
        ,email 
        ,icq 
        ,skype 
            
	) 
   values (
        _username
        ,_fullname
        ,_description
        ,_orgs
        ,'-' --_pass
        ,_email
        ,_icq
        ,_skype
             
	  );
 end if;
  return query select * from t_ntusers where username = _username;
end;

$BODY$;

ALTER FUNCTION p_ntusers_edit(_username varchar, _fullname varchar, _description varchar, _orgs varchar, _pass varchar, _email varchar, _icq varchar, _skype varchar)
    OWNER TO postgres;


CREATE FUNCTION p_rpdeclare_del(_iddeclare integer)
    RETURNS void
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

delete from t_rpDeclare where IdDeclare = _IdDeclare;

$BODY$;

ALTER FUNCTION p_rpdeclare_del(_iddeclare integer)
    OWNER TO postgres;
CREATE FUNCTION p_rpdeclare_edit(_iddeclare integer, _decname varchar, _descr varchar, _dectype integer, _decsql varchar, _keyfield varchar, _dispfield varchar, _keyvalue varchar, _dispvalue varchar, _keyparamname varchar, _dispparamname varchar, _isbasename integer, _descript varchar, _addkeys varchar, _tablename varchar, _editproc varchar, _delproc varchar, _image_bmp varchar, _savefieldlist varchar)
    RETURNS SETOF t_rpdeclare 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

BEGIN
IF EXISTS (SELECT IdDeclare FROM t_rpDeclare  WHERE IdDeclare = _IdDeclare) THEN
UPDATE t_rpDeclare SET
	DecName = _DecName,
	Descr = _Descr,
	DecType = _DecType,
	DecSQL = _DecSQL,
	KeyField = _KeyField,
	DispField = _DispField,
	KeyValue = _KeyValue,
	DispValue = _DispValue,
	KeyParamName = _KeyParamName,
	DispParamName = _DispParamName,
	IsBaseName = _IsBaseName,
	Descript = _Descript,
	AddKeys = _AddKeys,
	TableName = _TableName,
	EditProc = _EditProc,
	DelProc = _DelProc,
	image_bmp = _image_bmp,
	SaveFieldList = _SaveFieldList
WHERE IdDeclare = _IdDeclare;

ELSE

IF (COALESCE(_IdDeclare, 0) =0) THEN
   SELECT  MAX (IdDeclare) + 1 FROM t_rpDeclare INTO _IdDeclare;
END IF;
INSERT INTO t_rpDeclare
(
	IdDeclare,
	DecName,
	Descr,
	DecType,
	DecSQL,
	KeyField,
	DispField,
	KeyValue,
	DispValue,
	KeyParamName,
	DispParamName,
	IsBaseName,
	Descript,
	AddKeys,
	TableName,
	EditProc,
	DelProc,
	image_bmp,
	SaveFieldList
)
VALUES
(
	_IdDeclare,
	_DecName,
	_Descr,
	_DecType,
	_DecSQL,
	_KeyField,
	_DispField,
	_KeyValue,
	_DispValue,
	_KeyParamName,
	_DispParamName,
	_IsBaseName,
	_Descript,
	_AddKeys,
	_TableName,
	_EditProc,
	_DelProc,
	_image_bmp,
	_SaveFieldList
);
END IF;

return query select * from t_rpDeclare  WHERE IdDeclare = _IdDeclare;
END;

$BODY$;

ALTER FUNCTION p_rpdeclare_edit(_iddeclare integer, _decname varchar, _descr varchar, _dectype integer, _decsql varchar, _keyfield varchar, _dispfield varchar, _keyvalue varchar, _dispvalue varchar, _keyparamname varchar, _dispparamname varchar, _isbasename integer, _descript varchar, _addkeys varchar, _tablename varchar, _editproc varchar, _delproc varchar, _image_bmp varchar, _savefieldlist varchar)
    OWNER TO postgres;
CREATE FUNCTION p_sysaccesuser(_grp varchar, _account varchar, _action integer)
    RETURNS void
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

INSERT INTO t_AccessReport
(
GRP,
ACCOUNT,
FULLNAME,
EMAIL,
Type
)
SELECT
_GRP GRP,
A.Account,
A.FULLNAME,
A.EMAIL,
A.TYPE
FROM fn_FReeAccount(_GRP) A
WHERE A.Account = _Account AND _Action = 1 LIMIT 1;
DELETE FROM t_AccessReport
WHERE Account = _Account AND GRP = _GRP AND _Action = 2;

$BODY$;

ALTER FUNCTION p_sysaccesuser(_grp varchar, _account varchar, _action integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_accessreport_del(_ac_pk uuid)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_accessreport where ac_pk = _ac_pk;
end;

$BODY$;

ALTER FUNCTION p_t_accessreport_del(_ac_pk uuid)
    OWNER TO postgres;
CREATE FUNCTION p_t_accessreport_edit(_ac_pk uuid, _objectname varchar, _account varchar, _fullname varchar, _email varchar, _type integer)
    RETURNS SETOF v_t_accessreport 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select ac_pk from v_t_accessreport where ac_pk = _ac_pk) then
    update v_t_accessreport
	set 
        grp = _objectname
        ,account = _account
        ,fullname = _fullname
        ,email = _email
        ,type = _type
            
    where	
	    ac_pk = _ac_pk;
 else
	if (_ac_pk is null ) then
		_ac_pk := uuid_generate_v1();
	end if;   
   insert into t_accessreport(
        ac_pk
        ,grp 
        ,account 
        ,fullname 
        ,email 
        ,type 
            
	) 
   values (
        _ac_pk
        ,_objectname
        ,_account
        ,_fullname
        ,_email
        ,_type
             
	  );
 end if;
  return query select * from v_t_accessreport where ac_pk = _ac_pk;
end;

$BODY$;

ALTER FUNCTION p_t_accessreport_edit(_ac_pk uuid, _objectname varchar, _account varchar, _fullname varchar, _email varchar, _type integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_mnmainmenu_del(_idmenu integer)
    RETURNS void
    LANGUAGE 'sql'
    COST 100.0
    VOLATILE 
AS $BODY$

 DELETE FROM t_AccessReport WHERE GRP = (SELECT mnemo FROM t_mnMainMenu WHERE 
										IDMenu = _IDMenu);

 DELETE FROM t_mnMainMenu
 WHERE IDMenu = _IDMenu;
 
$BODY$;

ALTER FUNCTION p_t_mnmainmenu_del(_idmenu integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_mnmainmenu_edit(_idmenu integer, _ordmenu integer, _caption varchar, _link varchar, _app varchar, _link1 varchar, _mnemo varchar, _params varchar, _web varchar, _silver varchar)
    RETURNS SETOF t_mnmainmenu 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select idmenu from t_mnmainmenu where idmenu = _idmenu) then
    update t_mnmainmenu
	set 
        ordmenu = _ordmenu 
        ,caption = _caption
        ,link = _link
        ,app = _app
        ,link1 = _link1
        ,mnemo = _mnemo
        ,params = _params
        ,web = _web
        ,silver = _silver
            
    where	
	    idmenu = _idmenu;
 else
	if (_idmenu is null ) then
		_idmenu := nextval('t_mnmainmenu_idmenu_seq'::regclass);
	end if;   
   insert into t_mnmainmenu(
        idmenu
        ,ordmenu 
        ,caption 
        ,link 
        ,app 
        ,link1 
        ,mnemo 
        ,params 
        ,web 
        ,silver 
            
	) 
   values (
        _idmenu
        ,_ordmenu
        ,_caption
        ,_link
        ,_app
        ,_link1
        ,_mnemo
        ,_params
        ,_web
        ,_silver
             
	  );
 end if;
  return query select * from t_mnmainmenu where idmenu = _idmenu;
end;

$BODY$;

ALTER FUNCTION p_t_mnmainmenu_edit(_idmenu integer, _ordmenu integer, _caption varchar, _link varchar, _app varchar, _link1 varchar, _mnemo varchar, _params varchar, _web varchar, _silver varchar)
    OWNER TO postgres;
CREATE FUNCTION p_t_rpdeclare1_del(_iddeclare integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_rpdeclare where iddeclare = _iddeclare;
end;

$BODY$;

ALTER FUNCTION p_t_rpdeclare1_del(_iddeclare integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_sysfieldmap_del(_idmap integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_sysfieldmap where idmap = _idmap;
end;

$BODY$;

ALTER FUNCTION p_t_sysfieldmap_del(_idmap integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_sysfieldmap_edit(_idmap integer, _decname varchar, _dstfield varchar, _srcfield varchar, _iddeclare integer, _classname varchar, _groupdec varchar, _keyfield integer)
    RETURNS SETOF t_sysfieldmap 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select idmap from t_sysfieldmap where idmap = _idmap) then
    update t_sysfieldmap
	set 
        decname = _decname 
        ,dstfield = _dstfield
        ,srcfield = _srcfield
        ,iddeclare = _iddeclare
        ,classname = _classname
        ,groupdec = _groupdec
        ,keyfield = _keyfield
            
    where	
	    idmap = _idmap;
 else
	if (_idmap is null ) then
		_idmap := nextval('t_sysfieldmap_idmap_seq'::regclass);
	end if;   
   insert into t_sysfieldmap(
        idmap
        ,decname 
        ,dstfield 
        ,srcfield 
        ,iddeclare 
        ,classname 
        ,groupdec 
        ,keyfield 
            
	) 
   values (
        _idmap
        ,_decname
        ,_dstfield
        ,_srcfield
        ,_iddeclare
        ,_classname
        ,_groupdec
        ,_keyfield
             
	  );
 end if;
  return query select * from t_sysfieldmap where idmap = _idmap;
end;

$BODY$;

ALTER FUNCTION p_t_sysfieldmap_edit(_idmap integer, _decname varchar, _dstfield varchar, _srcfield varchar, _iddeclare integer, _classname varchar, _groupdec varchar, _keyfield integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_sysmenuimage_del(_idimage integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_sysmenuimage where idimage = _idimage;
end;

$BODY$;

ALTER FUNCTION p_t_sysmenuimage_del(_idimage integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_sysmenuimage_edit(_idimage integer, _caption varchar, _image_bmp varchar, _mnemo varchar)
    RETURNS SETOF t_sysmenuimage 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select idimage from t_sysmenuimage where idimage = _idimage) then
    update t_sysmenuimage
	set 
        caption = _caption 
        ,image_bmp = _image_bmp
        ,mnemo = _mnemo
            
    where	
	    idimage = _idimage;
 else
	if (_idimage is null ) then
		_idimage := nextval('t_sysmenuimage_idimage_seq'::regclass);
	end if;   
   insert into t_sysmenuimage(
        idimage
        ,caption 
        ,image_bmp 
        ,mnemo 
            
	) 
   values (
        _idimage
        ,_caption
        ,_image_bmp
        ,_mnemo
             
	  );
 end if;
  return query select * from t_sysmenuimage where idimage = _idimage;
end;

$BODY$;

ALTER FUNCTION p_t_sysmenuimage_edit(_idimage integer, _caption varchar, _image_bmp varchar, _mnemo varchar)
    OWNER TO postgres;
CREATE FUNCTION p_t_sysstatus_del(_idstatus integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_sysstatus where idstatus = _idstatus;
end;

$BODY$;

ALTER FUNCTION p_t_sysstatus_del(_idstatus integer)
    OWNER TO postgres;
CREATE FUNCTION p_t_sysstatus_edit(_idstatus integer, _statustype varchar, _statusname varchar, _color integer, _sortorder integer, _comment varchar, _image_bmp varchar)
    RETURNS SETOF t_sysstatus 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select idstatus from t_sysstatus where idstatus = _idstatus) then
    update t_sysstatus
	set 
        statustype = _statustype 
        ,statusname = _statusname
        ,color = _color
        ,sortorder = _sortorder
        ,comment = _comment
        ,image_bmp = _image_bmp
            
    where	
	    idstatus = _idstatus;
 else
	if (_idstatus is null ) then
		_idstatus := nextval('t_sysstatus_idstatus_seq'::regclass);
	end if;   
   insert into t_sysstatus(
        idstatus
        ,statustype 
        ,statusname 
        ,color 
        ,sortorder 
        ,comment 
        ,image_bmp 
            
	) 
   values (
        _idstatus
        ,_statustype
        ,_statusname
        ,_color
        ,_sortorder
        ,_comment
        ,_image_bmp
             
	  );
 end if;
  return query select * from t_sysstatus where idstatus = _idstatus;
end;

$BODY$;

ALTER FUNCTION p_t_sysstatus_edit(_idstatus integer, _statustype varchar, _statusname varchar, _color integer, _sortorder integer, _comment varchar, _image_bmp varchar)
    OWNER TO postgres;
CREATE FUNCTION p_t_usergroup_del(_groupname varchar)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
AS $BODY$

begin
   delete from t_usergroup where groupname = _groupname and groupname <> 'Administrators';
end;

$BODY$;

ALTER FUNCTION p_t_usergroup_del(_groupname varchar)
    OWNER TO postgres;
CREATE FUNCTION p_t_usergroup_edit(_groupname varchar, _type integer, _caption varchar)
    RETURNS SETOF t_usergroup 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 if exists(select groupname from t_usergroup where groupname = _groupname) then
    update t_usergroup
	set 
        type = _type 
        ,caption = _caption
            
    where	
	    groupname = _groupname;
 else
	if (_groupname is null ) then
		_groupname := '';
	end if;   
   insert into t_usergroup(
        groupname
        ,type 
        ,caption 
            
	) 
   values (
        _groupname
        ,_type
        ,_caption
             
	  );
 end if;
  return query select * from t_usergroup where groupname = _groupname;
end;

$BODY$;

ALTER FUNCTION p_t_usergroup_edit(_groupname varchar, _type integer, _caption varchar)
    OWNER TO postgres;
