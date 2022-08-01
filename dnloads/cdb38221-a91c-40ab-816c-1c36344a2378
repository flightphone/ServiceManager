create table t_columns (
    idcolumn serial not null,
    iddeclare integer not null,
    ordc integer,
    visible integer,
    fieldname varchar(255),
    fieldcaption varchar(255),
    displayformat varchar(255),
    width integer,
    constraint pk_t_columns primary key (idcolumn)
);

create function p_t_columns_edit
(
_idcolumn int4
,_iddeclare int4 DEFAULT null
,_ordc int4 DEFAULT null
,_visible integer DEFAULT null
,_fieldname varchar (255) DEFAULT null
,_fieldcaption varchar (255) DEFAULT null
,_displayformat varchar (255) DEFAULT null
,_width int4 DEFAULT null

 )
 returns setof t_columns
 as
 $$
 begin
 if exists(select idcolumn from t_columns where idcolumn = _idcolumn) then
    update t_columns
	set 
        iddeclare = _iddeclare 
        ,ordc = _ordc
        ,visible = _visible
        ,fieldname = _fieldname
        ,fieldcaption = _fieldcaption
        ,displayformat = _displayformat
        ,width = _width
            
    where	
	    idcolumn = _idcolumn;
 else
	if (_idcolumn is null ) then
		_idcolumn := nextval('t_columns_idcolumn_seq'::regclass);
	end if;   
   insert into t_columns(
        idcolumn
        ,iddeclare 
        ,ordc 
        ,visible 
        ,fieldname 
        ,fieldcaption 
        ,displayformat 
        ,width 
            
	) 
   values (
        _idcolumn
        ,_iddeclare
        ,_ordc
        ,_visible
        ,_fieldname
        ,_fieldcaption
        ,_displayformat
        ,_width
             
	  );
 end if;
  return query select * from t_columns where idcolumn = _idcolumn;
end;
$$ language plpgsql;


create function p_t_columns_del (_idcolumn int4)
returns void
as
$$
begin
   delete from t_columns where idcolumn = _idcolumn;
end;
$$ language plpgsql;


--idcolumn,iddeclare,ordc,visible,fieldname,fieldcaption,displayformat,width


