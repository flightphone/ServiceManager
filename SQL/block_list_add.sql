--drop table blacklist;
--update blacklist set priority = 0
/*
create table blacklist
(
   card_number int8 primary key,
   block_date_time TIMESTAMP,
   unblock_date_time TIMESTAMP,
   reason int4,
   priority int4 not null default(0)
);
*/


--drop index indx_date
create index indx_date on blacklist (block_date_time);

--drop view v_blacklist;
create or replace view v_blacklist
AS
select card_number::text card_number, block_date_time, unblock_date_time, reason, card_number c_number, "priority" from blacklist;

--drop function p_blacklist_edit(_card_number int8,_block_date_time timestamp,_unblock_date_time timestamp,_reason int4)

create function p_blacklist_edit

(

_card_number int8

,_block_date_time timestamp DEFAULT null

,_unblock_date_time timestamp DEFAULT null

,_reason int4 DEFAULT null

,_priority int4 default 0

 )

 returns setof blacklist

 as

 $$

 begin

 if exists(select card_number from blacklist where card_number = _card_number) then

    update blacklist

	set 

        block_date_time = _block_date_time 

        ,unblock_date_time = _unblock_date_time

        ,reason = _reason

        ,priority = COALESCE(_priority, 0)

            

    where	

	    card_number = _card_number;

 else

	if (_card_number is null ) then

		_card_number := '';

	end if;   

   insert into blacklist(

        card_number

        ,block_date_time 

        ,unblock_date_time 

        ,reason 

        ,priority    

	) 

   values (

        _card_number

        ,_block_date_time

        ,_unblock_date_time

        ,_reason

        ,COALESCE(_priority, 0)

             

	  );

 end if;

  return query select * from blacklist where card_number = _card_number;

end;

$$ language plpgsql;





create or replace function p_blacklist_del (_card_number int8)

returns void

as

$$

begin

   delete from blacklist where card_number = _card_number;

end;

$$ language plpgsql;



create or replace function p_blacklistdelta_edit

(

_card_number int8

,_block_date_time timestamp DEFAULT null

,_create_date_time timestamp DEFAULT null

,_reason int4 DEFAULT null



 )

 returns setof blacklistdelta

 as

 $$

 begin

 _create_date_time := COALESCE(_create_date_time, LOCALTIMESTAMP);
 if exists(select card_number from blacklistdelta where card_number = _card_number) then

    update blacklistdelta

	set 

        block_date_time = _block_date_time 

        ,create_date_time = _create_date_time

        ,reason = _reason

            

    where	

	    card_number = _card_number;

 else

   insert into blacklistdelta(

        card_number

        ,block_date_time 

        ,create_date_time 

        ,reason 

            

	) 

   values (

        _card_number

        ,_block_date_time

        ,_create_date_time

        ,_reason

             

	  );

 end if;

  return query select * from blacklistdelta where card_number = _card_number;

end;

$$ language plpgsql;





create function p_blacklistdelta_del (_card_number int8)

returns void

as

$$

begin

   delete from blacklistdelta where card_number = _card_number;

end;

$$ language plpgsql;





