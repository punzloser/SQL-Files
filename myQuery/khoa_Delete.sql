USE [ScheduleManagement]
GO
/****** Object:  StoredProcedure [dbo].[Khoa_Delete]    Script Date: 9/30/2020 8:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Khoa_Delete]

(
	@MaKhoa nvarchar(20)
)
as
begin
	delete from Khoa
	where MaKhoa = @MaKhoa
		select ERROR_MESSAGE = N'Xóa Thành Công'
end


