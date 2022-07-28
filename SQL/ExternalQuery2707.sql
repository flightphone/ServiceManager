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

