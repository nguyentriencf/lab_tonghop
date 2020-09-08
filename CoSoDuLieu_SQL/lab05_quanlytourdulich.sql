/*học phần: cơ sở dữ liệu
  ngày: 5/7/2020
  người thực hiện: Nguyễn Đình Phát Triển
  mssv:1822860
  lab04: quản lý đặt báo
*/
--- lênh tạo database
create database lab05_quanlytourdulich
go
----lệnh dùng cơ sở dữ liệu
use lab05_quanlytourdulich
----- lệnh tạo bảng
 ---tạo bảng tour
 go
 create table tour
 ( matour char(4)  primary key,
 tongsongay int check (tongsongay >0)
 )
 ------lệnh tạo bảng thành phố
 go
 create table thanhpho
 (matp char(2) primary key,
 tentp nvarchar(20) not null,
 )
 go
 create table tour_tp
 (matour char(4) references tour(matour),
 matp char(2) references thanhpho(matp),
 songay int check (songay >0),
 primary key(matour,matp)
 )
 go
 create table lich_tourdl
 (matour char(4) references tour(matour),
 ngaykh datetime,
 tenhdv char(30),
 songuoi int check (songuoi >0),
 tenkh nvarchar(40) not null,
 primary key(matour,ngaykh)
 )


 ----------thêm dữ liệu vào bảng----------
  ------ nhập dữ liệu bảng tour
  insert into tour values ('T001', 3)
  insert into tour values ('T002', 4)
  insert into tour values ('T003', 5)  
  insert into tour values ('T004', 7)  
   ------ nhập dũ liện bảng thànnh phố
  insert into thanhpho values ('01', N'Đà Lạt')
  insert into thanhpho values ('02', N'Nha Trang')
  insert into thanhpho values ('03', N'Phan Thiết')
  insert into thanhpho values ('04', N'Huế')
  insert into thanhpho values ('05', N'Đà Nẵng')
  
  ------- nhập dữ liệu bảng tour_tp
  insert into tour_tp values ('T001', '01', 2)
  insert into tour_tp values ('T001', '03', 1)
  insert into tour_tp values ('T002', '01', 2)
  insert into tour_tp values ('T002', '02', 2)
  insert into tour_tp values ('T003', '02', 2)
  insert into tour_tp values ('T003', '01', 1)
  insert into tour_tp values ('T003', '04', 2)
  insert into tour_tp values ('T004', '02', 2)
  insert into tour_tp values ('T004', '05', 2)
  insert into tour_tp values ('T004', '04', 3)

  -----nhập dữ liệu bảng tour_lịch
  set dateformat dmy
  go
  insert into lich_tourdl values ('T001', '14/02/2017', N'Vân', 20, N'Nguyễn Hoàng')
  insert into lich_tourdl values ('T002', '14/02/2017', N'Nam' , 30, N'Lê Ngọc')
  insert into lich_tourdl values ('T002', '06/03/2017', N'Hùng', 20, N'Lý Dũng')
  insert into lich_tourdl values ('T003', '18/02/2017',N'Dũng', 20, N'Lý Dũng')
  insert into lich_tourdl values ('T004', '18/02/2017', N'Hùng', 30, N'Dũng Nam')
  insert into lich_tourdl values ('T003', '10/03/2017', N'Nam', 45, N'Nguyễn An')
  insert into lich_tourdl values ('T002', '28/04/2017', N'Vân', 25, N'Ngọc Dung')
  insert into lich_tourdl values ('T004', '29/04/2017', N'Dũng', 35, N'Lê Ngọc')
  insert into lich_tourdl values ('T001', '30/04/2017', N'Nam', 25, N'Trần Nam')
  insert into lich_tourdl values ('T003', '15/06/2017', N'Vân', 20, N'Trịnh Bá')


  ----xem các bảng
  select * from tour
  select * from thanhpho
  select * from tour_tp
  select * from lich_tourdl

  delete  from lich_tourdl
  delete from tour_tp
  delete from thanhpho
  delete from tour
  ------thêm các thủ tục
create proc usp_insert_tour
@matour char(4), @tsn int
as
if exists(select * from tour where @matour =matour )
print N'đã có mã tour' + @matour + N'trong csdl'
else
 begin
  insert into tour values(@matour,@tsn)
  print N'đã thêm tour thành công'
 end
go
-----xem bảng tour
select * from tour
----gọi thực hiện thủ tục usp_insert_tour
exec usp_insert_tour 'T001', 3
exec usp_insert_tour 'T002', 4
exec usp_insert_tour 'T003', 5
exec usp_insert_tour 'T004', 7

create proc usp_insert_thanhpho
@matp char(2), @tentp nvarchar(20)
as
if exists(select * from thanhpho where @matp =matp)
print N'đã có mã thành phố'+ @matp +N'tồn tại trong csdl'
else
 begin
 insert into thanhpho values(@matp, @tentp)
 print N'thêm thành phố thành công'
 end
go
 
----gọi thực hiện thủ tục usp_insert_thanhpho
exec usp_insert_thanhpho '01', N'Đà Lạt'
exec usp_insert_thanhpho '02', N'Nha Trang'
exec usp_insert_thanhpho '03', N'Phan Thiết'
exec usp_insert_thanhpho '04', N'Huế'
exec usp_insert_thanhpho '05', N'Đà Nẵng'

select * from thanhpho

-----
create proc usp_insert_tourtp
@matour char(4) , @matp char(2), @songay int
as
if exists(select * from tour where @matour = matour )
begin
 if exists(select * from thanhpho where @matp = matp)
 print N'đã có mã tour_thanhpho '+ @matour + ' ' +@matp + N'trong csdl'
 else
 begin
  insert into tour_tp values(@matour,@matp,@songay)
  print N'đã thêm tour_thanhpho thành công'
 end
end
else print N'vi phạm ràng buộc khóa ngoại:không tồn tại mã toủr' + @matour + N'trong csdl'
go

----gọi thực hiện thủ tục usp_insert_tourtp
exec usp_insert_tourtp
exec usp_insert_tourtp
exec usp_insert_tourtp
exec usp_insert_tourtp













