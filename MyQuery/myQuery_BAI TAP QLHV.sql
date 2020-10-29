CREATE DATABASE QLHOCVIEN
GO
USE QLHOCVIEN
GO

CREATE TABLE GiaoVien
(
	MaGV NCHAR(10) PRIMARY KEY,
	TenGV NVARCHAR(50),
	NgaySinh DATETIME,
	GioiTinh NVARCHAR(100),
	DienThoai NCHAR(10),
	MaGVQuanLi NCHAR(10)
)
GO

CREATE TABLE LopHoc
(
	MaLop NCHAR(10) PRIMARY KEY,
	SiSo INT,
	LopTruong NCHAR(10),
	GVQuanLi NCHAR(10),
	NamBatDau INT,
	NamKetThuc INT

	FOREIGN KEY (GVQuanLi) REFERENCES GiaoVien (MaGV)
)
GO

CREATE TABLE HocVien
(
	MaHocVien NCHAR(10) PRIMARY KEY,
	TenHocVien NVARCHAR(50),
	NgaySinh DATETIME,
	TinhTrang NVARCHAR(50),
	MaLop NCHAR(10) NOT NULL

	FOREIGN KEY (MaLop) REFERENCES dbo.LopHoc (MaLop)
)
GO

CREATE TABLE MonHoc
(
	MaMonHoc NCHAR(10) PRIMARY KEY,
	TenMonHoc NVARCHAR(50),
	SoChi INT
)
GO

CREATE TABLE GiaoVien_Day_MonHoc
(
	MaGV NCHAR(10),
	MaMH NCHAR(10),
	ThamNien INT,
	SoLopDaDay INT

	PRIMARY KEY (MaGV,MaMH)
	FOREIGN KEY (MaGV) REFERENCES GiaoVien (MaGV),
	FOREIGN KEY (MaMH) REFERENCES dbo.MonHoc (MaMonHoc)
)
GO

CREATE TABLE PhanCong
(
	MaGV NCHAR(10),
	MaMH NCHAR(10),
	MaLop NCHAR(10)

	PRIMARY KEY (MaGV,MaMH,MaLop)
	FOREIGN KEY (MaGV) REFERENCES GiaoVien (MaGV),
	FOREIGN KEY (MaMH) REFERENCES dbo.MonHoc (MaMonHoc),
	FOREIGN KEY (MaLop) REFERENCES dbo.LopHoc (MaLop)
)
GO

CREATE TABLE KetQua 
(
	MaHV NCHAR(10),
	MaMonHoc NCHAR(10),
	LanThi INT NOT NULL,
	Diem FLOAT 

	PRIMARY KEY (MaHV, MaMonHoc, LanThi)
	FOREIGN KEY (MaHV) REFERENCES dbo.HocVien (MaHocVien),
	FOREIGN KEY (MaMonHoc) REFERENCES dbo.MonHoc (MaMonHoc)
)
GO

INSERT INTO GiaoVien VALUES ('GV00001', N'Nguyễn Văn An', '1981-01-02', N'Nam', '', 'GV00002')
INSERT INTO GiaoVien VALUES ('GV00002', N'Nguyễn Thị Như Lan', '1984-12-02', N'Nữ', '', 'GV00005')
INSERT INTO GiaoVien VALUES ('GV00003', N'Trần Minh Anh', '1986-03-23', N'Nam', '0909123999', 'GV00002')
INSERT INTO GiaoVien VALUES ('GV00004', N'Trương Tường Vi', '1988-02-01', N'Nữ', '0908990909', 'GV00008')
INSERT INTO GiaoVien VALUES ('GV00005', N'Hà Anh Tuấn', '1986-12-03', N'Nam', '0909909000', 'GV00008')
INSERT INTO GiaoVien VALUES ('GV00006', N'Tràn Anh Dũng', '1979-04-04', N'Nam', '', 'GV00010')
INSERT INTO GiaoVien VALUES ('GV00007', N'Trần Duy Tân', '1978-01-04', N'Nam', '', 'GV00002')
INSERT INTO GiaoVien VALUES ('GV00008', N'Nguyễn Thị Linh', '1979-07-08', N'Nữ', '0938079700', 'GV00009')
INSERT INTO GiaoVien VALUES ('GV00009', N'Trần Thị Kiều', '1977-01-03', N'Nữ', '', '')
INSERT INTO GiaoVien VALUES ('GV00010', N'Trần Phương Loan', '1978-04-30', N'Nữ', '', '')
GO
INSERT INTO LopHoc VALUES ('LH000001', 1, 'HV000002', 'GV00001', 2010, 2014)
INSERT INTO LopHoc VALUES ('LH000002', 1, 'HV000003', 'GV00003', 2009, 2013)
INSERT INTO LopHoc VALUES ('LH000003', 2, 'HV000004', 'GV00008', 2010, 2014)
INSERT INTO LopHoc VALUES ('LH000004', 4, 'HV000008', 'GV00010', 2011, 2015)
INSERT INTO LopHoc VALUES ('LH000005', 1, 'HV000009', 'GV00009', 2010, 2014)
GO
INSERT INTO HocVien VALUES ('HV000001', N'Nguyễn Thùy Linh', '1990-2-1', N'Buộc thôi học', 'LH000001')
INSERT INTO HocVien VALUES ('HV000002', N'Nguyễn Thị Kiều', '1993-12-20', N'Đang học', 'LH000001')
INSERT INTO HocVien VALUES ('HV000003', N'Nguyễn Xuân Thu', '1994-12-30', N'Đang học', 'LH000002')
INSERT INTO HocVien VALUES ('HV000004', N'Trần Trung Chính', '1992-3-12', N'Đang học', 'LH000003')
INSERT INTO HocVien VALUES ('HV000005', N'Trần Minh An', '1991-12-5', N'Đang học', 'LH000003')
INSERT INTO HocVien VALUES ('HV000006', N'Trương Mỹ Linh', '1989-5-1', N'Đã tốt nghiệp', 'LH000004')
INSERT INTO HocVien VALUES ('HV000007', N'Trần Hào', '1989-2-11', N'Đã tốt nghiệp', 'LH000004')
INSERT INTO HocVien VALUES ('HV000008', N'Nguyễn Huỳnh', '1990-6-11', N'Đang học', 'LH000004')
INSERT INTO HocVien VALUES ('HV000009', N'Nguyễn Xuân Trương', '1990-6-1', N'Đang học', 'LH000005')
INSERT INTO HocVien VALUES ('HV000010', N'Nguyễn Bình Minh', '1991-2-11', N'Đang học', 'LH000004')
GO
INSERT INTO MonHoc VALUES ('MH00001', N'Cơ sở dữ liệu', 5)
INSERT INTO MonHoc VALUES ('MH00002', N'Cấu trúc dữ liệu', 6)
INSERT INTO MonHoc VALUES ('MH00003', N'Mạng máy tính', 4)
INSERT INTO MonHoc VALUES ('MH00004', N'Toán cao cấp', 6)
INSERT INTO MonHoc VALUES ('MH00005', N'Tin học cơ sở', 3)
INSERT INTO MonHoc VALUES ('MH00006', N'Công nghệ phần mềm', 4)
INSERT INTO MonHoc VALUES ('MH00007', N'Trí tuệ nhân tạo', 4)
INSERT INTO MonHoc VALUES ('MH00008', N'Khai thác dữ liệu', 3)
INSERT INTO MonHoc VALUES ('MH00009', N'Phân tích thiết kế hệ thống thông tin', 3)
INSERT INTO MonHoc VALUES ('MH00010', N'Hệ thống thông minh', 4)
GO
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00001', 'MH00001', 3, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00001', 'MH00004', 2, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00002', 'MH00001', 1, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00002', 'MH00002', 1, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00003', 'MH00006', 2, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00003', 'MH00007', 3, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00003', 'MH00010', 4, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00004', 'MH00009', 6, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00004', 'MH00010', 1, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00005', 'MH00008', 4, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00005', 'MH00010', 2, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00006', 'MH00008', 4, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00006', 'MH00009', 2, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00006', 'MH00010', 4, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00007', 'MH00010', 7, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00008', 'MH00001', 2, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00008', 'MH00002', 1, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00009', 'MH00010', 2, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00010', 'MH00001', 3, NULL)
INSERT INTO GiaoVien_Day_MonHoc VALUES ('GV00010', 'MH00002', 1, NULL)
GO
INSERT INTO PhanCong VALUES ('GV00001', 'MH00001', 'LH000001')
INSERT INTO PhanCong VALUES ('GV00001', 'MH00004', 'LH000001')
INSERT INTO PhanCong VALUES ('GV00003', 'MH00010', 'LH000005')
INSERT INTO PhanCong VALUES ('GV00004', 'MH00009', 'LH000004')
INSERT INTO PhanCong VALUES ('GV00005', 'MH00008', 'LH000002')
INSERT INTO PhanCong VALUES ('GV00005', 'MH00008', 'LH000004')
INSERT INTO PhanCong VALUES ('GV00006', 'MH00008', 'LH000003')
INSERT INTO PhanCong VALUES ('GV00006', 'MH00009', 'LH000002')
INSERT INTO PhanCong VALUES ('GV00006', 'MH00009', 'LH000003')
INSERT INTO PhanCong VALUES ('GV00006', 'MH00010', 'LH000004')
INSERT INTO PhanCong VALUES ('GV00007', 'MH00010', 'LH000002')
INSERT INTO PhanCong VALUES ('GV00007', 'MH00010', 'LH000003')
INSERT INTO PhanCong VALUES ('GV00008', 'MH00002', 'LH000004')
GO
INSERT INTO KetQua VALUES ('HV000001', 'MH00001', 1, 5.5)
INSERT INTO KetQua VALUES ('HV000001', 'MH00004', 1, 6)
INSERT INTO KetQua VALUES ('HV000002', 'MH00001', 1, 7)
INSERT INTO KetQua VALUES ('HV000002', 'MH00004', 1, 8)
INSERT INTO KetQua VALUES ('HV000003', 'MH00008', 1, 8.7)
INSERT INTO KetQua VALUES ('HV000003', 'MH00009', 1, 9)
INSERT INTO KetQua VALUES ('HV000003', 'MH00010', 1, 10)
INSERT INTO KetQua VALUES ('HV000004', 'MH00008', 1, 4)
INSERT INTO KetQua VALUES ('HV000004', 'MH00008', 2, 3)
INSERT INTO KetQua VALUES ('HV000004', 'MH00009', 1, 2)
INSERT INTO KetQua VALUES ('HV000004', 'MH00009', 2, 5)
INSERT INTO KetQua VALUES ('HV000004', 'MH00010', 1, 6)
INSERT INTO KetQua VALUES ('HV000005', 'MH00008', 1, 7.5)
INSERT INTO KetQua VALUES ('HV000005', 'MH00009', 1, 1)
INSERT INTO KetQua VALUES ('HV000005', 'MH00009', 2, 7)
INSERT INTO KetQua VALUES ('HV000005', 'MH00010', 1, 1)
INSERT INTO KetQua VALUES ('HV000005', 'MH00010', 2, 3.5)
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- C. BÀI TẬP STORED PROCEDURE
-- 1
CREATE PROC spGetNameTeacher
AS
BEGIN
	DECLARE @ketqua NVARCHAR(20)

	SELECT @ketqua = gv.TenGV FROM dbo.GiaoVien gv
	LEFT JOIN dbo.LopHoc l ON gv.MaGV = l.GVQuanLi
	WHERE l.MaLop = 'LH000001'

	PRINT N'Họ tên GV quản lí lớp LH000001 : ' + CAST(@ketqua AS NVARCHAR)
END
spGetNameTeacher

-- 2
CREATE PROC spGetNameStudent
AS
BEGIN
	DECLARE @kq NVARCHAR(20)

	SELECT @kq = hv.TenHocVien FROM dbo.HocVien hv
	LEFT JOIN dbo.KetQua kq ON hv.MaHocVien = kq.MaHV
	LEFT JOIN dbo.MonHoc mh ON mh.MaMonHoc = kq.MaMonHoc
	WHERE mh.TenMonHoc = N'Cơ sở dữ liệu'
	AND kq.Diem >= 5
	AND hv.TinhTrang NOT LIKE N'Đang%'

	PRINT N'Họ tên học viên [đã từng] thi đậu CSDL : '+ CHAR(10) + CAST(@kq AS NVARCHAR)
END
spGetNameStudent

-- 3
CREATE PROC spGetInfoClass_1
@MaLop NCHAR(10)
AS
BEGIN
	--DECLARE @MaLop NCHAR(10) = 'LH000001'

	SELECT l.SiSo AS [Sĩ Số Lớp], gv.TenGV AS [Tên GV quản lí], hv.TenHocVien AS [Họ tên lớp trưởng]FROM dbo.LopHoc l
	LEFT JOIN dbo.GiaoVien gv ON gv.MaGV = l.GVQuanLi
	LEFT JOIN dbo.HocVien hv ON hv.MaLop = l.MaLop
	WHERE l.MaLop = @MaLop
	AND hv.MaHocVien = l.LopTruong

END
spGetInfoClass_1 'LH000001'

CREATE PROC spGetInfoClass_2
@MaLop NCHAR(10)
AS
BEGIN
	--DECLARE @MaLop NCHAR(10) = 'LH000001'
	DECLARE @siso TINYINT, @tengv NVARCHAR(30), @tenlt NVARCHAR(30)

	SELECT @siso = SiSo FROM dbo.LopHoc WHERE MaLop = @MaLop

	SELECT @tengv = gv.TenGV FROM dbo.GiaoVien gv 
	LEFT JOIN dbo.LopHoc l ON gv.MaGV = l.GVQuanLi
	WHERE MaLop = @MaLop

	SELECT @tenlt = hv.TenHocVien FROM dbo.HocVien hv
	LEFT JOIN dbo.LopHoc l ON l.MaLop = hv.MaLop
	WHERE l.MaLop = @MaLop AND hv.MaHocVien = l.LopTruong

	PRINT N'Với mã lớp : ' +CAST(@MaLop AS VARCHAR) + CHAR(10)+
	N'Sĩ số : ' + CAST(@siso AS VARCHAR) + CHAR(10)+
	N'Tên GV quản lí : ' + CAST(@tengv AS NVARCHAR) + CHAR(10)+
	N'Tên lớp trưởng : ' + CAST(@tenlt AS NVARCHAR)

END
spGetInfoClass_2 'LH000001'

-- 4
CREATE PROC spPrintNameTeacher_Out
@MaLop NCHAR(10),
@ketqua NVARCHAR(20) OUT
AS
BEGIN
	--DECLARE @MaLop NCHAR(10) = 'LH000001' 
	--DECLARE @ketqua NVARCHAR(20)

	SELECT @ketqua = gv.TenGV FROM dbo.GiaoVien gv
	LEFT JOIN dbo.LopHoc l ON gv.MaGV = l.GVQuanLi
	WHERE l.MaLop = @MaLop

	PRINT N'Họ tên GV quản lí lớp : '+ CAST(@MaLop AS VARCHAR) + '-> ' + CAST(@ketqua AS NVARCHAR)
END

DECLARE @MaLop NCHAR(10) = 'LH000001', @ketqua NVARCHAR(20)
EXEC spPrintNameTeacher_Out @MaLop, @ketqua OUT 

-- 5
CREATE PROC spCountSubjectPass
@TenHocVien NVARCHAR(50)
AS
BEGIN
	--DECLARE @TenHocVien NVARCHAR(50) = N'Nguyễn Thùy Linh'
	DECLARE @count TINYINT

	SELECT @count = COUNT(kq.MaMonHoc) FROM dbo.KetQua kq
	LEFT JOIN dbo.HocVien hv ON hv.MaHocVien = kq.MaHV
	WHERE hv.TenHocVien = @TenHocVien
	AND kq.Diem >= 5
	AND kq.LanThi IN (  SELECT MAX(kq.LanThi) FROM dbo.KetQua kq
						LEFT JOIN dbo.HocVien hv ON hv.MaHocVien = kq.MaHV
						WHERE hv.TenHocVien = @TenHocVien
						)
	PRINT N'Có ' + CAST(@count AS VARCHAR) + N' môn SV : ' + CAST(@TenHocVien AS NVARCHAR) + N' đậu'
	
END
spCountSubjectPass N'Nguyễn Thùy Linh'

-- 6
CREATE PROC spPrintListNameTeacher
AS
BEGIN

	SELECT dbo.GiaoVien.TenGV , COUNT(dbo.GiaoVien_Day_MonHoc.MaMH) AS [Số môn dạy] 
	FROM dbo.GiaoVien
	LEFT JOIN dbo.GiaoVien_Day_MonHoc ON GiaoVien_Day_MonHoc.MaGV = GiaoVien.MaGV
	GROUP BY TenGV

END
spPrintListNameTeacher

-- 7
CREATE PROC spAvgStudent
@TenHV NVARCHAR(50)
AS
BEGIN
	--DECLARE @TenHV NVARCHAR(50) = N'Nguyễn Thùy Linh'
	DECLARE @TongDiem_Tin FLOAT 
	DECLARE @TongTin TINYINT
	 
	SELECT @TongDiem_Tin = SUM(dbo.KetQua.Diem * dbo.MonHoc.SoChi) FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN dbo.HocVien ON dbo.HocVien.MaHocVien = dbo.KetQua.MaHV
	WHERE TenHocVien = @TenHV
	AND LanThi IN ( SELECT MAX(LanThi) FROM dbo.KetQua
					LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
					LEFT JOIN dbo.HocVien ON dbo.HocVien.MaHocVien = dbo.KetQua.MaHV
					WHERE TenHocVien = @TenHV )

	SELECT @TongTin = SUM(dbo.MonHoc.SoChi) FROM dbo.MonHoc
	LEFT JOIN dbo.KetQua ON KetQua.MaMonHoc = MonHoc.MaMonHoc
	LEFT JOIN dbo.HocVien ON dbo.HocVien.MaHocVien = dbo.KetQua.MaHV
	WHERE TenHocVien = @TenHV
	AND LanThi IN ( SELECT MAX(LanThi) FROM dbo.MonHoc
					LEFT JOIN dbo.KetQua ON KetQua.MaMonHoc = MonHoc.MaMonHoc
					LEFT JOIN dbo.HocVien ON dbo.HocVien.MaHocVien = dbo.KetQua.MaHV
					WHERE TenHocVien = @TenHV )

	PRINT N'Điểm trung bình HV '+CAST(@TenHV AS NVARCHAR) + ' = ' + CAST(ROUND((@TongDiem_Tin/@TongTin),1) AS VARCHAR)

END
spAvgStudent N'Nguyễn Thùy Linh'


-- 8
ALTER PROC spCountStudentPassSubject
@TenMonHoc NVARCHAR(50),
@KetQua TINYINT OUT 
AS
BEGIN
	--DECLARE @TenMonHoc NVARCHAR(50) = N'Cơ sở dữ liệu'
	--DECLARE @KetQua TINYINT

	SELECT @KetQua = COUNT(dbo.HocVien.MaHocVien) FROM dbo.HocVien
	LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	WHERE TenMonHoc = @TenMonHoc
	AND Diem >= 5
	AND TinhTrang IN ( SELECT dbo.HocVien.TinhTrang
						FROM dbo.HocVien
						LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
						LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
						WHERE TinhTrang NOT LIKE N'Đang%')

	PRINT  N' có ' + CAST(@KetQua AS VARCHAR) + N' sinh viên [đã từng] thi đậu môn ' + CAST(@TenMonHoc AS NVARCHAR)
	--SELECT * FROM dbo.HocVien
	--SELECT * FROM dbo.KetQua
	--SELECT * FROM dbo.MonHoc
END
DECLARE @TenMonHoc NVARCHAR(50) = N'Cơ sở dữ liệu', @KetQua TINYINT 
EXEC spCountStudentPassSubject @TenMonHoc, @KetQua OUT 

-- 9
CREATE PROC spPrintListDetailSubject
AS
BEGIN
	
	SELECT dbo.MonHoc.TenMonHoc AS [Tên MH], SUM(IIF( dbo.KetQua.LanThi = 2, 1, 0)) AS [Số SV vẫn chưa thi đậu] FROM dbo.MonHoc
	LEFT JOIN dbo.KetQua ON KetQua.MaMonHoc = MonHoc.MaMonHoc
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	WHERE dbo.KetQua.Diem < 5
	GROUP BY TenMonHoc 


	SELECT * FROM dbo.HocVien
	SELECT * FROM dbo.KetQua
	SELECT * FROM dbo.MonHoc
END
spPrintListDetailSubject


-- test

CREATE TRIGGER trTest
ON MonHoc
FOR  DELETE
AS 
BEGIN

	--SELECT * FROM inserted
	--SELECT * FROM deleted

	INSERT INTO test
	SELECT * FROM deleted 

END


SELECT * INTO test
FROM dbo.MonHoc
WHERE 1 > 2










