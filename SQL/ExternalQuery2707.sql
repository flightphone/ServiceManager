--drop function mft_import_query(_list varchar);
create function mft_import_query (_list varchar)
returns setof t_rpdeclare
AS
$$ 
begin
insert into t_rpdeclare (iddeclare, decname, descr, dectype, decsql, editproc, delproc)
select 
(select max(iddeclare) from t_rpdeclare) + a.nn  iddeclare,
a.id decname,
a.id descr,
30 dectype,
'__external__' decsql,
'p_auto_edit' editproc,
'p_auto_del'  delproc
from fn_split(_list, ',') a
where a.id not in (select decname from t_rpdeclare);
return query select * from t_rpdeclare where decname in (select regexp_split_to_table(_list, ','));
end;
$$ language plpgsql;

--select * from mft_import_query('aaa,dddd')

CREATE OR REPLACE FUNCTION p_mtfusers_edit(_username varchar, _pass varchar, _orgs varchar,  _email varchar, _description varchar)
    RETURNS SETOF t_ntusers 
    
AS 
$$
 declare 
    _ac_pk uuid;
 begin
 if (_username = 'Admin') then
    RAISE EXCEPTION 'Невозможно редактировать пользователя Admin';
 end if;   
 if exists(select username from t_ntusers where username = _username) then
    update t_ntusers
	set 
         description = _description
        ,orgs = _orgs
        ,pass = _pass
        ,email = _email
    where	
	username = _username;
  else
	if (_username is null ) then
		_username := '';
	end if;   
    insert into t_ntusers(
        username
        ,description 
        ,orgs 
        ,pass 
        ,email
	) 
   values (
        _username
        ,_description
        ,_orgs
        ,_pass
        ,_email
	  );
 end if;
 delete from t_accessreport where account = _username;
 _ac_pk := uuid_generate_v1();
 insert into t_accessreport (grp, account, fullname, email, type, ac_pk)
 values(_orgs, _username, _username, _username, 0, _ac_pk);

  return query select * from t_ntusers where username = _username;
end;

$$ LANGUAGE 'plpgsql';

--select * from t_ntusers;

create table agents
(
    ag_id serial,
    ag_name varchar(256),
    ag_comment varchar(256),
    ag_serificate varchar,
    constraint pk_agents primary KEY
    (ag_id)
);

create view v_agents
AS
select
    ag_id,
    ag_id ag_code,
    ag_name,
    ag_comment,
    ag_serificate
from agents;

--drop function p_agents_edit (_ag_id int4,_ag_name varchar (256),_ag_comment varchar (256),_ag_serificate varchar)

create or replace function p_agents_edit

(
_ag_id int4
,_ag_name varchar (256) DEFAULT null
,_ag_comment varchar (256) DEFAULT null
,_ag_serificate varchar DEFAULT null
 )
 returns setof v_agents
 as
 $$
 begin
 if exists(select ag_id from agents where ag_id = _ag_id) then
    update agents
	set 
        ag_name = _ag_name 
        ,ag_comment = _ag_comment
        ,ag_serificate = _ag_serificate
    where	
	    ag_id = _ag_id;
 else
	_ag_id := nextval('agents_ag_id_seq'::regclass);
   insert into agents(
        ag_id
        ,ag_name 
        ,ag_comment 
        ,ag_serificate 
	) 
   values (
        _ag_id
        ,_ag_name
        ,_ag_comment
        ,_ag_serificate
	  );
 end if;
  return query select * from v_agents where ag_id = _ag_id;
end;
$$ language plpgsql;





create function p_agents_del (_ag_id int4)

returns void

as

$$

begin

   delete from agents where ag_id = _ag_id;

end;

$$ language plpgsql;





--ag_id,ag_name,ag_comment,ag_serificate

select * from agents order by ag_id