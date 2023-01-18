/*

create table history1
(
    newdata varchar(50) primary key,
    datetime TIMESTAMP
);

insert into history1 (newdata, datetime)
select 
newdata,
max(datetime) datetime
from history
where tablename = 'blacklist'
and columnname = 'card_number'
and typeoperation = 'INSERT' 
group by history.newdata

insert into blacklist (card_number, block_date_time, reason)
select newdata::int8, date_trunc('day', datetime), 0 from history1 

select * from blacklist limit 100

--delete from blacklist where card_number = 500;
--select * from blacklist
ALTER TABLE blacklist ENABLE TRIGGER  ALL

select * from "public"."history" where datetime > '2022-08-19'
*/

select * from "public"."blacklist"
where "block_date_time" < '2022-08-11' 
order by block_date_time limit 100

create index indx_date on blacklist (block_date_time);