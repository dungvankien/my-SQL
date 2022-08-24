create database QuanLySanPham;
use QuanlySanpham;
create table PhieuXuat(
SoPX int(50) primary key not null auto_increment,
NgayXuat datetime,
DGXuat double,
SLXuat int (50)
);
create table VatTu(
MaVTu int(50) primary key not null auto_increment,
TenVTu varchar(50)
);
create table PhieuNhap(
SoPN int(50),
NgayNhao datetime,
DGNhap double,
SLNhap int(20)
);
create table DonDH(
SoDH int(50),
NgayDH datetime
); 
create table NhaCC(
MaNCC int(50) primary key not null auto_increment,
TenNCC varchar(50),
DiaChi varchar(50),
SĐT varchar (11)
);
