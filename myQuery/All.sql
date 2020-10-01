USE [master]
GO
/****** Object:  Database [KhoaData]    Script Date: 10/1/2020 3:52:52 PM ******/
CREATE DATABASE [KhoaData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KhoaData', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KhoaData.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KhoaData_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KhoaData_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KhoaData] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KhoaData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KhoaData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KhoaData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KhoaData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KhoaData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KhoaData] SET ARITHABORT OFF 
GO
ALTER DATABASE [KhoaData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KhoaData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KhoaData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KhoaData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KhoaData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KhoaData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KhoaData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KhoaData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KhoaData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KhoaData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KhoaData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KhoaData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KhoaData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KhoaData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KhoaData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KhoaData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KhoaData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KhoaData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KhoaData] SET  MULTI_USER 
GO
ALTER DATABASE [KhoaData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KhoaData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KhoaData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KhoaData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KhoaData] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KhoaData]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 10/1/2020 3:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nvarchar](20) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'1', N'saaf', N'1', N's')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'2', N'gf', N'4', N'h')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'3', N'6', N'7', N'6')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'35345', N'3535', N'335', N'3535')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'4', N'4', N'4', N'4')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'mkljno', N'iom', N'mi9oki', N'ki90ki')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [DienThoai], [Email]) VALUES (N'u8uh', N'huh', N'hu8hu', N'hju8uhj')
/****** Object:  StoredProcedure [dbo].[Khoa_Delete]    Script Date: 10/1/2020 3:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Khoa_Delete]

(
	@MaKhoa nvarchar(20)
)
as
begin
	delete from Khoa
	where MaKhoa = @MaKhoa
		select ERROR_MESSAGE = N'Xóa Thành Công'
end



GO
/****** Object:  StoredProcedure [dbo].[Khoa_Insert]    Script Date: 10/1/2020 3:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Khoa_Insert]

(
	@MaKhoa nvarchar(20),
	@TenKhoa nvarchar(50),
	@DienThoai nvarchar(20),
	@Email nvarchar(50)
)
as
begin
	if not exists(select * from Khoa where MaKhoa = @MaKhoa)
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
		select ErgMsg = N'Thêm Thành Công'
		end
		else 
		select EErgMsg = N'Thêm Thất Bại'
end


GO
/****** Object:  StoredProcedure [dbo].[Khoa_Update]    Script Date: 10/1/2020 3:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Khoa_Update]

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

GO
USE [master]
GO
ALTER DATABASE [KhoaData] SET  READ_WRITE 
GO
