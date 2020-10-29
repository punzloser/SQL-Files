CREATE DATABASE Quan_Ly_Sinh_Vien
GO
USE Quan_Ly_Sinh_Vien
GO

CREATE TABLE Khoa
(
	Ma_Khoa VARCHAR(10) PRIMARY KEY,
	Ten_Khoa NVARCHAR(100),
	Nam_Thanh_Lap INT 
)
GO

CREATE TABLE Khoa_Hoc
(
	Ma_Khoa_Hoc VARCHAR(10) PRIMARY KEY,
	Nam_Bat_Dau INT,
	Nam_Ket_Thuc INT 
)
GO

CREATE TABLE Chuong_Trinh_Hoc
(
	Ma_CT VARCHAR(10) PRIMARY KEY,
	Ten_CT NVARCHAR(100)
)
GO

CREATE TABLE Lop
(
	Ma_Lop VARCHAR(10) PRIMARY KEY,
	Ma_Khoa VARCHAR(10) NOT NULL,
	Ma_Khoa_Hoc VARCHAR(10) NOT NULL,
	Ma_CT VARCHAR(10) NOT NULL,
	STT INT 

	FOREIGN KEY(Ma_Khoa) REFERENCES dbo.Khoa(Ma_Khoa),
	FOREIGN KEY(Ma_Khoa_Hoc) REFERENCES dbo.Khoa_Hoc(Ma_Khoa_Hoc),
	FOREIGN KEY(Ma_CT) REFERENCES dbo.Chuong_Trinh_Hoc(Ma_CT)
)
GO

CREATE TABLE Sinh_Vien
(
	MaSV VARCHAR(10) PRIMARY KEY,
	Ho_Ten NVARCHAR(100),
	Nam_Sinh INT,
	Dan_Toc NVARCHAR(20),
	MaLop VARCHAR(10) NOT NULL

	FOREIGN KEY(MaLop) REFERENCES dbo.Lop(Ma_Lop)
)
GO

CREATE TABLE Mon_Hoc
(
	MaMH VARCHAR(10) PRIMARY KEY,
	Ma_Khoa VARCHAR(10) NOT NULL,
	TenMH NVARCHAR(100)

	FOREIGN KEY(Ma_Khoa) REFERENCES dbo.Khoa(Ma_Khoa)
)
GO

CREATE TABLE Ket_Qua
(
	MaSV VARCHAR(10) NOT NULL,
	MaMH VARCHAR(10) NOT NULL,
	Lan_Thi INT NOT NULL,
	Diem FLOAT

	PRIMARY KEY(MaSV, MaMH, Lan_Thi)
    
	FOREIGN KEY(MaSV) REFERENCES dbo.Sinh_Vien(MaSV),
	FOREIGN KEY(MaMH) REFERENCES dbo.Mon_Hoc(MaMH)
)
GO

CREATE TABLE Giang_Khoa
(
	Ma_CT VARCHAR(10) NOT NULL, 
	MaKhoa VARCHAR(10) NOT NULL,
	MaMH VARCHAR(10) NOT NULL,
	Nam_Hoc INT NOT NULL,
	Hoc_Ky INT,
	STLT INT,
	STHH INT,
	So_Tin_Chi INT

	PRIMARY KEY(Ma_CT, MaKhoa, MaMH, Nam_Hoc)

	FOREIGN KEY(Ma_CT) REFERENCES dbo.Chuong_Trinh_Hoc(Ma_CT),
	FOREIGN KEY(MaKhoa) REFERENCES dbo.Khoa(Ma_Khoa),
	FOREIGN KEY(MaMH) REFERENCES dbo.Mon_Hoc(MaMH)
)
GO	

-- nhập liệu cho bảng Khóa Học
Insert into Khoa(Ma_Khoa, Ten_Khoa, Nam_Thanh_Lap) values( 'CNTT', N'Công nghệ thông tin',1995)
go
Insert into Khoa values('VL', N'Vật Lý' , 1970)
go
-- nhập liệu cho bảng Khóa Học
Insert into Khoa_Hoc(Nam_Bat_Dau, Ma_Khoa_Hoc, Nam_Ket_Thuc) values( 2002, 'K2002',2006)
go
Insert into Khoa_Hoc values('K2003', 2003, 2007)
go
Insert into Khoa_Hoc values('K2004', 2004, 2008)
GO
-- Nhập liệu cho sinh viên
Insert into Sinh_Vien values('0212001', N'Nguyễn Vĩnh An', 1984, N'Kinh', 'TH2002/01')
go
Insert into Sinh_Vien values('0212002', N'Nguyễn Thanh Bình', 1985, N'Kinh', 'TH2002/01')
go
Insert into Sinh_Vien values('0212003', N'Nguyễn Thanh Cường', 1984, N'Kinh', 'TH2002/02')
go
Insert into Sinh_Vien values('0212004', N'Nguyễn Quốc Duy', 1983, N'Kinh', 'TH2002/02')
go
Insert into Sinh_Vien values('0311001', N'Phan Tuấn Anh', 1985, N'Kinh', 'TH2003/01')
go
Insert into Sinh_Vien values('0311002', N'Huỳnh Thanh Sang', 1984, N'Kinh', 'TH2003/01')
GO
-- Nhập liệu cho bảng Chương trình học
Insert into Chuong_Trinh_Hoc values('CQ', N'Chính Quy')
GO
-- Nhập liệu cho bảng Môn học
Insert into Mon_Hoc values('THT01', 'CNTT', N'Toán cao cấp A1')
go
Insert into Mon_Hoc values('VLT01', 'VL', N'Toán cao cấp A1')
go
Insert into Mon_Hoc values('THT02', 'CNTT', N'Toán rời rạc')
go
Insert into Mon_Hoc values('THCS01', 'CNTT', N'Cấu trúc dữ liệu 1')
go
Insert into Mon_Hoc values('THCS02', 'CNTT', N'Hệ điều hành')
GO
-- Nhập liệu cho bảng Kết quả
Insert into Ket_Qua values('0212001', 'THT01', 1,4)
go
Insert into Ket_Qua values('0212001', 'THT01', 2,7)
go
Insert into Ket_Qua values('0212002', 'THT01', 1,8)
go
Insert into Ket_Qua values('0212003', 'THT01', 1,6)
go
Insert into Ket_Qua values('0212004', 'THT01', 1,9)
go
Insert into Ket_Qua values('0212001', 'THT02', 1,8)
go
Insert into Ket_Qua values('0212002', 'THT02', 1,5.5)
go
Insert into Ket_Qua values('0212003', 'THT02', 1,4)
go
Insert into Ket_Qua values('0212003', 'THT02', 2,6)
go
Insert into Ket_Qua values('0212001', 'THCS01', 1,6.5)
go
Insert into Ket_Qua values('0212002', 'THCS01', 1,4)
go
Insert into Ket_Qua values('0212003', 'THCS01', 1,7)
GO
-- Nhập liệu cho bảng Giảng Khoa
Insert into Giang_Khoa values('CQ', 'CNTT', 'THT01',2003, 1, 60, 30, 5)
go
Insert into Giang_Khoa values('CQ', 'CNTT', 'THT02',2003, 2, 45, 30, 4)
go
Insert into Giang_Khoa values('CQ', 'CNTT', 'THCS01',2004, 1, 45, 30, 4)
GO
-- nhập liệu cho bảng Lớp
Insert into Lop values('TH2002/01', 'CNTT','K2002', 'CQ', 1)
go
Insert into Lop values('TH2002/02', 'CNTT','K2002', 'CQ', 2)
go
Insert into Lop values('TH2003/01', 'VL','K2003', 'CQ', 1)
GO

-- 1. Danh sách các sinh viên khoa “Công nghệ Thông tin” khoá 2002-2006
SELECT dbo.Sinh_Vien.* FROM dbo.Sinh_Vien
LEFT JOIN dbo.Lop ON Lop.Ma_Lop = Sinh_Vien.MaLop
LEFT JOIN dbo.Khoa ON Khoa.Ma_Khoa = Lop.Ma_Khoa
LEFT JOIN dbo.Khoa_Hoc ON Khoa_Hoc.Ma_Khoa_Hoc = Lop.Ma_Khoa_Hoc
WHERE Ten_Khoa = N'Công nghệ Thông tin' AND Nam_Bat_Dau = 2002 AND Nam_Ket_Thuc = 2006

--​Câu 2: "Cho biết các thông tin (MSSV, họ tên ,năm sinh) của các sinh viên học sớm hơn tuổi qui định 
--(theo tuổi qui định thi sinh viên đủ 18 tuổi khi bắt đầu khóa học)"
-- Day(GETDATE()) -> lấy ngày trong tháng
-- Month(GETDATE()) -> lấy Tháng trong Năm
-- Year(GETDATE()) -> lấy năm
SELECT sv.MaSV, sv.Ho_Ten, sv.Nam_Sinh
FROM dbo.Sinh_Vien sv
LEFT JOIN dbo.Lop l ON l.Ma_Lop = sv.MaLop
LEFT JOIN dbo.Khoa_Hoc k ON k.Ma_Khoa_Hoc = l.Ma_Khoa_Hoc
WHERE k.Nam_Bat_Dau - sv.Nam_Sinh < 18

-- Câu 3:" Cho biết sinh viên khoa CNTT, khoá 2002-2006 chưa học môn cấu trúc dữ liệu 1"
--cách sai
--SELECT DISTINCT sv.*
--FROM dbo.Sinh_Vien sv
--LEFT JOIN dbo.Lop l ON l.Ma_Lop = sv.MaLop
--LEFT JOIN dbo.Khoa k ON k.Ma_Khoa = l.Ma_Khoa
--LEFT JOIN dbo.Khoa_Hoc kh ON kh.Ma_Khoa_Hoc = l.Ma_Khoa_Hoc
--LEFT JOIN dbo.Mon_Hoc m ON m.Ma_Khoa = k.Ma_Khoa
--WHERE k.Ma_Khoa = 'CNTT' 
--AND kh.Nam_Bat_Dau = 2002 
--AND kh.Nam_Ket_Thuc = 2006
--AND m.TenMH != N'Cấu trúc dữ liệu 1' 

SELECT sv.*
FROM dbo.Sinh_Vien sv
LEFT JOIN dbo.Lop l ON l.Ma_Lop = sv.MaLop
LEFT JOIN dbo.Khoa k ON k.Ma_Khoa = l.Ma_Khoa
LEFT JOIN dbo.Khoa_Hoc kh ON kh.Ma_Khoa_Hoc = l.Ma_Khoa_Hoc
LEFT JOIN dbo.Mon_Hoc m ON m.Ma_Khoa = k.Ma_Khoa
WHERE k.Ma_Khoa = 'CNTT' 
AND kh.Nam_Bat_Dau = 2002 
AND kh.Nam_Ket_Thuc = 2006
AND  sv.MaSV NOT IN ( SELECT sv.MaSV
					FROM dbo.Sinh_Vien sv
					LEFT JOIN dbo.Lop l ON l.Ma_Lop = sv.MaLop
					LEFT JOIN dbo.Khoa k ON k.Ma_Khoa = l.Ma_Khoa
					LEFT JOIN dbo.Khoa_Hoc kh ON kh.Ma_Khoa_Hoc = l.Ma_Khoa_Hoc
					LEFT JOIN dbo.Mon_Hoc m ON m.Ma_Khoa = k.Ma_Khoa
					WHERE k.Ma_Khoa = 'CNTT' 
					AND kh.Nam_Bat_Dau = 2002 
					AND kh.Nam_Ket_Thuc = 2006
					AND m.TenMH = N'Cấu trúc dữ liệu 1') 


--Câu 4: Cho biết sinh viên thi không đậu (Diem <5) môn cấu trúc dữ liệu 1 nhưng chưa thi lại. 
SELECT sv.*
FROM dbo.Sinh_Vien sv
LEFT JOIN dbo.Ket_Qua  kq ON kq.MaSV = sv.MaSV
LEFT JOIN dbo.Mon_Hoc mh ON mh.MaMH = kq.MaMH
WHERE mh.TenMH = N'Cấu trúc dữ liệu 1'
AND kq.Diem < 5
AND kq.Lan_Thi = 1
AND sv.MaSV NOT IN (SELECT sv.MaSV
					FROM dbo.Sinh_Vien sv
					LEFT JOIN dbo.Ket_Qua  kq ON kq.MaSV = sv.MaSV
					LEFT JOIN dbo.Mon_Hoc mh ON mh.MaMH = kq.MaMH
					WHERE mh.TenMH = N'Cấu trúc dữ liệu 1'
					AND kq.Diem < 5
					AND kq.Lan_Thi > 1)
--Câu 5: Với mỗi lớp thuộc khoa CNTT, cho biết mã lớp, mã khóa học, tên chương trình và số sinh viên thuộc lớp đó 
SELECT lop.Ma_Lop, lop.Ma_Khoa_Hoc, dbo.Chuong_Trinh_Hoc.Ten_CT, COUNT(dbo.Sinh_Vien.MaSV) AS SoSV
FROM dbo.Lop
LEFT JOIN dbo.Chuong_Trinh_Hoc ON Chuong_Trinh_Hoc.Ma_CT = Lop.Ma_CT
LEFT JOIN dbo.Sinh_Vien ON Sinh_Vien.MaLop = Lop.Ma_Lop
LEFT JOIN dbo.Khoa ON Khoa.Ma_Khoa = Lop.Ma_Khoa
WHERE Khoa.Ma_Khoa = 'CNTT'
GROUP BY lop.Ma_Lop, lop.Ma_Khoa_Hoc, dbo.Chuong_Trinh_Hoc.Ten_CT 

--Câu 6: Cho biết điểm trung bình của sinh viên có mã số 0212003 
--(điểm trung bình chỉ tính trên lần thi sau cùng của sinh viên)

SELECT AVG(dbo.Ket_Qua.Diem) AS DTB
FROM dbo.Ket_Qua
LEFT JOIN 	 
(SELECT dbo.Ket_Qua.MaMH, MAX(dbo.Ket_Qua.Lan_Thi) LanThiCuoi
FROM dbo.Ket_Qua
WHERE dbo.Ket_Qua.MaSV = '0212002'
GROUP BY dbo.Ket_Qua.MaMH) TABLE2 
ON TABLE2.MaMH = Ket_Qua.MaMH
WHERE MaSV = '0212002'
AND dbo.Ket_Qua.Lan_Thi = TABLE2.LanThiCuoi


--FUNCTION

GO
--1. Với 1 mã sinh viên và 1 mã khoa, kiểm tra xem sinh viên có thuộc
--khoa này không (trả về đúng hoặc sai)
CREATE FUNCTION UF_Check_SV_Thuoc_Khoa
(
@MaSV VARCHAR(10),
@MaKhoa VARCHAR(10)
)
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @KetQua VARCHAR(5)

IF EXISTS(
			SELECT * FROM dbo.Sinh_Vien
			LEFT JOIN dbo.Lop ON Lop.Ma_Lop = Sinh_Vien.MaLop
			LEFT JOIN dbo.Khoa ON Khoa.Ma_Khoa = Lop.Ma_Khoa
			WHERE MaSV = @MaSV
			AND Khoa.Ma_Khoa = @MaKhoa)
			BEGIN
				SET @KetQua = 'true'
			END
ELSE	
	SET @KetQua = 'false'
RETURN @KetQua
END

SELECT dbo.UF_Check_SV_Thuoc_Khoa('0212002', 'CNTT')


--2. Tính điểm thi sau cùng của một sinh viên trong một môn học cụ thể
/*
CÁCH 1
ALTER FUNCTION UF_CheckDiemSVSaucung_C1
	(
      @MaSV VARCHAR(10) ,
      @MaMH VARCHAR(10)
    )
RETURNS FLOAT
AS
    BEGIN
        DECLARE @Diem FLOAT
        SELECT  TOP 1 @Diem = Diem
        FROM    dbo.Ket_Qua
        WHERE   MaSV = @MaSV
                AND MaMH = @MaMH
		ORDER BY Lan_Thi DESC
        RETURN @Diem
    END
GO

select dbo.UF_CheckDiemSVSaucung_C1 ('0212002', 'THCS01')
SELECT * FROM dbo.Ket_Qua
*/
CREATE FUNCTION UF_CheckDiemSVSaucung_C2
(
@MaSV VARCHAR(10),
@MaMH VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @DiemThiCuoi FLOAT

	SELECT @DiemThiCuoi = dbo.Ket_Qua.Diem
	FROM dbo.Ket_Qua
	LEFT JOIN(
			SELECT dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH, MAX(Lan_Thi) AS LanThiSauCung
			FROM dbo.Ket_Qua
			WHERE MaSV = @MaSV
			AND MaMH = @MaMH
			GROUP BY dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH) table2 
							ON table2.MaMH = Ket_Qua.MaMH AND table2.MaSV = Ket_Qua.MaSV
							WHERE dbo.Ket_Qua.MaSV = @MaSV
							AND dbo.Ket_Qua.MaMH = @MaMH
							AND table2.LanThiSauCung = dbo.Ket_Qua.Lan_Thi

	RETURN @DiemThiCuoi
END

SELECT dbo.UF_CheckDiemSVSaucung_C2('0212001', 'THT01')


--3. Tính điểm trung bình của một sinh viên (chú ý : điểm trung bình
--được tính dựa trên lần thi sau cùng), sử dụng function 2 đã viết
-- cach sai of kteam
CREATE FUNCTION UF_TinhDTBLanThiSauCung_Howkteam
(
	@MaSV VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN
	--DECLARE @MaSV VARCHAR(10)
	DECLARE @DTB FLOAT 
	--SET @MaSV = '0212002'
	DECLARE @MaMH VARCHAR(10)
	SELECT @DTB = AVG(dbo.UF_CheckDiemSVSaucung_C1(MaSV, dbo.Ket_Qua.MaMH)) 
    FROM dbo.Ket_Qua
	WHERE MaSV = @MaSV

	PRINT @DTB
END

SELECT * FROM dbo.Ket_Qua
--Cách pro trên mạng
CREATE FUNCTION UF_TinhDTBLanThiSauCung_CachTrenMang
(
@MaSV VARCHAR(10)
)
RETURNS float 
AS
BEGIN
	DECLARE @DiemTB FLOAT
	SELECT @DiemTB = AVG(table2.Diem)
	FROM 
	(SELECT DISTINCT dbo.Ket_Qua.MaMH, dbo.UF_CheckDiemSVSaucung_C2(MaSV, dbo.Ket_Qua.MaMH) AS Diem
	FROM dbo.Ket_Qua
	WHERE dbo.Ket_Qua.MaSV = @MaSV) AS table2

	RETURN @DiemTB
END

SELECT dbo.UF_TinhDTBLanThiSauCung_CachTrenMang ('0212002')


--Tính DTB lần thi sau cùng không sử dụng lại function 2

ALTER FUNCTION UF_TinhDTBLanThiSauCung2
(
@MaSV VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN

	DECLARE @DTB FLOAT 
	SELECT @DTB = AVG(dbo.Ket_Qua.Diem)
	FROM dbo.Ket_Qua
	LEFT JOIN
				(
				SELECT dbo.Ket_Qua.MaMH, MAX(dbo.Ket_Qua.Lan_Thi) AS LANTHICUOI
				FROM dbo.Ket_Qua
				WHERE MaSV = @MaSV
				GROUP BY MaMH
				) table2		ON table2.MaMH = Ket_Qua.MaMH
								WHERE MaSV = @MaSV
								AND table2.LANTHICUOI = dbo.Ket_Qua.Lan_Thi
	RETURN ROUND(@DTB,1)
END

SELECT dbo.UF_TinhDTBLanThiSauCung2 ('0212001')


--4. Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên
--này trong các lần thi của môn học đó.

CREATE FUNCTION UF_TraVeDiemThi
(
@MaSV VARCHAR(10),
@MaMH VARCHAR(10)
)
RETURNS TABLE
RETURN 

	SELECT dbo.Ket_Qua.Lan_Thi, dbo.Ket_Qua.Diem
	FROM dbo.Ket_Qua
	WHERE MaSV = @MaSV
	AND MaMH = @MaMH

-- return table "* from"
SELECT * FROM dbo.UF_TraVeDiemThi ('0212001', 'THT01')
SELECT * FROM dbo.Ket_Qua

--Bài tập về nhà
--5. Nhập vào 1 sinh viên, trả về danh sách các môn học mà sinh viên này phải
--học. (Bài tập về nhà)

ALTER FUNCTION UF_TraVeDSMonHocOfSV
(
	@MaSV VARCHAR(10)
)
RETURNS TABLE
RETURN
	SELECT dbo.Mon_Hoc.TenMH FROM dbo.Mon_Hoc
	 LEFT JOIN dbo.Khoa ON Khoa.Ma_Khoa = Mon_Hoc.Ma_Khoa
	 LEFT JOIN dbo.Lop ON Lop.Ma_Khoa = Mon_Hoc.Ma_Khoa
	 LEFT JOIN dbo.Sinh_Vien ON Sinh_Vien.MaLop = Lop.Ma_Lop
	WHERE  dbo.Sinh_Vien.MaSV = @MaSV

SELECT * FROM dbo.UF_TraVeDSMonHocOfSV('0212001')
SELECT * FROM dbo.Sinh_Vien
SELECT * FROM dbo.Khoa
SELECT * FROM dbo.Mon_Hoc
SELECT * FROM dbo.Lop

--PROCEDURE
--1.In danh sách các sinh viên của 1 lớp học
CREATE PROC UP_Print_List_Of_Students
@MaLop VARCHAR(10)
AS
BEGIN
	--DECLARE @MaLop VARCHAR(10)
	--SET @MaLop = 'TH2003/01'
	SELECT * FROM dbo.Sinh_Vien
	WHERE dbo.Sinh_Vien.MaLop = @MaLop
END
UP_Print_List_Of_Students 'TH2002/01'


--2.Nhập vào 2 sinh viên, 1 môn học, tìm xem sinh viên nào có điểm thi môn học đó lần đầu tiên là cao hơn.

--function
CREATE FUNCTION Check_Score_Lan1_Of_Student
(
	@MaSV VARCHAR(10),
	@MaMH VARCHAR(10)
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @KQ FLOAT
    SELECT @KQ = dbo.Ket_Qua.Diem FROM dbo.Ket_Qua
	WHERE MaMH = @MaMH
	AND MaSV = @MaSV
	AND Lan_Thi = 1

	RETURN @KQ
END
SELECT dbo.Check_Score_Lan1_Of_Student ('0212001', 'THT01')


ALTER PROC UP_Compare_Students_Having_High_Score_Lan1
@MaSV1 VARCHAR(10),
@MaSV2 VARCHAR(10),
@MaMH VARCHAR(10)
AS
BEGIN

	--SET @MaSV1 = '0212001'
	--SET @MaSV2 = '0212003'
	--SET @MaMH = 'THT01'

	DECLARE @KQ1 FLOAT
    DECLARE @KQ2 FLOAT
    
	SELECT @KQ1 = dbo.Check_Score_Lan1_Of_Student(@MaSV1, @MaMH)
	SELECT @KQ2 = dbo.Check_Score_Lan1_Of_Student(@MaSV2, @MaMH)
	IF(@KQ1 > @KQ2)
		PRINT @MaSV1 + N' có điểm thi cao hơn'
	ELSE
		PRINT @MaSV2 + N' có điểm thi cao hơn'
END

UP_Compare_Students_Having_High_Score_Lan1 '0212001', '0212003', 'THT01'

--3.Nhập vào 1 môn học và 1 mã sv, kiểm tra xem sinh viên có đậu môn này trong lần thi đầu tiên không,
 --nếu đậu thì xuất ra là “Đậu”, không thì xuất ra “Không đậu”

ALTER PROC UP_Check_Score_Student_Pass_Exam_Lan1
@MaMH NVARCHAR(100),
@MaSV VARCHAR(10)
AS
BEGIN
--DECLARE @MaMH VARCHAR(10)
--DECLARE @MaSV VARCHAR(10)
--SET @TenMH = N'Toán cao cấp A1'
--SET @MaSV = '0212001'
	IF EXISTS(
				SELECT * FROM dbo.Ket_Qua
				WHERE  dbo.Ket_Qua.MaMH = @MaMH
				AND MaSV = @MaSV
				AND dbo.Ket_Qua.Lan_Thi = 1 AND dbo.Ket_Qua.Diem >= 5)

				BEGIN
					PRINT N'Đậu'
				END
	ELSE	
		PRINT N'Rớt'
END

UP_Check_Score_Student_Pass_Exam_Lan1 'THT01','0212001'
SELECT * FROM dbo.Ket_Qua

--4.Nhập vào 1 khoa, in danh sách các sinh viên (mã sinh viên, họ tên, ngày sinh) thuộc khoa này.

CREATE PROC UP_Print_List_Students_Of_Khoa
@MaKhoa VARCHAR(10)
AS
BEGIN
	--DECLARE @MaKhoa VARCHAR(10)
	--SET @MaKhosa = 'VL'
	SELECT dbo.Sinh_Vien.MaSV, dbo.Sinh_Vien.Ho_Ten, dbo.Sinh_Vien.Nam_Sinh
    FROM dbo.Sinh_Vien
	LEFT JOIN dbo.Lop ON Lop.Ma_Lop = Sinh_Vien.MaLop
	LEFT JOIN dbo.Khoa ON Khoa.Ma_Khoa = Lop.Ma_Khoa
	WHERE Khoa.Ma_Khoa = @MaKhoa
END

UP_Print_List_Students_Of_Khoa 'CNTT'

--5.Nhập vào 1 sinh viên và 1 môn học, in điểm thi của sinh viên này của các lần thi môn học đó.
--Ví dụ:  Lần 1 : 10 Lần 2: 8

CREATE PROC UP_Print_Score_ALL_LanThi_Of_Student
@MaSV VARCHAR(10),
 @MaMH VARCHAR(10)
AS
BEGIN
	--DECLARE @MaSV VARCHAR(10)
	--DECLARE @MaMH VARCHAR(10)
	--SET @MaSV = '0212001'
	--SET @MaMH = 'THT01'

	SELECT dbo.Ket_Qua.Lan_Thi, dbo.Ket_Qua.Diem FROM dbo.Ket_Qua
	WHERE MaSV = @MaSV AND MaMH = @MaMH

END
UP_Print_Score_ALL_LanThi_Of_Student '0212002', 'THT01'

--6.Nhập vào 1 sinh viên, in ra các môn học mà sinh viên này phải học.

ALTER PROC UP_Print_ALL_Subject_ofStudent
@MaSV VARCHAR(10)
AS
BEGIN
	--DECLARE @MaSV VARCHAR(10)
	--SET @MaSV = '0311001'
	SELECT * FROM dbo.UF_TraVeDSMonHocOfSV(@MaSV)
	--SELECT dbo.Mon_Hoc.TenMH 
	--FROM dbo.Mon_Hoc
	--LEFT JOIN dbo.Lop ON Lop.Ma_Khoa = Mon_Hoc.Ma_Khoa
	--LEFT JOIN dbo.Sinh_Vien ON Sinh_Vien.MaLop = Lop.Ma_Lop
	--WHERE MaSV = @MaSV
END
UP_Print_ALL_Subject_ofStudent '0311002' SELECT * FROM dbo.Sinh_Vien

--7.Nhập vào 1 môn học, in danh sách các sinh viên đậu môn này trong lần thi đầu tiên. 
CREATE PROC UP_Print_All_ListSV_DauLanThi1
@MaMH VARCHAR(10)
AS
BEGIN
	SELECT dbo.Sinh_Vien.Ho_Ten FROM dbo.Sinh_Vien
	LEFT JOIN dbo.Ket_Qua ON Ket_Qua.MaSV = Sinh_Vien.MaSV
	WHERE MaMH = @MaMH
	AND dbo.Ket_Qua.Lan_Thi = 1 AND dbo.Ket_Qua.Diem > 5
END
UP_Print_All_ListSV_DauLanThi1 'THT02'
SELECT * FROM dbo.Ket_Qua

--8.In điểm các môn học của sinh viên có mã số là maSinhVien được nhập vào.
--Chú ý: điểm của môn học là điểm thi của lần thi sau cùng

ALTER PROC UP_Print_Score_Subject_ofSV_C1
@MaSV VARCHAR(10)
AS
BEGIN
	--DECLARE @MaSV VARCHAR(10)
	--SET @MaSV = '0212001'
	
	SELECT * FROM dbo.Ket_Qua
	WHERE MaSV = @MaSV
	AND Lan_Thi = ( SELECT MAX(Lan_Thi)
					FROM dbo.Ket_Qua kq2
					WHERE kq2.MaMH = dbo.Ket_Qua.MaMH
					AND kq2.MaSV = dbo.Ket_Qua.MaSV )

END
UP_Print_Score_Subject_ofSV_C1 '0212001'

CREATE PROC UP_Print_Score_Subject_ofSV_C2
@MaSV VARCHAR(10)
AS
BEGIN
	--DECLARE @MaSV VARCHAR(10)
	--SET @MaSV = '0212001'
	SELECT dbo.Ket_Qua.* FROM dbo.Ket_Qua
	LEFT JOIN (
				SELECT dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH, MAX(Lan_Thi) AS LanThiSauCung 
				FROM dbo.Ket_Qua
				WHERE MaSV = @MaSV
				GROUP BY dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH) table2 ON table2.MaMH = Ket_Qua.MaMH AND table2.MaSV = Ket_Qua.MaSV

				WHERE  table2.LanThiSauCung = dbo.Ket_Qua.Lan_Thi
END
UP_Print_Score_Subject_ofSV_C2 '0212001'

--Thêm 1 quan hệ XepLoai:maSV	diemTrungBinh	ketQua	hocLuc
--9.Quy định : ketQua của sinh viên là 'Đạt' nếu diemTrungBinh (chỉ tính các môn đã có điểm) của sinh viên đó 
--lớn hơn hoặc bằng 5 và không quá 2 môn dưới 4 điểm, ngược lại thì kết quả là không đạtĐưa dữ liệu vào bảng xếp loại.
-- Sử dụng function 3 đã viết ở bài 4
--Đối với những sinh viên có ketQua là 'Đạt' thì hocLuc được xếp loại như sau:

-- diemTrungBinh >= 8 thì hocLuc là ”Giỏi”
--7 < = diemTrungBinh < 8 thì hocLuc là ”Khá” Còn lại là ”Trung bình”  
--10.Với các sinh viên có tham gia đầy đủ các môn học của khoa, chương trình mà sinh viên đang theo học, 
--hãy in ra điểm trung bình cho các sinh viên này.
--Chú ý: Điểm trung bình được tính dựa trên điểm thi lần sau cùng. Sử dụng function 3 đã viết ở bài 4 

ALTER VIEW XepLoai
AS
SELECT dbo.Sinh_Vien.MaSV AS 'masv',
dbo.UF_TinhDTBLanThiSauCung2(Sinh_Vien.MaSV) AS 'dtb',
dbo.UF_KetQua(Sinh_Vien.MaSV) AS 'ketqua',
dbo.UF_HocLuc(Sinh_Vien.MaSV) AS 'hocluc'
FROM dbo.Sinh_Vien


ALTER FUNCTION UF_KetQua
(
	@MaSV VARCHAR(10)
)
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @KetQua NVARCHAR(20)
	DECLARE @DTB FLOAT
	DECLARE @Kiemtra TINYINT

	SET @DTB = (SELECT dbo.UF_TinhDTBLanThiSauCung2(@MaSV))
	
;WITH temp1 as
	(
	SELECT dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH, 
	dbo.Check_Score_Lan1_Of_Student(dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH)AS [Điểm]
	FROM dbo.Ket_Qua
	WHERE dbo.Ket_Qua.MaSV = @MaSV
	AND dbo.Check_Score_Lan1_Of_Student(dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH) <=4
	GROUP BY dbo.Ket_Qua.MaSV, dbo.Ket_Qua.MaMH
	)
	
	SELECT @Kiemtra = COUNT(*) FROM temp1

	IF (@DTB = null)
		SET @KetQua = NULL
    ELSE
		BEGIN
			IF (@DTB >= 5 AND @Kiemtra <= 2)
				SET @KetQua = N'đạt'
			ELSE	
				SET @KetQua = N'Không đạt'
		END

	RETURN @KetQua
END
SELECT dbo.UF_KetQua('0212002')

CREATE FUNCTION UF_HocLuc
(
 @MaSV VARCHAR(10)
)
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @HocLuc NVARCHAR(20)
	DECLARE @KetQua NVARCHAR(20)
	DECLARE @DTB FLOAT
    
	SET @KetQua = (SELECT dbo.UF_KetQua(@MaSV))
	SET @DTB = (SELECT dbo.UF_TinhDTBLanThiSauCung2(@MaSV))

	IF (@KetQua = N'đạt')
	BEGIN
		IF (@DTB >= 8)
			SET @HocLuc = N'giỏi'
		ELSE
			IF (@DTB >= 7)
				SET @HocLuc = N'khá'
			ELSE	
				SET @HocLuc = N'tb'
	END
	ELSE
		SET @HocLuc = NULL
RETURN @HocLuc
END
SELECT dbo.UF_HocLuc('0212004')

SELECT  * FROM dbo.Ket_Qua
