USE [ScheduleManagement]
GO
/****** Object:  StoredProcedure [dbo].[KhoaUpdate]    Script Date: 05/10/2020 9:38:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[KhoaUpdate]

(
	@MaKhoa NVARCHAR(20),
	@TenKhoa NVARCHAR(50),
	@DienThoai NVARCHAR(20),
	@Email NVARCHAR(50)
)
AS	
BEGIN
	
	UPDATE dbo.Khoa
	SET	TenKhoa = @TenKhoa,
		DienThoai = @DienThoai,
		Email = @Email
	WHERE MaKhoa = @MaKhoa

	SELECT ERROR_MESSAGE = N'Sửa Thành Công !'
END	