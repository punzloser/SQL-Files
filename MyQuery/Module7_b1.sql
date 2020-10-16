
CREATE TABLE LoaiDT
(
	MaLoaiDT INT PRIMARY KEY,
	TenLoaiDeTai NVARCHAR(100)
)
GO
 CREATE TABLE detai
(
	MaDT BIGINT IDENTITY(1,1) PRIMARY KEY,
	TenDT NVARCHAR(100),
	Diem FLOAT,
	TenGVHD NVARCHAR(100),
	MaLoaiDT INT NOT NULL

	FOREIGN KEY (MaLoaiDT) REFERENCES LoaiDT(MaLoaiDT)
)

INSERT INTO LoaiDT VALUES (1, N'Nghiên Cứu KH')
INSERT INTO LoaiDT VALUES (2, N'Thực Tập')

INSERT INTO detai VALUES (N'Quản Lý Siêu Thị', 10, N'Nguyễn A', 1)
INSERT INTO detai VALUES (N'Quản Lý Đất Đai', 9, N'Lê A', 2)
INSERT INTO detai VALUES (N'Quản Lý Dự Án', 8, N'Phạm A', 1)
INSERT INTO detai VALUES (N'Quản Lý Siêu Thị', 7, N'Dương A', 2)
INSERT INTO detai VALUES (N'Quản Lý Đất Đai', 6, N'Đỗ A', 2)
INSERT INTO detai VALUES (N'Quản Lý Dự Án', 5, N'Ngô A', 1)

CREATE PROC ChonDeTaiTheoLoaiDeTai
(
	@MaLoaiDT INT
)
AS
BEGIN
	SELECT *
	FROM dbo.detai
	WHERE MaLoaiDT = @MaLoaiDT
END

CREATE PROC ChonDeTaiTheoMaDeTai
(
	@MaDT bigint
)
AS
BEGIN
	SELECT *
	FROM dbo.detai
	WHERE MaDT = @MaDT
END

CREATE PROC ThemDeTai
(
	@TenDT NVARCHAR(100),
	@Diem FLOAT,
	@TenGVHD NVARCHAR(100),
	@MaLoaiDT INT
)
AS	
BEGIN
	INSERT INTO dbo.detai 
	(
		TenDT,
		Diem,
		TenGVHD,
		MaLoaiDT
	)
	VALUES
	(
		@TenDT,
		@Diem,
		@TenGVHD,
		@MaLoaiDT
	)
	SELECT ErrMsg = N'Thêm thành công !'
END

CREATE PROC SuaDeTai
(
	@MaDT bigint,
	@TenDT NVARCHAR(100),
	@Diem FLOAT,
	@TenGVHD NVARCHAR(100),
	@MaLoaiDT INT
)
AS	
BEGIN
	UPDATE dbo.detai
	SET TenDT = @TenDT,
		Diem = @Diem,
		TenGVHD = @TenGVHD,
		MaLoaiDT = @MaLoaiDT
	WHERE MaDT = @MaDT
	SELECT	ErrMsg = N'Cập nhật thành công !'
END

CREATE PROC XoaDeTai
(
	@MaDT bigint
)
AS
BEGIN
	DELETE FROM dbo.detai
	WHERE MaDT = @MaDT
	SELECT ErrMsg = N'Xóa thành công !'
END
