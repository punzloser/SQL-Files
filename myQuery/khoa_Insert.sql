USE [ScheduleManagement]
GO
/****** Object:  StoredProcedure [dbo].[Khoa_Insert]    Script Date: 9/30/2020 8:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Khoa_Insert]

(
	@MaKhoa nvarchar(20),
	@TenKhoa nvarchar(50),
	@DienThoai nvarchar(20),
	@Email nvarchar(50)
)
as
begin
	insert into Khoa
		(
			MaKhoa,
			TenKhoa,
			DienThoai,
			Email
		)
	values
		(@MaKhoa, @TenKhoa, @DienThoai, @Email)
		select ERROR_MESSAGE = N'Thêm Thành Công'
end
