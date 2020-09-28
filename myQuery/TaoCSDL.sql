CREATE TABLE DangNhap
(
	ID NVARCHAR(20) PRIMARY KEY,
	Pass NVARCHAR(50),
	Quyen FLOAT	
)
GO	

CREATE TABLE MonHoc
(
	MaMon NVARCHAR(20) PRIMARY KEY,
	TenMon NVARCHAR(50)
)
GO	

CREATE TABLE GiaoVien
(
	MaGV NVARCHAR(20) PRIMARY KEY,
	TenGV NVARCHAR(50),
	DiaChi NVARCHAR(50),
	NgaySinh DATETIME,
	GT	NVARCHAR(10),
	MaMon NVARCHAR(20) NOT NULL,
	ChuyenNganh NVARCHAR(50)

	FOREIGN KEY (MaMon) REFERENCES dbo.MonHoc(MaMon)
)
GO	

CREATE TABLE Khoa
(
	MaKhoa NVARCHAR(20) PRIMARY KEY,
	TenKhoa NVARCHAR(50),
	DienThoai NVARCHAR(20),
	Email NVARCHAR(50)
)
GO	

CREATE TABLE Lop
(
	MaLop NVARCHAR(20) PRIMARY KEY,
	TenLop NVARCHAR(50),
	SiSo float,
	MaKhoa NVARCHAR(20) NOT NULL

	FOREIGN KEY (MaKhoa) REFERENCES dbo.Khoa(MaKhoa)
)
GO

CREATE TABLE PhongHoc
(
	MaPhong NVARCHAR(20) PRIMARY KEY,
	TenPhong NVARCHAR(50),
	ChucNang NVARCHAR(20)
)
GO	

CREATE TABLE TKB
(
	Ngay DATETIME,
	MaGV NVARCHAR(20) NOT NULL,
	MaLop NVARCHAR(20) NOT NULL,
	MaMon NVARCHAR(20) NOT NULL,
	MaPhong NVARCHAR(20) NOT NULL,
	Buoi NVARCHAR(10)
	
	PRIMARY KEY(MaGV, MaLop, MaMon, MaPhong),
	FOREIGN KEY(MaGV) REFERENCES dbo.GiaoVien(MaGV),
	FOREIGN KEY(MaLop) REFERENCES dbo.Lop(MaLop),
	FOREIGN KEY(MaMon) REFERENCES dbo.MonHoc(MaMon),
	FOREIGN KEY(MaPhong) REFERENCES dbo.PhongHoc(MaPhong)
)
