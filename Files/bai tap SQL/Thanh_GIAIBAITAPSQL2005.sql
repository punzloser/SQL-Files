ALTER PROC BAI7A
@TenGV NVARCHAR(30),
@TenSV NVARCHAR(30)
AS
BEGIN
	DECLARE @msgv SMALLINT
	SET @msgv = (SELECT dbo.giaovien.msgv FROM dbo.giaovien) 
	IF EXISTS(
				SELECT dbo.sinhvien.mssv 
				FROM dbo.sinhvien
				RIGHT JOIN dbo.sv_detai ON sv_detai.mssv = sinhvien.mssv
				RIGHT JOIN dbo.detai ON detai.msdt = sv_detai.msdt
				RIGHT JOIN dbo.gv_hddt ON gv_hddt.msdt = detai.msdt
				RIGHT JOIN dbo.giaovien ON giaovien.msgv = gv_hddt.msgv
				AND tengv = @TenGV
				AND tensv = @TenSV)
	BEGIN
		UPDATE dbo.gv_hd_cn
		SET msgv = @msgv
	END


	ELSE	
		RETURN 0
		
END

BAI7A N'Đinh Thúy Vân', N'Lê Trung'

SELECT sinhvien.tensv, dbo.giaovien.tengv, dbo.detai.tendt, dbo.gv_hddt.msdt
FROM dbo.sinhvien
LEFT JOIN dbo.sv_detai ON sv_detai.mssv = sinhvien.mssv
LEFT JOIN dbo.detai ON detai.msdt = sv_detai.msdt
LEFT JOIN dbo.gv_hddt ON gv_hddt.msdt = detai.msdt
LEFT JOIN dbo.giaovien ON giaovien.msgv = gv_hddt.msgv

select * from sys.objects WHERE type = 'PK'

ALTER PROC BAI1B
@TenHV NVARCHAR(10)
AS
BEGIN

	SELECT COUNT(dbo.giaovien.msgv) AS N'SỐ GV THỎA HỌC VỊ' FROM dbo.giaovien
				  RIGHT JOIN dbo.gv_hd_cn ON gv_hd_cn.msgv = giaovien.msgv
				  RIGHT JOIN dbo.hocvi ON hocvi.mshv = gv_hd_cn.mshv
				  AND tenhv = @TenHV
				  
END
BAI1B 'CN'


