--#
--#       Gpu Hash Join TestCases without BulkLoad 
--#

-- off to any join plan
set enable_hashjoin to off;
set enable_mergejoin to off;
set enable_nestloop to off;
-- off to any scan plan
set enable_indexscan to off;
set enable_bitmapscan to off;

--smallint
select a.id,case when a.smlint_x = b.smlint_x then a.smlint_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.smlint_x=b.smlint_x and a.id=b.id order by a.id;

--integer
select a.id,case when a.integer_x = b.integer_x then a.integer_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.integer_x=b.integer_x and a.id=b.id order by a.id;

--bigint
select a.id,case when a.bigint_x = b.bigint_x then a.bigint_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.bigint_x=b.bigint_x and a.id=b.id order by a.id;

--real
select a.id,case when a.real_x = b.real_x then a.real_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.real_x=b.real_x and a.id=b.id order by a.id;

--float
select a.id,case when a.float_x = b.float_x then a.float_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.float_x=b.float_x and a.id=b.id order by a.id;

--numeric
select a.id,case when a.nume_x = b.nume_x then a.nume_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.nume_x=b.nume_x and a.id=b.id order by a.id;

--small serial
select a.id,case when a.smlsrl_x = b.smlsrl_x then a.smlsrl_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.smlsrl_x=b.smlsrl_x and a.id=b.id order by a.id;

--serial
select a.id,case when a.serial_x = b.serial_x then a.serial_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.serial_x=b.serial_x and a.id=b.id order by a.id;

--big serial
select a.id,case when a.bigsrl_x = b.bigsrl_x then a.bigsrl_x else 0 end from 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as a
 inner join 
(select * from strom_test where id between 20001 and 30000 and id%100=0 and id::text not like '' ) as b
 on a.bigsrl_x=b.bigsrl_x and a.id=b.id order by a.id;