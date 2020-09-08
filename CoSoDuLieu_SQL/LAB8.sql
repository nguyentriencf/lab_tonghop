/*Học phần: Cơ sở dữ liệu
Giảng viên: Tạ Thị Thu Phượng
Ngày: 18/05/2020
Người thực hiện: NGUYỄN ĐÌNH PHÁT TRIỂN
MSSV: 1812860*/

create database Lab08
use Lab08
go
create table khoa
(
 mskhoa char(2) primary key,
 tenkoa nvarchar(20) not null,
 tentat nchar(4) not null,
)
 go
 create table  lop
 (
 mslop char(4) primary key,
 tenlop nvarchar(40) not null,
 mskhoa char(2) references khoa(mskhoa),
 niemkhoa char(4) not null,
 )
  go
 create table tinh
 (
  mstinh char(2) primary key,
  tentinh nvarchar(20) not null,
 )
 go 
create table sinhvien
(
mssv char(7) primary key,
ho nvarchar(40) not null,
ten nvarchar(10) not null,
ngaysinh datetime,
mstinh char(2) references tinh(mstinh),
ngaynhaphoc datetime,
mslop char(4) references lop(mslop),
phai bit not null,
diachi nvarchar(40) not null,
sdt nchar(10),
)
go
create table monhoc
(
msmh char(4) primary key,
tenmh nchar(40) not null,
heso int,
)
go
create table bangdiem
(
 mssv char(7) references sinhvien(mssv),
 msmh char(4) references monhoc(msmh),
 lanthi int not null,
 diem float,
 primary key(mssv, msmh, lanthi),
)

 insert into khoa values ('01',N'Cong Nghe Thong Tin', 'CNTT')
 insert into khoa values ('02', N'Điện tử viễn thông', 'DTVT')
 insert into khoa values ('03', N'Quản trị kinh doanh', 'QTKD')
 insert into khoa values ('04', N'Công nghệ sinh học', 'CNSH')

 insert into lop values ('98TH', N'Tin hoc khoa 1998', '01', '1998')
 insert into lop values ('98VT', N'Vien thong khoa 1998', '02', '1998')
 insert into lop values ('99TH', N'Tin hoc khoa 1999', '01', '1999')
 insert into lop values ('99VT', N'Vien thong khoa 1999','02', '1999')
 insert into lop values ('99QT', N'Quan trin kinh doanh 1999', '03', '1999')

 insert into tinh values ('01', N'An Giang')
 insert into tinh values ('02', N'TPHCM')
 insert into tinh values ('03', N'Dong Nai')
 insert into tinh values ('04', N'Long An')
 insert into tinh values ('05', N'Hue')
 insert into tinh values ('06', N'Ca Mua')

 set dateformat dmy
 insert into sinhvien values ('98TH001', N'Nguyen Van', N'An', '06/08/80', '01', '03/09/98', '98TH', 'yes', '12 Tran Hung Dao, Q.1', '8234512') 
 insert into sinhvien values ('98TH002', N'Le Thi', N'An', '17/10/79', '01', '03/09/98', '98TH', 'No', '23 CMT8, Q. Tan Binh', '0303234342' )
 insert into sinhvien values ('98VT001', 'Nguyen Duc', 'Binh', '25/11/81', '02', '03/09/98', '98VT', 'Yes', '245 Lac Long Quan, Q.11', '8654323')
 insert into sinhvien values ('98VT002', 'Tran Ngoc', 'Anh', '19/08/80', '02', '03/09/98', '98VT', 'No', '242 Tran Hung Dao, Q.1',null)
 insert into sinhvien values ('99TH001', 'Ly Van Hung', 'Dung', '27/09/81', '03', '05/10/99', '99TH', 'Yes', '178 CMT8, Q. Tan Binh', '7563213')
 insert into sinhvien values ('99TH002', 'Van Minh', 'Hoang', '01/01/81', '04', '05/10/99', '99TH', 'Yes', '272 Ly Thuong Kiet, Q.10', '8341234')
 insert into sinhvien values ('99TH003', 'Nguyen', 'Tuan', '12/01/80', '03', '05/10/99', '99TH', 'Yes', '162 Tran Hung Dao, Q.5',null)
 insert into sinhvien values ('99TH004', 'Tran Van', 'Minh', '25/06/81', '04', '05/10/99', '99TH', 'Yes', '147 Dien Bien Phu, Q.3', '7236754')
 insert into sinhvien values ('99TH005', 'Nguyen Thai', 'Minh', '01/01/80', '04', '05/10/99', '99TH', 'Yes', '345 Le Dai Hanh, Q.11',null)
 insert into sinhvien values ('99VT001', 'Le Ngoc', 'Mai', '21/06/82', '01', '05/10/99', '99VT', 'No', '129 Tran Hung Dao, Q.1', '0903124534')
 insert into sinhvien values ('99QT001', 'Nguyen Thi', 'Oanh', '19/08/73', '04', '05/10/99', '99QT', 'No', '76 Hung Vuong, Q.5', '0901656324')
 insert into sinhvien values ('99QT002', 'Le My', 'Hanh', '20/05/76', '04', '05/10/99', '99QT', 'No', '12 Pham Ngoc Thach, Q.3',null)

 insert into monhoc values ('TA01', N'Nhap mon tin hoc', 2)
 insert into monhoc values ('TA02', N'Lap trinh co ban', 3)
 insert into monhoc values ('TB01', N'cau truc du lieu', 2)
 insert into monhoc values ('TB02', N'co so du lieu', 2) 
 insert into monhoc values ('QA01', N'Kinh te vi mo',2)
 insert into monhoc values ('QA02', N'Quan tri chat luong', 3)
 insert into monhoc values ('VA01', N'Dien tu co ban', 2)
 insert into monhoc values ('VA02', N'Mach so', 3)
 insert into monhoc values ('VB01', N'Truyen so lieu', 3)
 insert into monhoc values ('XA01', N'Vat ly dai cuong', 2)
 
insert into bangdiem values  ('98TH001', 'TA01', 1, 8.5)
insert into bangdiem values  ('98TH001', 'TA02', 1, 8)
insert into bangdiem values  ('98TH002', 'TA01', 1, 4)
insert into bangdiem values  ('98TH002', 'TA01', 2, 5.5)
insert into bangdiem values  ('98TH001', 'TB01', 1, 7.5)
insert into bangdiem values  ('98TH002', 'TB01', 1, 8)
insert into bangdiem values  ('98VT001', 'VA01', 1, 4)
insert into bangdiem values  ('98VT001', 'VA01', 2, 5)
insert into bangdiem values  ('98VT002', 'VA02', 1, 7.5)
insert into bangdiem values  ('99TH001', 'TA01', 1, 4)
insert into bangdiem values  ('99TH001', 'TA01', 2, 6)
insert into bangdiem values  ('99TH001', 'TB01', 1, 6.5)
insert into bangdiem values  ('99TH002', 'TB01', 1, 10)
insert into bangdiem values  ('99TH002', 'TB02', 1, 9)
insert into bangdiem values  ('99TH003', 'TA02', 1, 7.5)
insert into bangdiem values  ('99TH003', 'TB01', 1, 3)
insert into bangdiem values  ('99TH003', 'TB01', 2, 6)
insert into bangdiem values  ('99TH003', 'TB02', 1, 8)
insert into bangdiem values  ('99TH004', 'TB02', 1, 2)
insert into bangdiem values  ('99TH004', 'TB02', 2, 4)
insert into bangdiem values  ('99TH004', 'TB02' ,3, 3)
insert into bangdiem values  ('99QT001', 'QA01', 1, 7)
insert into bangdiem values  ('99QT001', 'QA02', 1, 6.5)
insert into bangdiem values  ('99QT002', 'QA01', 1, 8.5)
insert into bangdiem values  ('99QT002', 'QA02', 1, 9)

select * from khoa
select * from lop
select * from tinh
select * from sinhvien
select * from monhoc
select * from bangdiem


--1) Liệt kê MSSV, Họ, Tên, Địa chỉ của tất cả các sinh viên
select mssv, ho+' '+ten as hoten, diachi
from sinhvien

--2) Liệt kê MSSV, Họ, Tên, MS Tỉnh của tất cả các sinh viên. Sắp xếp kết quả theo MS
--tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên.
select mssv, ho, ten, mstinh
from sinhvien
order by mstinh, ten

--3) Liệt kê các sinh viên nữ của tỉnh Long An
select *
from sinhvien where phai = 'No' and mstinh = '04'

--4) Liệt kê các sinh viên có sinh nhật trong tháng giêng.
select *
from sinhvien where MONTH(ngaysinh) = '01'