truncate table querys;
truncate table connectors;
truncate table query_ext;

----------------------------------------------------

insert into querys(name,userid,command,dbconnectorname)
values ('AIR','15',' select  * from Airlines','Airlines');
insert into querys(name,userid,command,dbconnectorname)
values ('CHTEST','16','select * from COT_Test.AllPasTrans LIMIT 60','CH');
insert into querys(name,userid,command,dbconnectorname)
values ('PHONES','15','Select * from Phones','FB');
insert into querys(name,userid,command,dbconnectorname)
values ('PSG','123','Select * from blacklist','PsgSQL');
insert into querys(name,userid,command,dbconnectorname)
values ('TARIF','123','Select * from ServiceTariff','MSSQL');
insert into querys(name,userid,command,dbconnectorname)
values ('TARIF70','123','Select * from ServiceTariff','MSSQL');
insert into querys(name,userid,command,dbconnectorname)
values ('TARIF788','19','Select * from ServiceTariff','MSSQL');

insert into connectors(name,username,password,address,dbname,typedb)
values ('Airlines','sa','aA12345678$','51.250.44.37','test','0');
insert into connectors(name,username,password,address,dbname,typedb)
values ('CH','trans_adm','Click01','http://192.168.0.88:8123/','','2');
insert into connectors(name,username,password,address,dbname,typedb)
values ('ConnName11','usr','pswd123','localhost\DataBase','WorkBase','0');
insert into connectors(name,username,password,address,dbname,typedb)
values ('FB','SYSDBA','tariffib','localhost:D:\DataBase\CUTDB_FireBird\DC2_IB1.gdb','BaseSOD','1');
insert into connectors(name,username,password,address,dbname,typedb)
values ('MSSQL','sa','SOD-Server','new124srv\SOD','BaseSOD','0');
insert into connectors(name,username,password,address,dbname,typedb)
values ('PsgSQL','tarif_psql','tarif_01','192.168.0.114','COT_NSI_test','3');

insert into query_ext(qu_name,userid2)
values ('AIR','15');
insert into query_ext(qu_name,userid2)
values ('CHTEST','16');
insert into query_ext(qu_name,userid2)
values ('PHONES','15');
insert into query_ext(qu_name,userid2)
values ('PSG','15');
insert into query_ext(qu_name,userid2)
values ('TARIF','16');
insert into query_ext(qu_name,userid2)
values ('TARIF70','16');
insert into query_ext(qu_name,userid2)
values ('TARIF788','19');

----------------------------------------------------
