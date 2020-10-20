CREATE DATABASE AppDetai
GO
USE	AppDetai
GO	

CREATE TABLE LoaiDT
(
	MaLoaiDT INT PRIMARY KEY,
	TenLoaiDeTai NVARCHAR(100)
)
GO
CREATE TABLE detai
(
	MaDT bigint IDENTITY(1,1) PRIMARY KEY,
	TenDT nvarchar(100),
	diem float,
	TenGVHD nvarchar(100),
	MaLoaiDT INT

	FOREIGN KEY (MaLoaiDT) REFERENCES dbo.LoaiDT(MaLoaiDT)
)
GO

alter proc ChonDeTaiTheoLoaiDeTai 
@MaLoaiDT INT
as
begin
	select * from detai where MaLoaiDT = @MaLoaiDT
end

alter proc ChonDeTaiTheoMaDeTai
@MaDT bigint
as
begin
	select * from detai where MaDT = @MaDT
end

create proc ThemDeTai
@TenDT nvarchar(100),
@diem float,
@TenGVHD nvarchar(100),
@MaLoaiDT INT
as
begin
	begin try 
	insert detai (TenDT, diem, TenGVHD, MaLoaiDT) values (@TenDT, @diem, @TenGVHD, @MaLoaiDT)
	select ErrMsg = N'Thêm thành công !'
	end try
	begin catch
	select ErrMsg = N'Thêm thất bại !'
	end catch
end

create proc SuaDeTai
@MaDT bigint,
@TenDT nvarchar(100),
@diem float,
@TenGVHD nvarchar(100),
@MaLoaiDT INT
as
begin
	begin try 
	update detai 
	set TenDT = @TenDT, diem = @diem, TenGVHD = @TenGVHD
	where MaDT = @MaDT
	select ErrMsg = N'Thêm thành công !'
	end try
	begin catch
	select ErrMsg = N'Thêm thất bại !'
	end catch
end

create proc XoaDeTai
@MaDT bigint
as
begin
	delete from detai where MaDT = @MaDT
	select ErrMsg = N'Xóa thành công !'
end



