drop FUNCTION public.p_querys_edit(_name character varying, _userid integer, _command character varying, _dbconnectorname character varying);


CREATE OR REPLACE VIEW public.v_querys AS
 SELECT q.name,
    e.userid2 AS userid,
    q.command,
    q.dbconnectorname,
    d.iddeclare,
    a.ag_name,
    d.keyfield

   FROM querys q
     JOIN t_rpdeclare d ON q.name::text = d.decname::text
     JOIN query_ext e ON q.name::text = e.qu_name::text
     LEFT JOIN agents a ON e.userid2 = a.ag_id;

ALTER TABLE public.v_querys
    OWNER TO postgres;

--select * from v_querys    

CREATE FUNCTION public.p_querys_edit(_name character varying, _userid integer, _command character varying, _dbconnectorname character varying, _keyfield varchar(50))
    RETURNS SETOF v_querys 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE     ROWS 1000.0
AS $BODY$

 begin
 _userid := COALESCE(_userid, 123);
 if exists(select name from querys where name = _name) then
    update querys
	set 
        userid = cast(_userid as varchar(32))
        ,command = _command
        ,dbconnectorname = _dbconnectorname
            
    where	
	    name = _name;
 else
	if (_name is null ) then
		_name := '';
	end if;   
   insert into querys(
        "name"
        ,userid 
        ,command 
        ,dbconnectorname 
            
	) 
   values (
        _name
        ,cast(_userid as varchar(32))
        ,_command
        ,_dbconnectorname
             
	  );
 end if;
  PERFORM mft_import();  --обновляем declare
  update query_ext 
  set userid2 = _userid
  where qu_name = _name;

  update t_rpdeclare set keyfield = _keyfield where decname = _name;
  return query select * from v_querys where name = _name;
end;

$BODY$;

ALTER FUNCTION public.p_querys_edit(_name character varying, _userid integer, _command character varying, _dbconnectorname character varying, _keyfield varchar(50))
    OWNER TO postgres;
