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
WHERE dbo.Ket_Qua.MaSV = '0212003'
GROUP BY dbo.Ket_Qua.MaMH) TABLE2 
ON TABLE2.MaMH = Ket_Qua.MaMH
WHERE MaSV = '0212003'
AND dbo.Ket_Qua.Lan_Thi = TABLE2.LanThiCuoi

--1. Với 1 mã sinh viên và 1 mã khoa, kiểm tra xem sinh viên có thuộc
--khoa này không (trả về đúng hoặc sai)
--2. Tính điểm thi sau cùng của một sinh viên trong một môn học cụ thể
--3. Tính điểm trung bình của một sinh viên (chú ý : điểm trung bình
--được tính dựa trên lần thi sau cùng), sử dụng function 5.2 đã viết
--4. Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên
--này trong các lần thi của môn học đó.
--Bài tập về nhà
--5. Nhập vào 1 sinh viên, trả về danh sách các môn học mà sinh viên này phải
--học. (Bài tập về nhà)