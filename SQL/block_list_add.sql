create table blacklist
(
   card_number int8 primary key,
   block_date_time TIMESTAMP,
   unblock_date_time TIMESTAMP,
   reason int4
);


create index indx_date on blacklist (block_date_time);

create view v_blacklist
AS
select card_number::text card_number, block_date_time, unblock_date_time, reason from blacklist;

create function p_blacklist_edit

(

_card_number int8

,_block_date_time timestamp DEFAULT null

,_unblock_date_time timestamp DEFAULT null

,_reason int4 DEFAULT null



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

            

	) 

   values (

        _card_number

        ,_block_date_time

        ,_unblock_date_time

        ,_reason

             

	  );

 end if;

  return query select * from blacklist where card_number = _card_number;

end;

$$ language plpgsql;





create function p_blacklist_del (_card_number int8)

returns void

as

$$

begin

   delete from blacklist where card_number = _card_number;

end;

$$ language plpgsql;




