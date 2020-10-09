CREATE DATABASE QuanLyDoiBong
GO	

USE QuanLyDoiBong
GO

CREATE TABLE DoiBong
(
	MaDoi VARCHAR(10) PRIMARY KEY,
	TenDoi NVARCHAR(30)
)
GO	

CREATE TABLE CauThu
(
	MaCauThu VARCHAR(10) PRIMARY KEY,
	TenCauThu NVARCHAR(30) NOT NULL,
	NgaySinh DATETIME,
	LoaiCauThu NVARCHAR(20),
	GhiChu NVARCHAR(30),
	SanNha NVARCHAR(30),
	MaDoi VARCHAR(10) NOT NULL,

	FOREIGN KEY (MaDoi) REFERENCES dbo.DoiBong(MaDoi)
)

CREATE TABLE ThamSo
(
	Ma INT PRIMARY KEY,
	DienGiai NVARCHAR(30),
	GiaTri INT,
	DonVi NVARCHAR(10)
)
--THÊM DỮ LIỆU THAM SỐ
INSERT INTO	ThamSo VALUES (1, N'Số cầu thủ đội', 3, N'Người')

--THÊM DỮ LIỆU ĐỘI BÓNG
INSERT INTO	DoiBong VALUES ('A1', N'Becamex Bình Dương')
INSERT INTO	DoiBong VALUES ('A2', N'Đồng Nai')
INSERT INTO	DoiBong VALUES ('A3', N'Bến Tre')
INSERT INTO	DoiBong VALUES ('A4', N'Cà Mau')
INSERT INTO	DoiBong VALUES ('A5', N'Hà Nội T&T')
--THÊM DỮ LIỆU CẦU THỦ
INSERT INTO	CauThu VALUES ('1001', N'Dương Quá', '1995/12/1', N'Ngoài Nước', 'Tiền Đạo Cấm', 'Hàng Đẫy', 'A1') 
INSERT INTO	CauThu VALUES ('1002', N'Cô Long', '1995/11/1', N'Ngoài Nước', 'Đội Phó', 'Hàng Đẫy', 'A2') 
INSERT INTO	CauThu VALUES ('1003', N'RobinSon', '1995/10/1', N'Ngoài Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A3') 
INSERT INTO	CauThu VALUES ('1004', N'Nguyễn Hoàng Thanh', '1995/01/25', N'Trong Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A1') 
INSERT INTO	CauThu VALUES ('1005', N'Nguyễn Văn Tèo', '1995/08/1', N'Trong Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A4') 
INSERT INTO	CauThu VALUES ('1006', N'Nguyễn Công Phượng', '1995/07/1', N'Trong Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A5') 
INSERT INTO	CauThu VALUES ('1007', N'Ngô Bảo Châu', '1995/06/1', N'Trong Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A1') 
INSERT INTO	CauThu VALUES ('1008', N'Daivd Duong', '1995/05/1', N'Ngoài Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A2') 
INSERT INTO	CauThu VALUES ('1009', N'Nguyễn Tuấn', '1995/04/1', N'Trong Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A3') 
INSERT INTO	CauThu VALUES ('1010', N'Ngô Thì Nhậm', '1995/03/1', N'Trong Nước', 'Đội Trưởng', 'Hàng Đẫy', 'A5') 


--PROC
CREATE PROC CauThuInsert
(
	@MaCauThu VARCHAR(10),
	@TenCauThu NVARCHAR(30),
	@NgaySinh DATETIME,
	@LoaiCauThu NVARCHAR(20),
	@GhiChu NVARCHAR(30),
	@SanNha NVARCHAR(30),
	@MaDoi VARCHAR(10)
)
AS
BEGIN
	INSERT INTO	CauThu VALUES (@MaCauThu, @TenCauThu, @NgaySinh, @LoaiCauThu, @GhiChu, @SanNha, @MaDoi)
	SELECT ErrMsg = N'Thêm thành công !'
END
GO	

CREATE PROC CauThuUpdate
(
	@MaCauThu VARCHAR(10),
	@TenCauThu NVARCHAR(30),
	@NgaySinh DATETIME,
	@LoaiCauThu NVARCHAR(20),
	@GhiChu NVARCHAR(30),
	@SanNha NVARCHAR(30),
	@MaDoi VARCHAR(10)
)
AS
BEGIN
	UPDATE dbo.CauThu
	SET	TenCauThu = @TenCauThu,
		NgaySinh = @NgaySinh,
		LoaiCauThu = @LoaiCauThu,
		GhiChu = @GhiChu,
		SanNha = @SanNha,
		MaDoi = @MaDoi
	WHERE MaCauThu = @MaCauThu
	SELECT ErrMsg = N'Sửa thành công !'
END
GO	
CREATE PROC CauThuDelete
(
	@MaCauThu VARCHAR(10)
)
AS
BEGIN
	DELETE FROM dbo.CauThu
	WHERE MaCauThu = @MaCauThu
	SELECT ErrMsg = N'Xóa thành công'
END

CREATE PROC ChonCauThuTheoDoi
(
	@MaCauThu VARCHAR(10) 
)
AS
BEGIN
	SELECT *
	FROM dbo.CauThu
	WHERE MaCauThu = @MaCauThu
END