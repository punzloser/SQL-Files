CREATE DATABASE QLHOCVIEN
GO
USE QLHOCVIEN
GO

CREATE TABLE GiaoVien
(
	MaGV NCHAR(10) PRIMARY KEY,
	TenGV NVARCHAR(50),
	NgaySinh DATETIME,
	GioiTinh NVARCHAR(10),
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
INSERT INTO KetQua VALUES ('HV000006', 'MH00010', 1, 2.5)
INSERT INTO KetQua VALUES ('HV000006', 'MH00010', 2, 3.3)
INSERT INTO KetQua VALUES ('HV000007', 'MH00010', 1, 3.5)
INSERT INTO KetQua VALUES ('HV000007', 'MH00010', 2, 1.5)
INSERT INTO KetQua VALUES ('HV000008', 'MH00010', 1, 2.5)
INSERT INTO KetQua VALUES ('HV000008', 'MH00010', 2, 6.5)
INSERT INTO KetQua VALUES ('HV000009', 'MH00010', 1, 4.5)
INSERT INTO KetQua VALUES ('HV000009', 'MH00010', 2, 5.5)
INSERT INTO KetQua VALUES ('HV000010', 'MH00010', 1, 3.5)
INSERT INTO KetQua VALUES ('HV000010', 'MH00010', 2, 6.5)
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- C. BÀI TẬP STORED PROCEDURE
-- 1. Cho biết họ tên giáo viên quản lý lớp LH000001.
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

-- 2. Cho biết họ tên các học viên đã từng thi đậu môn “Cơ sở dữ liệu”
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

-- 3. Nhập vào một mã lớp, cho biết sỉ số lớp, họ tên giáo viên quản lý lớp và họ tên lớp trưởng.
-- C1
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

-- C2
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

-- 4. Nhập vào một mã lớp, xuất ra họ tên giáo viên quản lý lớp dưới dạng tham số output và
-- in ra kết quả bằng lệnh print.
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

END

DECLARE @MaLop NCHAR(10) = 'LH000001', @ketqua NVARCHAR(20)
EXEC spPrintNameTeacher_Out @MaLop, @ketqua OUT 
PRINT N'Họ tên GV quản lí lớp : '+ CAST(@MaLop AS VARCHAR) + '-> ' + CAST(@ketqua AS NVARCHAR)


-- 5. Nhập vào họ tên một học viên, đếm số môn mà học viên này đã thi đậu. Điều kiện thi
-- đậu: điểm lần thi sau cùng của môn này >= 5.
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

-- 6. Xuất ra danh sách họ tên các giáo viên, ứng với mỗi giáo viên cho biết có số môn mà
-- các giáo viên này đã được phân công giảng dạy.
CREATE PROC spPrintListNameTeacher
AS
BEGIN

	SELECT dbo.GiaoVien.TenGV , COUNT(dbo.GiaoVien_Day_MonHoc.MaMH) AS [Số môn dạy] 
	FROM dbo.GiaoVien
	LEFT JOIN dbo.GiaoVien_Day_MonHoc ON GiaoVien_Day_MonHoc.MaGV = GiaoVien.MaGV
	GROUP BY TenGV

END
spPrintListNameTeacher

-- function phục vụ cho câu 7, 10, 12
-- chức năng : nhập vào TÊN học viên, xuất ra đtb lần thi [sau cùng]
CREATE FUNCTION fnAvgStudent
(
	@TenHV NVARCHAR(50)
)
RETURNS FLOAT
AS
BEGIN
	--DECLARE @TenHV NVARCHAR(50) = N'Trần Trung Chính'
	DECLARE @DTB_LanThiSauCung FLOAT

	SELECT @DTB_LanThiSauCung = SUM(dbo.KetQua.Diem*dbo.MonHoc.SoChi)/ SUM(dbo.MonHoc.SoChi)  FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	LEFT JOIN 
	(
	SELECT dbo.KetQua.MaMonHoc, MAX(LanThi) AS [Lần thi cuối] FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	WHERE TenHocVien = @TenHV
	GROUP BY dbo.KetQua.MaMonHoc
	) tb2 
	ON tb2.MaMonHoc = KetQua.MaMonHoc
	WHERE TenHocVien = @TenHV
	AND dbo.KetQua.LanThi = tb2.[Lần thi cuối]

	RETURN ROUND(@DTB_LanThiSauCung,2)
END
SELECT dbo.fnAvgStudent (N'Nguyễn Thùy Linh')

-- 7. Nhận vào tên một học viên, cho biết điểm trung bình của học viên đó. Điểm trung bình
-- được tính trên điểm thi lần thi sau cùng của học viên theo công thức:
-- Điểm trung bình = ∑(Điểm * Số tín chỉ) / ∑Số tín chỉ
CREATE PROC spAvgStudent
@TenHV NVARCHAR(50)
AS
BEGIN
	DECLARE @DTB_LanThiSauCung FLOAT 
	SELECT @DTB_LanThiSauCung = dbo.fnAvgStudent(dbo.HocVien.TenHocVien) FROM dbo.HocVien
	LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
	WHERE TenHocVien = @TenHV

	PRINT N'Điểm trung bình HV '+CAST(@TenHV AS NVARCHAR) + ' = ' + CAST(ROUND(@DTB_LanThiSauCung,1) AS VARCHAR)

END
spAvgStudent N'Nguyễn Thùy Linh'

-- 8. Nhận vào một tên môn học, cho biết có bao nhiêu học viên đã từng thi đậu môn này.
-- Xuất ra dưới dạng tham số output và in ra kết quả bằng lệnh print.
CREATE PROC spCountStudentPassSubject_Out
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
						-- đã từng thi đậu : nghĩa là không thuộc sv đang học 
	--SELECT * FROM dbo.HocVien
	--SELECT * FROM dbo.KetQua
	--SELECT * FROM dbo.MonHoc
END
DECLARE @TenMonHoc NVARCHAR(50) = N'Cơ sở dữ liệu', @KetQua TINYINT 
EXEC spCountStudentPassSubject_Out @TenMonHoc, @KetQua OUT 
PRINT  N' có ' + CAST(@KetQua AS VARCHAR) + N' sinh viên [đã từng] thi đậu môn ' + CAST(@TenMonHoc AS NVARCHAR)
	

-- 9. Xuất ra danh sách tên các môn học, ứng với mỗi môn cho biết số học viên vẫn chưa thi
-- đậu môn đó. Học viên chưa thi đậu khi điểm lần thi cuối cùng môn đó <5.
CREATE PROC spPrintListDetailSubject
AS
BEGIN
	--c1 by Thầy

	--SELECT dbo.MonHoc.TenMonHoc AS [Tên MH], SUM(IIF( dbo.KetQua.LanThi = 2, 1, 0)) AS [Số SV vẫn chưa thi đậu] FROM dbo.MonHoc
	--LEFT JOIN dbo.KetQua ON KetQua.MaMonHoc = MonHoc.MaMonHoc
	--LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	--WHERE dbo.KetQua.Diem < 5
	--GROUP BY TenMonHoc 
	-- * đề bài chưa yêu cầu nếu lần 1 cao thì lấy lần 1 *

	--c2 ý tưởng ban đầu tìm ra lần thi cuối cùng sau đó left join theo vùng dữ liệu để ra yêu cầu

	SELECT dbo.MonHoc.TenMonHoc AS [Tên MH], COUNT(dbo.HocVien.MaHocVien) AS [Số SV Thi lần 2 mà vẫn rớt] FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	LEFT JOIN 
    (
	SELECT dbo.KetQua.MaMonHoc,  MAX(LanThi) AS LanThiCuoi FROM dbo.KetQua
	GROUP BY MaMonHoc
	) tb2 ON tb2.MaMonHoc = KetQua.MaMonHoc
	WHERE dbo.KetQua.Diem < 5
	AND dbo.KetQua.LanThi = tb2.LanThiCuoi
	GROUP BY TenMonHoc
END
spPrintListDetailSubject
--SELECT * FROM dbo.HocVien
--SELECT * FROM dbo.KetQua
--SELECT * FROM dbo.MonHoc

-- 10. Nhận vào một mã lớp, cho biết họ tên học viên có điểm trung bình cao nhất của lớp đó.
-- Điều kiện và công thức tính điểm trung bình tương tự câu 6.
CREATE PROC spPrintStudentHighScoreAVG
@MaLop NCHAR(10)
AS
BEGIN
	--DECLARE @MaLop NCHAR(10) = 'LH000003'

	-- Tái Sử dụng function dbo.fnAvgStudent

	SELECT TOP 1 dbo.HocVien.TenHocVien AS [Tên học viên], dbo.fnAvgStudent(dbo.HocVien.TenHocVien) AS [Điểm trung bình] FROM dbo.HocVien
	LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
	WHERE MaLop = @MaLop
	GROUP BY TenHocVien
	ORDER BY [Điểm trung bình] DESC 

	--SELECT * FROM dbo.HocVien
	--SELECT * FROM dbo.KetQua
END
spPrintStudentHighScoreAVG 'LH000002'

-- 11. Viết stored procedure nhận vào thông tin một học viên mới và đưa học viên vào CSDL
-- theo quy trình sau:
--  B1: Kiểm tra nếu mã học viên đã có  thông báo lỗi
--  B2: Kiểm tra nếu học viên được xếp vào lớp chưa tồn tại  thông báo lỗi
--  B3: Kiểm tra nếu học viên được xếp vào lớp có nhiều hơn 20 học viên  thông báo
-- lớp đã quá đông và không thể nhận thêm học viên
--  B4: Kiểm tra nếu tình trạng không phải là một trong ba tình trạng „đang học‟, „đã
-- tốt nghiệp‟ hoặc „bị thôi học‟  thông báo lỗi
--  B5: Thêm học viên vào
--  B6: Tăng cột sĩ số trong bảng lớp insert học viên thêm 1
SELECT * FROM dbo.HocVien
SELECT * FROM dbo.LopHoc
spCheckNewStudentInsert 'HV000sg0019', N'Nguyễn Văn A', '1999-1-1', N'Đang họcf', 'LH0000f04'
CREATE PROC spCheckNewStudentInsert
@MaHocVien NCHAR(10),
@TenHocVien NVARCHAR(50),
@NgaySinh DATETIME,
@TinhTrang NVARCHAR(50),
@MaLop NCHAR(10)
AS
BEGIN
	BEGIN TRY 
	IF EXISTS ( SELECT * FROM dbo.HocVien
				WHERE MaHocVien = @MaHocVien)
			BEGIN
				RAISERROR('Trùng mã học viên',10,1)
				RETURN 
			END
	IF NOT EXISTS ( SELECT * FROM dbo.LopHoc
					LEFT JOIN dbo.HocVien ON HocVien.MaLop = LopHoc.MaLop
					WHERE dbo.LopHoc.MaLop = @MaLop)
			BEGIN
				RAISERROR('Lớp này chưa có',10,1)
				RETURN
			END
	IF	EXISTS ( SELECT * FROM dbo.LopHoc
				 LEFT JOIN dbo.HocVien ON HocVien.MaLop = LopHoc.MaLop
				 WHERE dbo.LopHoc.MaLop = @MaLop
				 AND SiSo >= 20)
			BEGIN
				RAISERROR('Lớp đã quá đông, không nhận thêm',10,1)
				RETURN
			END
	IF NOT EXISTS ( SELECT * FROM dbo.HocVien
				WHERE MaHocVien = @MaHocvien
				AND @TinhTrang = N'Buộc thôi học'
				OR @TinhTrang = N'Đang học'
				OR @TinhTrang = N'Đã tốt nghiệp')
			BEGIN
				RAISERROR('Lỗi ! column TinhTrang',10,1)
				RETURN
			END
	ELSE
		INSERT INTO HocVien VALUES (@MaHocVien, @TenHocVien, @NgaySinh, @TinhTrang, @MaLop)
		UPDATE dbo.LopHoc
		SET SiSo += 1
		WHERE MaLop = @MaLop
		PRINT N'Thêm thành công'
		RETURN
	END TRY

	BEGIN CATCH
		RAISERROR(N'Lỗi chưa phát hiện',15,1)		 
		ROLLBACK
	END CATCH
END

-- 12. Viết stored procedure xóa các học viên có điểm trung bình <= 3.5 ra khỏi CSDL theo quy trình :
-- Quản trị Cơ sở dữ liệu
--  B1 : tìm những học có đtb <= 3.5
--  Ứng với mỗi học viên
-- o Xóa các tham chiếu liên quan đến học viên này
-- o Bớt đi giá trị cột sĩ số của lớp học viên theo học đi 1
-- o Xóa học viên
SELECT * FROM dbo.LopHoc
SELECT * FROM dbo.KetQua
SELECT * FROM dbo.HocVien

CREATE PROC spDeleteStudentBadScoreAVG
--@MaHocVien NCHAR(10)
AS
BEGIN
	DECLARE @diem FLOAT
	SET @diem = 6
	 
	IF NOT EXISTS (
				SELECT DISTINCT dbo.HocVien.TenHocVien, dbo.fnAvgStudent(dbo.HocVien.TenHocVien) AS 'DTB <= 6' FROM dbo.KetQua
				LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
				WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @diem
				GROUP BY TenHocVien )
			BEGIN
				PRINT N'Không có học viên nào DTB <= ' + CAST(@diem AS VARCHAR)
			END
	ELSE	
		BEGIN
			DECLARE @check BIT = 1
			SELECT DISTINCT dbo.HocVien.TenHocVien, dbo.fnAvgStudent(dbo.HocVien.TenHocVien) AS 'DTB <= 3.5' FROM dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @diem
			GROUP BY TenHocVien

			IF (@check = 1)
				BEGIN
					-- dùng bảng tạm để update
					SELECT dbo.HocVien.MaLop ,COUNT(dbo.LopHoc.MaLop ) AS [SL] INTO #TEMP 
					FROM dbo.HocVien
					LEFT JOIN dbo.LopHoc ON LopHoc.MaLop = HocVien.MaLop
					WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @diem
					GROUP BY HocVien.MaLop

					UPDATE dbo.LopHoc
					SET dbo.LopHoc.SiSo = SiSo - #TEMP.SL
					FROM #TEMP
					WHERE dbo.LopHoc.MaLop = #TEMP.MaLop
				END 
		END

		DELETE dbo.KetQua
		WHERE MaHV IN (SELECT dbo.KetQua.MaHV
					   FROM dbo.KetQua
					   LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
					   WHERE dbo.fnAvgStudent(HocVien.TenHocVien) <= @diem)
		
		-- y/c phải có kết quả đầy đủ từ tất cả sv hoặc để dữ liệu null  => câu truy vấn đúng 

		DELETE dbo.HocVien
		WHERE dbo.HocVien.MaHocVien NOT IN ( SELECT dbo.KetQua.MaHV
											 FROM dbo.KetQua )
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- C. BÀI TẬP TRIGGER
-- 1. Cột tình trạng trong bảng học viên nếu có giá trị chỉ có thể là 'đang học', 'đã tốt nghiệp'
-- hoặc 'buộc thôi học'
CREATE TRIGGER trStudentInsertUpdate ON HocVien
FOR UPDATE, INSERT
AS 
BEGIN
	DECLARE @tinhtrang NVARCHAR(50)
	SELECT @tinhtrang = TinhTrang FROM inserted
	IF (@tinhtrang NOT IN (N'Đang học', N'Đã tốt nghiệp', N'Buộc thôi học'))
	BEGIN
		RAISERROR(N'Đang học, đã tốt nghiệp hoặc buộc thôi học', 16, 1)
		ROLLBACK
	END
	
END

-- 2. Cột giới tính trong bảng giáo viên nếu có giá trị chỉ có thể là „nam‟ hoặc „nữ
CREATE TRIGGER trTeacherInsertUpdate ON GiaoVien
FOR UPDATE, INSERT
AS
BEGIN
	DECLARE @gt NVARCHAR(10)
	SELECT @gt = GioiTinh FROM inserted
	IF (@gt NOT IN (N'Nam', N'Nữ'))
	BEGIN
		RAISERROR(N'Phải là nam hay nữ', 16, 1)
		ROLLBACK  
	END
END

-- 3. Tuổi của học viên phải từ 18 trở lên.
INSERT INTO HocVien VALUES 
('HV000099', N'Nguyễn A', '2000-2-11', N'Đang học', 'LH000005')
CREATE TRIGGER trStudentYearOld ON HocVien
FOR UPDATE, INSERT
AS
BEGIN
	-- C1
	--DECLARE @ngaysinh DATETIME
	--DECLARE @tuoi INT 

	--SELECT @ngaysinh = NgaySinh FROM inserted
	--SELECT @tuoi = CAST(YEAR(GETDATE()) AS INT) - CAST(YEAR(@ngaysinh) AS INT)
	--IF (@tuoi <= 18)
	--	BEGIN
	--		RAISERROR(N'Chưa đủ 18 tuổi', 16, 1)
	--		ROLLBACK
	--	END
	-- C2
	IF EXISTS ( SELECT * 
				FROM inserted
				WHERE YEAR(GETDATE()) - YEAR(NgaySinh) <= 18 ) 
		BEGIN
			RAISERROR(N'Chưa đủ 18 tuổi', 16, 1)
			ROLLBACK
		END
END

-- 4. Năm bắt đầu của một lớp học luôn phải nhỏ hơn năm kết thúc
UPDATE LopHoc
SET SiSo = 1, LopTruong = 'HV000002', GVQuanLi = 'GV00001', NamBatDau = '2005', NamKetThuc = '2006'
WHERE MaLop = 'LH000001'
CREATE TRIGGER trClassYear ON LopHoc
FOR UPDATE, INSERT 
AS 
BEGIN
	-- C1 như Câu 3 nhưng vẫn lỗi chưa hiểu nguyên nhân
	-- C2
	IF EXISTS ( SELECT *
				FROM inserted
				WHERE NamBatDau > NamKetThuc )
		BEGIN
			RAISERROR(N'Năm bắt đầu phải nhỏ hơn năm kết thúc', 16, 1)
			ROLLBACK
		END 
END

-- 5. Một lớp học phải có tổi thiểu một học viên và tối đa 20 học viên
CREATE TRIGGER trClassStudentSiSo ON LopHoc
FOR UPDATE, INSERT
AS 
BEGIN
	IF NOT EXISTS ( SELECT *
					FROM inserted
					WHERE SiSo BETWEEN 1 AND 20)
				BEGIN
					RAISERROR(N'Lớp tối thiểu 1 học viên, tối đa 20 học viên', 16, 1)
					ROLLBACK
				END
END

-- 6. Một giáo viên phải có khả năng giảng dạy ít nhất một môn
-- tức là phải có một MaGV duy nhất đang dạy trong bảng GiaoVien_Day_MonHoc
CREATE TRIGGER trTeacherTeachSubjects ON GiaoVien_Day_MonHoc
FOR DELETE
AS 
BEGIN
	IF NOT EXISTS ( SELECT MaGV
					FROM deleted
					WHERE deleted.MaGV IN ( SELECT gvd.MaGV
											FROM dbo.GiaoVien_Day_MonHoc gvd))
	
		BEGIN
			RAISERROR(N'Một GV phải dạy ít nhất 1 môn', 16, 1)
			ROLLBACK
		END
END

-- 7. Tuổi của giáo viên phải nằm trong khoảng 22 đến 55.
CREATE TRIGGER trTeacherYearOld ON GiaoVien
FOR UPDATE, INSERT
AS	
BEGIN
	IF NOT EXISTS ( SELECT *
					FROM inserted 
					WHERE YEAR(GETDATE()) - YEAR(NgaySinh) BETWEEN 22 AND 25)
				BEGIN
					RAISERROR(N'Tuổi GV từ 22 tới 25', 16, 1)
					ROLLBACK
				END
END

-- 8.  Lớp trưởng phải là một học viên thuộc về lớp.
CREATE TRIGGER trClassMonitorBelongTo ON LopHoc
FOR INSERT, UPDATE 
AS	
BEGIN
	IF NOT EXISTS ( SELECT *
					FROM inserted
					WHERE inserted.LopTruong IN ( SELECT MaHocVien
												  FROM dbo.HocVien))
												  
				BEGIN
					RAISERROR(N'Lớp trưởng phải là học viên', 16, 1)
					ROLLBACK
				END
END

-- 9 Mỗi giáo viên chỉ được quản lý tối đa hai lớp học
-- tức là nếu đếm GVQuanLi lên 3 thì roolback
CREATE TRIGGER trClassTeacherManage ON LopHoc
FOR INSERT, UPDATE
AS 
BEGIN
	IF EXISTS ( SELECT dbo.LopHoc.GVQuanLi, COUNT(dbo.LopHoc.MaLop) FROM dbo.LopHoc
				GROUP BY dbo.LopHoc.GVQuanLi
				HAVING	COUNT(dbo.LopHoc.MaLop) > 2)
			   
		BEGIN
			RAISERROR(N'Mỗi GV chỉ được quản 2 lớp', 16, 1)
			ROLLBACK
		END
END

-- 10
CREATE TRIGGER trTeacherManageClass ON GiaoVien
FOR UPDATE, INSERT
AS 
BEGIN
	IF EXISTS ( SELECT dbo.GiaoVien.MaGVQuanLi, COUNT(dbo.GiaoVien.MaGV)  
				FROM dbo.GiaoVien
				GROUP BY MaGVQuanLi
				HAVING  COUNT(dbo.GiaoVien.MaGV) > 3)
		BEGIN
			RAISERROR('GV chỉ được quản lí 3 người', 16, 1)
			ROLLBACK
		END
END

-- 11. Học viên thuộc về một lớp chỉ được học những môn có mở ra cho lớp đó.
-- tức trong bản phân công phải có mã MH
SELECT * FROM dbo.PhanCong
SELECT * FROM dbo.KetQua

ALTER TRIGGER trCheckSubjectStudent ON KetQua
FOR INSERT, UPDATE
AS	
BEGIN
	
	IF EXISTS ( SELECT inserted.MaMonHoc FROM inserted
				LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = inserted.MaHV
				LEFT JOIN dbo.LopHoc ON LopHoc.MaLop = HocVien.MaLop
				WHERE inserted.MaMonHoc NOT IN ( SELECT dbo.PhanCong.MaMH
												FROM dbo.PhanCong ))
			BEGIN
			    RAISERROR(N'Môn này chưa mở', 16, 1)
				ROLLBACK
			END	
END

-- 12. Giáo viên chỉ được dạy những môn mà họ có khả năng giảng dạy
SELECT * FROM dbo.GiaoVien_Day_MonHoc
SELECT * FROM dbo.PhanCong

ALTER TRIGGER trSubjectTeacherTeach ON PhanCong
FOR UPDATE, INSERT
AS 
BEGIN
	IF NOT EXISTS ( SELECT dbo.GiaoVien_Day_MonHoc.MaGV, dbo.GiaoVien_Day_MonHoc.MaMH 
					FROM dbo.GiaoVien_Day_MonHoc
					WHERE MaMH IN ( SELECT inserted.MaMH
									FROM inserted
									WHERE inserted.MaGV = dbo.GiaoVien_Day_MonHoc.MaGV))
			BEGIN
			    RAISERROR(N'Môn này GV không có khả năng dạy', 16, 1)
				ROLLBACK
			END				
END

-- 13. Thêm cột SoMonDaGD (số môn đã giảng dạy) vào bảng giáo viên. Quy định giá trị
-- trong cột này phải tương ứng với số môn mà giáo viên đã được phân công giảng dạy

ALTER TABLE GiaoVien ADD SoMonDaGD INT
GO

CREATE TRIGGER trTeacherAutoUpdateCountSubject ON GiaoVien
FOR UPDATE, INSERT
AS 
BEGIN
	DECLARE @count INT 
    SELECT @count = COUNT(dbo.GiaoVien.MaGV) 
	FROM dbo.GiaoVien


END























-- test trigger  với 2 bảng inserted & deleted
-- insert into select : chèn dữ liệu vào 1 bảng có sẵn
-- select into : tạo bảng sao từ bảng nào đó
-- After tương tự như for trong trigger
CREATE TRIGGER trTest
ON MonHoc
AFTER DELETE AS 
	BEGIN

		--SELECT * FROM inserted
		--SELECT * FROM deleted

		INSERT INTO test
		SELECT * FROM Deleted

	END


SELECT * INTO test
FROM dbo.MonHoc
WHERE 1 > 2
