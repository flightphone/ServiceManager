--select * from t_ntusers;
CREATE OR REPLACE FUNCTION p_mtfusers_edit(_username varchar, _pass varchar, _orgs varchar,  _email varchar, _description varchar)
    RETURNS SETOF t_ntusers 
    
AS 
$$
 declare 
    _ac_pk uuid;
 begin
 _pass := COALESCE(_pass, '-');
 if (_username = 'Admin') then
    RAISE EXCEPTION 'Невозможно редактировать пользователя Admin';
 end if;   
 if exists(select username from t_ntusers where username = _username) then
    update t_ntusers
	set 
         description = _description
        ,orgs = _orgs
        ,pass = case when trim (both ' *' from _pass) = '' then pass else _pass end
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
        , case when trim (both ' *' from _pass) = '' then '-' else _pass end
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

