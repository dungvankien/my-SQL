create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int(50) primary key	not null,
cName varchar(50),
cAge int(10)
);
create table Oder(
oID int(50) primary key not null,
cID int(50) not null,
oDate datetime,
oTotalPrice double,
foreign key (cID) references Customer (cID)
);
create table Product(
pID int(50) primary key not null,
pName varchar(50),
pPrice double
);
create table OrderDetail(
oID int(50) not null,
pID int(50) not null,
odQty int(50),
primary key (oID, pid),
foreign key(oID) references Oder(oID),
foreign key(pID) references Product(pID)
);

