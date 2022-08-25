use classicmodels;
-- khoi tao
delimiter //
create procedure findAllCustomers()
begin
select *
from customers;
end //
delimiter ;
-- cach goi procedure
call findAllCustomers();
-- cach xoa procedure dung Drop
delimiter //
drop procedure if exists findAllCustomers //
create procedure findAllCustomers()
begin
select *
from customers
where customerNumber = 175;
end //
delimiter //
call findAllCustomers();
