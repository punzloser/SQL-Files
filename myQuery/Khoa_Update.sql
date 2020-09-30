use ScheduleManagement
go
create proc Khoa_Update

(
	@MaKhoa nvarchar(20),
	@TenKhoa nvarchar(50),
	@DienThoai nvarchar(20),
	@Email nvarchar(50)
)
as
begin
	update Khoa
	set	TenKhoa = @TenKhoa,
		DienThoai = @DienThoai,
		Email = @Email
	where MaKhoa = @MaKhoa

	select ERROR_MESSAGE = N'Sửa Thành Công !'
end
