-------------------------
/* học phần cơ sở dữ liệu
 ngày: 28/4/2020
 người thực hiên: nguyễn đình phát triển
 mssv: 1812860
 lab 02
 */
 -------------lệnh tạo cơ sở dữ liệu
 create database lab02_qlsx
 go
 ------lệnh dùng cơ sở dữ liệu
 use lab02_qlsx
 -----lệnh tạo các bảng
 go
 create table tosanxuat
 (matsx char(4) primary key not null,
 tentsx nvarchar(5) not null
 )
 ----
 go
 create table congnhan
 (macn char(5) primary key,
 ho nvarchar(30) not null unique,
 ten nvarchar(10) not null,
 phai nvarchar(4) not null,
 ngaysinh datetime not null,
 matsx char(4) references tosanxuat(matsx),
 ----- khai báo khóa chinh gồm nhiều thuộc tính
 )
 go
 create table sanpham
 (masp char(5) primary key,
 tensp nvarchar(20) not null,
 dvt nvarchar(10) not null,
 tiencong float check (tiencong >0),
 )
 go
 create table thanhpham
 (macn char(5) references congnhan(macn),
 masp char(5) references sanpham(masp),
 ngay datetime, 
 soluong int check(soluong >=0),
 primary key (macn,masp,ngay)
 )
  ------chèn dữ liệu
  go
  insert into tosanxuat values('TS01',N'Tổ 1')
  insert into tosanxuat values('TS02',N'Tổ 2')

  ------nhập dữ liệu cho bảng công nhân
  ----thay đổi giá trị măc đinh thành dd/mm/yyyy
  set dateformat dmy
  go 
  insert into congnhan values('CN001',N'Nguyễn Trường',N'An',N'Nam','12/05/1981','TS01')
  insert into congnhan values('CN002',N'Lê Thị Hông',N'Gấm',N'Nữ','04/06/1980','TS01')
  insert into congnhan values('CN003',N'Nguyễn Công',N'Thành',N'Nam','04/05/1981','TS02')
  insert into congnhan values('CN004',N'Võ Hữu',N'Hạnh',N'Nam','15/02/1980','TS02')
  insert into congnhan values('CN005',N'Lý Thanh',N'Hân',N'Nữ','03/02/1981','TS01')

  
  -----
  insert into sanpham values('SP001',N'Nồi đất',N'cái',10000)
  insert into sanpham values('SP002',N'Chén',N'cái',2000)
  insert into sanpham values('SP003',N'Bình gốm nhỏ',N'cái',20000)
  insert into sanpham values('SP004',N'Bình gốm lớn',N'cái',25000)
  -----
  --thay đổi định dạng ngày
  set dateformat dmy
  go
  insert into thanhpham values('CN001','SP001','01/02/2007',10)
  insert into thanhpham values('CN002','SP001','01/02/2007',5)
  insert into thanhpham values('CN003','SP002','10/01/2007',50)
  insert into thanhpham values('CN004','SP003','12/01/2007',10)
  insert into thanhpham values('CN005','SP002','12/01/2007',100)
  insert into thanhpham values('CN002','SP004','13/02/2007',10)
  insert into thanhpham values('CN001','SP003','14/02/2007',15)
  insert into thanhpham values('CN003','SP001','15/01/2007',20)
  insert into thanhpham values('CN003','SP004','14/02/2007',15)
  insert into thanhpham values('CN004','SP002','30/01/2007',100)
  insert into thanhpham values('CN005','SP003','01/02/2007',50)
  insert into thanhpham values('CN001','SP001','20/02/2007',30)
  ----xem bảng 
  select *from tosanxuat
  select * from congnhan
  select * from sanpham
  select *from thanhpham

 
 ------truy vấn dữ liệu
 --câu 1:
 /* liệt kế các công nhân theo tổ sản xuất gồm các thông tin
 tentsx,hoten,ngáyinh,phai(sx theo thứ tự tăng dần 
 của tổ sản xuất,tên của công nhân)
 */
 select tentsx,ho+' '+ten as hoten,ngaysinh,phai
 from tosanxuat,congnhan
 order by tentsx,ten
 ---câu 2: liệt kê thành phẩm mà công nhân 'Nguyễn Trường An' đã làm được gồm các thông tin:tensp,ngay,soluong,thanhtien(sắp xếp theo thứ tự tăng dần của ngày)
 select  tensp,CONVERT(char(10), ngay, 103) as ngay,soluong, tiencong,soluong*tiencong as thanhtien
 from congnhan A,thanhpham B, sanpham C
 where A.macn = B.macn and B.masp = C.masp and ho = N'Nguyễn Trường' and ten = N'An'
 order by ngay
 ----câu3 liệt kê các nhân viển không sản xuất sản phẩm binh gốm lớn
 select * from congnhan
 where congnhan.macn not in (----liệt kê các công nhân sản sản phẩm bình gốm nhỏ
                select B.macn
				from thanhpham B,sanpham C
				where B.masp =C.masp and tensp ='Bình gốm nhỏ'
 )
 ---câu4:Liệt kê thông tin các công nhân có sản xuất cả ‘Nồi đất’ và ‘Bình gốm nhỏ’.
 select A.macn,ho+' '+ten as hoten,phai,ngaysinh,matsx
 from congnhan A,thanhpham B, sanpham C
 where A.macn = B.macn and B.masp =C.masp and tensp =N'Nồi đất' 
 and A.macn in(---- liệt kê các nhân viên sản xuất thêm sản phẩm 'Bình gốm nhỏ'
                          select  F.macn
						  from sanpham E, thanhpham F
						  where E.masp = F.masp and tensp=N'Bình gốm lớn'
 )
 
 --câu 5:Thống kê Số luợng công nhân theo từng tổ sản xuất.
 select  tentsx,COUNT(macn) as soluongcongnhan
 from congnhan A,tosanxuat B
 where A.matsx =B.matsx
 group by B.matsx,tentsx
 order by B.matsx
 --câu 6:Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được (Ho,Ten, TenSP, TongSLThanhPham, TongThanhTien).
 select  A.macn,ho+' '+ten as hoten , tensp,COUNT(soluong) as tongthanhpham,sum(soluong*tiencong) as tongthanhtien
 from congnhan A, thanhpham B, sanpham C
 where A.macn = B.macn and B.masp = C.masp
 group by A.macn ,ho+' '+ten, tensp
 order by A.macn
 ---câu7: Tổng số tiền công đã trả cho công nhân trong tháng 1 năm 2007
select sum(soluong*tiencong) as tongtiencong
from thanhpham A, sanpham B
where A.masp = B.masp and MONTH(ngay) = 1 and YEAR(ngay) = 2007
 ---câu8: Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2/2007
 ---bước 1 đếm sô lượng thành phẩm đuoẹc sản xuất trong tháng 2/2007
 select  A.masp,COUNT(soluong) as tongthanhpham
 from thanhpham A, sanpham B 
 where A.masp =B.masp 
 group by A.masp,soluong

 ---câu9: Cho biết công nhân sản xuất được nhiều ‘Chén’ nhất.
 ---câu10: Tiền công tháng 2/2006 của công nhân viên có mã số ‘CN002’
 ---câu11:Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên.

 ---câu12:Cập nhật giá tiền công của các loại bình gốm thêm 1000.
---câu13:  Thêm bộ <’CN006’, ‘Lê Thị’, ‘Lan’, ‘Nữ’,’TS02’ > vào bảng CongNhan.