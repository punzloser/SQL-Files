﻿CREATE DATABASE QuanLyDeTai
GO	
USE QuanLyDeTai
GO
CREATE TABLE SINHVIEN
(
	MSSV CHAR(10) PRIMARY KEY,
	TENSV NVARCHAR(30) NOT NULL,
	SODT VARCHAR(30),
	LOP VARCHAR(6),
	DIACHI CHAR(50)
)
GO

CREATE TABLE DETAI
(
	MSDT CHAR(10) PRIMARY KEY,
	TENDT NVARCHAR(30) NOT NULL,
)
GO

CREATE TABLE SV_DETAI
(
	MSSV CHAR(10),
	MSDT CHAR(10)
	PRIMARY KEY(MSSV,MSDT),
	FOREIGN KEY (MSSV) REFERENCES dbo.SINHVIEN,
	FOREIGN KEY (MSDT) REFERENCES dbo.DETAI
)
GO

CREATE TABLE HOCHAM
(
	MSHH SMALLINT PRIMARY KEY,
	TENHH NVARCHAR(20) NOT NULL
)

CREATE TABLE GIAOVIEN
(
	MSGV SMALLINT PRIMARY KEY,
	TENGV NVARCHAR(30) NOT NULL,
	DIACHI VARCHAR(30) NOT NULL,
	SODT VARCHAR(30) NOT NULL,
	MSHHAM SMALLINT,
	NAMHH SMALLDATETIME NOT NULL
	FOREIGN KEY (MSHHAM) REFERENCES dbo.HOCHAM
)
GO	

CREATE TABLE HOCVI
(
	MSHV SMALLINT PRIMARY KEY,
	TENHV VARCHAR(10) NOT NULL
)
GO

CREATE TABLE CHUYENNGANH
(
	MSCN SMALLINT PRIMARY KEY,
	TENCN NVARCHAR(30) NOT NULL
)
GO

CREATE TABLE GV_HD_CN
(
	MSGV SMALLINT,
	MSHV SMALLINT,
	MSCN SMALLINT,
	NAM SMALLDATETIME NOT NULL
	PRIMARY KEY (MSGV,MSHV,MSCN),
	FOREIGN KEY (MSGV) REFERENCES dbo.GIAOVIEN,
	FOREIGN KEY (MSHV) REFERENCES dbo.HOCVI,
	FOREIGN KEY (MSCN) REFERENCES dbo.CHUYENNGANH
)
GO

CREATE TABLE GV_HDDT
(
	MSGV SMALLINT,
	MSDT CHAR(10),
	DIEM FLOAT NOT NULL
	PRIMARY KEY(MSGV,MSDT),
	FOREIGN KEY(MSGV) REFERENCES dbo.GIAOVIEN,
	FOREIGN KEY(MSDT) REFERENCES dbo.DETAI
)
GO

CREATE TABLE GV_PBDT
(
	MSGV SMALLINT,
	MSDT CHAR(10),
	DIEM FLOAT NOT NULL
	PRIMARY KEY(MSGV,MSDT)
	FOREIGN KEY (MSGV) REFERENCES dbo.GIAOVIEN,
	FOREIGN KEY (MSDT) REFERENCES dbo.DETAI
)
GO

CREATE TABLE GV_UVDT
(
	MSGV SMALLINT,
	MSDT CHAR(10),
	DIEM FLOAT	NOT NULL
	PRIMARY KEY(MSGV,MSDT),
	FOREIGN KEY(MSGV) REFERENCES dbo.GIAOVIEN,
	FOREIGN KEY(MSDT) REFERENCES dbo.DETAI
)
GO

CREATE TABLE HOIDONG
(
	MSHD SMALLINT PRIMARY KEY,
	PHONG SMALLINT,
	TGBD SMALLDATETIME,
	NGAYHD SMALLDATETIME NOT NULL,
	TINHTRANG NVARCHAR(30) NOT NULL,
	MSGVCTHD SMALLINT
	FOREIGN KEY(MSGVCTHD) REFERENCES dbo.GIAOVIEN
)
GO

CREATE TABLE HOIDONG_GV
(
	MSHD SMALLINT,
	MSGV SMALLINT
	PRIMARY KEY(MSHD,MSGV),
	FOREIGN KEY(MSHD) REFERENCES dbo.HOIDONG,
	FOREIGN KEY(MSGV) REFERENCES dbo.GIAOVIEN
)
GO

CREATE TABLE HOIDONG_DT
(
	MSHD SMALLINT,
	MSDT CHAR(10),
	QUYETDINH NCHAR(10)
	PRIMARY KEY(MSHD,MSDT),
	FOREIGN KEY(MSHD) REFERENCES dbo.HOIDONG,
	FOREIGN KEY(MSDT) REFERENCES dbo.DETAI
)
--THEM DU LIEU SINHVIEN
INSERT INTO SINHVIEN VALUES ('97TH01',N'Nguyễn Văn An', '9688543', '97TH01', '12NTMK')
INSERT INTO SINHVIEN VALUES ('97TH02',N'Lý An', '8454433', '97TH01', '13/4 LCT')
INSERT INTO SINHVIEN VALUES ('97TH03',N'Đinh Thúy Vân', '8455789', '97TH01', '20 Pastuer')
INSERT INTO SINHVIEN VALUES ('97TH04',N'Trần Văn Ngọc', '8149023', '97TH02', '54/12 LHP')
INSERT INTO SINHVIEN VALUES ('97TH05',N'Hồ Khánh Ly', '9851623', '97TH02', '12 HBT')
INSERT INTO SINHVIEN VALUES ('97TH06',N'Nguyễn Bá Toàn', '9688531', '97TH01', '31 THĐ')
--THEM DU LIEU DETAI
INSERT INTO DETAI VALUES ('97001', N'Quản lý thư viện')
INSERT INTO DETAI VALUES ('97002', N'Nhận dạng vân tay')
INSERT INTO DETAI VALUES ('97003', N'Bán đấu giá trên mạng')
INSERT INTO DETAI VALUES ('97004', N'Quản lý siêu thị')
INSERT INTO DETAI VALUES ('97005', N'Xử lý ảnh')
--THEM DU LIEU SV_DETAI
INSERT INTO	SV_DETAI VALUES ('97TH01', '97004')
INSERT INTO	SV_DETAI VALUES ('97TH02', '97005')
INSERT INTO	SV_DETAI VALUES ('97TH03', '97001')
INSERT INTO	SV_DETAI VALUES ('97TH04', '97002')
INSERT INTO	SV_DETAI VALUES ('97TH05', '97003')
INSERT INTO	SV_DETAI VALUES ('97TH06', '97005')
--THEM DU LIEU HOCHAM
INSERT INTO HOCHAM VALUES (1, N'Phó giáo sư')
INSERT INTO HOCHAM VALUES (2, N'Giáo sư')
DELETE FROM dbo.GIAOVIEN
--THEM DU LIEU GIAOVIEN
INSERT INTO GIAOVIEN VALUES (1, N'Trần Lan', '11 NVT', '8751515', 1, '1996')
INSERT INTO GIAOVIEN VALUES (2, N'Nguyễn Văn A', '23/5 LQĐ', '8515186', 1, '1996')
INSERT INTO GIAOVIEN VALUES (3, N'Lê Trung', '4 TC', '8235464', 1, '1996')
INSERT INTO GIAOVIEN VALUES (4, N'Nguyễn Bảo Thy', '78 NTMK', '8775588', 2, '1997')
INSERT INTO GIAOVIEN VALUES (5, N'Chu Hòai Ân', '71/4 TL', '8997859', 2, '1997')
INSERT INTO GIAOVIEN VALUES (6, N'Nguyễn Ngọc An', '11 HBT', '8457689', 2, '1997')
