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
	SiSo INT,
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
INSERT INTO MonHoc VALUES ('M1', N'Toán cao cấp')
INSERT INTO MonHoc VALUES ('M2', N'Kiến trúc máy tính')
INSERT INTO MonHoc VALUES ('M3', N'Kỹ thuật lập trình')
INSERT INTO MonHoc VALUES ('M4', N'Nguyên lý kế toán')
INSERT INTO MonHoc VALUES ('M5', N'Quản trị Marketing')
INSERT INTO MonHoc VALUES ('M6', N'Quản trị nguồn nhân lực')
--THÊM DỮ LIỆU GIÁO VIÊN
INSERT INTO GiaoVien VALUES ('G1', N'Phạm Quốc Phong', '27 N6 Khu phố Bình Dương', '1980-12-1', N'Nam', 'M4', N'Kinh tế')
INSERT INTO GiaoVien VALUES ('G2', N'Nguyễn Thị Mai Chi', 'KP1 P.Long Bình Tân', '1981-11-1', N'Nữ', 'M5', N'Kinh tế')
INSERT INTO GiaoVien VALUES ('G3', N'Hồ Văn Khôi', '90 QL51 Long Bình Tân', '1981-05-11', N'Nam', 'M6', N'Kinh tế')
INSERT INTO GiaoVien VALUES ('G4', N'Phạm Mạnh Cương', 'Trảng Dài Thành phố Biên Hòa', '1999-01-01', N'Nam', 'M2', N'Kỹ sư')
INSERT INTO GiaoVien VALUES ('G5', N'Nguyễn Quang Phú', '136 Phan Trung Tân Mai', '1998-11-01', N'Nam', 'M3', N'Kỹ sư')
INSERT INTO GiaoVien VALUES ('G6', N'Huỳnh Phước Danh', 'Trảng Dài, Thành phố Biên Hòa', '1999-01-01', N'Nam', 'M1', N'Kỹ sư')
--THÊM DỮ LIỆU LỚP
INSERT INTO Lop VALUES ('L1', 'K15CNTT', 40, 'K1')
INSERT INTO Lop VALUES ('L2', 'K15QTKD', 50, 'K2')
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
				SELECT ErrMsg = 'Nhập lại, trùng mã !'
			END
	ELSE	
		INSERT dbo.Khoa
		VALUES (@MaKhoa, @TenKhoa, @DienThoai, @Email)
		SELECT ErrMsg = 'Thêm thành công !'
		
END



