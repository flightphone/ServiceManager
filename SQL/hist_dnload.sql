create table dnload_history
(
    id_dh serial primary key,
    dh_date timestamp,
    dh_len int
);

create or replace function dnload_history_insert (_dh_len4 int)
returns int 
AS
$$
declare 
    _id_dh int4;
begin
    _id_dh:= nextval('dnload_history_id_dh_seq'::regclass);
    insert into dnload_history(id_dh, dh_date, dh_len)
    values (_id_dh, current_timestamp, _dh_len4);
    return ((_id_dh % 1000)::int4);
end;    
$$ language plpgsql;

select * from dnload_history
select dnload_history_insert(5000);