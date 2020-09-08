------------
/* học phần: cơ sở dữ liệu
 ngày: 5/3/2020
 người thực hiện: Nguyễn Đình Phát Triển
 mssv:1822860
 lab04: quản lý đặt báo
 */
 create database lab04_qldatbao
 go
 -----lệnh sử dụng database
 use lab04_qldatbao 
 ----lệnh tạo các bảng
 go
 create table bao_tchi
 (mabaotc char(4) primary key,
 ten nvarchar(30) not null unique,
 dinhky nvarchar(20) not null,
 soluong int check(soluong > 0),
 giaban int check (giaban >0)
 )
 ------ lệnh tạo bảng phát thanh
 go
 create table phatthanh
 (mabaotc char(4) references bao_tchi(mabaotc),
 sobaotc int,
 ngayph datetime,
 primary key(mabaotc,sobaotc)
 )
 ------lệnh tạo bảng khách hàng
 go 
 create table khachhang
 (makh char(4) primary key,
 tenkh char(30) not null unique,
 diachi char(50) not null
 )
 -----tạo bảng đặt báo
 go
 create table datbao
 (makh char(4) references khachhang(makh),
 mabaotc char(4) references bao_tchi(mabaotc),
 slmua int check(slmua >0),
 ngaydm datetime,
 primary key (makh,mabaotc)
 )
 ------xem dữ liệu các bảng
 select* from bao_tchi
 select* from phatthanh
 select* from khachhang
 select* from datbao

 ---------các thủ tục thêm dữ liệu-------
 create proc usp_insert_baotchi
 @mabaotc char(4), @ten nvarchar(30), @dinhky nvarchar(20), @sl int , @giaban int
 AS
 if exists(select * from bao_tchi where @mabaotc = mabaotc) --------kiểm tra có trùng khóa chính(mabaotc)
 print N'Đã có mã báo'+ @mabaotc + N'trong cơ sở dữ liệu!'
 else
    begin 
     insert into bao_tchi values(@mabaotc, @ten, @dinhky, @sl, @ giaban)
     print N'thêm báo thành công.'
	end
go
------gọi thực hiên thủ tục usp_insert_baotchi
exec usp_insert_baotchi 'TT01', N'Tuổi trẻ', N'Nhật báo', 1000, 1500
exec usp_insert_baotchi 'KT01', N'Kiến thức hằng ngày', N'Bán nguyệt san', 3000, 6000
exec usp_insert_baotchi 'TN01', N'Thanh niên', N'Nhật báo', 1000, 2000
exec usp_insert_baotchi 'PN01', N'Phụ nữ', N'Tuần Báo', 2000, 4000  
exec usp_insert_baotchi 'PN02', N'Phụ nữ', N'Nhật báo', 1000,2000 
-----xem bảng báo chí
select * from bao_tchi
-------------------
create proc usp_insert_phathanh
@mabaotc char(4), @sobaotc int, @ngayph    datetime
AS
if exists(select * from bao_tchi where @mabaotc = mabaotc)-----kiểm tra ràng buộc khóa ngoại
begin
if exists(select * from phathanh where @sobaotc = sobaotc)
 print N'Đã có số báo'+@mabaotc+' '+@sobaotc+N'trong cơ sở dữ liệu'
else
   begin
   insert into phathanh values(@mabaotc, @sobaotc, ngayph)
   print N'thêm phát hành thành công.'
   end
end
else 
 print N'vi phạm ràng buộc khóa ngoại: không tồn tại mã báo tập chí'+@mabaotc+ 'trong cơ sở dữ liệu.'
go
-----------------
--gọi thực hiện thủ tục usp_insert_phathanh
set dateformat dmy
go
exec usp_insert_phathanh 'TT01', 123, '15/12/2005'
exec usp_insert_phathanh 'KT02', 70, '15/12/2005'
exec usp_insert_phathanh 'TT01', 124, '16/12/2005'
exec usp_insert_phathanh 'TN01', 256, '17/12/2005'
exec usp_insert_phathanh 'PN01', 45, '23/12/2005'
exec usp_insert_phathanh 'PN02', 11, '18/12/2005'
exec usp_insert_phathanh 'PN02', 112, '19/12/2005'
exec usp_insert_phathanh 'TT01', 125, '17/12/2005'
exec usp_insert_phathanh 'PN01', 46, '30/12/2005'
---xem bảng phát hành
select * from phathanh
------
create proc usp_insert_khachhang
@makh char(4), @tenkh char(30), diachi char(50)
AS
if exists(select * from khachhang where @makh =makh)
 print N'đã có khách hàng'+@makh +N'trong cơ sở dữ liệu.'
else
begin
 insert into khachhang values(@makh, @tenkh, @diachi)
 print N'thêm khách hàng thành công.'
end
go
----gọi thưc hiện thủ tục usp_insert_khachhang
exec usp_insert_khachhang 'KH01', N'Lan', N'2 NDT'
exec usp_insert_khachhang 'KH02', N'Nam', N'32 THĐ'
exec usp_insert_khachhang 'KH03', N'Ngọc', N'16 LHP'
-----xem  bảng khách hàng
select * from khachhang

-------
create usp_insert_datbao
@makh char(4), mabaotc char(4), slmua int, ngaydm     datetime
AS
if exists(select * from bao_tchi where @mabaotc = mabaotc) and  exists(select * from makh where @makh = makh) 
begin
 if exists(select * from datbao where @makh = makh and @mabaotc = mabaotc)
  print N'Đã tồn có thông tin đặt báo'+ @makh+', '+ @mabaotc +'trong cơ sở dữ liệu.'
 else 
  insert into datbao values(@makh, @mabaotc, @slmua, @ngaydm)
  print N'Đặt báo thành công.'
end
else
if not exists(select * from bao_tch where @mabaotc = mabaotc)
   print N'khống có báo, tạp chi'+ @mabaotc + 'trong cơ sở dữ liệu.'
   else 
    print N'không có khách hàng'+ @makh + N'trong cơ sở dữ liệu.'
go

-----gọi thực hiện thủ tục
set dateformat dmy
go
exec usp_insert_datbao 'KH01', 'TT01', 100, '12/01/2000'
exec usp_insert_datbao 'KH02', 'TN01', 150, '01/05/2001'
exec usp_insert_datbao 'KH01', 'PN02', 200, '25/06/2001'
exec usp_insert_datbao 'KH03', 'KT01', 50, '17/03/2002'
exec usp_insert_datbao 'KH03', 'KT01', 200, '26/08/2003'
exec usp_insert_datbao 'KH02', 'TT01', 250, '15/01/2004'
exec usp_insert_datbao 'Kh01', 'KT01', 300, '14/10/2004'

select * from datbao
----------------------------------------------------------------------------------------------
--II.TRUY VẤN DỮ LIỆU:
--1)	Cho biết các tờ báo, tạp chí (MABAOTC, TEN, GIABAN) có định kỳ phát hành hàng tuần (Tuần báo).
--2)	Cho biết thông tin về các tờ báo thuộc loại báo phụ nữ (mã báo tạp chí bắt đầu bằng PN).
--3)	Cho biết tên các khách hàng có đặt mua báo phụ nữ (mã báo tạp chí bắt đầu bằng PN), không liệt kê khách hàng trùng.
--4)	Cho biết tên các khách hàng có đặt mua tất cả các báo phụ nữ (mã báo tạp chí bắt đầu bằng PN).
--5)	Cho biết các khách hàng không đặt mua báo thanh niên.
--6)	Cho biết số tờ báo mà mỗi khách hàng đã đặt mua.
--7)	Cho biết số khách hàng đặt mua báo trong năm 2004.
--8)	Cho biết thông tin đặt mua báo của các khách hàng (TenKH, TeN, DinhKy, SLMua, SoTien), trong đó SoTien = SLMua  DonGia. 
--9)	Cho biết các tờ báo, tạp chí (Ten, DinhKy) và tổng số lượng đặt mua của các khách hàng đối với tờ báo, tạp chí đó.
--10)	Cho biết tên các tờ báo dành cho học sinh, sinh viên (mã báo tạp chí bắt đầu bằng HS).
--11)	Cho biết những tờ báo không có người đặt mua.
--12)	Cho biết tên, định kỳ của những tờ báo có nhiều người đặt mua nhất.
--13)	Cho biết khách hàng đặt mua nhiều báo, tạp chí nhất.
--14)	Cho biết các tờ báo phát hành định kỳ một tháng 2 lần.
--15)	Cho biết các tờ báo, tạp chí có từ 3 khách hàng đặt mua trở lên.

------------------------------------------------------------------------------------------------
