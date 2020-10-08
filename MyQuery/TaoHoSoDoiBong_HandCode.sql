CREATE DATABASE QuanLyDoiBong
GO	

USE QuanLyDoiBong
GO

CREATE TABLE DoiBong
(
	MaDoiBong VARCHAR(10) PRIMARY KEY,
	TenDoi NVARCHAR(30),
	SanNha NVARCHAR(30)
)
GO	

CREATE TABLE CauThu
(
	MaCauThu VARCHAR(10) PRIMARY KEY,
	TenCauThu NVARCHAR(30) NOT NULL,
	NgaySinh DATETIME,
	LoaiCauThu NVARCHAR(20),
	GhiChu NVARCHAR(30),
	MaDoi VARCHAR(10) NOT NULL,

	FOREIGN KEY (MaDoi) REFERENCES dbo.DoiBong(MaDoiBong)
)

DELETE TABLE ThamSo
(
	Ma INT PRIMARY KEY,
	DienGiai NVARCHAR(30),
	GiaTri INT,
	DonVi NVARCHAR(10)
)
--THÊM DỮ LIỆU THAM SỐ
INSERT INTO	ThamSo VALUES (1, N'Số cầu thủ đội', 3, N'Người')

--THÊM DỮ LIỆU ĐỘI BÓNG
INSERT INTO	DoiBong VALUES ('A1', N'Becamex Bình Dương', 'Đồi Núi')
INSERT INTO	DoiBong VALUES ('A2', N'Đồng Nai', 'Đồng Bằng')
INSERT INTO	DoiBong VALUES ('A3', N'Bến Tre', 'Đồi Núi')
INSERT INTO	DoiBong VALUES ('A4', N'Cà Mau', 'Đồng Bằng')
INSERT INTO	DoiBong VALUES ('A5', N'Hà Nội T&T', 'Đồi Núi')
--THÊM DỮ LIỆU CẦU THỦ
INSERT INTO	CauThu VALUES ('1001', N'Dương Quá', '1995/12/1', N'Ngoài Nước', 'Tiền Đạo Cấm', 'A1') 
INSERT INTO	CauThu VALUES ('1002', N'Cô Long', '1995/11/1', N'Ngoài Nước', 'Đội Phó', 'A2') 
INSERT INTO	CauThu VALUES ('1003', N'RobinSon', '1995/10/1', N'Ngoài Nước', 'Đội Trưởng', 'A3') 
INSERT INTO	CauThu VALUES ('1004', N'Nguyễn Hoàng Thanh', '1995/01/25', N'Trong Nước', 'Đội Trưởng', 'A1') 
INSERT INTO	CauThu VALUES ('1005', N'Nguyễn Văn Tèo', '1995/08/1', N'Trong Nước', 'Đội Trưởng', 'A4') 
INSERT INTO	CauThu VALUES ('1006', N'Nguyễn Công Phượng', '1995/07/1', N'Trong Nước', 'Đội Trưởng', 'A5') 
INSERT INTO	CauThu VALUES ('1007', N'Ngô Bảo Châu', '1995/06/1', N'Trong Nước', 'Đội Trưởng', 'A1') 
INSERT INTO	CauThu VALUES ('1008', N'Daivd Duong', '1995/05/1', N'Ngoài Nước', 'Đội Trưởng', 'A2') 
INSERT INTO	CauThu VALUES ('1009', N'Nguyễn Tuấn', '1995/04/1', N'Trong Nước', 'Đội Trưởng', 'A3') 
INSERT INTO	CauThu VALUES ('1010', N'Ngô Thì Nhậm', '1995/03/1', N'Trong Nước', 'Đội Trưởng', 'A5') 


--TEST
SELECT dbo.CauThu.TenCauThu, dbo.CauThu.GhiChu FROM dbo.CauThu
LEFT JOIN	dbo.DoiBong ON dbo.CauThu.MaDoi = dbo.DoiBong.MaDoiBong
AND dbo.DoiBong.SanNha = 'Đồi Núi'

--PROC
CREATE PROC CauThuInsert
(
	----Tham so nhap cau thu
)
AS	
BEGIN

DECLARE @socauthu INT
DECLARE @socauthuquydinh INT

SELECT @socauthu= COUNT(*) FROM dbo.CauThu WHERE MaDoi=@madoi
SELECT @socauthuquydinh=COUNT(*) FROM dbo.ThamSo WHERE Ma=1

IF(@socauthu>@socauthuquydinh)
	

INSERT INTO [dbo].[CauThu]
           ([MaCauThu]
           ,[TenCauThu]
           ,[NgaySinh]
           ,[LoaiCauThu]
           ,[GhiChu]
           ,[MaDoi]
           ,[MaLoaiCauThu])
     VALUES
           (<MaCauThu, varchar(10),>
           ,<TenCauThu, nvarchar(30),>
           ,<NgaySinh, datetime,>
           ,<LoaiCauThu, nvarchar(20),>
           ,<GhiChu, nvarchar(30),>
           ,<MaDoi, varchar(10),>
           ,<MaLoaiCauThu, varchar(10),>)

end
GO


