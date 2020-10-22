câu 1
--------------------------------------
create table PhongBan
(
	MaPhong varchar(10) not null primary key,
	TenPhong nvarchar(100) not null
)
create table Nhanvien
(
	MaNV varchar(10) not null primary key,
	TenNV nvarchar(100) not null,
	NgaySinh varchar(10) not null,
	LuongNgay float not null default 0 check (LuongNgay between 0 and 10000000),
	MaPhong varchar(10) not null references PhongBan(MaPhong)
)

create table DuAn
(
	MaDa varchar(10) not null primary key,
	TenDa varchar(100) not null,
	SoNgay float,
	MaNV varchar(10) not null references Nhanvien(MaNV)
)
--------------------------------------
insert PhongBan( MaPhong, TenPhong)
values ('p1' , N'phòng 1') 
insert PhongBan( MaPhong, TenPhong)
values ('p2' , N'phòng 2')
insert PhongBan( MaPhong, TenPhong)
values ('p3' , N'phòng 3')
---------------------------------------
insert Nhanvien( MaNV, TenNV, NgaySinh, LuongNgay, MaPhong)
values ('nv1', N'Siêu Nhân Đỏ', '19/06/1992', 7000000, 'p1')
insert Nhanvien( MaNV, TenNV, NgaySinh, LuongNgay, MaPhong)
values ('nv2', N'Siêu Nhân Vàng', '20/07/1992', 6000000, 'p2')
insert Nhanvien( MaNV, TenNV, NgaySinh, LuongNgay, MaPhong)
values ('nv3', N'Siêu Nhân Xanh', '21/08/1992', 5000000, 'p3')
------------------------------------------------
insert DuAn( MaDA, TenDA, SoNgay, MaNV)
values ('1',N'Bán vé số', 30, 'nv1')
insert DuAn( MaDA, TenDA, SoNgay, MaNV)
values ('2',N'Bán ve chai', 29, 'nv2')
insert DuAn( MaDA, TenDA, SoNgay, MaNV)
values ('3',N'Lụm bọc', 28, 'nv3')
----------------------------------------
Câu 2a
----------------------------------------------
create proc sp_PHONGBANInsert(@MaPhong varchar(10), @TenPhong nvarchar(100))
as
if not exists (select * from PhongBan where MaPhong=@MaPhong)
	begin
		insert PhongBan(MaPhong, TenPhong)
		values(@MaPhong, @TenPhong)
		print 'Thanh Cong'
		return 1
	end
else
	begin
	print 'Sai'
	return 0
	end
--------------------
exec sp_PHONGBANInsert 'p4', 'phòng 4'
-----------------------------------
câu 2b
------------------------------
create proc sp_NHANVIENInsert(@MaNV varchar(10), @TenNV nvarchar(100), @NgaySinh varchar(10),
@LuongNgay float, @MaPhong varchar(10))
as
if not exists (select * from Nhanvien where MaNV=@MaNV)
	begin
		insert Nhanvien(MaNV, TenNV, NgaySinh, LuongNgay, MaPhong )
		values(@MaNV, @TenNV, @NgaySinh, @LuongNgay, @MaPhong)
		print 'Thanh Cong'
		return 1
	end
else
	begin
	print 'Sai'
	return 0
	end
-----------------------------------------------------
exec sp_NHANVIENInsert 'nv4', N'Siêu Nhân Đen', '25/09/1992', 5000000, 'p4'
------------------------------------------------
câu 2c
--------------------------------
create proc sp_DUANInsert (@MaDa varchar(10),@TenDa varchar(100), @SoNgay float,
@MaNV varchar(10))
as
if not exists (select * from DuAn where MaDa=@MaDa)
	begin
		insert DuAn(MaDa, TenDa, SoNgay, MaNV)
		values(@MaDa, @TenDa, @SoNgay, @MaNV)
		print 'Thanh Cong'
		return 1
	end
else
	begin
	print 'Sai'
	return 0
	end
---------------------------------
exec sp_DUANInsert '4', N'Đổ rác', 30, 'nv4'
-------------------------------
câu 2d
------------------------------------
create proc spud_DUAN  (@MaDa varchar(10),@TenDa varchar(100), @SoNgay float,
@MaNV varchar(10))
as
if exists (select * from DuAn where MaDa=@MaDa)
	begin
		update DuAn
		set TenDa=@TenDa , SoNgay=@SoNgay , MaNV=@MaNV
		where MaDa=@MaDa
		
print 'Thanh Cong'
		return 1
	end
else
	begin
	print 'Sai'
	return 0
	end
---------------------------------------------------
exec spud_DUAN '3', 'aaaaaa' , 20, 'nv4'
-------------------------------------
câu 2 e
----------------------------------------------
create proc spud_TongLuongNV (@MaNV varchar(10), @TongLuong float output)
as
	begin
		select @TongLuong= sum(t1.LuongNgay*t2.SoNgay)
		from Nhanvien t1, DuAn t2
		where t1.MaNV= t2.MaNV and t1.MaNV=@MaNV
	end
--------------------------------------------------------------------------
Declare @Tong Float
Exec spud_TongLuongNV 'nv4', @Tong output
Print @Tong
-----------------------------------------------------
câu 3a
-------------------------------------------------
