create database banhang
 CREATE TABLE SanPham
( 
MaSP Smallint ,
TenSP varchar(30) ,
DonGia Money ,
SoTon Real
)
CREATE TABLE DDH
( 
MaDH Int primary key ,
MaNCC Int ,
NgayLap DateTime ,
NgayYCGiao DateTime
)

CREATE TABLE CTDH
( MaDH Int , 
MaSP SmallInt , 
SL float , 
DGBan Money ,
ThanhTien As SL * DGBan
)

CREATE TABLE LoaiSP
( 
	MaLoaiSP Smallint primary key,
	TenLoaiSanPham nvarchar(100)
)
CREATE TABLE SanPham
( 
MaSP Smallint Primary Key ,
TenSP varchar(30) Not Null Unique,
DonGia Money Default 0 Check (DonGia >=0),
SoTon Real Default 0 Check (SoTon >=0),
MaLoaiSP Smallint Not Null References LoaiSP(MaLoaiSP)
On Delete No Action
On Update Cascade
)

CREATE TABLE SanPham
( 
MaSP SmallInt Constraint pkMaSP Primary Key ,
TenSP varchar(30) Constraint uniTenSP Unique ,
DonGia Money Constraint chkDonGia Check (DonGia >=0) ,
SoTon Real Constraint dfSoTon Default 0 ,
MaLoaiSP SmallInt Constraint nnMaLoaiSP Not Null
Constraint fkMaLSP References LoaiSP (MaLoaiSP)
On Delete No Action
On Update Cascade
)

CREATE TABLE CTDH
( 
MaDH smallInt Not Null References DDH,
MaSP SmallInt Not Null References SanPham,
SoLuong float Default 0 Check (SoLuong > 0),
DGBan Money Default 0 Check (DGBan > 0),
ThanhTien As SoLuong * DGBan,
Constraint pk_CTHD Primary Key (MaDH, MaSP)
)

create table NHACC
(
MaNCC smallint IDENTITY(1,1) primary key ,
TenNCC nvarchar(30) unique
)
ALTER TABLE NHACC
ALTER COLUMN TenNCC nvarchar(30)

CREATE TABLE DDH
( 
MADH SmallInt Constraint pkDDH Primary Key ,
NgayDH DateTime Default GetDate( ) Not Null ,
NgayYCGiao DateTime DEFAULT GetDate( ) Not Null ,
Constraint chkNgayYCGiao Check (NgayDH <= NgayYCGiao) ,
MaNCC SmallInt Not Null Constraint fk_DHH_NCC References NHACC(MaNCC)
)


CREATE TABLE NhanVien (
MaNV Int CONSTRAINT pk_NV Primary Key,
TenNV VarChar(40) NOT NULL)
GO

ALTER TABLE NhanVien
ADD NoiSinh Varchar(20) DEFAULT 'Đồng Nai',
MaNVQL Int NULL Constraint fk_MaNV References NhanVien(MaNV)

ALTER TABLE SanPham 
ADD SoTon Float NOT NULL
CONSTRAINT df_ST DEFAULT 0 WITH VALUES

ALTER TABLE SanPham
DROP COLUMN SoTon

ALTER TABLE SanPham
DROP CONSTRAINT df_ST

SP_RENAME 'SanPham.DonGia', 'DonGiaSP', 'COLUMN'
