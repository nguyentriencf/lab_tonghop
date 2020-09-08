----------
/*học phần csdl
 ngày 27/4/2020
 người thực hiện: nguyễn đình phát triển
 lab02
 */
-----lệnh tạo cơ sở dữ liệu
create database lab03_nhapxuatsanxuat
go
----lệnh tạo sử dụng csdl
use lab03_nhapxuatsanxuat
----lệnh tạo các bảng
go 
create table hanghoa
(mahh char(5) primary key,
tenhh nvarchar(40) not null unique,
dvt nvarchar(4),
soluongton int check(soluongton >=0)
)
go 
create table doitac
(madt char(5) primary key,
tendt nvarchar(30) not null,
diachi nvarchar(30) not null,
dienthoai char(10) not null
)
go 
create table khanangcc
(madt char(5) references doitac(madt),
mahh char(5) references hanghoa(mahh),
primary key(madt,mahh),
)
go
create table hoadon
(sohd char(5) primary key,
ngaylaphd datetime,
madt char(5) references doitac(madt),
tongtg int check (tongtg >=0)
)
go
create table ct_hoadon
(sohd char(5) references hoadon(sohd),
mahh char(5) references hanghoa(mahh),
dongia int check (dongia >=0),
soluong int check (soluong >= 0)
)


----nhập dữ liệu

----BẢNG HÀNG HÓA
go
insert into hanghoa values('CPU01','CPU INTEL,CELERON 600 BOX',N'Cái', 5)
insert into hanghoa values('CPU02','CPU INTEL,PIII 700',N'Cái', 10)
insert into hanghoa values('CPU03','CPU AMD K7 ATHL,ON 600',N'Cái' ,8)
insert into hanghoa values('HDD01','HDD 10.2 GB QUANTUM',N'Cái', 10)
insert into hanghoa values('HDD02','HDD 13.6 GB SEAGATE',N'Cái', 15)
insert into hanghoa values('HDD03','HDD 20 GB QUANTUM',N'Cái', 6)
insert into hanghoa values('KB01','KB GENIUS',N'Cái', 12)
insert into hanghoa values('KB02','KB MITSUMIMI',N'Cái', 5)
insert into hanghoa values('MB01','GIGABYTE CHIPSET INTEL',N'Cái', 10)
insert into hanghoa values('MB02','ACOPR BX CHIPSET VIA',N'Cái', 10)
insert into hanghoa values('MB03','INTEL PHI CHIPSET INTEL',N'Cái', 10)
insert into hanghoa values('MB04','ECS CHIPSET SIS',N'Cái', 10)
insert into hanghoa values('MB05','ESC CHIPSET VIA',N'Cái', 10)
insert into hanghoa values('MNT01','SAMSUNG 14" SYNCMASTER',N'Cái', 5)
insert into hanghoa values('MNT02','LG 14"',N'Cái', 5)
insert into hanghoa values('MNT03','ACER 14"',N'Cái', 8)
insert into hanghoa values('MNT04','PHILIPS 14"',N'Cái', 6)
insert into hanghoa values('MNT05','VIEWSONIC 14"',N'Cái', 7)

----NHẬP DỮ LIỆU BẢNG ĐỐI TÁC
go
insert into doitac values('CC001', N'Cty TNC', N'176 BTX Q1-TPHCM', 088250259)
insert into doitac values('CC002',N'Cty Hoàng Long', N'15A TTT Q1-TP.HCM', 088250898)
insert into doitac values('CC003', N'Cty Hợp Nhất', N'152 BTX Q1-TP.HCM', 08.8252376)
insert into doitac values('K0001', N'Nguyễn Minh Hải', N'91 Nguyễn Văn Trỗi Tp.Đà Lạt', 063831129)
insert into doitac values('K0002', N'Như Quỳnh', N'21 Điện Biên Phủ. N.Trang', 058590270)
insert into doitac values('K0003', N'Trân Nhật Duật', N'Lê Lợi TP.Huế', 054848376)
insert into doitac values('K0004', N'Phan NGuyễn Hùng Anh', N'11 Nam Kỳ Khời Nghĩa-TP.Đà Lạt', 063823409)

----nhập dữ liệu bảng khả năng cung cấp
insert into khanangcc values('CC001', 'CPU01')
insert into khanangcc values('CC001', 'HDD03')
insert into khanangcc values('CC001', 'KB01')
insert into khanangcc values('CC001', 'MB02')
insert into khanangcc values('CC001', 'MB04')
insert into khanangcc values('CC001', 'MNT01')
insert into khanangcc values('CC002', 'CPU01')
insert into khanangcc values('CC002', 'CPU02')
insert into khanangcc values('CC002', 'CPU03')
insert into khanangcc values('CC002', 'KB02')
insert into khanangcc values('CC002', 'MB01')
insert into khanangcc values('CC002', 'MB05')
insert into khanangcc values('CC002', 'MNT03')
insert into khanangcc values('CC003', 'HDD01')
insert into khanangcc values('CC003', 'HDD02')
insert into khanangcc values('CC003', 'HDD03')
insert into khanangcc values('CC003', 'MB03')

----NHẬP DỮ LIỆU BẢNG HÓA ĐƠN
set dateformat dmy
go
insert into hoadon values('N0001', '25/01/2006', 'CC001', null )
insert into hoadon values('N0002', '01/05/2006', 'CC002', null )
insert into hoadon values('X0001', '15/05/2006', 'K0001', null)
insert into hoadon values('X0002', '16/06/2006', 'K0002', null)
insert into hoadon values('X0003', '20/04/2006', 'K0001', null)

----NHẬP DỮ LIỆU BẢNG HOADON_CT
insert into ct_hoadon values('N0001', 'CPU01', 63 , 10)
insert into ct_hoadon values('N0001', 'HDD03', 97, 7)
insert into ct_hoadon values('N0001', 'KB01', 3, 5)
insert into ct_hoadon values('N0001', 'MB02', 57, 5)
insert into ct_hoadon values('N0001', 'MNT01', 112, 3)
insert into ct_hoadon values('N0002', 'CPU02', 115, 3)
insert into ct_hoadon values('N0002', 'KB02', 5, 7)
insert into ct_hoadon values('N0002', 'MNT03', 111, 5)
insert into ct_hoadon values('X0001', 'CPU01', 67, 2)
insert into ct_hoadon values('X0001', 'HDD03', 100, 2)
insert into ct_hoadon values('X0001', 'KB01', 5, 2)
insert into ct_hoadon values('X0001', 'MB02', 62, 1)
insert into ct_hoadon values('X0002', 'CPU01', 67, 1)
insert into ct_hoadon values('X0002', 'KB02', 7, 3)
insert into ct_hoadon values('X0002', 'MNT01', 115, 2)
insert into ct_hoadon values('X0003', 'CPU01', 67, 1)
insert into ct_hoadon values('X0003', 'MNT03', 115, 2)

---XEM CÁC BẢNG
select * from hanghoa
select * from doitac
select * from khanangcc
select * from hoadon
select * from ct_hoadon


---truy vấn dữ liệu
----câu 1: liệt kê các mặt hàng thuộc loại đĩa cứng
select *from hanghoa
where mahh like N'HDD%'
---câu 2:liệt kê các mặt hàng có số lượng tồn trên 10
select * from hanghoa 
where soluongton > 10

-----câu 3:cho biết thông tin về các nhà cung cấp ở thành phố hồ chỉ minh
select *from doitac
where  diachi like N'%HCM'



/* câu4: liệt kê các hóa đơn nhập hàng trong tháng 5/2006, thông tin hiển thị gồm:sohd,
ngaylaphd,ten,diachi,và điện thoại nhà cung cấp;số mặt hàng
*/
select B.sohd,ngaylaphd,tendt,diachi,dienthoai,COUNT(mahh) as somathang
from doitac A, hoadon B , ct_hoadon C
where A.madt = B.madt  and B.sohd =C.sohd and B.madt like 'CC%'
   and MONTH(ngaylaphd) =5 and YEAR(ngaylaphd) = 2006
group by B.sohd,ngaylaphd,tendt,diachi,dienthoai
 --- câu 5: cho biết tên các nhà cung cấp có cung cấp đĩa cứng.
 select tendt
 from doitac A, khanangcc B
 where A.madt = B.madt and B.mahh like 'HDD%'
 -----câu 6:  cho biết tên các nhà cung cấp có thể cung cấp đĩa cứng.
 -----câu 7:cho biết tên nhà cung cấp không cung cấp đĩa cứng
 select distinct tendt
 from doitac A, khanangcc B
 where A.madt =B.madt and B.madt not in(select A.madt
 from doitac A, khanangcc B
 where A.madt = B.madt and B.mahh like 'HDD%')
 ---câu8: cho biết thông tin các mặt hàng chưa bán được
 select mahh
 from hanghoa 
 where mahh not in(select A.mahh
                   from ct_hoadon A, hanghoa B
				   where A.mahh = B.mahh 
 )
 
 










