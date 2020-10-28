CREATE PROC UP_6A
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
@tenhv NVARCHAR(10),
@sogv_thoa TINYINT OUT
)
AS
BEGIN
	--DECLARE @tenhv NVARCHAR(10)
	--SET @tenhv = N'KS'
	IF EXISTS(SELECT dbo.hocvi.mshv FROM dbo.hocvi
			  WHERE tenhv = @tenhv)

			  BEGIN
			  	
				SELECT @sogv_thoa = COUNT(dbo.gv_hd_cn.msgv) FROM dbo.gv_hd_cn
				LEFT JOIN dbo.giaovien ON giaovien.msgv = gv_hd_cn.msgv
				LEFT JOIN dbo.hocvi ON hocvi.mshv = gv_hd_cn.mshv
				WHERE tenhv = @tenhv
				PRINT N'Có ' + CAST(@sogv_thoa AS VARCHAR(5)) + N' thỏa học vị '+ @tenhv

			  END
	ELSE	
		PRINT N'Không có GV nào thõa tên học vị : ' +@tenhv 
	
END
GO

DECLARE @tenhv NVARCHAR(10) = 'Th.s', @sogv_thoa TINYINT
--Set @tenhv='Th.s'
EXEC UP_1B @tenhv, @sogv_thoa OUT


ALTER PROC UP_2B
(
	@msdt char(6),
	@DTB FLOAT OUT 
)
AS
BEGIN
	--DECLARE @msdt char(6)
	--SET @msdt = '97001'
	SET @DTB = 0

	IF EXISTS(SELECT dbo.detai.msdt FROM dbo.detai
			  
			  WHERE dbo.detai.msdt = @msdt)

			  BEGIN
			  	
				SELECT @DTB = (dbo.gv_hddt.diem + dbo.gv_pbdt.diem + 3*dbo.gv_uvdt.diem)/5
				FROM dbo.detai
				JOIN dbo.gv_hddt ON gv_hddt.msdt = detai.msdt
				JOIN dbo.gv_pbdt ON gv_pbdt.msdt = detai.msdt
				JOIN dbo.gv_uvdt ON gv_uvdt.msdt = detai.msdt
				AND dbo.detai.msdt = @msdt

				PRINT N'Điểm trung bình của đề tài '+@msdt + '= ' + CAST(@DTB AS VARCHAR)

			  END
	ELSE	
		PRINT N'Không tìm thấy mã số đề tài : '+CAST(@msdt AS VARCHAR)
		RETURN 0
END

DECLARE @msdt char(6) = '97001', @DTB FLOAT 
--SET @msdt = '97001'
EXEC UP_2B @msdt, @DTB OUT


ALTER PROC UP_3B
(
	@tengv nvarchar(30),
	@SDT varchar(10) OUT
)
AS
BEGIN
	IF EXISTS ( SELECT * FROM dbo.giaovien WHERE tengv = @tengv)
		BEGIN
			SELECT @SDT = dbo.giaovien.sodt FROM dbo.giaovien
			WHERE dbo.giaovien.tengv = @tengv

			PRINT N'Giáo viên '+CAST(@tengv AS NVARCHAR) + N' có SDT : ' + CAST(@SDT AS VARCHAR)	

		END
	ELSE	
		PRINT N'Không tìm thấy giáo viên '+ CAST(@tengv AS NVARCHAR)
		RETURN 0
--SELECT * FROM dbo.UF_3B(N'Lê Trung')
--SELECT * FROM dbo.giaovien
END
GO

DECLARE @tengv NVARCHAR(30) = N'Lê Trung', @SDT NVARCHAR(10)
EXEC UP_3B @tengv, @SDT OUT

ALTER PROC UP_4B
@mshd SMALLINT,
@ten NVARCHAR(30) OUT,
@sdt NVARCHAR(30) OUT
AS
BEGIN
	--DECLARE @ten NVARCHAR(30)
	--DECLARE @sdt NVARCHAR(30)
	--DECLARE @mshd SMALLINT
	--SET @mshd = 6

	IF EXISTS ( SELECT dbo.hoidong.mshd FROM dbo.hoidong WHERE mshd = @mshd)

		BEGIN
		
		SELECT @ten = dbo.giaovien.tengv FROM dbo.giaovien
		LEFT JOIN dbo.hoidong ON giaovien.msgv = hoidong.msgvcthd
		WHERE mshd = @mshd

		SELECT @sdt = dbo.giaovien.sodt FROM dbo.giaovien
		LEFT JOIN dbo.hoidong ON giaovien.msgv = hoidong.msgvcthd
		WHERE mshd = @mshd

		PRINT N'MSHD : '+ CAST(@mshd AS VARCHAR) + CHAR(10)
			+N'Tên chủ tịch hội đồng : '+CAST(@ten AS NVARCHAR) + CHAR(10) 
			+N'Số ĐT : '+CAST(@sdt AS VARCHAR)
		END
	ELSE
		PRINT N'Không tìm thấy mshd : '+CAST(@mshd AS VARCHAR)
		RETURN 0
	
END
GO


DECLARE @mshd SMALLINT = 3, @ten NVARCHAR(30), @sdt NVARCHAR(30)
EXEC UP_4B @mshd, @ten OUT, @sdt OUT

ALTER PROC UP_5B
@tenhv NVARCHAR(10),
@sodetaihd TINYINT OUT,
@sodetaipb TINYINT OUT 
AS
BEGIN
	--DECLARE @tenhv NVARCHAR(10) = 'TSKH'
	--DECLARE @sodetaihd TINYINT
	--DECLARE @sodetaipb TINYINT

	IF EXISTS ( SELECT dbo.hocvi.mshv FROM dbo.hocvi WHERE tenhv = @tenhv)
		
		BEGIN
			
			SELECT @sodetaihd = COUNT(dbo.gv_hddt.msdt) FROM dbo.gv_hddt
						LEFT JOIN dbo.gv_hd_cn ON gv_hd_cn.msgv = gv_hddt.msgv
						LEFT JOIN dbo.hocvi ON hocvi.mshv = gv_hd_cn.mshv
						WHERE dbo.hocvi.tenhv = @tenhv

			SELECT @sodetaipb = COUNT(dbo.gv_pbdt.msdt) FROM dbo.gv_pbdt
								LEFT JOIN dbo.gv_hd_cn ON gv_hd_cn.msgv = gv_pbdt.msgv
								LEFT JOIN dbo.hocvi ON hocvi.mshv = gv_hd_cn.mshv
								WHERE dbo.hocvi.tenhv = @tenhv
			PRINT N'Với học vị : '+ @tenhv + CHAR(10)
			+N'Số đề tài hướng dẫn : '+CAST(@sodetaihd AS VARCHAR)+CHAR(10)
			+N'Số đề tài phản biện : '+CAST(@sodetaipb AS VARCHAR)
		END 
	ELSE
		 PRINT N'Không có kết quả nào từ học vị này'
		 RETURN 0
END
GO


DECLARE @tenhv NVARCHAR(10) = 'TSKH', @sodetaihd TINYINT, @sodetaipb TINYINT
EXEC UP_5B @tenhv, @sodetaihd OUT, @sodetaipb OUT 

CREATE TRIGGER UTG_1C
ON detai
FOR DELETE
AS
BEGIN
	
END
Delete From DETAI Where msdt='97005' 

