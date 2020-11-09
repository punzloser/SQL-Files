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
INSERT INTO GiaoVien VALUES ('GV00006', N'Trần Anh Dũng', '1979-04-04', N'Nam', '', 'GV00010')
INSERT INTO GiaoVien VALUES ('GV00007', N'Trần Duy Tân', '1978-01-04', N'Nam', '', 'GV00002')
INSERT INTO GiaoVien VALUES ('GV00008', N'Nguyễn Thị Linh', '1979-07-08', N'Nữ', '0938079700', 'GV00009')
INSERT INTO GiaoVien VALUES ('GV00009', N'Trần Thị Kiều', '1977-01-03', N'Nữ', '', '')
INSERT INTO GiaoVien VALUES ('GV00010', N'Trần Phương Loan', '1978-04-30', N'Nữ', '', '')
GO
INSERT INTO LopHoc VALUES ('LH000001', 2, 'HV000002', 'GV00001', 2010, 2014)
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
INSERT INTO MonHoc VALUES ('MH00009', N'Phân tích thiết kế HTTT', 3)
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

-- 2. Cho biết họ tên các học viên đã từng thi đậu môn 'Cơ sở dữ liệu'
CREATE PROC spGetNameStudent
AS
BEGIN
	DECLARE @kq NVARCHAR(60)

	SELECT dbo.HocVien.TenHocVien AS 'Tên HV đã từng thi đậu' FROM dbo.HocVien
	LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	WHERE TenMonHoc = N'Cơ sở dữ liệu'
	AND Diem >= 5

	PRINT N'Họ tên học viên [đã từng] thi đậu CSDL : '+ CHAR(10) + @kq
END
spGetNameStudent

-- 3. Nhập vào một mã lớp, cho biết sĩ số lớp, họ tên giáo viên quản lý lớp và họ tên lớp trưởng.
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
ALTER PROC spPrintListNameTeacher
AS
BEGIN

	SELECT dbo.GiaoVien.TenGV , COUNT(dbo.PhanCong.MaMH) AS [Số môn dạy] 
	FROM dbo.PhanCong
	LEFT JOIN dbo.GiaoVien ON GiaoVien.MaGV = PhanCong.MaGV
	GROUP BY TenGV
	SELECT * FROM dbo.PhanCong

END
spPrintListNameTeacher

-- function phục vụ cho phần procedure câu 7, 10, 12, phần trigger câu 17, 18, phần cursor câu 4
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
				(SELECT dbo.KetQua.MaMonHoc, MAX(LanThi) AS [Lần thi cuối] FROM dbo.KetQua
				LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
				LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
				WHERE TenHocVien = @TenHV
				GROUP BY dbo.KetQua.MaMonHoc) tb2 ON tb2.MaMonHoc = KetQua.MaMonHoc

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
	AND LanThi != 2
	--SELECT * FROM dbo.HocVien
	--SELECT * FROM dbo.KetQua
	--SELECT * FROM dbo.MonHoc
END
DECLARE @TenMonHoc NVARCHAR(50) = N'Hệ thống thông minh', @KetQua TINYINT 
EXEC spCountStudentPassSubject_Out @TenMonHoc, @KetQua OUT 
PRINT  N' có ' + CAST(@KetQua AS VARCHAR) + N' sinh viên [đã từng] thi đậu môn ' + CAST(@TenMonHoc AS NVARCHAR)
	

-- 9. Xuất ra danh sách tên các môn học, ứng với mỗi môn cho biết số học viên vẫn chưa thi
-- đậu môn đó. Học viên chưa thi đậu khi điểm lần thi cuối cùng môn đó < 5.
-- vì group by lồng các kiểu nhưng chỉ lấy ra KQ sau cùng, nếu sót SV nào đó mà chỉ thi lần 1 => rớt không thi lại thì cách 1,2 sai vd HV000010  	MH00008
-- khắc phục bằng function
CREATE FUNCTION fnCountThiRotDayDu
(
	@MaHV VARCHAR(10),
	@MaMH VARCHAR(10)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @kq TINYINT
	SELECT @kq= COUNT(dbo.KetQua.MaHV) FROM dbo.KetQua
	WHERE  KetQua.MaHV = @MaHV AND MaMonHoc = @MaMH  --'HV000010' 'MH00008'
	AND Diem < 5
	RETURN @kq
END
SELECT dbo.fnCountThiRotDayDu('HV000010', 'MH00008')


CREATE PROC spPrintListDetailSubject
AS
BEGIN
	----c1 by Thầy
	--SELECT dbo.MonHoc.TenMonHoc AS [Tên MH], SUM(IIF( dbo.KetQua.LanThi = 2, 1, 0)) AS [Số SV vẫn chưa thi đậu] FROM dbo.MonHoc
	--LEFT JOIN dbo.KetQua ON KetQua.MaMonHoc = MonHoc.MaMonHoc
	--LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	--WHERE dbo.KetQua.Diem < 5
	--GROUP BY TenMonHoc 

	----c2 ý tưởng ban đầu tìm ra lần thi cuối cùng sau đó left join theo vùng dữ liệu để ra yêu cầu => sót sv thi lần 1 mà ko thi lại
	--SELECT DISTINCT dbo.MonHoc.TenMonHoc AS [Tên MH], COUNT(dbo.KetQua.MaHV) [Số SV vẫn chưa thi đậu] FROM dbo.KetQua
	--LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	--LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	--LEFT JOIN 
	--			(SELECT dbo.KetQua.MaHV,  MAX(LanThi) AS LanThiCuoi FROM dbo.KetQua
	--			 GROUP BY MaHV) tb2 ON tb2.MaHV = KetQua.MaHV
	--WHERE dbo.KetQua.Diem < 5
	--AND dbo.KetQua.LanThi = tb2.LanThiCuoi
	--GROUP BY TenMonHoc

	--c3
	SELECT DISTINCT dbo.MonHoc.TenMonHoc AS [Tên MH], dbo.fnCountThiRotDayDu(KetQua.MaHV, dbo.KetQua.MaMonHoc) [Số SV vẫn chưa thi đậu] FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	LEFT JOIN 
				(SELECT dbo.KetQua.MaHV,  MAX(LanThi) AS LanThiCuoi FROM dbo.KetQua
				 GROUP BY MaHV) tb2 ON tb2.MaHV = KetQua.MaHV
	WHERE dbo.KetQua.Diem < 5
	AND dbo.KetQua.LanThi = tb2.LanThiCuoi
END
EXEC spPrintListDetailSubject

-- 10. Nhận vào một mã lớp, cho biết họ tên học viên có điểm trung bình cao nhất của lớp đó.
-- Điều kiện và công thức tính điểm trung bình tương tự câu 6.
CREATE PROC spPrintStudentHighScoreAVG
@MaLop NCHAR(10)
AS
BEGIN
	--DECLARE @MaLop NCHAR(10) = 'LH000003'

	-- Sử dụng function dbo.fnAvgStudent

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
-- B1: Kiểm tra nếu mã học viên đã có -> thông báo lỗi
-- B2: Kiểm tra nếu học viên được xếp vào lớp chưa tồn tại -> thông báo lỗi
-- B3: Kiểm tra nếu học viên được xếp vào lớp có nhiều hơn 20 học viên -> thông báo
-- lớp đã quá đông và không thể nhận thêm học viên
-- B4: Kiểm tra nếu tình trạng không phải là một trong ba tình trạng 'đang học', 'đã
-- tốt nghiệp' hoặc 'bị thôi học' -> thông báo lỗi
-- B5: Thêm học viên vào
-- B6: Tăng cột sĩ số trong bảng lớp insert học viên thêm 1
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
-- B1 : tìm những học viên có đtb <= 3.5
-- Ứng với mỗi học viên
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
	SET @diem = 3.5
	 
	IF NOT EXISTS (SELECT DISTINCT dbo.HocVien.TenHocVien, dbo.fnAvgStudent(dbo.HocVien.TenHocVien) AS 'DTB <= 3.5' FROM dbo.KetQua
					LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
					WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @diem
					GROUP BY TenHocVien )
			BEGIN
				PRINT N'Không có học viên nào DTB <= ' + CAST(@diem AS VARCHAR)
			END
	ELSE	
		BEGIN
			DECLARE @check BIT = 1
			--B1 : tìm những học có đtb <= 3.5
			SELECT DISTINCT dbo.HocVien.TenHocVien, dbo.fnAvgStudent(dbo.HocVien.TenHocVien) AS 'DTB <= 3.5' FROM dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @diem
			GROUP BY TenHocVien

			IF (@check = 1)
				BEGIN
					-- dùng bảng tạm để update
					-- Count những người < 3.5 ném vào bảng #TEMP
					SELECT dbo.HocVien.MaLop, COUNT(dbo.LopHoc.MaLop ) AS [SL] INTO #TEMP 
					FROM dbo.HocVien
					LEFT JOIN dbo.LopHoc ON LopHoc.MaLop = HocVien.MaLop
					WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @diem
					GROUP BY HocVien.MaLop

					--update lại sỉ số từ #TEMP sang bảng thực
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
		
		-- nhược điểm xóa luôn thằng sv mà không có kết quả thi trong bảng kết quả => trigger câu 14 tối ưu hơn vì update theo dữ liệu thực
		DELETE dbo.HocVien
		WHERE dbo.HocVien.MaHocVien NOT IN ( SELECT dbo.KetQua.MaHV
											 FROM dbo.KetQua )
END

-- cách 3 chậm hơn không đáng kể
CREATE PROC spCurForCau12
AS
BEGIN
	DECLARE @DTB FLOAT
	SET @DTB = 3.5
	 
	IF NOT EXISTS (SELECT DISTINCT dbo.HocVien.TenHocVien, dbo.fnAvgStudent(dbo.HocVien.TenHocVien)  FROM dbo.KetQua
					LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
					WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= @DTB
					GROUP BY TenHocVien )
			BEGIN
				PRINT N'Không có học viên nào DTB <= ' + CAST(@DTB AS VARCHAR)
			END	
	ELSE
		BEGIN
				DECLARE cur	CURSOR FOR 
						SELECT DISTINCT dbo.KetQua.MaHV, dbo.fnAvgStudent(dbo.HocVien.TenHocVien)  FROM dbo.KetQua
						LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
						WHERE dbo.fnAvgStudent(dbo.HocVien.TenHocVien) <= 3.5
						--GROUP BY dbo.KetQua.MaHV
		OPEN cur
			DECLARE @MaHV NVARCHAR(50), @Diem FLOAT , @MaLop VARCHAR(10)
			FETCH NEXT FROM cur INTO @MaHV, @Diem
			SET @MaLop = (SELECT dbo.LopHoc.MaLop FROM dbo.HocVien LEFT JOIN dbo.LopHoc ON LopHoc.MaLop = HocVien.MaLop WHERE MaHocVien = @MaHV)
	
			-- cập nhật tức thời sĩ số theo MaLop khi dữ liệu không đúng
			UPDATE dbo.LopHoc
			SET SiSo = dbo.fnGetCountStudentByLop(LopHoc.MaLop)

			-- Xóa các tham chiếu liên quan đến học viên này ( ko cần, vì nó thừa )
			ALTER TABLE dbo.KetQua NOCHECK CONSTRAINT ALL 
			ALTER TABLE dbo.HocVien NOCHECK CONSTRAINT ALL

				WHILE @@FETCH_STATUS = 0
					IF(@Diem < 3.5)
						BEGIN
							DELETE dbo.KetQua WHERE MaHV = @MaHV
							DELETE dbo.HocVien WHERE MaHocVien = @MaHV
							UPDATE dbo.LopHoc 
							SET SiSo -= 1
							WHERE MaLop = @MaLop  -- drop trigger trAutoUpdateCountSiSo câu 14 phần C  trước khi chạy
					
							FETCH NEXT FROM cur INTO @MaHV, @Diem
						END

			ALTER TABLE dbo.KetQua CHECK CONSTRAINT ALL 
			ALTER TABLE dbo.HocVien CHECK CONSTRAINT ALL
		CLOSE cur
		DEALLOCATE cur

		END
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
												  FROM dbo.HocVien
												  WHERE dbo.HocVien.MaLop = inserted.MaLop))
												  
				BEGIN
					RAISERROR(N'Lớp trưởng phải là học viên thuộc lớp', 16, 1)
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

-- 10. Mỗi giáo viên chỉ được quản lý tối đa ba giáo viên khác.
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
-- tức trong bản phân công phải có mã MH của cái lớp đó
SELECT * FROM dbo.PhanCong
SELECT * FROM dbo.KetQua

CREATE TRIGGER trCheckSubjectStudent ON KetQua
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
-- Dữ liệu đề bài insert vào ko đúng theo trigger
CREATE TRIGGER trSubjectTeacherTeach ON PhanCong
FOR UPDATE, INSERT
AS 
BEGIN
	IF NOT EXISTS ( SELECT MaGV, MaMH
					FROM inserted
					WHERE MaMH IN ( SELECT dbo.GiaoVien_Day_MonHoc.MaMH
									FROM dbo.GiaoVien_Day_MonHoc
									WHERE dbo.GiaoVien_Day_MonHoc.MaGV = inserted.MaGV))
			BEGIN
			    RAISERROR(N'Môn này GV không có khả năng dạy', 16, 1)
				ROLLBACK
			END				
END

-- 13. Thêm cột SoMonDaGD (số môn đã giảng dạy) vào bảng giáo viên. Quy định giá trị
-- trong cột này phải tương ứng với số môn mà giáo viên đã được phân công giảng dạy

-- Thêm cột SoMonDaGD
ALTER TABLE GiaoVien ADD SoMonDaGD INT
GO

-- trigger cho update insert
CREATE TRIGGER trAutoUpdateCountGiaoVien_InsertUpdate ON PhanCong
FOR UPDATE, INSERT
AS 
BEGIN
	-- c1 dùng bảng tạm (tối ưu hơn khi update nhưng dữ liệu chậm hơn nếu data nhiều, không đúng đề bài)
 --   SELECT dbo.PhanCong.MaGV, COUNT(DISTINCT(dbo.PhanCong.MaMH)) AS SM INTO #TEMP2
	--FROM dbo.PhanCong
	--GROUP BY dbo.PhanCong.MaGV

	--UPDATE dbo.GiaoVien
	--SET dbo.GiaoVien.SoMonDaGD = #TEMP2.SM
	--FROM #TEMP2
	--WHERE #TEMP2.MaGV = dbo.GiaoVien.MaGV

	-- c2 
	DECLARE @SM TINYINT
	DECLARE @MaGV NCHAR(10)

	SELECT @MaGV = MaGV FROM Inserted -- thiếu dòng này trigger tuổi GV sẽ đá vào đây mặc dù không biết tại sao 
	SELECT @SM = COUNT(DISTINCT(dbo.PhanCong.MaMH)) FROM dbo.PhanCong
	WHERE dbo.PhanCong.MaGV = @MaGV

	UPDATE dbo.GiaoVien
	SET dbo.GiaoVien.SoMonDaGD = @SM
	WHERE dbo.GiaoVien.MaGV = @MaGV
END
-- trigger cho delete
CREATE TRIGGER trAutoUpdateCountGiaoVien_Delete ON PhanCong
FOR DELETE
AS 
BEGIN
	DECLARE @SM TINYINT
	DECLARE @MaGV NCHAR(10)

	SELECT @MaGV = MaGV FROM Deleted
	SELECT @SM = COUNT(DISTINCT(dbo.PhanCong.MaMH)) FROM dbo.PhanCong
	WHERE dbo.PhanCong.MaGV = @MaGV

	UPDATE dbo.GiaoVien
	SET dbo.GiaoVien.SoMonDaGD = @SM
	WHERE dbo.GiaoVien.MaGV = @MaGV
END

-- function cập nhật số môn theo MaGV
CREATE FUNCTION fnGetSubjectTeacherTeach
(
	@MaGV NCHAR(10)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @SM TINYINT 
	SELECT @SM = COUNT(DISTINCT(dbo.PhanCong.MaMH)) FROM dbo.PhanCong
	WHERE dbo.PhanCong.MaGV = @MaGV
	RETURN @SM
END

-- cập nhật tức thời số môn theo MaGV, những lần sau sẽ tự động
UPDATE dbo.GiaoVien
SET SoMonDaGD = dbo.fnGetSubjectTeacherTeach(GiaoVien.MaGV)

-- (tối ưu hơn)cách kết hợp cả insert, update, delete trong 1 trigger
CREATE TRIGGER trAutoUpdateCountGiaoVien ON PhanCong
AFTER UPDATE, INSERT, DELETE
AS 
BEGIN
	DECLARE @SM TINYINT
	DECLARE @MaGV NCHAR(10)
	DECLARE @active VARCHAR(20)

	IF EXISTS (SELECT * FROM Inserted) AND EXISTS (SELECT * FROM Deleted)
		BEGIN
			SET @active = 'UPDATE'
			SELECT @MaGV = MaGV FROM Inserted
			SELECT @SM = COUNT(DISTINCT(dbo.PhanCong.MaMH)) 
			FROM dbo.PhanCong
			WHERE dbo.PhanCong.MaGV = @MaGV

			UPDATE dbo.GiaoVien
			SET dbo.GiaoVien.SoMonDaGD = @SM
			WHERE dbo.GiaoVien.MaGV = @MaGV
		END
	IF EXISTS (SELECT * FROM Inserted) AND NOT EXISTS (SELECT * FROM Deleted)
		BEGIN
			SET @active = 'INSERT'
			SELECT @MaGV = MaGV FROM Inserted
			SELECT @SM = COUNT(DISTINCT(dbo.PhanCong.MaMH)) 
			FROM dbo.PhanCong
			WHERE dbo.PhanCong.MaGV = @MaGV

			UPDATE dbo.GiaoVien
			SET dbo.GiaoVien.SoMonDaGD = @SM
			WHERE dbo.GiaoVien.MaGV = @MaGV
		END
	IF EXISTS (SELECT * FROM Deleted) AND NOT EXISTS (SELECT * FROM Inserted)
		BEGIN
			SET @active = 'DELETE'
			SELECT @MaGV = MaGV FROM Deleted
			SELECT @SM = COUNT(DISTINCT(dbo.PhanCong.MaMH)) 
			FROM dbo.PhanCong
			WHERE dbo.PhanCong.MaGV = @MaGV

			UPDATE dbo.GiaoVien
			SET dbo.GiaoVien.SoMonDaGD = @SM
			WHERE dbo.GiaoVien.MaGV = @MaGV
		END
END

-- 14. Cột sĩ số trong bảng lớp phải tương ứng với số học viên đếm được của lớp đó.

CREATE TRIGGER trAutoUpdateCountSiSo ON HocVien
AFTER INSERT, UPDATE, DELETE 
AS 
BEGIN
	DECLARE @siso TINYINT, @MaLop NCHAR(10), @active VARCHAR(20)

	IF EXISTS (SELECT * FROM Inserted) AND EXISTS (SELECT * FROM Deleted)
		BEGIN
			SET @active = 'UPDATE'
			SELECT @MaLop = MaLop FROM Inserted
			SELECT @siso = COUNT(dbo.HocVien.MaHocVien) 
			FROM dbo.HocVien
			WHERE dbo.HocVien.MaLop = @MaLop

			UPDATE dbo.LopHoc
			SET SiSo = @siso
			WHERE dbo.LopHoc.MaLop = @MaLop
		END
	IF EXISTS (SELECT * FROM Inserted) AND NOT EXISTS (SELECT * FROM Deleted)
		BEGIN
			SET @active = 'INSERT'
			SELECT @MaLop = MaLop FROM Inserted
			SELECT @siso = COUNT(dbo.HocVien.MaHocVien) 
			FROM dbo.HocVien
			WHERE dbo.HocVien.MaLop = @MaLop

			UPDATE dbo.LopHoc
			SET SiSo = @siso
			WHERE dbo.LopHoc.MaLop = @MaLop
		END
	IF EXISTS (SELECT * FROM Deleted) AND NOT EXISTS (SELECT * FROM Inserted)
		BEGIN
			SET @active = 'DELETE'
			SELECT @MaLop = MaLop FROM Deleted
			SELECT @siso = COUNT(dbo.HocVien.MaHocVien) 
			FROM dbo.HocVien
			WHERE dbo.HocVien.MaLop = @MaLop

			UPDATE dbo.LopHoc
			SET SiSo = @siso
			WHERE dbo.LopHoc.MaLop = @MaLop
		END
END

-- function cập nhật sĩ số theo MaLop 
CREATE FUNCTION fnGetCountStudentByLop
(
	@MaLop NCHAR(10)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @siso TINYINT
	SELECT @siso = COUNT(dbo.HocVien.MaHocVien) 
	FROM dbo.HocVien
	WHERE dbo.HocVien.MaLop = @MaLop
	RETURN @siso
END
-- cập nhật tức thời sĩ số theo MaLop, những lần sau sẽ tự động
UPDATE dbo.LopHoc
SET SiSo = dbo.fnGetCountStudentByLop(LopHoc.MaLop)

-- 15. Thêm cột SoMonCoTheGD (số môn có khả năng giảng dạy) vào bảng giáo viên. Quy
-- định giá trị trong cột này phải tương ứng với số môn mà giáo viên có khả năng giảng dạy

-- Thêm cột SoMonCoTheGD vào bảng giáo viên
ALTER TABLE dbo.GiaoVien ADD SoMonCoTheGD INT
GO 

CREATE TRIGGER trAutoUpdateCountSoMonCoTheGD ON dbo.GiaoVien_Day_MonHoc
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	DECLARE @SoMonCoTheGD TINYINT, @MaGV NCHAR(10), @active VARCHAR(20)
	
	IF EXISTS(SELECT * FROM Inserted) AND EXISTS(SELECT * FROM Deleted)
		BEGIN
			SET @active = 'UPDATE'
			SELECT @MaGV = MaGV FROM Inserted
			SELECT @SoMonCoTheGD = COUNT(A.MaMH) FROM dbo.GiaoVien_Day_MonHoc A
			WHERE A.MaGV = @MaGV

			UPDATE dbo.GiaoVien
			SET SoMonCoTheGD = @SoMonCoTheGD
			WHERE dbo.GiaoVien.MaGV = @MaGV
		END
	IF EXISTS(SELECT * FROM Inserted) AND NOT EXISTS(SELECT * FROM Deleted)
		BEGIN
			SET @active = 'INSERT'
			SELECT @MaGV = MaGV FROM Inserted
			SELECT @SoMonCoTheGD = COUNT(A.MaMH) FROM dbo.GiaoVien_Day_MonHoc A
			WHERE A.MaGV = @MaGV

			UPDATE dbo.GiaoVien
			SET SoMonCoTheGD = @SoMonCoTheGD
			WHERE dbo.GiaoVien.MaGV = @MaGV
		END
	IF EXISTS(SELECT * FROM Deleted) AND NOT EXISTS(SELECT * FROM Inserted)
		BEGIN
			SET @active = 'DELETE'
			SELECT @MaGV = MaGV FROM Deleted
			SELECT @SoMonCoTheGD = COUNT(A.MaMH) FROM dbo.GiaoVien_Day_MonHoc A
			WHERE A.MaGV = @MaGV

			UPDATE dbo.GiaoVien
			SET SoMonCoTheGD = @SoMonCoTheGD
			WHERE dbo.GiaoVien.MaGV = @MaGV
		END
END

-- function cập nhật SoMonCoTheGD theo MaGV
CREATE FUNCTION fnGetCountSoMonCoTheGD
(
	@MaGV NCHAR(10)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @SoMonCoTheGD TINYINT
	SELECT @SoMonCoTheGD = COUNT(A.MaMH) FROM dbo.GiaoVien_Day_MonHoc A
	WHERE a.MaGV = @MaGV
	RETURN @SoMonCoTheGD
END

-- cập nhật tức thời SoMonCoTheGD theo MaGV, những lần sau sẽ tự động
UPDATE dbo.GiaoVien
SET SoMonCoTheGD = dbo.fnGetCountSoMonCoTheGD(GiaoVien.MaGV)

-- 16. Thêm cột số tín chỉ đạt được vào bảng học viên. Quy định giá trị trong cột này phải
-- tương ứng với số tín chỉ mà học viên đã đạt được.
ALTER TABLE dbo.HocVien ADD SoTinChi_Dat TINYINT
GO

-- Lấy ra cột điểm mà lần thi cuối trên 5 => số chỉ thỏa theo đề bài ban đầu
-- chưa tính cho trường hợp trường cho lấy điểm cao nhất lần 1 nếu lần 2 bé hơn
-- vd lần 2 thi được 3, lần 1 thi được 4

-- Tạo function Số Tín thỏa theo kết quả tái sử dụng trong trigger 3 lần
CREATE FUNCTION fnSoChiThoa
(
	@MaHV NCHAR(10)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @SoChiThoa TINYINT
	SELECT @SoChiThoa = SUM(SoChi) FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN 
	(
	SELECT dbo.KetQua.MaMonHoc, MAX(dbo.KetQua.LanThi) AS 'Lần Thi Cuối' FROM dbo.KetQua
	WHERE dbo.KetQua.MaHV = @MaHV	
	GROUP BY dbo.KetQua.MaMonHoc
	) tb2 ON  tb2.MaMonHoc = KetQua.MaMonHoc
	WHERE dbo.KetQua.MaHV = @MaHV
	AND tb2.[Lần Thi Cuối] = dbo.KetQua.LanThi
	AND Diem >= 5
	RETURN @SoChiThoa
END
SELECT dbo.fnSoChiThoa('HV000010')

CREATE TRIGGER trAutoUpdateSumSoTinThoa ON dbo.KetQua
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @SoChiThoa INT, @MaHV NCHAR(10), @active VARCHAR(20)
	
	IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
		BEGIN
			SET @active = 'UPDATE'
			SELECT @MaHV = MaHV FROM inserted
			SELECT @SoChiThoa = dbo.fnSoChiThoa(KetQua.MaHV)
			FROM dbo.KetQua
			WHERE MaHV = @MaHV

			UPDATE dbo.HocVien
			SET SoTinChi_Dat = @SoChiThoa
			WHERE dbo.HocVien.MaHocVien = @MaHV
		END
	IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
		BEGIN
			SET @active = 'INSERT'
			SELECT @MaHV = MaHV FROM inserted
			SELECT @SoChiThoa = dbo.fnSoChiThoa(KetQua.MaHV)
			FROM dbo.KetQua
			WHERE MaHV = @MaHV

			UPDATE dbo.HocVien
			SET SoTinChi_Dat = @SoChiThoa
			WHERE dbo.HocVien.MaHocVien = @MaHV
		END
	IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
		BEGIN
			SET @active = 'DELETE'
			SELECT @MaHV = MaHV FROM deleted
			SELECT @SoChiThoa = dbo.fnSoChiThoa(KetQua.MaHV)
			FROM dbo.KetQua
			WHERE MaHV = @MaHV

			UPDATE dbo.HocVien
			SET SoTinChi_Dat = @SoChiThoa
			WHERE dbo.HocVien.MaHocVien = @MaHV
		END
END

-- update cho lần chạy đầu tiên
UPDATE dbo.HocVien
SET SoTinChi_Dat = dbo.fnSoChiThoa(HocVien.MaHocVien)

-- 17. Thêm cột điểm trung bình vào bảng học viên. Quy định giá trị trong cột này phải tương
-- ứng với điểm trung bình của học viên.

ALTER TABLE dbo.HocVien ADD Diem_TB FLOAT	
GO

CREATE TRIGGER trAutoUpdateDTB ON dbo.KetQua
AFTER INSERT, UPDATE, DELETE
AS	
BEGIN
	DECLARE @MaHV NCHAR(10), @DTB FLOAT, @active VARCHAR(20)

	IF EXISTS(SELECT * FROM Inserted) AND EXISTS(SELECT * FROM Deleted)
		BEGIN
			SET @active = 'UPDATE'
			SELECT @MaHV = Inserted.MaHV FROM Inserted
			SELECT @DTB = dbo.fnAvgStudent(TenHocVien)
			FROM dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.KetQua.MaHV = @MaHV

			UPDATE dbo.HocVien
			SET Diem_TB = @DTB
			WHERE dbo.HocVien.MaHocVien = @MaHV
		END
	IF EXISTS(SELECT * FROM Inserted) AND NOT EXISTS(SELECT * FROM Deleted)
		BEGIN
			SET @active = 'INSERT'
			SELECT @MaHV = Inserted.MaHV FROM Inserted
			SELECT @DTB = dbo.fnAvgStudent(TenHocVien)
			FROM dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.KetQua.MaHV = @MaHV

			UPDATE dbo.HocVien
			SET Diem_TB = @DTB
			WHERE dbo.HocVien.MaHocVien = @MaHV
		END
	IF EXISTS(SELECT * FROM Deleted) AND NOT EXISTS(SELECT * FROM Inserted)
		BEGIN
			SET @active = 'DELETE'
			SELECT @MaHV = Deleted.MaHV FROM Deleted
			SELECT @DTB = dbo.fnAvgStudent(TenHocVien)
			FROM dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.KetQua.MaHV = @MaHV

			UPDATE dbo.HocVien
			SET Diem_TB = @DTB
			WHERE dbo.HocVien.MaHocVien = @MaHV
		END
END
--SELECT dbo.fnAvgStudent (N'Nguyễn Bình Minh')
-- update cho lần chạy đầu tiên
UPDATE dbo.HocVien
SET Diem_TB = dbo.fnAvgStudent(dbo.HocVien.TenHocVien)

--18. Thêm cột xếp loại vào bảng học viên. Quy định giá trị của cột này như sau:
--ĐTB < 5 Loại yếu
--ĐTB = 5 Loại TB
--5 < ĐTB <= 6.5 Loại TB khá
--6.5 < ĐTB < 8 Loại khá
--8 <= ĐTB < 9 Loại giỏi
--9 <= ĐTB <= 10 Loại xuất sắc

ALTER TABLE dbo.HocVien ADD Xep_Loai NVARCHAR(20)
GO

-- function xuất ra học lực từ fnAvgStudent đã làm dựa vào MaHV
CREATE FUNCTION fnXepLoai
(
	@MaHV NCHAR(10)
)
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @DTB FLOAT, @XL NVARCHAR(20)
	SELECT @DTB = dbo.fnAvgStudent(TenHocVien) FROM dbo.KetQua
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	WHERE MaHocVien = @MaHV

	SET @XL = IIF(@DTB BETWEEN 9 AND 10, N'xuất sắc',
				IIF(@DTB < 9 AND @DTB >= 8, N'giỏi',
				IIF(@DTB < 8 AND @DTB > 6.5, N'khá',
				IIF(@DTB <= 6.5 AND @DTB > 5, N'TB khá',
				IIF(@DTB = 5, N'TB', N'Yếu')))))
	RETURN @XL			
END
SELECT dbo.fnXepLoai('HV000002')

CREATE TRIGGER trSetHocLucByDTB ON dbo.KetQua
AFTER INSERT, UPDATE, DELETE 
AS
BEGIN
	DECLARE @MaHV NCHAR(10), @XL NVARCHAR(20), @active VARCHAR(20)
	
	IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
		BEGIN
			SET @active = 'UPDATE'
			SELECT @MaHV = MaHV FROM inserted
			SELECT @XL = dbo.fnXepLoai(dbo.KetQua.MaHV) from dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.KetQua.MaHV = @MaHV

			UPDATE dbo.HocVien
			SET Xep_Loai = @XL
			WHERE MaHocVien = @MaHV
		END	
	IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
		BEGIN
			SET @active = 'INSERT'
			SELECT @MaHV = MaHV FROM inserted
			SELECT @XL = dbo.fnXepLoai(dbo.KetQua.MaHV) from dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.KetQua.MaHV = @MaHV

			UPDATE dbo.HocVien
			SET Xep_Loai = @XL
			WHERE MaHocVien = @MaHV
		END	
	IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			SET @active = 'DELETE'
			SELECT @MaHV = MaHV FROM deleted
			SELECT @XL = dbo.fnXepLoai(dbo.KetQua.MaHV) from dbo.KetQua
			LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
			WHERE dbo.KetQua.MaHV = @MaHV

			UPDATE dbo.HocVien
			SET Xep_Loai = @XL
			WHERE MaHocVien = @MaHV
		END	
END
-- update cho lần chạy đầu tiên
UPDATE dbo.HocVien
SET Xep_Loai = dbo.fnXepLoai(dbo.HocVien.MaHocVien)

/*
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
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- G. ÔN TẬP TRIGGER
-- 1, 2, 3, 4, 7 trigger giống phần F

ALTER TABLE dbo.HocVien
ADD CONSTRAINT CheckTinhTrang CHECK (TinhTrang IN (N'Đang học', N'Buộc thôi học', N'Đã tốt nghiệp'))

--5. Một giáo viên không được tự quản lý họ.
CREATE TRIGGER trCheckTrungGV ON GiaoVien
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @MaGVQuanLi NCHAR(10)
	SELECT @MaGVQuanLi = MaGVQuanLi FROM inserted

	IF EXISTS ( SELECT *
				FROM inserted LEFT JOIN dbo.GiaoVien ON dbo.GiaoVien.MaGV = inserted.MaGV
				WHERE @MaGVQuanLi = dbo.GiaoVien.MaGV)
			BEGIN
				RAISERROR('GV không thể tự quản lí mình', 16, 1)
				ROLLBACK
			END						
END

--6. Tất cả mã giáo viên đều bắt đầu bằng GV.
CREATE TRIGGER trCheckMaGV ON GiaoVien
FOR INSERT, UPDATE 
AS 
BEGIN
	DECLARE @MaGV NCHAR(10)
	SELECT @MaGV = MaGV FROM inserted
	IF EXISTS ( SELECT * FROM inserted
					LEFT JOIN dbo.GiaoVien ON dbo.GiaoVien.MaGV = inserted.MaGV
					WHERE @MaGV NOT LIKE 'GV%') -- chưa tối ưu in hoa được
			BEGIN
				RAISERROR('Mã GV phải bắt đầu bằng [GV]', 16, 1)
				ROLLBACK
			END
END

--7.(tự nghĩ ra) Nếu sv thi lần 1 đậu rồi thì không được thi tiếp lần 2, chỉ khi điểm lần 1 nhỏ thì lần 2 chấp nhận
CREATE TRIGGER trCheckLanThiHopLi ON KetQua
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @1 FLOAT, @2 FLOAT
	DECLARE @MaHV VARCHAR(10), @MaMH VARCHAR(10)
	SELECT @MaHV = (SELECT MaHV FROM inserted)
	SELECT @MaMH = (SELECT MaMonHoc FROM inserted)

	SELECT @1 = (SELECT dbo.KetQua.Diem
				 FROM dbo.KetQua
				 WHERE LanThi = 1
				 AND Diem >= 5
				 AND dbo.KetQua.MaHV = @MaHV AND dbo.KetQua.MaMonHoc = @MaMH)

	SELECT @2 = (SELECT dbo.KetQua.Diem 
				 FROM dbo.KetQua
				 WHERE LanThi = 2
				  AND dbo.KetQua.MaHV = @MaHV AND dbo.KetQua.MaMonHoc = @MaMH)
	IF(@2 <= @1 OR @2 > @1)
		BEGIN
			RAISERROR('SV đã thi đậu', 16, 1)
			ROLLBACK
		END

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- D. BÀI TẬP CURSOR
--1. Làm lại câu 6 ở phần A nhưng dùng lệnh print để xuất kết quả ra màn hình.
/*
--procedure từ câu 6
CREATE PROC spPrintListNameTeacher
AS
BEGIN

	SELECT dbo.GiaoVien.TenGV , COUNT(dbo.GiaoVien_Day_MonHoc.MaMH) AS [Số môn dạy] 
	FROM dbo.GiaoVien
	LEFT JOIN dbo.GiaoVien_Day_MonHoc ON GiaoVien_Day_MonHoc.MaGV = GiaoVien.MaGV
	GROUP BY TenGV

END
spPrintListNameTeacher
*/
-- Tái sử dung procedure spPrintListNameTeacher vào function nhưng sql không cho
-- Tạo function trả ra bảng
CREATE FUNCTION fnForCurCau1
(
)
RETURNS TABLE 
RETURN 
	SELECT dbo.GiaoVien.TenGV , COUNT(dbo.GiaoVien_Day_MonHoc.MaMH) AS [Số môn dạy] 
	FROM dbo.GiaoVien
	LEFT JOIN dbo.GiaoVien_Day_MonHoc ON GiaoVien_Day_MonHoc.MaGV = GiaoVien.MaGV
	GROUP BY TenGV
--SELECT * FROM dbo.fnForCurCau1()
CREATE PROC spCurCau1
AS
BEGIN
		DECLARE cur CURSOR FOR SELECT * FROM dbo.fnForCurCau1()
		OPEN cur

		DECLARE @TenGV NVARCHAR(30), @SoMonDay TINYINT
		FETCH NEXT FROM cur INTO @TenGV, @SoMonDay
		WHILE @@FETCH_STATUS = 0
			BEGIN
				PRINT N'Tên GV     : ' + @TenGV +CHAR(10)+ N'Số môn dạy : '+CAST(@SoMonDay AS VARCHAR)
				PRINT '-------------------------------'
				FETCH NEXT FROM cur INTO @TenGV, @SoMonDay
			END
		CLOSE cur
		DEALLOCATE cur
END 
--2. Nhập vào một mã giáo viên, xuất ra tên giáo viên, danh sách tên các môn giáo viên
-- giảng dạy cùng số lần dạy theo định dạng
																																																																					/*
**Tên giáo viên : Trịnh Hoài An
**Danh sách các môn được phân công giảng dạy
******1. Cấu trúc dữ liệu : 3 lần
******2. Cơ sở dữ liệu : 5 lần
																																																																																																																																																												*/
CREATE PROC spCurCau2
( 
	@MaGV VARCHAR(10)
)
AS
BEGIN
	-- hoặc @@CURSOR_ROWS = 0
	IF NOT EXISTS (SELECT 1 FROM dbo.PhanCong WHERE MaGV = @MaGV)
		BEGIN
			PRINT N'GV này chưa dạy môn nào'
			RETURN 
		END
	ELSE 
		BEGIN
			
		
			DECLARE cur CURSOR FOR
									SELECT dbo.GiaoVien.TenGV, dbo.MonHoc.TenMonHoc, COUNT(dbo.PhanCong.MaMH) AS 'Số lần dạy' FROM dbo.GiaoVien
									LEFT JOIN dbo.PhanCong ON PhanCong.MaGV = GiaoVien.MaGV
									LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = PhanCong.MaMH
									WHERE dbo.GiaoVien.MaGV = @MaGV
									GROUP BY dbo.GiaoVien.TenGV, TenMonHoc 
									--ORDER BY TenGV
			OPEN cur

			DECLARE @TenGV NVARCHAR(30), @TenMonDay NVARCHAR(50), @Count_LanDay VARCHAR(5), @i VARCHAR(5) = 0
			FETCH NEXT FROM cur INTO @TenGV, @TenMonDay, @Count_LanDay
			
				PRINT N'**Tên giáo viên : '+@TenGV+CHAR(10)
				+ N'**Danh sách các môn được phân công giảng dạy'
				WHILE @@FETCH_STATUS = 0
					
					BEGIN
						SET @i += 1
						PRINT  '******'+@i+'. '+@TenMonDay+ ' : '+@Count_LanDay+ N' lần'
						FETCH NEXT FROM cur INTO @TenGV, @TenMonDay, @Count_LanDay
					END

			CLOSE cur
			DEALLOCATE cur
		END
END
spCurCau2 'GV00006'

--3. Nhập vào một mã môn, xuất ra thông tin môn (tên môn, số tín chỉ) cùng danh sách các
-- học viên đã từng thi đậu môn này theo định dạng
																																																																					/*
**Môn : Cấu trúc dữ liệu
**Số tín chỉ : 4 tín chỉ
**Danh sách học viên thi đậu
******1. Lê Thanh Tùng
******2. Trịnh Ngọc Thanh
																																																																																																																																																												*/
CREATE PROC spCurCau3
(
	@MaMH VARCHAR(10)
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM dbo.KetQua WHERE dbo.KetQua.MaMonHoc = @MaMH)
		BEGIN
			PRINT N'Chưa có dữ liệu môn này'
			RETURN 
		END
	ELSE	
		BEGIN
			DECLARE cur CURSOR FOR 
						SELECT dbo.MonHoc.TenMonHoc, SoChi, TenHocVien FROM dbo.MonHoc
						LEFT JOIN dbo.KetQua ON KetQua.MaMonHoc = MonHoc.MaMonHoc
						LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
						WHERE dbo.MonHoc.MaMonHoc = @MaMH
						AND Diem >= 5
			OPEN cur
				DECLARE @TenMH NVARCHAR(50), @SoChi VARCHAR(5), @TenHV NVARCHAR(50), @i VARCHAR(5) = 0
				FETCH NEXT FROM cur INTO @TenMH, @SoChi, @TenHV

				PRINT N'**Môn : ' +@TenMH+CHAR(10)+ N'**Số chỉ : '+@SoChi + N' tín chỉ'+CHAR(10)
				+N'**Danh sách học viên thi đậu'
				WHILE @@FETCH_STATUS = 0
					BEGIN
						SET @i += 1
						PRINT '******'+@i + '. '+@TenHV
						FETCH NEXT FROM cur INTO @TenHV, @SoChi, @TenHV
					END 
			CLOSE cur
			DEALLOCATE cur
		END
END
spCurCau3 'MH00004'

--4. Nhập vào mã lớp, xuất ra thông tin lớp (mã lớp, tên lớp trưởng) cùng danh sách các học
-- viên của lớp (họ tên học viên và điểm trung bình) theo định dạng
																																																																					/*
**Lớp : LH000001
**Lớp trưởng : Lê Thanh Tùng
**Danh sách học viên
******1. Lê Thanh Tùng : 7.52
******2. Trịnh Ngọc Thanh : 2.15																																																																																																																																																												*/
-- function lấy ra tên lớp trưởng từ MaLop
CREATE FUNCTION fnLopTruongOfLop
(
	@MaLop NCHAR(10)
)
RETURNS NVARCHAR(30)
AS
BEGIN
	DECLARE @TenLT NVARCHAR(30)
	SELECT @TenLT = dbo.HocVien.TenHocVien FROM dbo.HocVien
	LEFT JOIN dbo.LopHoc ON LopHoc.LopTruong = dbo.HocVien.MaHocVien
	WHERE dbo.LopHoc.MaLop = @MaLop

	RETURN @TenLT
END
SELECT dbo.fnLopTruongOfLop('LH000004')

CREATE PROC spCurCau4
(
	@MaLopHoc VARCHAR(10)
)
AS
BEGIN
	IF NOT EXISTS( SELECT 1 FROM dbo.LopHoc WHERE MaLop = @MaLopHoc)
		BEGIN
			PRINT N'Lớp này chưa có'
			RETURN
		END
	DECLARE cur CURSOR FOR  
						SELECT DISTINCT(dbo.HocVien.TenHocVien), dbo.fnAvgStudent(dbo.HocVien.TenHocVien), HocVien.MaLop, dbo.fnLopTruongOfLop(LopHoc.MaLop) FROM dbo.HocVien
						LEFT JOIN dbo.LopHoc ON LopHoc.MaLop = HocVien.MaLop
						LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
						WHERE HocVien.MaLop = @MaLopHoc
	OPEN cur
		DECLARE @TenHV NVARCHAR(50), @DTB FLOAT, @MaLop VARCHAR(10), @TenLT NVARCHAR(50), @i VARCHAR(5) = 0
		FETCH NEXT FROM cur INTO @TenHV, @DTB, @MaLop, @TenLT

		PRINT N'**Lớp : '+@MaLop+CHAR(10)+N'**Lớp trưởng : '+@TenLT+CHAR(10)+N'**Danh sách học viên'
		WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @i += 1
				PRINT '******'+@i+'. '+@TenHV+' : '+CAST(@DTB AS VARCHAR)
				FETCH NEXT FROM cur INTO @TenHV, @DTB, @MaLop, @TenLT
			END
	CLOSE cur
	DEALLOCATE cur
END
spCurCau4 'LH000004'

--5. Nhập vào mã học viên xuất ra bảng điểm theo đinh dạng.
																																																																					/*
**Họ tên : Lê Thanh Tùng
**Lớp : LH000001
**Kết quả học tập
----------------------------------------------------
STT			Môn học			Số tín chỉ			Điểm
 1		Cấu trúc dữ liệu		5				7.5
 2		Cơ sở dữ liệu			5				10
																																																																																																																																																												*/
-- function lấy ra điểm của môn (lần thi sau cùng) từ MaHV, MaMH
CREATE FUNCTION fnGetDiemLTCuoi
(
	@MaHV VARCHAR(10),
	@MaMH VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @KQ FLOAT 
	SELECT  @KQ = dbo.KetQua.Diem FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN (SELECT dbo.KetQua.MaMonHoc, MAX(dbo.KetQua.LanThi) [LT cuối] FROM dbo.KetQua
				LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
				WHERE MaHV = @MaHV
				AND dbo.KetQua.MaMonHoc = @MaMH
				GROUP BY dbo.KetQua.MaMonHoc) tb2 ON tb2.MaMonHoc = KetQua.MaMonHoc 
	WHERE tb2.[LT cuối] = dbo.KetQua.LanThi
	AND dbo.KetQua.MaHV =  @MaHV --'HV000010'
	AND dbo.KetQua.MaMonHoc = @MaMH --'MH00010'
	RETURN @KQ
END  
SELECT dbo.fnGetDiemLTCuoi('HV000010', 'MH00010')

--
CREATE PROC spCurCau5
(
	@MaHV VARCHAR(10)
)
AS
BEGIN
	DECLARE cur CURSOR FOR 
						SELECT DISTINCT dbo.HocVien.TenHocVien, dbo.HocVien.MaLop, dbo.MonHoc.TenMonHoc, SoChi, dbo.fnGetDiemLTCuoi(KetQua.MaHV, dbo.KetQua.MaMonHoc) FROM dbo.HocVien
						LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
						LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
						WHERE MaHocVien = @MaHV--'HV000001'
	OPEN cur
		DECLARE @TenHV NVARCHAR(50), @MaLop VARCHAR(10), @TenMH NVARCHAR(50), @SoChi CHAR(2), @Diem FLOAT, @i VARCHAR(5) = 0
		FETCH NEXT FROM cur INTO @TenHV, @MaLop, @TenMH, @SoChi, @Diem

		PRINT N'**Họ tên          : '+@TenHV+CHAR(10)+ N'**Lớp             : '+@MaLop+CHAR(10)+ N'**Kết quả học tập'+CHAR(10)+'----------------------------------------------------------------'
		PRINT N'STT			Môn học						     Số tín chỉ		Điểm'+CHAR(10)

		IF @@CURSOR_ROWS = 0
		 BEGIN
	 		PRINT 'Sinh viên chưa học môn nào'
			RETURN 
		 END
		WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @i += 1
				PRINT @i+'		'+@TenMH+'		   				 '+@SoChi+'		      '+CAST(@Diem AS VARCHAR(5))
				FETCH NEXT FROM cur INTO @TenHV, @MaLop, @TenMH, @SoChi, @Diem
			END
	CLOSE cur
	DEALLOCATE cur
END
spCurCau5 'HV000001'

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- E. BÀI TẬP FUNCTION
--1. Nhập vào tên một học viên cho biết tuổi của học viên này
CREATE FUNCTION fnTuoiHV
(
	@TenHV NVARCHAR(30)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @Tuoi TINYINT
		SELECT @Tuoi = YEAR(GETDATE()) - YEAR(dbo.HocVien.NgaySinh) FROM dbo.HocVien
		WHERE TenHocVien = @TenHV
		RETURN @Tuoi
END
SELECT dbo.fnTuoiHV(N'Nguyễn Thùy Linh')

--2. Nhập vào tên một học viên cho biết số môn học viên này đã từng thi rớt

CREATE FUNCTION fnCountMonRot
(
	@TenHV NVARCHAR(50)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @count TINYINT
    SELECT @count = COUNT(dbo.MonHoc.MaMonHoc) FROM dbo.KetQua
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	WHERE TenHocVien = @TenHV
	AND Diem < 5
	AND LanThi = 1

	RETURN @count
END
SELECT dbo.fnCountMonRot(N'Nguyễn Bình Minh')

--3. Nhập vào một mã lớp, một tên giáo viên. Cho biết số môn mà giáo viên từng dạy cho lớp này
CREATE FUNCTION fnCountSoMonGVDay
(
	@MaLop VARCHAR(10),
	@TenGV NVARCHAR(50)
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @Count TINYINT
	
		SELECT @Count = COUNT(dbo.PhanCong.MaMH) FROM dbo.PhanCong
		LEFT JOIN dbo.GiaoVien ON GiaoVien.MaGV = PhanCong.MaGV
		WHERE dbo.PhanCong.MaLop = @MaLop AND dbo.GiaoVien.TenGV = @TenGV

	RETURN CAST(@Count AS VARCHAR) 
END
SELECT dbo.fnCountSoMonGVDay('LH000004', N'Nguyễn Thị Linh')

--4. Nhập vào một mã học viên, cho biết điểm trung bình của học viên.
CREATE FUNCTION fnGetDTB_HocVien
(
	@MaHV VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @KQ FLOAT 

    SELECT @KQ = dbo.fnAvgStudent(TenHocVien) FROM dbo.KetQua
	LEFT JOIN dbo.HocVien ON HocVien.MaHocVien = KetQua.MaHV
	WHERE MaHocVien = @MaHV

	RETURN @KQ
END
SELECT dbo.fnGetDTB_HocVien('HV000002')

--5. Nhập vào một tên môn học, cho biết danh sách các học viên (mã học viên, tên học viên,
-- ngày sinh) đã đậu môn này. Học viên đậu khi điểm lần thi sau cùng >= 5.
CREATE FUNCTION fnList_HocVien
(
	@TenMH NVARCHAR(50)
)
RETURNS TABLE
RETURN 
		SELECT dbo.HocVien.MaHocVien, TenHocVien, NgaySinh FROM dbo.HocVien 
		LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
		LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
		LEFT JOIN 
					( SELECT dbo.KetQua.MaHV, MAX(dbo.KetQua.LanThi) [Lần thi cuối] FROM dbo.KetQua
					  LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
					  WHERE TenMonHoc = @TenMH	   
					  GROUP BY MaHV) tb2 ON tb2.MaHV = HocVien.MaHocVien
		WHERE tb2.[Lần thi cuối] = dbo.KetQua.LanThi
		AND TenMonHoc = @TenMH
		AND Diem >= 5

-- SELECT * FROM dbo.fnList_HocVien(N'Khai thác dữ liệu')

--6. Nhập vào tên môn, cho biết danh sách các giáo viên (mã gv, họ tên, tuổi) đã từng giảng dạy môn này nhiều hơn một lần.	

CREATE FUNCTION fnListGV_TungGiangNhieuHon1Lan
(
	@TenMH NVARCHAR(50)
)
RETURNS TABLE 
RETURN 
		SELECT DISTINCT(dbo.GiaoVien.MaGV), dbo.GiaoVien.TenGV, YEAR(GETDATE())-YEAR(NgaySinh) [Tuổi] /*, a.[Dạy > 1 lần]*/ FROM dbo.GiaoVien
		LEFT JOIN dbo.PhanCong ON PhanCong.MaGV = GiaoVien.MaGV
		LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = PhanCong.MaMH
		RIGHT JOIN 
		-- right kết vùng phải chỉ lấy người từng giảng hơn 1

					( SELECT dbo.PhanCong.MaGV, COUNT(dbo.PhanCong.MaMH) [Dạy > 1 lần] FROM dbo.GiaoVien
					  LEFT JOIN dbo.PhanCong ON PhanCong.MaGV = GiaoVien.MaGV	
					  LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = PhanCong.MaMH
					  WHERE TenMonHoc = @TenMH
					  GROUP BY PhanCong.MaGV	
					  HAVING COUNT(dbo.PhanCong.MaMH) > 1) a ON a.MaGV = GiaoVien.MaGV

		WHERE TenMonHoc = @TenMH

-- SELECT * FROM dbo.fnListGV_TungGiangNhieuHon1Lan(N'Khai thác dữ liệu')

--7. Nhập vào một mã lớp. Cho biết thông tin các giáo viên (mã gv, họ tên, số môn có khả
-- năng giảng dạy) đã từng được phân công giảng dạy cho lớp này.	
CREATE FUNCTION fnThongTinGV_PhanCong
(
	@MaLop VARCHAR(10)
)
RETURNS TABLE 
RETURN 
		SELECT dbo.PhanCong.MaGV, dbo.GiaoVien.TenGV, COUNT(DISTINCT(dbo.GiaoVien_Day_MonHoc.MaMH)) [Số môn có khả năng dạy] FROM dbo.GiaoVien_Day_MonHoc
		LEFT JOIN dbo.PhanCong ON PhanCong.MaGV = GiaoVien_Day_MonHoc.MaGV
		LEFT JOIN dbo.GiaoVien ON GiaoVien.MaGV = GiaoVien_Day_MonHoc.MaGV
		WHERE dbo.GiaoVien_Day_MonHoc.MaGV IN ( SELECT dbo.PhanCong.MaGV
												FROM dbo.PhanCong
												LEFT JOIN dbo.LopHoc ON	LopHoc.MaLop = PhanCong.MaLop
												WHERE LopHoc.MaLop = @MaLop)
		GROUP BY dbo.PhanCong.MaGV,TenGV
-- SELECT * FROM dbo.fnThongTinGV_PhanCong('LH000002')

--8. Xuất ra tên học viên từng thi rớt môn 'Cơ sở dữ liệu' nhiều lần nhất.
-- nhưng thực tế rớt đúng 2 lần là nhiều và học lại luôn
-- test nhập giả sv1 rớt lần 1, sv2 rớt lần 3, select TOP 3 vì có thể rớt chung 1 lần hoặc 2 
CREATE FUNCTION fnPrintHV_ThiRot_N_Lan()
RETURNS TABLE 
RETURN 
		SELECT DISTINCT TOP 3 dbo.HocVien.TenHocVien, COUNT(LanThi) [Số lần rớt] FROM dbo.HocVien
		LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
		LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc

		RIGHT JOIN (SELECT dbo.KetQua.MaMonHoc, COUNT(LanThi) [Số lần rớt] FROM dbo.KetQua
					LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
					WHERE TenMonHoc = N'Cơ sở dữ liệu' AND Diem < 5
					GROUP BY dbo.KetQua.MaMonHoc
					HAVING COUNT(LanThi) > 1) tb2 ON tb2.MaMonHoc = KetQua.MaMonHoc

		WHERE TenMonHoc = N'Cơ sở dữ liệu' AND Diem < 5
		GROUP BY TenHocVien
		ORDER BY [Số lần rớt] DESC
-- SELECT * FROM dbo.fnPrintHV_ThiRot_N_Lan()

--9. Nhập vào một mã lớp. Trong số các giáo viên từng dạy cho lớp này, cho biết họ tên giáo
-- viên lớn tuổi nhất.
-- 2 GV trùng tuổi nhưng hàm tính chính xác ra cả tháng nên lấy top 1 thay vì trả ra bảng như bài 8
CREATE FUNCTION fnPrintGVTuoiLonNhat
(
	@MaLop VARCHAR(10)
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @TenGV NVARCHAR(50)
		SELECT TOP 1 @TenGV =  dbo.GiaoVien.TenGV FROM dbo.GiaoVien
		LEFT JOIN dbo.PhanCong ON PhanCong.MaGV = GiaoVien.MaGV

		RIGHT JOIN	(SELECT dbo.GiaoVien.MaGV, TenGV, YEAR(GETDATE())-YEAR(NgaySinh) [Tuổi] FROM dbo.GiaoVien
					LEFT JOIN dbo.PhanCong ON PhanCong.MaGV = GiaoVien.MaGV
					WHERE dbo.PhanCong.MaLop = @MaLop) tb2 ON tb2.MaGV = GiaoVien.MaGV

		WHERE dbo.PhanCong.MaLop = @MaLop
		ORDER BY [Tuổi] DESC
		RETURN @TenGV
END
SELECT dbo.fnPrintGVTuoiLonNhat('LH000004')

--10. Nhập vào một tên môn học. Trong số các học viên từng thi rớt môn này, cho biết họ tên học viên nhỏ tuổi nhất.
CREATE FUNCTION fnHocVienTungRotMH
(
	@TenMH NVARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @KQ NVARCHAR(50)

	SELECT DISTINCT @KQ = TenHocVien FROM dbo.HocVien
	LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
	LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
	RIGHT JOIN	
			(SELECT DISTINCT TOP 1 dbo.HocVien.MaHocVien, YEAR(GETDATE()) - YEAR(NgaySinh) [Số tuổi] FROM dbo.HocVien
			LEFT JOIN dbo.KetQua ON KetQua.MaHV = HocVien.MaHocVien
			LEFT JOIN dbo.MonHoc ON MonHoc.MaMonHoc = KetQua.MaMonHoc
			WHERE TenMonHoc = @TenMH
			AND Diem < 5 AND LanThi = 1
			ORDER BY [Số tuổi]) tb2 ON tb2.MaHocVien = KetQua.MaHV

	WHERE TenMonHoc = @TenMH--N'Khai thác dữ liệu'
	RETURN @KQ
END
SELECT dbo.fnHocVienTungRotMH(N'Khai thác dữ liệu')
