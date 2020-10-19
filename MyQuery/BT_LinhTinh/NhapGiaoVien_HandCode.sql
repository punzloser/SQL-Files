CREATE DATABASE BaiTap7
GO	
USE BaiTap7
GO	
CREATE TABLE Khoa
(
	MaKhoa SMALLINT PRIMARY KEY,
	TenKhoa NVARCHAR(100)
)
GO	

CREATE TABLE GiaoVien
(
	MaGV BIGINT IDENTITY(1,1) PRIMARY KEY,
	TenGV NVARCHAR(100),
	SoDT NVARCHAR(20),
	Luong FLOAT,
	MaKhoa SMALLINT

	FOREIGN KEY (MaKhoa) REFERENCES dbo.khoa(MaKhoa)
)
--Thêm
ALTER PROC GiaoVienInsert
(
	@TenGV NVARCHAR(100),
	@SoDT NVARCHAR(20),
	@Luong FLOAT,
	@MaKhoa SMALLINT
)
AS	
BEGIN	
	INSERT INTO	GiaoVien
	(
		TenGV,
		SoDT,
		Luong,
		MaKhoa
	)
	VALUES	
	(
		@TenGV,
		@SoDT,
		@Luong,
		@MaKhoa
	)
	SELECT	ErrMsg = N'Thêm thành công !'
END	
--Sửa
CREATE PROC GiaoVienUpdate
(
	@MaGV BIGINT,
	@TenGV NVARCHAR(100),
	@SoDT NVARCHAR(20),
	@Luong FLOAT,
	@MaKhoa SMALLINT
)
AS	
BEGIN	
	UPDATE dbo.GiaoVien
	SET	TenGV = @TenGV,
		SoDT = @SoDT,
		Luong = @Luong,
		MaKhoa = @Makhoa
	WHERE MaGV = @MaGV
	SELECT ErrMsg = N'Cập nhật thành công !'

		
END	
--Xóa
CREATE PROC GiaoVienDelete
(
	@MaGV BIGINT
)
AS
BEGIN
	DELETE FROM	dbo.GiaoVien
	WHERE	MaGV = @MaGV
	SELECT ErrMsg = N'Xóa thành công !'
END
--Chọn GV theo khoa
CREATE PROC ChonGVTheoKhoa
(
	@MaKhoa SMALLINT
)
AS	
BEGIN
	SELECT *
	FROM dbo.GiaoVien
	WHERE	MaKhoa = @MaKhoa

END
