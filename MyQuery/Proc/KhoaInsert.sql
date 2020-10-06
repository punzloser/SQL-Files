USE [ScheduleManagement]
GO
/****** Object:  StoredProcedure [dbo].[KhoaInsert]    Script Date: 05/10/2020 9:54:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[KhoaInsert]

(
	@MaKhoa NVARCHAR(20),
	@TenKhoa NVARCHAR(50),
	@DienThoai NVARCHAR(20),
	@Email NVARCHAR(50)
)
AS	
BEGIN
	
	INSERT INTO	 Khoa
		(
			MaKhoa,
			TenKhoa,
			DienThoai,
			Email
		)
	VALUES
		(@MaKhoa, @TenKhoa, @DienThoai, @Email)
		SELECT ERROR_MESSAGE = N'Thêm Thành Công'
END	


