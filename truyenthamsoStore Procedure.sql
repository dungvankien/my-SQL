use classicmodels;
delimiter //
create procedure getCusById(
in cusNum int (11)
)
begin
select *
from customers
where customerNumber = cusNum;
end //
delimiter //
call getCusById(114);
-- tham so out
delimiter //
create procedure getCustomersContByCity(
in in_city varchar(50),
out total int
)
begin
select count(customerNumber)
into total
from customers
where city = in_city;
end //
delimiter ;
-- goi store procedure
call getCustomersContByCity('lyon', @total);
select @total;
-- tham so loai inout
delimiter //
create procedure setCouner(
inout counter int,
in inc int
)
begin 
set counter = counter + inc;
end //
delimiter ;
 --  goi store procedure
 SET @counter = 1;

CALL SetCounter(@counter,1);

CALL SetCounter(@counter,1);

CALL SetCounter(@counter,5);

SELECT @counter;