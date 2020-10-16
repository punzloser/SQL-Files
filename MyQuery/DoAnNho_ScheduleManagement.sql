CREATE DATABASE ScheduleManagement
GO 

USE ScheduleManagement
GO

CREATE TABLE DangNhap
(
	ID VARCHAR(20) PRIMARY KEY,
	Pass VARCHAR(50),
	Quyen INT	
)
GO	

CREATE TABLE Khoa
(
	MaKhoa VARCHAR(20) PRIMARY KEY,
	TenKhoa NVARCHAR(50),
	DienThoai VARCHAR(20),
	Email NVARCHAR(50)
)
GO	

CREATE TABLE MonHoc
(
	MaMon VARCHAR(20) PRIMARY KEY,
	TenMon NVARCHAR(50),
	TongTiet INT,
	SoTin INT 
)
GO	

CREATE TABLE GiaoVien
(
	MaGV VARCHAR(20) PRIMARY KEY,
	TenGV NVARCHAR(50),
	DiaChi NVARCHAR(50),
	NgaySinh DATETIME,
	GT	NVARCHAR(5),
	MaMon VARCHAR(20) NOT NULL,
	ChuyenNganh NVARCHAR(50)

	FOREIGN KEY (MaMon) REFERENCES dbo.MonHoc(MaMon)
)
GO	


CREATE TABLE Lop
(
	MaLop VARCHAR(20) PRIMARY KEY,
	TenLop NVARCHAR(50),
	SiSo VARCHAR(5),
	MaKhoa VARCHAR(20) NOT NULL

	FOREIGN KEY (MaKhoa) REFERENCES dbo.Khoa(MaKhoa)
)
GO

CREATE TABLE PhongHoc
(
	MaPhong VARCHAR(20) PRIMARY KEY,
	TenPhong NVARCHAR(50),
	ChucNang NVARCHAR(20),
	SucChua INT
)
GO	

CREATE TABLE TKB
(
	Ngay DATETIME,
	MaGV VARCHAR(20) NOT NULL,
	MaLop VARCHAR(20) NOT NULL,
	MaMon VARCHAR(20) NOT NULL,
	MaPhong VARCHAR(20) NOT NULL,
	Buoi NVARCHAR(10)
	
	PRIMARY KEY(MaGV, MaLop, MaMon, MaPhong),
	FOREIGN KEY(MaGV) REFERENCES dbo.GiaoVien(MaGV),
	FOREIGN KEY(MaLop) REFERENCES dbo.Lop(MaLop),
	FOREIGN KEY(MaMon) REFERENCES dbo.MonHoc(MaMon),
	FOREIGN KEY(MaPhong) REFERENCES dbo.PhongHoc(MaPhong)
)
--THÊM DỮ LIỆU ĐĂNG NHẬP
INSERT INTO DangNhap VALUES ('admin', 'admin', NULL)
--THÊM DỮ LIỆU KHOA
INSERT INTO Khoa VALUES ('K1', N'Kỹ thuật', '090111111', 'a001@gmail.com')
INSERT INTO Khoa VALUES ('K2', N'Quản trị', '090111222', 'a002@gmail.com')
--THÊM DỮ LIỆU MÔN HỌC
INSERT INTO MonHoc VALUES ('M1', N'Toán cao cấp', 45, 3)
INSERT INTO MonHoc VALUES ('M2', N'Kiến trúc máy tính', 30, 2)
INSERT INTO MonHoc VALUES ('M3', N'Kỹ thuật lập trình', 60, 4)
INSERT INTO MonHoc VALUES ('M4', N'Nguyên lý kế toán', 45, 3)
INSERT INTO MonHoc VALUES ('M5', N'Quản trị Marketing', 45, 3)
INSERT INTO MonHoc VALUES ('M6', N'Quản trị nguồn nhân lực', 60, 3)
--THÊM DỮ LIỆU GIÁO VIÊN
INSERT INTO GiaoVien VALUES ('G1', N'Phạm Quốc Phong', N'Bình Dương', '1980-12-1', N'Nam', 'M4', N'Kinh tế')
INSERT INTO GiaoVien VALUES ('G2', N'Nguyễn Thị Mai Chi', N'Long Bình Tân', '1981-11-1', N'Nữ', 'M5', N'Kinh tế')
INSERT INTO GiaoVien VALUES ('G3', N'Hồ Văn Khôi', N'Long Bình Tân', '1981-05-11', N'Nam', 'M6', N'Kinh tế')
INSERT INTO GiaoVien VALUES ('G4', N'Phạm Mạnh Cương', N'Trảng Dài', '1999-01-01', N'Nam', 'M2', N'Kỹ sư')
INSERT INTO GiaoVien VALUES ('G5', N'Nguyễn Quang Phú', N'Tân Mai', '1998-11-01', N'Nam', 'M3', N'Kỹ sư')
INSERT INTO GiaoVien VALUES ('G6', N'Huỳnh Phước Danh', N'Trảng Dài', '1999-01-01', N'Nam', 'M1', N'Kỹ sư')
--THÊM DỮ LIỆU LỚP
INSERT INTO Lop VALUES ('L1', 'K15CNTT', '40', 'K1')
INSERT INTO Lop VALUES ('L2', 'K15QTKD', '50', 'K2')
--THÊM DỮ LIỆU PHÒNG HỌC
INSERT INTO PhongHoc VALUES ('P1', N'A5.1 Phần mềm', N'Phòng học chính', 32)
INSERT INTO PhongHoc VALUES ('P2', N'A1.1 Phần mềm', N'Phòng học chính', 45)
--THÊM DỮ LIỆU THỜI KHÓA BIỂU
INSERT INTO TKB VALUES ('2020-12-10', 'G1', 'L2', 'M4', 'P2', N'Sáng')
INSERT INTO TKB VALUES ('2020-12-10', 'G4', 'L1', 'M2', 'P1', N'Chiều')

--PROC KHOA
CREATE PROC ThemKhoa
@MaKhoa VARCHAR(20),
@TenKhoa NVARCHAR(50),
@DienThoai VARCHAR(20),
@Email NVARCHAR(50)
AS
BEGIN
	IF EXISTS (SELECT dbo.Khoa.MaKhoa
				FROM dbo.Khoa
				WHERE MaKhoa = @MaKhoa)
			BEGIN
				SELECT ErrMsg = N'Trùng mã khoa ! Nhập lại'
				RETURN 0
			END
	IF	@MaKhoa = ''
			BEGIN
				SELECT ErrMsg = N' Mã Khoa trống !'
				RETURN 0
			END
	ELSE	
		INSERT dbo.Khoa
		VALUES (@MaKhoa, @TenKhoa, @DienThoai, @Email)
		SELECT ErrMsg = N'Thêm thành công !'
END

CREATE PROC SuaKhoa
@MaKhoa VARCHAR(20),
@TenKhoa NVARCHAR(50),
@DienThoai VARCHAR(20),
@Email NVARCHAR(50)
AS
BEGIN
	IF	@MaKhoa = ''
		BEGIN
			SELECT ErrMsg = N'Mã Khoa là Khóa chính !'
			RETURN 0
		END
	IF	@TenKhoa	= '' OR
		@DienThoai  = '' OR
		@Email	    = ''
		BEGIN
			SELECT ErrMsg = N'Sửa lại không được trống !'
			RETURN 0
		END
	IF EXISTS(SELECT khoa.MaKhoa
			  FROM dbo.Khoa	
			  WHERE Khoa.MaKhoa = @MaKhoa
			  AND TenKhoa       = @TenKhoa
			  AND DienThoai     = @DienThoai
			  AND Email         = @Email)
		BEGIN
			SELECT ErrMsg = N'Dữ liệu không thay đổi!'
			RETURN 0
		END
	ELSE 
		UPDATE dbo.Khoa
		SET TenKhoa   = @TenKhoa,
			DienThoai = @DienThoai,
			Email     = @Email
		WHERE MaKhoa = @MaKhoa
		SELECT ErrMsg = N'Sửa thành công !'
END

CREATE PROC XoaKhoa
@MaKhoa VARCHAR(20)
AS	
BEGIN
	
	IF @MaKhoa = ''
		BEGIN
			SELECT ErrMsg = N'Lỗi !'
			RETURN 0
		END
	IF EXISTS
			(SELECT  dbo.Lop.MaKhoa
			 FROM    dbo.Lop
			 WHERE	 Lop.MaKhoa = @MaKhoa)
		BEGIN
		SELECT ErrMsg = N'Mã khoa đang tham chiếu !'
		RETURN 0
		END
	ELSE	
		BEGIN
			DELETE FROM dbo.Khoa
			WHERE MaKhoa = @MaKhoa
			SELECT ErrMsg = N'Xóa thành công !'
		END
END

--PROC LOP
CREATE PROC ThemLop
@MaLop VARCHAR(20),
@TenLop NVARCHAR(50),
@SiSo VARCHAR(5),
@MaKhoa VARCHAR(20)
AS
BEGIN
	IF EXISTS (SELECT dbo.Lop.MaLop
				FROM dbo.Lop
				WHERE MaLop = @MaLop)
			BEGIN
				SELECT ErrMsg = N'Trùng mã lớp ! Nhập lại'
				RETURN 0
			END
	IF	@MaLop = ''
			BEGIN
				SELECT ErrMsg = N' Mã Lớp trống !'
				RETURN 0
			END
	IF NOT EXISTS (SELECT Lop.MaKhoa
					FROM dbo.Khoa, dbo.Lop
					WHERE Khoa.MaKhoa = @MaKhoa
					AND Lop.MaKhoa = @MaKhoa)
			BEGIN
				SELECT ErrMsg = N' Lớp chưa có Khoa này !'
				RETURN 0
			END
	ELSE	
		INSERT dbo.Lop
		VALUES (@MaLop, @TenLop, @SiSo, @MaKhoa)
		SELECT ErrMsg = N'Thêm thành công !'
END
ThemLop 'a', 'f', 'f', 'f'


CREATE PROC SuaLop
@MaLop VARCHAR(20),
@TenLop NVARCHAR(50),
@SiSo VARCHAR(5),
@MaKhoa VARCHAR(20)
AS 
BEGIN
	IF	@MaLop = '' 
		BEGIN
			SELECT ErrMsg = N'Mã Lớp là Khóa chính !'
			RETURN 0
		END
	IF	@TenLop   = '' OR
		@SiSo     = '' OR
		@MaKhoa	  = ''
		BEGIN
			SELECT ErrMsg = N'Sửa lại không được trống !'
			RETURN 0
		END
	IF EXISTS(SELECT *
			  FROM dbo.Lop	
			  WHERE Lop.MaLop  = @MaLop
				AND	TenLop     = @TenLop 
				AND	SiSo       = @SiSo
				AND	MaKhoa	   = @MaKhoa)
		BEGIN
			SELECT ErrMsg = N'Dữ liệu không thay đổi!'
			RETURN 0
		END
	IF NOT EXISTS (SELECT Lop.MaKhoa
					FROM dbo.Khoa, dbo.Lop
					WHERE Khoa.MaKhoa = @MaKhoa
					AND Lop.MaKhoa = @MaKhoa)
			BEGIN
				SELECT ErrMsg = N' Lớp chưa có Khoa này !'
				RETURN 0
			END
	ELSE 
			UPDATE dbo.Lop
			SET TenLop  = @TenLop,
				SiSo    = @SiSo,
				MaKhoa  = @MaKhoa
			WHERE MaLop = @MaLop
			SELECT ErrMsg = N'Sửa thành công !'
END

CREATE PROC XoaLop
@MaLop VARCHAR(20)
AS
BEGIN
	DELETE FROM dbo.Lop
	WHERE Lop.MaLop = @MaLop
	SELECT ErrMsg = N'Xóa thành công !'
END
XoaLop 'a', 'a', 'a', 'K2'

--PROC GiaoVien

CREATE PROC ThemGiaoVien
@MaGV VARCHAR(20),
@TenGV NVARCHAR(50),
@DiaChi NVARCHAR(50),
@NgaySinh DATETIME,
@GT	NVARCHAR(5),
@MaMon VARCHAR(20), 
@ChuyenNganh NVARCHAR(50)
AS	
BEGIN
	IF NOT EXISTS (SELECT dbo.GiaoVien.MaMon 
					 FROM dbo.GiaoVien, dbo.MonHoc
					WHERE dbo.GiaoVien.MaMon = dbo.MonHoc.MaMon
					 AND  dbo.GiaoVien.MaMon = @MaMon)
			BEGIN
				SELECT ErrMsg = N'Mã môn chưa có trong Môn học'
				RETURN 0
			END
	IF EXISTS (SELECT dbo.GiaoVien.MaGV
				FROM dbo.GiaoVien
				WHERE MaGV = @MaGV)
			BEGIN
				SELECT ErrMsg = N'Trùng mã GV ! Nhập lại'
				RETURN 0
			END
	INSERT INTO GiaoVien VALUES(@MaGV, @TenGV, @DiaChi, @NgaySinh, @GT, @MaMon, @ChuyenNganh)
	SELECT ErrMsg = N'Thêm thành công !'
END
ThemGiaoVien '47', '1', '1', '1999-11-11', N'Nam', 'Mf99', '17'

CREATE PROC SuaGiaoVien
@MaGV VARCHAR(20),
@TenGV NVARCHAR(50),
@DiaChi NVARCHAR(50),
@NgaySinh DATETIME,
@GT	NVARCHAR(5),
@MaMon VARCHAR(20), 
@ChuyenNganh NVARCHAR(50)
AS	
BEGIN
	UPDATE  dbo.GiaoVien
	SET TenGV	 = @TenGV,
		DiaChi	 = @DiaChi,
		NgaySinh = @NgaySinh,
		      GT = @GT,
		   MaMon = @MaMon,
     ChuyenNganh = @ChuyenNganh		
	 WHERE MaGV = @MaGV
	 SELECT ErrMsg = N'Sửa thành công !'
END

CREATE PROC XoaGiaoVien
@MaGV VARCHAR(20)
AS	
BEGIN
	DECLARE @MaMon VARCHAR(20)

	IF EXISTS(SELECT dbo.GiaoVien.MaGV 
				FROM dbo.GiaoVien
				LEFT JOIN dbo.MonHoc ON MonHoc.MaMon = GiaoVien.MaMon
				AND dbo.GiaoVien.MaGV = @MaGV)
			BEGIN
				SELECT ErrMsg = N'Lỗi !'
				RETURN 0
			END 
	DELETE FROM dbo.GiaoVien
	WHERE MaGV = @MaGV
	AND dbo.GiaoVien.GT != 'Nam'
	AND dbo.GiaoVien.GT != 'Nữ'
	SELECT ErrMsg = N'Xóa thành công !'
END
--PROC PhongHoc
CREATE PROC ThemPhong
@MaPhong VARCHAR(20),
@TenPhong NVARCHAR(50),
@ChucNang NVARCHAR(20),
@SucChua INT
AS	
BEGIN
	IF @MaPhong = ''
	 BEGIN
	 	SELECT ErrMsg = N'Lỗi !'
		RETURN 0
	 END
	ELSE
		INSERT INTO	 PhongHoc VALUES (@MaPhong, @TenPhong, @ChucNang, @SucChua)
		SELECT ErrMsg = N'Thêm thành công !'
END

CREATE PROC SuaPhong
@MaPhong VARCHAR(20),
@TenPhong NVARCHAR(50),
@ChucNang NVARCHAR(20),
@SucChua INT
AS
BEGIN
	UPDATE dbo.PhongHoc
	SET TenPhong = @TenPhong,
		ChucNang = @ChucNang,
		 SucChua = @SucChua		
	WHERE MaPhong = @MaPhong
	SELECT ErrMsg = N'Sửa thành công !'
END

CREATE PROC XoaPhong
@MaPhong VARCHAR(20)
AS	
BEGIN
	DELETE FROM dbo.PhongHoc
	WHERE MaPhong = @MaPhong
	SELECT ErrMsg = N'Xóa thành công !'
END

--PROC MonHoc

CREATE PROC ThemMon
@MaMon VARCHAR(20),
@TenMon NVARCHAR(50),
@TongTiet INT,
@SoTin INT 
AS
BEGIN
	INSERT INTO MonHoc VALUES(@MaMon, @TenMon, @TongTiet, @SoTin)
	SELECT ErrMsg = N'Thêm thành công !'
END

CREATE PROC SuaMon
@MaMon VARCHAR(20),
@TenMon NVARCHAR(50),
@TongTiet INT,
@SoTin INT 
AS
BEGIN
	UPDATE dbo.MonHoc
	SET	TenMon   = @TenMon,
		TongTiet = @TongTiet,
		SoTin    = @SoTin
	WHERE MaMon	 = @MaMon
	SELECT ErrMsg = N'Sửa thành công !'
END

CREATE PROC XoaMon
@MaMon VARCHAR(20)
AS
BEGIN
	DELETE FROM dbo.MonHoc
	WHERE MaMon = @MaMon
	SELECT ErrMsg = N'Xóa thành công !'
END
--PROC TKB
ALTER PROC ChonTKBTheoMaGV
@MaGV VARCHAR(20)
AS
BEGIN
	SELECT *
	FROM dbo.TKB
	WHERE MaGV = @MaGV
END

ALTER PROC ThemTKB
@Ngay DATETIME,
@MaGV VARCHAR(20),
@MaLop VARCHAR(20),
@MaMon VARCHAR(20),
@MaPhong VARCHAR(20),
@Buoi NVARCHAR(10)
AS
BEGIN
	BEGIN TRY 
		INSERT INTO TKB VALUES (@Ngay, @MaGV, @MaLop, @MaMon, @MaPhong, @Buoi)
		SELECT ErrMsg = N'Thêm thành công !'
	END TRY
	BEGIN CATCH	
		SELECT ErrMsg = N'Thêm thất bại ! Error line :' + CONVERT(NVARCHAR(3),ERROR_LINE()) + CHAR(10) + ERROR_MESSAGE()
	END CATCH
END

ALTER PROC SuaTKB
@Ngay DATETIME,
@MaGV VARCHAR(20),
@MaLop VARCHAR(20),
@MaMon VARCHAR(20),
@MaPhong VARCHAR(20),
@Buoi NVARCHAR(10)
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.TKB
		SET Ngay = @Ngay,
			Buoi = @Buoi
		WHERE	MaGV = @MaGV
		AND 	MaPhong = @MaPhong
		AND 	MaLop = @MaLop
		AND 	MaMon = @MaMon
		AND @Ngay > GETDATE()
	SELECT ErrMsg = N'Sửa thành công !'			
	END TRY
    BEGIN CATCH
		SELECT ErrMsg = N'Sửa thất bại ! ErrLine :' + CONVERT(NVARCHAR(3),ERROR_LINE()) + CHAR(10) + ERROR_MESSAGE()
	END CATCH
END
--DELETE FROM dbo.TKB
--WHERE Ngay <= GETDATE()
CREATE PROC XoaTKB
@MaGV VARCHAR(20),
@MaLop VARCHAR(20),
@MaMon VARCHAR(20),
@MaPhong VARCHAR(20)
AS
BEGIN
	BEGIN TRY	
		DELETE dbo.TKB
		WHERE  MaGV    = @MaGV
		AND	   MaLop   = @MaLop
		AND	   MaMon   = @MaMon
		AND	   MaPhong = @MaPhong
		SELECT ErrMsg = N'Xóa thành công !'	
	END TRY
    BEGIN CATCH
		SELECT ErrMsg = N'Xóa thất bại ! ErrLine : ' + CONVERT(NVARCHAR(3), ERROR_LINE()) + CHAR(10) + ERROR_MESSAGE()
	END CATCH
END

--PROC XemTKB

ALTER PROC XemTKB
@NgayBatDau DATETIME,
@NgayKetThuc DATETIME
AS
BEGIN

	SELECT dbo.TKB.Buoi, dbo.TKB.Ngay, dbo.GiaoVien.TenGV, dbo.Lop.TenLop, dbo.MonHoc.TenMon, dbo.PhongHoc.TenPhong
	FROM dbo.TKB
	LEFT JOIN dbo.GiaoVien ON dbo.GiaoVien.MaGV = dbo.TKB.MaGV
	LEFT JOIN dbo.Lop ON Lop.MaLop = TKB.MaLop
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMon = TKB.MaMon
	LEFT JOIN dbo.PhongHoc ON PhongHoc.MaPhong = TKB.MaPhong	
	WHERE Ngay BETWEEN @NgayBatDau AND @NgayKetThuc

END
--SELECT DATEPART(WEEKDAY, '2020-10-16') AS DatePartInt;

-- PROC DangNhap
ALTER PROC DN
@ID VARCHAR(20),
@Pass VARCHAR(50)
AS
BEGIN
		SELECT * FROM dbo.DangNhap
		WHERE ID = @ID
		AND Pass = @Pass 
		AND @ID = 'admin'
		AND @Pass = 'admin'
END
DN 'admin', 'f'



