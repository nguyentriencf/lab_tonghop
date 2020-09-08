--------------------------
/* học phần cơ sở dữ liệu
   ngày:
   người thưc hiện: nguyễn đinh phát triển
*/
--lênh tạo cơ sở dữ liệu
create database lab1_quanlynv
go
----lệnh sử dụng cơ sở dữ liêu
use lab1_quanlynv
--- lệnh tạo các bảng
create table chinhanh
(MSCN char(2) primary key, ---khai báo khóa chính
TenCN nvarchar(30) not null unique
)
go
create table NhanVien
(MANV char(4) primary key, --- khoai báo kháo chính
HO nvarchar(20) not null,
TEN nvarchar(10) not null,
NgaySinh datetime,
NgayVaoLam datetime,
MSCN   char(2) references chinhanh(MSCN),--- khai bao MSCN  là khóa ngoại tham chiếu đến khóa chính MSCN của quan hệ chi nhánh 
)
go
create table KyNang
(MSKN char(2) primary key,
TenKN nvarchar(30) not null,
)
go
create table NhanVienKyNang
(MANV char(4) references NhanVien(MANV),
MSKN char(2) references KyNang(MSKN),
MucDo tinyint check (MucDo between 1 and 9), -- kiểm tra MucDo >= 1 and <9
primary key(MANV,MSKN)--- khai báo khóa chính gồm nhiều thuộc tính
)
--xem các thuộc tính 
select * from chinhanh
select * from NhanVien
select * from KyNang
select * from NhanVienKyNang

--- nhập dữ liệu các bảng
insert into chinhanh values('01',N'Quận 1')
insert into chinhanh values('02',N'Quận 5')
insert into chinhanh values('03',N'Bình thạnh') 
--- xem bảng chi nhánh
select* from ChiNhanh
---nhập dữ liệu các nhân viên
insert into KyNang values('01',N'word')
insert into KyNang values('02',N'excel')
insert into KyNang values('03',N'access')
insert into kyNang values('04',N'powerpoint')
insert into KyNang values('05',N'SPSS')
--- xem bảng kỹ năng 
select * from KyNang
---nhập nhân viên
set dateformat dmy ---khai báo định dạng ngày tháng
insert into NhanVien values('0001',N'Lê Văn', N'Minh','10/06/1960','02/05/1986','01')
insert into NhanVien values('0002',N'Nguyễn Thị', N'Mai','20/04/1970','04/07/2001','01')
insert into NhanVien values('0003',N'Lê Văn ', N'Tuấn','25/06/1975','01/09/1982','02')
insert into NhanVien values('0004',N'Vương Tuấn', N'Vũ','26/03/1960','12/01/1986','02')
insert into NhanVien values('0005',N'Lý Anh', N'Hân','01/12/1980','15/05/2004','02')
insert into NhanVien Values('0006',N'Phan Lê', N'Tuấn','04/06/1976','25/10/2005','03')
insert into NhanVien values('0007',N'Lê Tuấn', N'Tú','15/08/1975','15/08/2000','03')
----xem bảng nhân viên
select * from NhanVien
---nhập dữ liệu bảng kỹ năng nhân viên

insert into NhanVienKyNang values('0001','01',2)
insert into NhanVienKyNang values('0001','02',1)
insert into NhanVienKyNang values('0002','01',2)
insert into NhanVienKyNang values('0002','03',2)
insert into NhanVienKyNang values('0003','02',1)
insert into NhanVienKyNang values('0003','03',2)
insert into NhanVienKyNang values('0004','01',5)
insert into NhanVienKyNang values('0004','02',4)
insert into NhanVienKyNang values('0004','03',1)
insert into NhanVienKyNang values('0005','02',4)
insert into NhanVienKyNang values('0005','05',4)
insert into NhanVienKyNang values('0006','05',4)
insert into NhanVienKyNang values('0006','02',4)
insert into NhanVienKyNang values('0006','03',2)
insert into NhanVienKyNang values('0007','03',4)
insert into NhanVienKyNang values('0007','04',3)

select *from chinhanh
select *from NhanVien
select *from KyNang
select *from NhanVienKyNang
---xem bảng nhân viên kỹ năng
 ---truy vấn lựa chọn trên nhiều bảng
---- câu 1a
select MANV, HO+' '+TEN as HoTen, YEAR(GETDATE()) - YEAR(NgayVaoLam) as SoNamLamViec
from NhanVien

-- 1b 
select HO+' '+TEN as HoTen, NgaySinh, NgayVaoLam
from NhanVien
order by MSCN
--1c 
select HO+' '+ TEN, TenKN, MucDo
from NhanVien A, KyNang B, NhanVienKyNang C
where A.MANV = C.MANV and B.MSKN = C.MSKN  and TenKN = 'word'
--1d
select  TenKN, MucDo
from NhanVien A, KyNang B, NhanVienKyNang C
where A.MANV = C.MANV and B.MSKN = C.MSKN  and HO =N'Lê Văn' and TEN =N'Tuấn'
-- truy vấn lồng
--2a
select A.MANV, HO+' '+TEN as HoTEN, A.MSCN, TenCN,D.TenKN, C.MucDo
from NhanVien A, chinhanh B, NhanVienKyNang C, KyNang D
where A.MSCN = B.MSCN and A. MANV = C.MANV and C.MSKN = D.MSKN and TenKN = 'excel'
         and C.MucDo >=all( select E.MucDo
		                 from NhanVienKyNang E, KyNang F
						 where E.MSKN = F.MSKN and F.TenKN = 'excel')

--2b
select A.MANV, HO+' '+TEN as HOTEN, A.MSCN, B.TenCN
from NhanVien A, chinhanh B, NhanVienKyNang C, KyNang D
where A.MSCN = A.MSCN and A.MANV = C.MANV and C.MSKN =D.MSKN
          and TenKN ='word'
		  and A.MANV in(select E.MANV
		                from NhanVienKyNang E, KyNang F
		                where E.MSKN = F.MSKN and F.TenKN ='excel')
 
select TenKN, MucDo
from NhanVien A, NhanVienKyNang B, KyNang C
where A.MANV = b.MANV and B.MSKN = c.MSKN and HO =N'Lê Văn' and TEN=N'Tuấn' 

--2c
select A.MANV, HO+' '+TEN as HoTen, a.MSCN, TenCN,TenKN, C.MucDo
from NhanVien A, chinhanh B, NhanVienKyNang C, KyNang D
where A.MSCN = B.MSCN and A.MANV = C.MANV and C.MSKN = D.MSKN
      and A.MANV >=all(select E.MucDo
	                    from NhanVienKyNang E, KyNang F
						where E.MSKN = F.MSKN)
--2d liệt kê các chi nhánh mà trong đó mọi nhân viên đều biết sử dụng word  
select distinct A.MSCN, B.TenCN, HO, TEN
from NhanVien A, chinhanh B, NhanVienKyNang C, KyNang D
where A.MSCN = B.MSCN and A.MANV = C.MANV and C.MSKN = D.MSKN
      and B.MSCN in ( select MSKN
	                 from  KyNang
					 where TenKN ='word')
--truy vấn gom dữ liệu
--3a với mỗi chi nhánh hãy cho biết các thông tin sau TenCN, SoNV(số nhân viên của chi nhánh đó)
select TenCN, count(A.MANV) as SoNV
from NhanVien A, chinhanh B
where A.MSCN = B.MSCN
group by TenCN
--3b với mỗi kỹ năng, hãy cho biết TenKN, SoNguoiDung(số nhân viên biết sử dụng kỹ năng đó)
select TenKN, COUNT(A.MANV) as SoNguoiDung
from NhanVienKyNang A, KyNang B
where A.MSKN =b.MSKN
group by TenKN
--3c cho biết TenKN  có 3 nhân viên sử dụng trở lên
select TenKN
from NhanVienKyNang A, KyNang B
where A.MSKN =b.MSKN
group by TenKN
having COUNT(A.MANV) >= 3
--3d cho biết tên chi nhánh có nhiều nhân viên nhất
select TenCN, COUNT(A.MANV) as soNV
from NhanVien A, chinhanh B
where A.MSCN = B.MSCN
group by TenCN
having COUNT(A.MANV) <= all(select COUNT (C.MANV)
                           from NhanVien C
						   group by C.MSCN)

                           
						    
--3d cho bết chi nhánh nào ít nhân viên nhất
select TenCN, COUNT(A.MANV) as soNV
from NhanVien A, chinhanh B
where A.MSCN = B.MSCN
group by TenCN
having COUNT(A.MANV) <= all (select COUNT(C.MANV)
                             from NhanVien C
							 group by C.MSCN)
 --3f với mỗi nhân viên hãy cho biết sô kĩ năng tin  học mà nhân viên đó có được
 select HO+' '+TEN AS HoTen,COUNT(B.MSKN) as soKN
 from NhanVien A, NhanVienKyNang B, KyNang C
 where A.MANV =B.MANV AND B.MSKN = C.MSKN
 group by HO+' '+TEN

 --3g cho biết tên nhân viên sử dụng nhiều kỹ năng nhất
 select HO+' '+TEN AS HoTen,COUNT(B.MSKN) as soKN
 from NhanVien A, NhanVienKyNang B, KyNang C
 where A.MANV = B.MANV and B.MSKN = C.MSKN
 group by HO+' '+TEN
 having COUNT(B.MSKN) >= all(select COUNT(D.MSKN)
                             from NhanVienKyNang D
							 group by D.MANV
                             )
-- 4 cập nhât dữ liệu
--4a