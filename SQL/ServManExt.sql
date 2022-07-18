create table contype
(cn_id int not null, 
 cn_typedb varchar(255),
 constraint pk_contype primary key (cn_id)
 );

 insert into contype values (0, 'MSSQL');
 insert into contype values (1, 'FireBird');
 insert into contype values (2, 'ClickHouse');
 insert into contype values (3, 'PostgreSQL');

 create table connectors
 (
        Name varchar(255) not null, 
        UserName varchar(50) not null,
		Password varchar(50) not null,
		Address varchar(255), 
		DBName varchar(255),
		TypeDB int,
        constraint pk_connectors primary key (Name)
 );

 create VIEW v_connectors AS
 select
        c.Name, 
        c.UserName,
		c.Password,
		c.Address, 
		c.DBName,
		c.TypeDB,
        t.cn_typedb
 from connectors c inner join contype t on c.TypeDB = t.cn_id;

create function p_connectors_edit
(
_name varchar (255)
,_username varchar (50) DEFAULT null
,_password varchar (50) DEFAULT null
,_address varchar (255) DEFAULT null
,_dbname varchar (255) DEFAULT null
,_typedb int4 DEFAULT null

 )
 returns setof v_connectors
 as
 $$
 begin
 if exists(select name from connectors where name = _name) then
    update connectors
	set 
        username = _username 
        ,password = _password
        ,address = _address
        ,dbname = _dbname
        ,typedb = _typedb
            
    where	
	    name = _name;
 else
	if (_name is null ) then
		_name := '';
	end if;   
   insert into connectors(
        name
        ,username 
        ,password 
        ,address 
        ,dbname 
        ,typedb 
            
	) 
   values (
        _name
        ,_username
        ,_password
        ,_address
        ,_dbname
        ,_typedb
             
	  );
 end if;
  return query select * from v_connectors where name = _name;
end;
$$ language plpgsql;


create function p_connectors_del (_name varchar (255))
returns void
as
$$
begin
   delete from connectors where name = _name;
end;
$$ language plpgsql;


--name,username,password,address,dbname,typedb


create table querys
(
        Name varchar(100) not null,
		UserID varchar(255) not null,
		Command varchar not null,
		DBConnectorName varchar(255) not null,
        constraint pk_querys primary key (Name)
);

create function p_querys_edit
(
_name varchar (100)
,_userid varchar (255) DEFAULT null
,_command varchar DEFAULT null
,_dbconnectorname varchar (255) DEFAULT null

 )
 returns setof querys
 as
 $$
 begin
 if exists(select name from querys where name = _name) then
    update querys
	set 
        userid = _userid 
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
        ,_userid
        ,_command
        ,_dbconnectorname
             
	  );
 end if;
  return query select * from querys where name = _name;
end;
$$ language plpgsql;


create function p_querys_del (_name varchar (100))
returns void
as
$$
begin
   delete from querys where name = _name;
end;
$$ language plpgsql;


--name,userid,command,dbconnectorname