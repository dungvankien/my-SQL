create database Practice_Products;
use Practice_Products;
create table products(
id int (10) primary key auto_increment,
productCode int(10),
productName varchar(50),
productPrice decimal,
productAmount int,
productDescription varchar(225),
productStatus bit(1)
);
insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values(1,'trada',5000,2000,'ngon dang',1),
(2,'trachanh',4000,2000,'ngot chiu',1),
(3,'tradao',6000,2000,'chiu chiu',1),
(4,'traolong',20000,2000,'thom thom',1),
(5,'trasua',35000,0,'ngot qua',0);
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_productCode
on products(productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_Name_price
on products(productName, productPrice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM products where productName;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as
select productCode, productName, productPrice, productStatus
from products;
-- Tiến hành sửa đổi view
create or replace view  product_view as
select productCode, productName, productPrice
from  products;
-- Tiến hành xoá view
drop view product_view;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure getInforProduct()
begin
select *
from practice_products.products;
end //
delimiter ;
call getInforProduct();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct(
in productCode int,
in productName varchar(50),
in productPrice decimal,
in productAmount int,
in productDescription varchar(50),
in productStatus bit(1)
)
begin
insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values(productCode,productName,productPrice,productAmount,productDescription,productStatus);
end //
delimiter ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure editProdut(
in id1 int,
in productCode1 int,
in productName1 varchar(50),
in productPrice1 decimal,
in productAmount1 int,
in productDescription1 varchar(50),
in productStatus1 bit(1)
)
begin
declare productCode2 int;
declare productName2 varchar(50);
declare productPrice2 decimal;
declare productAmount2 int;
declare productDescription2 varchar(50);
declare productStatus2 bit(1);

set productCode2=productCode1;
if (productCode2 is null) then 
	set productCode2=(select productCode  from products where `id` = id1);
end if;

set productName2=productName1;
if (productName2 is null) then 
	set productName2=(select productName  from products where `id` = id1);
end if;

set productPrice2=productPrice1;
if (productPrice2 is null) then 
	set productPrice2=(select productPrice  from products where `id` = id1);
end if;

set productAmount2=productAmount1;
if productAmount2 is null then 
	set productAmount2=(select productAmount  from products where `id` = id1);
end if;

set productDescription2=productDescription1;
if (productDescription2 is null) then 
	set productDescription2=(select productDescription  from products where `id` = id1);
end if;

set productStatus2=productStatus1;
if (productStatus2 is null) then 
	set productStatus2=(select productStatus  from products where `id` = id1);
end if;

UPDATE `practice_products`.`products` SET `productCode` = productCode2, `productName` = productName2, `productPrice` = productPrice2,
 `productAmount` = productAmount2, `productDescription` = productDescription2, `productStatus` = productStatus2 WHERE (`id` = id1);
 end //
 delimiter ;
 -- Tạo store procedure xoá sản phẩm theo id
 delimiter //
 create procedure removeProduc(
 in id1 int
 )
 begin
 DELETE FROM `practice_products`.`products` WHERE (`id` = id1);
end //
delimiter //
