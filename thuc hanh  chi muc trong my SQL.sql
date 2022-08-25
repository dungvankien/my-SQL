use classicmodels;
select *
from customers
where customerName = 'Land of Toys Inc.';
-- dung explain
explain select * 
from customers
where customerName = 'Land of Toys Inc.';
alter table customers add index idx_customerName(customerName);
explain select * from customers where customerName ='Land of Toys Inc.';
alter table customers add index idx_full_name(contactLastName, contactFirstName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
-- xoa chir mucj trong banr
alter table customers drop index idx_full_name;