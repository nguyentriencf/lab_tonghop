/*Học phần: Cơ sở dữ liệu
Giảng viên: Tạ Thị Thu Phượng
Ngày: 18/05/2020
Người thực hiện: NGUYỄN ĐÌNH PHÁT TRIỂN
MSSV: 1812860*/

create database lab08_quanlysinhvien
go
use lab08_quanlysinhvien
go
----
create table Khoa
(MSKhoa nchar(2) primary key,
TenKhoa nvarchar(30) not null unique,
TenTat nchar(4) not null unique)
go
----------
create table Lop
(MSLop nchar(4) primary key,
TenLop nvarchar(30) not null unique,
MSKhoa nchar(2) references khoa(MSKhoa),
NienKhoa nchar(4) not null)
go
------
create table Tinh
(MSTinh nchar(2) primary key,
TenTinh nvarchar(20) not null unique)
go
-----------
create table SinhVien
(MSSV nchar(7) primary key,
Ho nvarchar(20) not null,
Ten nchar(10) not null,
NgaySinh date not null,
MSTinh nchar(2) references Tinh(MSTinh),
NgayNhapHoc date not null,
MSLop nchar(4) references Lop(MSLop),
Phai nchar(3) not null,
DiaChi nvarchar(30) not null,
DienThoai nchar(10)
)
go
-----------------------
create table MonHoc
(MSMH nchar(4) primary key,
TenMH nvarchar(30) not null,
HeSo tinyint not null)
go
-----------------------

create table BangDiem
(MSSV nchar(7)  references SinhVien(MSSV),
MSMH nchar(4)  references MonHoc(MSMH),
LanThi tinyint not null,
Diem float not null,
primary key (MSSV, MSMH, LanThi))
go


----thêm các thủ tục
create proc usp_insert_Khoa
@MSKhoa nchar(2),
@TenKhoa nvarchar(30),
@TenTat nchar(4) 
as
if exists(select * from Khoa where MSKhoa =@MSKhoa)
  print N'đã có'+ @MSkhoa +'trong csdl'
  else
    begin
	  insert into Khoa values(@MSKhoa, @TenKhoa, @TenTat)
	  print N'insert complex'
end
------ goi thu tuc

 exec usp_insert_Khoa '01',N'Cong Nghe Thong Tin', 'CNTT'
exec usp_insert_Khoa '02', N'Điện tử viễn thông', 'DTVT'
exec usp_insert_Khoa '03', N'Quản trị kinh doanh', 'QTKD'
exec usp_insert_Khoa '04', N'Công nghệ sinh học', 'CNSH'
select * from Khoa
---
create proc usp_insert_lop
@MSLop nchar(4),
@TenLop nvarchar(30),
@MSKhoa nchar(2) ,
@NienKhoa nchar(4)
as
 if exists(select * from Khoa where MSKhoa =@MSKhoa ) ---- check forgen key
  begin
  if exists (select * from Lop where MSLop =@MSLop)
  print N'da co'+ @MSLop +'trong csdl'
  else
  insert into Lop values (@MSLop, @TenLop, @MSKhoa, @NienKhoa)
  print 'insert complex'
  end
else
  if not exists(select * from Khoa where MSKhoa = @MSKhoa) --- vi pham khoa ngoai
  print 'khong ton tai'+ @MSKhoa + 'trong Csdl nen khong the them lop'
go
 ------ goi thu tuc 
 
 exec usp_insert_lop '98TH', N'Tin hoc khoa 1998', '01', '1998'
 exec usp_insert_lop '98VT', N'Vien thong khoa 1998', '02', '1998'
 exec usp_insert_lop '99TH', N'Tin hoc khoa 1999', '01', '1999'
 exec usp_insert_lop '99VT', N'Vien thong khoa 1999','02', '1999'
 exec usp_insert_lop '99QT', N'Quan trin kinh doanh 1999', '03', '1999'
 select * from Lop

 create proc usp_insert_Tinh
 @MSTinh nchar(2) ,
 @TenTinh nvarchar(20) 
as
 if exists (select *from Tinh where MSTinh = @MSTinh)
 print N'da ton tai'+ @MSTinh +'trong csdl'
 else
  begin
  insert into Tinh values (@MSTinh, @TenTinh)
  print 'da them tinh thanh cong'
  end
go
 
 ---- goi thu tuc 
 exec usp_insert_Tinh '01', N'An Giang'
 exec usp_insert_Tinh '02', N'TPHCM'
 exec usp_insert_Tinh '03', N'Dong Nai'
 exec usp_insert_Tinh '04', N'Long An'
 exec usp_insert_Tinh '05', N'Hue'
 exec usp_insert_Tinh '06', N'Ca Mua'
 select * from tinh
 
 create proc usp_insert_sinhvien
@MSSV nchar(7),
@Ho nvarchar(20) ,
@Ten nchar(10),
@NgaySinh date ,
@MSTinh nchar(2),
@NgayNhapHoc date ,
@MSLop nchar(4),
@Phai nchar(3) ,
@DiaChi nvarchar(30),
@DienThoai nchar(10)
as
if exists(select * from Tinh where MSTinh =@MSTinh) and exists(select * from Lop where MSLop =@MSLop) ---kiem tra khoa ngoai
  begin
   if exists (select * from SinhVien where MSSV =@MSSV)--- kiem tra khoa chinh
   print N'da ton tai'+ @MSSV +'trong csdl'
   else
    begin 
	  insert into SinhVien values (@MSSV, @Ho, @Ten, @NgaySinh, @MSTinh, @NgayNhapHoc, @MSLop, @Phai, @DiaChi, @DienThoai)
	  print 'them thanh cong'
    end
  end
else 
   if not exists (select * from Tinh where MSTinh = @MSTinh)
    print 'khong ton tai'+ @MSTinh + 'trong csdl'
else
   if not exists (select * from Lop where MSLop = @MSLop)
    print 'khong ton tai'+  @MSLop + 'trong csdl'
go
----- goi thu tuc 
set dateformat dmy
exec usp_insert_sinhvien '98TH001', N'Nguyen Van', N'An', '06/08/80', '01', '03/09/98', '98TH', 'yes', '12 Tran Hung Dao, Q.1', '8234512' 
exec usp_insert_sinhvien '98TH002', N'Le Thi', N'An', '17/10/79', '01', '03/09/98', '98TH', 'No', '23 CMT8, Q. Tan Binh', '0303234342' 
exec usp_insert_sinhvien '98VT001', 'Nguyen Duc', 'Binh', '25/11/81', '02', '03/09/98', '98VT', 'Yes', '245 Lac Long Quan, Q.11', '8654323' 
exec usp_insert_sinhvien '98VT002', 'Tran Ngoc', 'Anh', '19/08/80', '02', '03/09/98', '98VT', 'No', '242 Tran Hung Dao, Q.1',null
exec usp_insert_sinhvien '99TH001', 'Ly Van Hung', 'Dung', '27/09/81', '03', '05/10/99', '99TH', 'Yes', '178 CMT8, Q. Tan Binh', '7563213'
exec usp_insert_sinhvien '99TH002', 'Van Minh', 'Hoang', '01/01/81', '04', '05/10/99', '99TH', 'Yes', '272 Ly Thuong Kiet, Q.10', '8341234'
exec usp_insert_sinhvien '99TH003', 'Nguyen', 'Tuan', '12/01/80', '03', '05/10/99', '99TH', 'Yes', '162 Tran Hung Dao, Q.5',null
exec usp_insert_sinhvien '99TH004', 'Tran Van', 'Minh', '25/06/81', '04', '05/10/99', '99TH', 'Yes', '147 Dien Bien Phu, Q.3', '7236754'
exec usp_insert_sinhvien '99TH005', 'Nguyen Thai', 'Minh', '01/01/80', '04', '05/10/99', '99TH', 'Yes', '345 Le Dai Hanh, Q.11',null
exec usp_insert_sinhvien '99VT001', 'Le Ngoc', 'Mai', '21/06/82', '01', '05/10/99', '99VT', 'No', '129 Tran Hung Dao, Q.1', '0903124534'
exec usp_insert_sinhvien '99QT001', 'Nguyen Thi', 'Oanh', '19/08/73', '04', '05/10/99', '99QT', 'No', '76 Hung Vuong, Q.5', '0901656324'
exec usp_insert_sinhvien '99QT002', 'Le My', 'Hanh', '20/05/76', '04', '05/10/99', '99QT', 'No', '12 Pham Ngoc Thach, Q.3',null

select * from SinhVien

create proc usp_insert_MonHoc
@MSMH nchar(4),
@TenMH nvarchar(30) ,
@HeSo tinyint 
as
if exists (select * from MonHoc where MSMH =@MSMH)
print 'da co'+ @MSMH +'ton tai trong csdl'
else
 begin
  insert into MonHoc values(@MSMH, @TenMH, @HeSo)
  print 'them thanh cong'
 end
go
---them thu tuc
exec usp_insert_MonHoc 'TA01', N'Nhap mon tin hoc', 2
exec usp_insert_MonHoc 'TA02', N'Lap trinh co ban', 3
exec usp_insert_MonHoc 'TB01', N'cau truc du lieu', 2
exec usp_insert_MonHoc 'TB02', N'co so du lieu', 2 
exec usp_insert_MonHoc 'QA01', N'Kinh te vi mo',2
exec usp_insert_MonHoc 'QA02', N'Quan tri chat luong', 3
exec usp_insert_MonHoc 'VA01', N'Dien tu co ban', 2
exec usp_insert_MonHoc 'VA02', N'Mach so', 3
exec usp_insert_MonHoc 'VB01', N'Truyen so lieu', 3
exec usp_insert_MonHoc 'XA01', N'Vat ly dai cuong', 2 
 select * from MonHoc

 create proc usp_insert_diem
@MSSV nchar(7),
@MSMH nchar(4) ,
@LanThi tinyint ,
@Diem float 
as
if exists (select *from SinhVien where MSSV = @MSSV) and exists (select *from MonHoc where MSMH = @MSMH)  --kiem tra khoa ngoai
 begin
 if exists (select *from BangDiem where LanThi =@LanThi and MSSV = @MSSV and MSMH = @MSMH)
 print 'da co'+ @LanThi +'trong csdl'
 else 
 begin
 insert into BangDiem values (@MSSV ,@MSMH  ,@LanThi ,@Diem)
 print 'them thanh cong'
 end
end
else 
if not exists (select * from SinhVien where MSSV = @MSSV)
print 'khong ton tai'+ @MSSV
if not exists (select * from MonHoc where MSMH = @MSMH)
print 'khong ton tai'+ @MSMH
go 

----- them thu tuc
exec usp_insert_diem '98TH001', 'TA01', 1, 8.5
exec usp_insert_diem '98TH001', 'TA02', 1, 8
exec usp_insert_diem '98TH002', 'TA01', 1, 4
exec usp_insert_diem '98TH002', 'TA01', 2, 5.5
exec usp_insert_diem '98TH001', 'TB01', 1, 7.5
exec usp_insert_diem '98TH002', 'TB01', 1, 8
exec usp_insert_diem '98VT001', 'VA01', 1, 4
exec usp_insert_diem '98VT001', 'VA01', 2, 5
exec usp_insert_diem '98VT002', 'VA02', 1, 7.5
exec usp_insert_diem '99TH001', 'TA01', 1, 4
exec usp_insert_diem '99TH001', 'TA01', 2, 6
exec usp_insert_diem '99TH001', 'TB01', 1, 6.5
exec usp_insert_diem '99TH002', 'TB01', 1, 10
exec usp_insert_diem '99TH002', 'TB02', 1, 9
exec usp_insert_diem '99TH003', 'TA02', 1, 7.5
exec usp_insert_diem '99TH003', 'TB01', 1, 3
exec usp_insert_diem '99TH003', 'TB01', 2, 6
exec usp_insert_diem '99TH003', 'TB02', 1, 8
exec usp_insert_diem '99TH004', 'TB02', 1, 2
exec usp_insert_diem '99TH004', 'TB02', 2, 4
exec usp_insert_diem '99TH004', 'TB02' ,3, 3
exec usp_insert_diem '99QT001', 'QA01', 1, 7
exec usp_insert_diem '99QT001', 'QA02', 1, 6.5
exec usp_insert_diem '99QT002', 'QA01', 1, 8.5
exec usp_insert_diem '99QT002', 'QA02', 1, 9
 select * from BangDiem

 -----truy vấn dữ liệu
 --1) Liệt kê MSSV, Họ, Tên, Địa chỉ của tất cả các sinh viên
 select MSSV, Ho, Ten, Diachi
 from SinhVien

 --2) Liệt kê MSSV, Họ, Tên, MS Tỉnh của tất cả các sinh viên. Sắp xếp kết quả theo MS
--tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên.
select MSSV, Ho, Ten, MSTinh
from SinhVien
order by MSTinh,Ten

--3) Liệt kê các sinh viên nữ của tỉnh Long An
select *
from SinhVien where Phai = 'No' and MSTinh ='04'

--4) Liệt kê các sinh viên có sinh nhật trong tháng giêng.
select *
from SinhVien where MONTH(NgaySinh) = '1'
--5) Liệt kê các sinh viên có sinh nhật nhằm ngày 1/1.
select *
from SinhVien where MONTH(NgaySinh) ='1'and DAY(NgaySinh) = '1'
--6) Liệt kê các sinh viên có số điện thoại.
select *
from SinhVien where DienThoai != 'null'

---8) Liệt kê các sinh viên tên ‘Minh’ học lớp ’99TH’
select *
from SinhVien where Ten = 'Minh' and MSLop like '99TH'

--9) Liệt kê các sinh viên có địa chỉ ở đường ‘Tran Hung Dao’
select *
from SinhVien where DiaChi like '%Tran Hung Dao%'

--10) Liệt kê các sinh viên có tên lót chữ ‘Van’ (không liệt kê người họ ‘Van’)
select *
from SinhVien where Ho like '%Van'
--11) Liệt kê MSSV, Họ Ten (ghép họ và tên thành một cột), Tuổi của các sinh viên 
--ở tỉnh Long An.
select MSSV, Ho+ ' '+ Ten as HovaTen, YEAR (GETDATE()) - YEAR(NgaySinh) as Tuoi  
from SinhVien where MSTinh ='04'

--12) Liệt kê các sinh viên nam từ 23 đến 28 tuổi.
select *
from SinhVien where Phai ='Yes' and YEAR(GETDATE()) - YEAR(NgaySinh) >=23 and YEAR(GETDATE()) - YEAR(NgaySinh) <= 28

--13) Liệt kê các sinh viên nam từ 32 tuổi trở lên và các sinh viên nữ từ 27 tuổi trở lên.
 select *
 from SinhVien 
 where Phai = 'Yes' and YEAR(GETDATE()) - YEAR(NgaySinh) >=32 and in (select *
                                                                     from SinhVien 
																     where Phai = 'No' and YEAR(GETDATE()) - YEAR(NgaySinh) <= 27)          )

 --14) Liệt kê các sinh viên khi nhập học còn dưới 18 tuổi, hoặc đã trên 25 tuổi.
 select *
 from SinhVien 
 where YEAR(NgayNhapHoc) - YEAR(NgaySinh) <= 18 or YEAR(NgayNhapHoc) - YEAR(NgaySinh) >= 25
                                                                                
--15) Liệt kê danh sách các sinh viên của khóa 99 (MSSV có 2 ký tự đầu là ‘99’).
select *
from SinhVien where MSSV like '99%'
--16) Liệt kê MSSV, Điểm thi lần 1 môn ‘Co so du lieu’ của lớp ’99TH’
 select MSSV, Diem
 from BangDiem 
 where MSMH ='TB02' and LanThi = 1
 --17) Liệt kê MSSV, Họ tên của các sinh viên lớp ’99TH’ thi không đạt lần 
 --1 môn ‘Co so du lieu’
  select a.MSSV, Ho+' '+ Ten as HOvaTen
 from BangDiem a, SinhVien b
 where a.MSSV =b.MSSV and MSMH ='TB02' and LanThi = 2 and MSLop ='99TH' 
 
 --18) Liệt kê tất cả các điểm thi của sinh viên có mã số ’99TH001’ theo mẫu sau:
 select A.MSSV, TenMH, LanThi, Diem
 from BangDiem A, MonHoc B
 where A.MSMH = B.MSMH and A.MSSV ='99TH001'
 
 
 --19) Liệt kê MSSV, họ tên, MSLop của các sinh viên có điểm thi lần 1 môn
 --‘Co so du lieu’ từ 8 điểm trở lên
 select A.MSSV, Ho+' '+Ten as HovaTen, MSLop, Diem
 from SinhVien A, BangDiem B
 where A.MSSV = B.MSSV and MSMH ='TB02' and LanThi = 1

 --20) Liệt kê các tỉnh không có sinh viên theo học
 select MSTinh
 from  Tinh 
 where MSTinh not in (select A.MSTinh
                      from Tinh A, SinhVien B
				      where A.MSTinh = B.MSTinh)
                                        
--21) Liệt kê các sinh viên hiện chưa có điểm môn thi nào.
select *
from SinhVien
where MSSV not in (select A.MSSV
                   from SinhVien A, BangDiem B
				   where A.MSSV =B.MSSV)


-- truy vân gom nhóm
--22) Thống kê số lượng sinh viên ở mỗi lớp theo mẫu sau: MSLop, TenLop, SoLuongSV
select A.MSLop, TenLop, COUNT(MSSV) as "số lượng sinh viên"
from SinhVien A, Lop B
where  A.MSLop = B.MSLop
Group by A.MSLop, TenLop


--23) Thống kê số lượng sinh viên ở mỗi tỉnh theo mẫu sau
select A.MSTinh, TenTinh, COUNT(MSSV) as "số lươngh sinh viên nam"
from Tinh A, SinhVien B
where A.MSTinh = B.MSTinh and Phai ='Yes' and B.Phai in(select COUNT(D.MSSV) 
                                                      from Tinh C, SinhVien D 
													   where C.MSTinh = D.MSTinh and D.Phai ='No'
													   group by C.MSTinh, C.TenTinh)
group by A.MSTinh,TenTinh, Phai


 

