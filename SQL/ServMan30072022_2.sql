create table query_ext
(
   qu_name varchar(100) not null, 
   userid2 int,
   constraint pk_query_ext primary key(qu_name)
);

create or replace view v_querys
as
select 
q.name,
e.userid2 userid,
q.command,
q.dbconnectorname,
d.iddeclare, --d.decname, d.descr, d.dectype, d.decsql, d.keyfield, d.dispfield, d.keyvalue, d.dispvalue, d.keyparamname, d.dispparamname, d.descript, d.addkeys, d.tablename, d.editproc, d.delproc, d.savefieldlist
a.ag_name
from querys as q 
inner join t_rpdeclare as d on q.name = d.decname
inner join query_ext e on q.name = e.qu_name
left join agents a on e.userid2 = a.ag_id;


--select * from v_querys
--select name, command, row_number() over (order by name) nn from querys order by name;

--drop function mft_import()
create or replace function mft_import()
returns void
AS
$$ 
begin
insert into t_rpdeclare (iddeclare, decname, descr, dectype, decsql, editproc, delproc)
select 
(select max(iddeclare) from t_rpdeclare) + 
(row_number() over (order by a.name)) iddeclare,
a.name decname,
a.name descr,
30 dectype,
'__external__' decsql,
'p_auto_edit' editproc,
'p_auto_del'  delproc
from querys a
where a.name not in (select decname from t_rpdeclare)
order by name;

insert into query_ext (qu_name)
select 
a.name 
from  querys a
where a.name not in (select qu_name from query_ext);

return;
end;
$$ language plpgsql;

drop function p_querys_edit(
_name varchar (100)
,_userid varchar (255) 
,_command varchar 
,_dbconnectorname varchar (255) 
 );

--select * from p_querys_edit('AAA', 2, 'select 4', 'TTT')
--select mft_import()

create or replace function p_querys_edit
(
_name varchar (100)
,_userid int 
,_command varchar DEFAULT null
,_dbconnectorname varchar (255) DEFAULT null

 )
 returns setof v_querys
 as
 $$
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
  return query select * from v_querys where name = _name;
end;
$$ language plpgsql;

----------------Agents----------------------------------

drop function p_agents_edit
(
_ag_id int4
,_ag_name varchar (256)
,_ag_comment varchar (256)
,_ag_serificate varchar
 );

drop view v_agents;

--drop function get_agents_query (ag_id int)

update agents
set ag_serificate = 'Действует';

alter table agents
add column ag_file integer default(0);


create function get_agents_query (ag_id int)
returns varchar
AS
$$ 
DECLARE
   res varchar;
   _name RECORD;
BEGIN
   res := '';
   for _name in 
   select name from v_querys where userid = ag_id order by name
   loop
      res := res || _name.name || ',';
   end loop;
   return res;
END;   
$$ language plpgsql;


create or replace view v_agents
AS
select
    ag_id,
    ag_name,
    ag_comment,
    ag_serificate,
    ag_file,
    get_agents_query(ag_id) agents_query
from agents;

create or replace function p_agents_edit

(
_ag_id int4
,_ag_name varchar (256) DEFAULT null
,_ag_comment varchar (256) DEFAULT null
,_ag_serificate varchar DEFAULT null
,_ag_file integer DEFAULT 0
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
        ,ag_file = _ag_file
    where	
	    ag_id = _ag_id;
 else
	_ag_id := nextval('agents_ag_id_seq'::regclass);
   insert into agents(
        ag_id
        ,ag_name 
        ,ag_comment 
        ,ag_serificate 
        ,ag_file
	) 
   values (
        _ag_id
        ,_ag_name
        ,_ag_comment
        ,_ag_serificate
        ,_ag_file
	  );
 end if;
  return query select * from v_agents where ag_id = _ag_id;
end;
$$ language plpgsql;


--select * from v_agents

--select get_agents_query(1);

--update agents set ag_file = 0

----------------------------------File system----------------------
create table fileh
(
   fh_pk serial not null primary key,
   fh_name varchar(256),
   fh_sysname varchar(256)
);

create function p_fileh_edit

(

_fh_pk int4

,_fh_name varchar (256) DEFAULT null

,_fh_sysname varchar (256) DEFAULT null



 )

 returns setof fileh

 as

 $$

 begin

 if exists(select fh_pk from fileh where fh_pk = _fh_pk) then

    update fileh

	set 

        fh_name = _fh_name 

        ,fh_sysname = _fh_sysname

            

    where	

	    fh_pk = _fh_pk;

 else

	if (_fh_pk is null ) then

		_fh_pk := nextval('fileh_fh_pk_seq'::regclass);

	end if;   

   insert into fileh(

        fh_pk

        ,fh_name 

        ,fh_sysname 

            

	) 

   values (

        _fh_pk

        ,_fh_name

        ,_fh_sysname

             

	  );

 end if;

  return query select * from fileh where fh_pk = _fh_pk;

end;

$$ language plpgsql;





create function p_fileh_del (_fh_pk int4)

returns void

as

$$

begin

   delete from fileh where fh_pk = _fh_pk;

end;

$$ language plpgsql;


