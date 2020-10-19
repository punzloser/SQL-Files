CREATE DATABASE daotao
GO
CREATE TABLE Khoa
(
	MaKhoa SMALLINT PRIMARY KEY,
	TenKhoa NVARCHAR(100)
)
GO

CREATE TABLE GiaoVien
(
	MaGiaoVien BIGINT IDENTITY(1,1) PRIMARY KEY,
	TenGiaoVien NVARCHAR(100),
	SoDT NVARCHAR(100),
	Luong FLOAT,
	MaKhoa SMALLINT

	FOREIGN KEY (MaKhoa) REFERENCES dbo.Khoa(MaKhoa)
)
GO

CREATE PROC ChonGVTheoKhoa
@MaKhoa SMALLINT
AS
BEGIN
	SELECT * FROM dbo.GiaoVien WHERE MaKhoa = @MaKhoa
END

CREATE PROC ChonGVTheoMaGV
@MaGiaoVien BIGINT
AS
BEGIN
	SELECT * FROM dbo.GiaoVien WHERE MaGiaoVien = @MaGiaoVien
END

CREATE PROC ThemGV

@TenGiaoVien NVARCHAR,
@SoDT NVARCHAR,
@Luong FLOAT,
@MaKhoa SMALLINT
AS
BEGIN
	BEGIN TRY
		INSERT INTO GiaoVien(TenGiaoVien, SoDT, Luong, MaKhoa) VALUES (@TenGiaoVien, @SoDT, @Luong, @MaKhoa)
		SELECT ErrMsg = N'Thêm thành công !'
    END TRY
	BEGIN CATCH
		SELECT ErrMsg = N'Thêm thất bại !'
	END CATCH
END

CREATE PROC SuaGV
@MaGiaoVien BIGINT,
@TenGiaoVien NVARCHAR,
@SoDT NVARCHAR,
@Luong FLOAT,
@MaKhoa SMALLINT
AS
BEGIN
	BEGIN TRY 
		UPDATE dbo.GiaoVien 
		SET TenGiaoVien = @TenGiaoVien, SoDT = @SoDT, Luong = @Luong, MaKhoa = @MaKhoa 
		WHERE MaGiaoVien = @MaGiaoVien
		SELECT ErrMsg = N'Sửa thành công !'
	END TRY
	BEGIN CATCH
		SELECT ErrMsg = N'Sửa thất bại !'
	END CATCH
END

CREATE PROC XoaGV
@MaGiaoVien BIGINT
AS
BEGIN
	BEGIN TRY
		DELETE FROM dbo.GiaoVien WHERE MaGiaoVien = @MaGiaoVien
		SELECT ErrMsg = N'Xóa thành công !'
    END TRY
	BEGIN CATCH
		SELECT ErrMsg = N'Xóa thất bại !'
	END CATCH
END


