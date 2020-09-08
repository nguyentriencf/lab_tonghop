-----------------------------
/*cơ sở dữ liệu.
 ngày 27/6/2020
 quản lý quán coffee
*/
------------------------
--cài đăt cơ sở dữ liệu quán
-- các bảng cần sử dụng
/*
  drink
  bàn
  loại nước
  tài khoản đăng nhập
  hóa đơn
  chi tiết hóa đơn
*/
create database QuanLyQuanCoffee
go
use QuanLyQuanCoffee

CREATE TABLE BAN
(MABAN char(4) primary key DEFAULT N'CHƯA ĐẶT TÊN',
TENBAN NVARCHAR(100) NOT NULL,
TRANGTHAI NVARCHAR(100) NOT NULL DEFAULT N'TRỐNG' -- TRỐNG || CÓ NGƯỜI
)
GO

------------------------------------------------
CREATE TABLE TAIKHOAN
( TENHIENTHI NVARCHAR(100) PRIMARY KEY,
TENDANGNHAP NVARCHAR(100) NOT NULL DEFAULT N'TRIEN',
MATKHAU NVARCHAR(1000) NOT NULL DEFAULT 0,
LOAITK INT NOT NULL DEFAULT 0 -- 1: TÊN ADMIN VÀ 0: TÊN NHÂN VIÊN
)
GO
------------------------------------------------
CREATE TABLE  LOAINUOC
(MALOAI CHAR(4) PRIMARY KEY,
TENLOAI NVARCHAR(100) NOT NULL,
)
GO
------------------------------------------------
CREATE TABLE NUOC
(MANUOC CHAR(4) PRIMARY KEY,
TENNUOC NVARCHAR(100) NOT NULL ,
GIA FLOAT NOT NULL,
MALOAI CHAR(4) references LOAINUOC(MALOAI) NOT NULL,

)
go
------------------------------------------------
CREATE TABLE HOADON
( MAHD CHAR(4) PRIMARY KEY,
 GIOVAO DATETIME NOT NULL default GETDATE(),
 GIORA DATETIME ,
 TINHTRANG INT NOT NULL DEFAULT 0, -- 1: ĐÃ THANH TOÁN, 0: CHƯA THANH TOÁN
 MABAN CHAR(4) REFERENCES BAN (MABAN) NOT NULL ,
)
GO 
------------------------------------------------
CREATE TABLE CT_HOADON
(
 MAHD CHAR(4) REFERENCES HOADON(MAHD) NOT NULL,
 MANUOC CHAR(4) REFERENCES NUOC(MANUOC) NOT NULL,
 SOLUONG INT NOT NULL DEFAULT 0,
 PRIMARY KEY(MAHD,MANUOC)
)
go

--drop table CT_HOADON
--drop table HOADON
select * from HOADON
-------- xây dựng hàm và thủ tục----
-------- bàn--------
create proc usp_them_ban
@MABAN char(4) ,
@TENBAN NVARCHAR(100)

as
 if exists(select * from BAN where MABAN =@MABAN)
 print N'đã có '+ @MABAN+ N'trong csdl'
 else
   begin
    insert  dbo.BAN (MABAN,TENBAN) values (@MABAN,@TENBAN)
	print N'thêm bàn thành công'
   end
go


--thêm cở dữ liệu
exec usp_them_ban 'TN01',N'Bàn 1'
exec usp_them_ban 'TN02',N'Bàn 2'
exec usp_them_ban 'TN03',N'Bàn 3'
exec usp_them_ban 'TN04',N'Bàn 4'
exec usp_them_ban 'TN05',N'Bàn 5'
exec usp_them_ban 'TN06',N'Bàn 6'
exec usp_them_ban 'TN07',N'Bàn 7'
exec usp_them_ban 'TN08',N'Bàn 8'
exec usp_them_ban 'TN09',N'Bàn 9'
exec usp_them_ban 'TN10',N'Bàn 10'
exec usp_them_ban 'NS01',N'Sân 1'
exec usp_them_ban 'NS02',N'Sân 2'
exec usp_them_ban 'NS03', N'Sân 3'
exec usp_them_ban 'NS04',N'Sân 4'
select * from BAN

---lấy danh sách bàn
create proc usp_DSBan
as
select *from dbo.BAN
go
exec dbo.usp_DSBan 
--------------------------------------------
----tài khoản-------
--thêm
create proc usp_themtaikhoan
@TENHIENTHI NVARCHAR(100),
@TENDANGNHAP NVARCHAR(100) ,
@MATKHAU NVARCHAR(1000),
@LOAITK INT 
as
  if exists(select * from TAIKHOAN where TENHIENTHI = @TENHIENTHI)
  print N'đã tên hiển thị '+@TENHIENTHI+ N'trong cơ sở dữ liệu'
  else
   begin
   insert into TAIKHOAN values(@TENHIENTHI , @TENDANGNHAP , @MATKHAU, @LOAITK)
   print N'thêm tài koản thành công'
   end
go

exec usp_themtaikhoan N'Triển','391999','1',1 
exec usp_themtaikhoan N'Hướng','191293','1',0


---lấy dữ liệu tài khoản
create proc usp_dangnhap
@TENDANGNHAP NVARCHAR(100) ,
@MATKHAU NVARCHAR(1000) 
as 
 begin
  select * from TAIKHOAN where TENDANGNHAP =@TENDANGNHAP and MATKHAU = @MATKHAU
 end
go

select * from TAIKHOAN
----------------------------------------
------loại nước
-- thêm 
create proc usp_themLoainuoc
@MALOAI CHAR(4),
@TENLOAI NVARCHAR(100)
as
 if exists(select * from LOAINUOC where MALOAI =@MALOAI)
 print N'đã có '+@MALOAI+N'trong cơ sở dữ liệu'
 else
   begin
     insert into LOAINUOC values (@MALOAI, @TENLOAI)
	 print N'đã thêm loại nước thành công'
   end
go
 
exec usp_themLoainuoc 'LN01',N'Cà Phê'
exec usp_themLoainuoc 'LN02',N'Yaourt'
exec usp_themLoainuoc 'LN03',N'Kem'
exec usp_themLoainuoc 'LN04',N'SinhTố,Nước Ép'
exec usp_themLoainuoc 'LN05',N'Nước pha chế'
exec usp_themLoainuoc 'LN06',N'Nước ngọt'
exec usp_themLoainuoc 'LN07',N'Thuôc'
select * from LOAINUOC 
---xóa

-------nước

create proc usp_them_Nuoc
@MANUOC CHAR(4),
@TENNUOC NVARCHAR(100),
@GIA FLOAT,
@MALOAI CHAR(4)
as
if exists(select * from LOAINUOC where MALOAI = @MALOAI)
 begin
  if exists(select * from NUOC where MANUOC = @MANUOC )
  print N'đã có ' + @MANUOC + N'trong cơ sở dữ liệu'
  else
   begin
     insert into NUOC values (@MANUOC, @TENNUOC, @GIA, @MALOAI)
	 print N'đã thêm  nước thành công'
   end
  end
else
 if not exists (select * from LOAINUOC where MALOAI = @MALOAI)
 print N'không có'+@MALOAI+N' trong cơ sở dữ liệu'
go

    exec usp_them_Nuoc 'CF01',	N'cà phê đen',	10000,	'LN01'
    exec usp_them_Nuoc 'CF02',	N'Cà phê sữa',	12000,	'LN01'
    exec usp_them_Nuoc 'CF03',	N'Bạc xỉu	',15000	,'LN01'
    exec usp_them_Nuoc 'CF04',	N'Cà phê hạt',	150000000,	'LN01'
    exec usp_them_Nuoc 'CF04',	N'Sữa Tươi	',15000,	'LN01'
    exec usp_them_Nuoc 'YY01',	N'Yaourt',	8000,	'LN02'
    exec usp_them_Nuoc 'YY02',	N'Yaourt đá	',15000,	'LN02'
    exec usp_them_Nuoc 'YY03',	N'Yaourt đào'	,18000	,'LN02'
    exec usp_them_Nuoc 'YY04',	N'Yaourt dâu '	,18000	,'LN02'
    exec usp_them_Nuoc 'YY05',	N'Yaourt nha đam',18000	,'LN02'
    exec usp_them_Nuoc 'YY06',	N'Yaourt việt quất' ,18000,	'LN02'
    exec usp_them_Nuoc 'KK01',	N'Kem dâu',	20000,	'LN03'
    exec usp_them_Nuoc 'KK02',	N'Kem dừa',	20000,	'LN03'
    exec usp_them_Nuoc 'KK03',	N'Kem sầu riêng	',20000,	'LN03'
    exec usp_them_Nuoc 'KK04',	N'Kem socola	',20000,	'LN03'
    exec usp_them_Nuoc 'ST01',	N'Sinh tố dâu	',20000,	'LN04'
    exec usp_them_Nuoc 'ST02',	N'Sinh tố xoài	',20000,	'LN04'
    exec usp_them_Nuoc 'ST03',	N'Sinh tố bơ	',20000,	'LN04'
    exec usp_them_Nuoc 'ST04',	N'Sinh tố đu đủ	',20000,	'LN04'
    exec usp_them_Nuoc 'ST05',	N'Nước ép cam	',20000,	'LN04'
    exec usp_them_Nuoc 'ST06',	N'Nước ép chanh	',15000,	'LN04'
    exec usp_them_Nuoc 'PC01',	N'Soda chanh	',15000,	'LN05'
    exec usp_them_Nuoc 'PC02',	N'Soda đào',	18000	,'LN05'
    exec usp_them_Nuoc 'PC03',	N'Soda việt quất	',18000,	'LN05'
    exec usp_them_Nuoc 'PC04',	N'Soda blue	',18000,	'LN05'
    exec usp_them_Nuoc 'PC05',	N'Trà đào 	',18000,	'LN05'
    exec usp_them_Nuoc 'PC06',	N'Trà gừng mật ông'	,15000	,'LN05'
    exec usp_them_Nuoc 'PC07',	N'Tắc xí muội'	,15000,	'LN05'
    exec usp_them_Nuoc 'NN01',	N'Nước suối',	8000,	'LN06'
    exec usp_them_Nuoc 'NN01',	N'Bò húc	',16000,	'LN06'
    exec usp_them_Nuoc 'NN02',	N'Dr.thanh	',15000,	'LN06'
    exec usp_them_Nuoc 'NN03',	N'Nutri'	,12000,	'LN06'
    exec usp_them_Nuoc 'NN04',	N'Numberone'	,12000	,'LN06'
    exec usp_them_Nuoc 'NN05',	N'Trà xanh'	,12000	,'LN06'
    exec usp_them_Nuoc 'NN06',	N'String'	,12000	,'LN06'
    exec usp_them_Nuoc 'NN07',	N'Coca'	,12000,	'LN06'
    exec usp_them_Nuoc 'NN08',	N'Pepsi'	,12000,	'LN06'
    exec usp_them_Nuoc 'NN09',	N'Revice'	,12000,	'LN06'
    exec usp_them_Nuoc 'NN10',	N'Chanh muối'	,12000,	'LN06'
    exec usp_them_Nuoc 'NN11',	N'Bí đao'	,12000,	'LN06'
    exec usp_them_Nuoc 'TL01',	N'Seven'	,15000,	'LN07'
    exec usp_them_Nuoc 'TL02',	N'Mèo'	,25000,	'LN07'
    exec usp_them_Nuoc 'TL03',	N'Ba số'	,35000,	'LN07'
	select * from NUOC
---HÓA ĐƠN
--create proc usp_themHOADON
-- @MAHD CHAR(4),
-- --@GIOVAO DATETIME ,
-- --@GIORA DATETIME ,
-- @TINHTRANG INT,
-- @MABAN CHAR(4) 
-- as
--  declare @GIOVAO DATETIME
--  declare @GIORA DATETIME
--if  exists(select * from BAN where MABAN =@MABAN)
-- begin
 
--  if exists(select * from HOADON where MAHD =@MAHD)
--    print N'Đã có' +@MAHD+ N'trong cơ sở dữ liệu'
--  else 
--   begin    
--    set @GIOVAO = GETDATE()
	
--	if @TINHTRANG = 1 set @GIORA = GETDATE() 
--	else set @GIORA = null
--    insert HOADON values(@MAHD, @GIOVAO, @GIORA, @TINHTRANG, @MABAN) 
	
--	print N'Đã thêm hóa đơn thành công'
--   end
-- end
--else
-- if not exists(select * from BAN where MABAN =@MABAN)
--  print N'đã có'+ @MABAN + N'trong cơ sở dữ liệu'
--go
--select * from HOADON


--/*
--You can't pass in a function call as an argument to your stored procedure. Instead use an intermediate variable:

--DECLARE @tmp DATETIME
--SET @tmp = GETDATE()

--EXEC DisplayDate @tmp;
--*/


--set dateformat dmy
--  EXEC usp_themHOADON 'B008',0, 'TN01'
 
 
  
SELECT * FROM HOADON


----HÀM TỰ SINH MÃ CHO hóa đơn
 create function SinhMAHD() returns char(4)
As
Begin
	declare @MaxMAHD char(4)
	declare @NewMAHD varchar(4)
	declare @stt	int
	declare @i	int	
	declare @sokytu	int

	if exists(select * from HOADON )---Nếu bảng hóa đơn có dữ liệu
	 begin
		--Lấy mã giáo viên lớn nhất hiện có
		select @MaxMAHD = max(MAHD) 
		from HOADON
		--Trích phần ký số của mã lớn nhất và chuyển thành số 
		set @stt=convert(int, right(@MaxMAHD,3)) + 1 --Số thứ tự của giáo viên mới
	 end
	else--Nếu bảng giáo viên đang rỗng (nghĩa là chưa có giáo viên nào được lưu trữ trong CSDL.
	 set @stt= 1 -- Số thứ tự của giáo viên trong trường hợp chưa có gv nào trong CSDL
	--Kiểm tra và bổ sung chữ số 0 để đủ 3 ký số trong mã gv.
	set @sokytu = len(convert(varchar(3), @stt))
	set @NewMAHD='B'
	set @i = 0
	while @i < 3 -@sokytu
		begin
			set @NewMAHD = @NewMAHD + '0'
			set @i = @i + 1
		end	
	set @NewMAHD = @NewMAHD + convert(varchar(3), @stt)

return @NewMAHD
End

--Thử hàm sinh mã
print dbo.SinhMAHD()
 -- thử nghiệm thêm hóa đơn với hàm tự sinh mã 
 -- tạo một proc thêm một hóa đơn có hàm thự động sinh mã
 select * from HOADON
 create proc usp_themHOADON
 --@MAHD CHAR(4),
 --@GIOVAO DATETIME ,
 --@GIORA DATETIME ,
 @TINHTRANG INT,
 @MABAN CHAR(4) 
 as
 begin
  declare @MAHD CHAR(4)
  declare @GIOVAO DATETIME
  declare @GIORA DATETIME 
 if  exists(select * from BAN where MABAN = @MABAN )
  begin
    
    set @MAHD = dbo.SinhMAHD()
    set @GIOVAO = GETDATE()
	if @TINHTRANG = 1 set @GIORA = GETDATE() 
	if @TINHTRANG = 0 set @GIORA = null	
    insert HOADON values(@MAHD, @GIOVAO, @GIORA, @TINHTRANG, @MABAN) 	
	print N'Đã thêm hóa đơn thành công'
  end
else
  print N'Không có' + @MABAN + N'trong cơ sở dư liệu'
end


go

exec usp_themHOADON 1,'NS01'
exec usp_themHOADON 0,'NS01'
exec usp_themHOADON 0,'TN01'
exec usp_themHOADON 0,'NS02'
select * from HOADON
-- thực thi thủ tục tự sinh mã cho bill



select * from CT_HOADON
create proc usp_themCTHD
 @MAHD CHAR(4) ,
 @MANUOC CHAR(4),
 @SOLUONG INT 
 as
 if exists (select * from HOADON where MAHD = @MAHD) and exists(select * from NUOC where MANUOC = @MANUOC)
 begin
   if exists (select * from CT_HOADON where MAHD = @MAHD and MANUOC = @MANUOC)
   print N'đã có'+ ' ' + @MAHD+ ' '+ @MANUOC+ N'trong cơ sở dữ liệu'
   else
    begin
     insert into CT_HOADON values(@MAHD, @MANUOC, @SOLUONG)
	 print N'thêm tên hóa đơn thành công'
	end
end
 else
  if not exists(select * from HOADON where MAHD =@MAHD)
   print N'không có mã'+ ' ' + @MAHD + N'trong cơ sở dữ liệu'
  else
    print N'không có mã'+ ' ' + @MANUOC + N'trong cơ sở dữ liệu'

select * from NUOC
-- thêm dữ liệu tên hóa đơn
 exec usp_themCTHD 'B001','CF01', 2
 exec usp_themCTHD 'B001','CF02', 1
 exec usp_themCTHD 'B003','ST01', 1 
 exec usp_themCTHD 'B002','ST01', 1
 exec usp_themCTHD 'B002','TL01', 1
 exec usp_themCTHD 'B004','ST01', 2
 exec usp_themCTHD 'B004','TL01', 3
select * from CT_HOADON
select * from HOADON
select * from BAN
select * from LOAINUOC
select * from NUOC

-------------lấy hóa đơn ra từ mã bàn(trạng thái = 0)
select * from dbo.HOADON where MABAN = 'NS01' and TINHTRANG = 0
select * from dbo.CT_HOADON where MAHD ='B002'
