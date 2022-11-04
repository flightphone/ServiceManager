create table mft_blacklist_history
(
    hi_id serial primary key,
    hi_deep int4,
    hi_comment varchar(256),
    hi_types varchar(7000),
    audtuser varchar(256),
    audtdate timestamptz,
    hi_email varchar(64)
);

--select * from mft_blacklist_history order by hi_id desc

create or replace function p_mft_blacklist_history_edit

(

_hi_id int4

,_hi_deep int4 DEFAULT null

,_hi_comment varchar (256) DEFAULT null

,_hi_types varchar (7000) DEFAULT null

,_audtuser varchar (256) DEFAULT null

,_audtdate timestamptz DEFAULT null

,_hi_email varchar (64) DEFAULT null



 )

 returns setof mft_blacklist_history

 as

 $$
 begin
 
 _audtdate := NOW()::timestamptz;

 if exists(select hi_id from mft_blacklist_history where hi_id = _hi_id) then

    update mft_blacklist_history

	set 

        hi_deep = _hi_deep 

        ,hi_comment = _hi_comment

        ,hi_types = _hi_types

        ,audtuser = _audtuser

        ,audtdate = _audtdate

        ,hi_email = _hi_email

            

    where	

	    hi_id = _hi_id;

 else

	if (_hi_id is null ) then

		_hi_id := nextval('mft_blacklist_history_hi_id_seq'::regclass);

	end if;   

   insert into mft_blacklist_history(

        hi_id

        ,hi_deep 

        ,hi_comment 

        ,hi_types 

        ,audtuser 

        ,audtdate 

        ,hi_email 

            

	) 

   values (

        _hi_id

        ,_hi_deep

        ,_hi_comment

        ,_hi_types

        ,_audtuser

        ,_audtdate

        ,_hi_email

             

	  );

 end if;

  return query select * from mft_blacklist_history where hi_id = _hi_id;

end;

$$ language plpgsql;





create function p_mft_blacklist_history_del (_hi_id int4)

returns void

as

$$

begin

   delete from mft_blacklist_history where hi_id = _hi_id;

end;

$$ language plpgsql;


