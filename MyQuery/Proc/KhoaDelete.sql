USE [ScheduleManagement]
GO
/****** Object:  StoredProcedure [dbo].[KhoaDelete]    Script Date: 05/10/2020 9:37:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[KhoaDelete]

	@MaKhoa NVARCHAR(20)

AS	
BEGIN
	DELETE FROM	 Khoa
	WHERE MaKhoa = @MaKhoa
	SELECT ERROR_MESSAGE = N'Xóa Thành Công'
END	


