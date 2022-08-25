use classicmodels;
create view customer_view AS
select customerNumber, customerName, phone
from customers;
select *
from customer_view;
-- cap nhap customer_view
create or replace view customer_view as
select customernumber, customername, contactlastname, contactfirstname, phone
from customers
where city ='Nantes';
-- xoa view
Drop view customer_view;