use quanlybanhang;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice
from oder;
--  Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cName, product.pName
from (((customer
join oder on customer.cID = oder.cID)
join orderdetail on oder.oID=orderdetail.oID)
join product on orderdetail.pID=product.pID);
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.cID, customer.cName, oder.oID
from customer
left join oder on customer.cid=oder.cid
where oid is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn
select oder.oID, oder.oDate, sum(orderDetail.odQty*product.pPrice) as oTotalPrice
from(( oder
join orderDetail on oder.oID= orderDetail.oid)
join product on product.pID=orderDetail.pID)
group by oId;


