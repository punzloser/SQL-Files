--Tao database
Create database dbdetai
go
USE dbdetai
go
--Tao Tables

create table sinhvien
(
mssv char(6) primary key,
tensv nvarchar(30) not null,
sodt varchar(10),
lop char(6),
diachi nchar(50)
)
go
create table detai
(
msdt char(6) primary key, 
tendt nvarchar(30)not null
)
go
create table sv_detai
(
mssv char(6),
msdt char(6),
primary key (mssv,msdt)
)
go
create table giaovien
(
msgv smallint primary key,
tengv nvarchar(30) not null,
diachi nvarchar(50)not null,
sodt varchar(10)not null,
mshham smallint,
namhh smalldatetime
)
go
create table hocvi
(
mshv smallint primary key,
tenhv nvarchar(10)not null
)
go
create table chuyennganh
(
mscn smallint primary key,
tencn nvarchar(30) not null
)
go
create table hocham
(
mshh smallint primary key,
tenhh nvarchar(20)not null
)
go
create table gv_hd_cn
(
msgv smallint,
mshv smallint,
mscn smallint,
nam smalldatetime not null,
primary key (msgv, mshv,mscn)
)
go
create table gv_hddt
(
msgv smallint,
msdt char(6),
diem float not null,
primary key (msgv,msdt)
)
go
create table gv_pbdt
(
msgv smallint,
msdt char(6),
diem float not null,
primary key (msgv,msdt)
)
go
create table gv_uvdt
(
msgv smallint,
msdt char(6),
diem float not null,
primary key (msgv,msdt)
)
go
create table hoidong
(
mshd smallint primary key,
phong smallint,
tgbd smalldatetime,
ngayhd smalldatetime not null,
tintrang nvarchar(30)not null,
msgvcthd smallint
)
go
create table hoidong_gv
(
mshd smallint,
msgv smallint,
primary key (mshd,msgv)
)
go
create table hoidong_dt
(
mshd smallint,
msdt char(6),
quyetdinh char(10),
primary key (mshd,msdt)
)
go
----------------------------------------------.
----------------------------------------------.
----------------------------------------------.
ALTER PROC UP_6A
@msdt CHAR(6)
AS
BEGIN
	DECLARE @gvhd SMALLINT
	DECLARE @gvpb SMALLINT
	SET @gvhd = (SELECT msgv FROM gv_hddt WHERE msdt = @msdt)
	SET @gvpb = (SELECT msgv FROM gv_pbdt WHERE msdt = @msdt)
	IF EXISTS( SELECT detai.msdt 
			   FROM detai
			   WHERE msdt = @msdt)

			   BEGIN
			   	UPDATE gv_hddt
				SET msgv = @gvpb
				WHERE msdt = @msdt
	
				UPDATE gv_pbdt
				SET msgv = @gvhd
				WHERE msdt = @msdt
			   END
	ELSE
		PRINT N'không tồn tại msdt = ' + @msdt	
		RETURN 0
END
UP_6A '97001'

SELECT * FROM gv_hddt
SELECT * FROM gv_pbdt

CREATE PROC UP_7A
@tengv NVARCHAR(30),
@tensv NVARCHAR(30)
AS
BEGIN
	DECLARE @sogv INT
	DECLARE @sosv INT 
	SELECT @sogv = COUNT(*) FROM giaovien WHERE tengv = @tengv
	SELECT @sosv = COUNT(*) FROM dbo.sinhvien WHERE tensv = @tensv

	IF (@sogv = 0)
		BEGIN
			PRINT N'Không có giáo viên '+@tengv
			RETURN 0
		END
	IF (@sosv = 0)
		BEGIN
			PRINT N'Không có sinh viên '+@tengv
			RETURN 0
		END
	IF (@sogv > 1 OR @sosv >1)
		BEGIN
			PRINT N'Trùng tên giáo viên hoặc sinh viên'
			RETURN 1
		END
	DECLARE @msgv SMALLINT, @msdt CHAR(6)

	SELECT @msgv = dbo.giaovien.msgv 
	FROM dbo.giaovien
	WHERE tengv = @tengv

	SELECT @msdt = dbo.sv_detai.msdt
	FROM dbo.sv_detai
	LEFT JOIN dbo.sinhvien ON sinhvien.mssv = sv_detai.mssv
	WHERE tensv = @tensv

	UPDATE dbo.gv_hddt
	SET  msgv = @msgv
	WHERE msdt = @msdt

	PRINT N'đã cập nhật'
	--SELECT * FROM dbo.sinhvien
	--SELECT * FROM dbo.sv_detai
	--SELECT * FROM dbo.gv_hddt
	--SELECT * FROM dbo.giaovien
END
UP_7A N'Lê Trung', 'Lý An'

CREATE PROC UP_8A
(
@tensv nvarchar(30)
)
AS
BEGIN
	--DECLARE	@tensv nvarchar(30)	
	--SET @tensv = 'Lý An'
	IF EXISTS(
			SELECT dbo.sinhvien.mssv FROM dbo.sinhvien
			LEFT JOIN dbo.sv_detai ON sv_detai.mssv = sinhvien.mssv
			WHERE tensv = @tensv)

			BEGIN
				PRINT N'không thể xóa'
				RETURN 0
			END
	ELSE	
		DELETE dbo.sinhvien
		WHERE tensv = @tensv
		PRINT N'đã xóa'
END
UP_8A 'Lý An'
SELECT * FROM dbo.sinhvien

ALTER PROC UP_1B
(
@tenhv NVARCHAR(10)
)
AS
BEGIN
	--DECLARE @tenhv NVARCHAR(10)
	--SET @tenhv = N'KS'
	IF EXISTS(SELECT dbo.gv_hd_cn.msgv
			  FROM dbo.gv_hd_cn
			  LEFT JOIN dbo.giaovien ON giaovien.msgv = gv_hd_cn.msgv
			  LEFT JOIN dbo.hocvi ON hocvi.mshv = gv_hd_cn.mshv
			  WHERE tenhv = @tenhv)

			  BEGIN
			  	
				SELECT COUNT(DISTINCT dbo.gv_hd_cn.msgv) AS [Số_GV_thỏa_HV] FROM dbo.gv_hd_cn
				LEFT JOIN dbo.giaovien ON giaovien.msgv = gv_hd_cn.msgv
				LEFT JOIN dbo.hocvi ON hocvi.mshv = gv_hd_cn.mshv
				WHERE tenhv = @tenhv

			  END
	ELSE	
		RETURN 
	

	--SELECT * FROM dbo.hocvi
	--SELECT * FROM dbo.giaovien
	--SELECT * FROM dbo.gv_hd_cn
END
UP_1B 'KS'

ALTER FUNCTION UF_2B
(
	@msdt char(6)
)
RETURNS FLOAT
AS
BEGIN
	--DECLARE @msdt char(6)
	--SET @msdt = '97001'
	DECLARE @DTB FLOAT	
	SET @DTB = 0

	IF EXISTS(SELECT dbo.detai.msdt FROM dbo.detai
			  LEFT JOIN dbo.gv_hddt ON gv_hddt.msdt = detai.msdt
			  LEFT JOIN dbo.gv_pbdt ON gv_pbdt.msdt = detai.msdt
			  LEFT JOIN dbo.gv_uvdt ON gv_uvdt.msdt = detai.msdt
			  WHERE dbo.detai.msdt = @msdt)

			  BEGIN
			  	
				SELECT @DTB = (dbo.gv_hddt.diem + dbo.gv_pbdt.diem + 3*dbo.gv_uvdt.diem)/5
				FROM dbo.detai
				JOIN dbo.gv_hddt ON gv_hddt.msdt = detai.msdt
				JOIN dbo.gv_pbdt ON gv_pbdt.msdt = detai.msdt
				JOIN dbo.gv_uvdt ON gv_uvdt.msdt = detai.msdt
				AND dbo.detai.msdt = @msdt

			  END
	ELSE	
		RETURN 0
	
	--PRINT @DTB

	--SELECT * FROM gv_hddt
	--SELECT * FROM dbo.gv_pbdt
	--SELECT * FROM dbo.gv_uvdt
RETURN ROUND(@DTB,1)	
END
SELECT dbo.UF_2B ('97001')

ALTER FUNCTION UF_3B
(
	@tengv nvarchar(30)
)
RETURNS TABLE
RETURN
		SELECT dbo.giaovien.sodt AS SoDT FROM dbo.giaovien
		WHERE dbo.giaovien.tengv = @tengv
	
SELECT * FROM dbo.UF_3B(N'Lê Trung')
SELECT * FROM dbo.giaovien

ALTER PROC UP_5B
@tengv NVARCHAR(30)
AS
BEGIN
	--DECLARE @tengv NVARCHAR(30)
	--SET @tengv = N'Lê Trung'
	DECLARE @sodt_hd TINYINT 
	DECLARE @sodt_pb TINYINT 

	SELECT @sodt_hd = COUNT(dbo.gv_hddt.msgv) FROM dbo.gv_hddt
	LEFT JOIN dbo.giaovien ON giaovien.msgv = gv_hddt.msgv
	WHERE tengv = @tengv

	PRINT N'số đề tài hướng dẫn : '+ CAST(@sodt_hd AS NVARCHAR(30))

	SELECT @sodt_pb = COUNT(dbo.gv_pbdt.msgv) FROM dbo.gv_pbdt
	LEFT JOIN dbo.giaovien ON giaovien.msgv = gv_pbdt.msgv
	WHERE tengv = @tengv

	PRINT N'số đề tài phản biện : '+ CAST(@sodt_pb AS NVARCHAR(30))

END
UP_5B N'Lê Trung'
