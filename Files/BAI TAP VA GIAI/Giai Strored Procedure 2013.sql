/*A STORED PROCEDUREDS VOI THAM SO VAO*/

--Cau1
Create PROC Pro_Cau1( @msgv smallint, @tengv varchar(30),@sodt varchar(10), @diachi varchar(50),@mshh smallint,@namhh varchar(15))
As
	If Exists (Select mshh From HOCHAM Where mshh=@mshh)
	Begin
		Insert into GIAOVIEN(MSGV,TENGV,DIACHI,SODT,MSHHAM,NAMHH)
		Values (@msgv,@tengv,@diachi,@sodt,@mshh,@namhh)
		Print 'Da chen thanh cong'
	End
	Else
		Print 'Table HOCHAM chua co du lieu'
		Return 0
Go
--Cho thuc thi procedure vua tao
Exec Pro_Cau1 7,'Nguyen Anh Tuan','0122455878','26 Nguyen thi minh khai',2,'1/1/2001'
Go

--Cau 2
Create PROC Pro_Cau2 ( @msgv smallint, @tengv varchar(30),@sodt varchar(10), @diachi varchar(50),@mshh smallint,@namhh varchar(15))
As
	If Exists (Select mshh From HOCHAM Where mshh=@mshh)
	Begin
		If Not Exists (Select msgv From GIAOVIEN Where msgv=@msgv)
		Begin
			Insert into GIAOVIEN(MSGV,TENGV,DIACHI,SODT,MSHHAM,NAMHH)
			Values (@msgv,@tengv,@diachi,@sodt,@mshh,@namhh)
			Print 'Da chen thanh cong'
		End
		Else
			Print 'Table HOCHAM chua co du lieu'
			Return 0
	End
Go
--Cho thuc thi procedure vua tao
Exec Pro_Cau2 8,'Nguyen Mai Anh','0906455878','26 Tran Phu',2,'5/8/2001'
Go

--Cau 3
Create PROC Pro_Cau3 ( @msgv smallint, @tengv varchar(30),@sodt varchar(10), @diachi varchar(50),@mshh smallint,@namhh varchar(15))
As
	If Exists (Select mshh From HOCHAM Where mshh=@mshh)
	Begin
		If Not Exists (Select msgv From GIAOVIEN Where msgv=@msgv)
		Begin
			Insert into GIAOVIEN(MSGV,TENGV,DIACHI,SODT,MSHHAM,NAMHH)
			Values (@msgv,@tengv,@diachi,@sodt,@mshh,@namhh)
		End
		Else
			Print 'Da co du lieu trong Table GIAOVIEN'
			Return 0
	End
	Else	Print 'Table HOCHAM chua co du lieu'
		Return 1
Go
--Cho thuc thi procedure vua tao
Exec Pro_Cau3 8,'Nguyen Mai Anh','0906455878','26 Tran Phu',2,'5/8/2001'
Go

--Cau 4

Create PROC Pro_Cau4 (@msdt char(6),@tendetaimoi varchar(30))
As
	If Exists (select msdt From DETAI Where msdt=@msdt)
	Begin
		Update DETAI
		Set tendt=@tendetaimoi
		Where msdt=@msdt
		Print 'Da cap nhat thanh cong'
		Return 1
	End
	Else
		Print ' Khong co de tai nao co ma so' +@msdt
		Return 0
Go
--Cho thuc thi procedure vua tao
Exec Pro_Cau4 '97001','Quan ly sieu thi'
Go
--Kiem tra lai TABLE Detai
Select * From DETAI 

--Cau 5

Create PROC Pro_Cau5 (@mssv char(6),@tensv_moi varchar(30),@diachi_moi varchar(50))
As
	If Exists (select mssv From INHVIEN Where mssv=@mssv)
	Begin
		Update SINHVIEN
		Set tensv=@tensv_moi, diachi=@diachi_moi
		Where mssv=@mssv
		Print 'Da cap nhat thanh cong'
		Return 1
	End
	Else
		Print ' Khong co sinh vien nao co ma so' +@mssv
		Return 0
Go
--Cho thuc thi procedure vua tao
Exec Pro_Cau5 '97TH01','Nguyen Mai Chi'
Go
--Kiem tra lai TABLE SINHVIEN
Select * From SINHVIEN
Go

--Cau 6
alter PROC Pro_Cau6 (@msdt char(6))
As
	If Exists (Select msgv From GV_PBDT Where msdt=@msdt)
	Begin
	
		Declare @gvhd smallint, @gvpb smallint

		Set @gvhd=(Select msgv from GV_HDDT Where msdt=@msdt)
		Set @gvpb=(Select msgv from GV_PBDT Where msdt=@msdt)

		Update GV_HDDT
		Set msgv=@gvpb
		Where msdt=@msdt
		Print 'Da cap nhat du lieu trong Table GV_HDDT'

		Update GV_PBDT
		Set msgv=@gvhd
		Where msdt=@msdt
		Print 'Da cap nhat du lieu trong Table GV_PBDT'

	End
	Else
		begin
			Print 'Khong co ma so Giang vien tuong ung trong Table GV_PBDT'
			Return 0
		end
Go


Exec Pro_cau6 '97001'



--Kiem tra lai truoc va sau khi chay pro_cau6
Select * From GV_HDDT Where msdt='97001'
Go

Select * From GV_PBDT Where msdt='97001'
Go


--Cau 7


Create PROC Pro_Cau7 (@tengv varchar(30), @tensv varchar(30))
As
	Declare @sogv int, @sosv int
	Select @sosv=COUNT(*) From SINHVIEN Where tensv=@tensv
	Select @sogv=COUNT(*) From GIAOVIEN Where tengv=@tengv
	If (@sogv=0)
		Begin
			Print ' Khong co Giao vien ten:' + @tengv
			Return 0
		End
	If (@sosv=0)
		Begin
			Print ' Khong co sinh vien ten:' + @tensv
			Return 0
		End
	If (@sogv>1)
		Begin
			Print 'Co'+CAST(@sogv As varchar)+'co ten'+ @tengv+ ' trung nhau'
			Return 1
		End

	If (@sosv>1)
		Begin
			Print 'Co'+CAST(@sosv As varchar)+'co ten'+ @tensv+ ' trung nhau'
			Return 1
		End
--Neu chi co ten sinh vien duy nhat va ten giao vien duy nhat thi cho cap nhat du lieu
	Declare @msdt char(6), @msgv smallint
	Select @msdt=msdt From SINHVIEN t1, SV_DETAI t2 Where t1.tensv=@tensv anh t1.mssv=t2.mssv
	Select @msgv=msgv From GIAOVIEN  Where tengv=@tengv
	Update GV_HDDT Set msgv=@msgv Where msdt=@msdt
	Print ' Da cap nhat du lieu trong Table GV_HDDT'
Go
--Cho thuc thi Procedure vua tao
Exec Pro_cau7 'Nguyen Thi C', 'Nguyen Van an'
Go
--Kiem tra lai
Select * From GV_HDDT
Go

--Cau 8
alter PROC Pro_Cau8 (@tensv varchar(30))
As
--Neu co ten sinh vien can xoa
	If Exists (Select mssv From SINHVIEN Where tensv=@tensv)
	Begin
		--Neu co du lieu tuong ung trong table SV_DETAI thi ko the xoa
		If Exists (Select msdt From SINHVEN t1,SV_DETAI t2 Where t1.mssv=t2.mssv and t1.tensv=@tensv)
		Begin
			Print ' Khong the xoa'	
			Return 0
		End	
		Else
		begin
			Delete From SINHVIEN Where tensv=@tensv
			Print 'Da xoa sinh vien co ten:'+@tensv
			Return 0
		end
	End
Go
--Kiem tra
Exec Pro_Cau8 'Nguyen Van an'
Select * From SINHVIEN

/*B. Stored Procedure voi tham so vao va ra*/

--Cau 1
create PROC Pro_Out_Cau1 (@tenhv varchar(10), @sogv int OUTPUT)
As	
	If Exists (Select mshv From HOCVI Where tenhv=@tenhv)
		Begin
			Select @sogv=COUNT(*) From GIAOVIEN t1, gv_hd_cn t2,HOCVI t3
			Where t1.msgv=t2.msgv and t2.mshv=t3.mshv and t3.tenhv=@tenhv
		End
	Else
		Begin
			Print ' Khong co hoc vi nao ten:'+@tenhv
			Return 0
		End
Go
--Kiem tra
Declare @tenhv varchar(10),@sogv int
Set @tenhv='Th.s'
Exec Pro_Out_Cau1 @tenhv,@sogv OUTPUT
Print 'Voi hoc vi'+@tenhv+'co:'+CAST(@sogv as varchar)+'giao vien thoa hoc vi'
Go

--Cau 2


Create PROC Pro_Out_Cau2 (@msdt char(6),@diemtrungbinh float OUTPUT)
As	
	If Exists (Select msdt From DETAI Where msdt=@msdt)
		Begin
			Declare @diemgvhd float,@diemgvpb float, @diemgvuv float
			Declare @so_gvhd int,@so_gvpb int, @so_gvuv int

			Select @diemgvhd=SUM(diem),@so_gvhd=COUNT(*) From GV_HDDT Where msdt=@msdt
			Select @diemgvpb=SUM(diem),@so_gvpb=COUNT(*) From GV_PBDT Where msdt=@msdt
			Select @diemgvuv=SUM(diem),@so_gvuv=COUNT(*) From GV_UVDT Where msdt=@msdt
			Set @diemtrungbinh=(@diemgvhd+@diemgvpb+@diemgvuv)/(@so_gvhd+@so_gvpb+@so_gvuv)
		End
	Else
		Begin
			Print ' Khong co de tai nao voi ma so:'+@msdt
			Return 0
		End
Go
--Kiem tra

Declare @msdt char(6),@dtb float
Set @msdt='97003'
Exec Pro_Out_Cau2 @msdt,@dtb OUTPUT
Print 'Diem trung binh cua de tai'+@msdt+'la:'+CAST(@dtb as varchar)
Go

--Cau 3


Create PROC Pro_Out_Cau3 (@tengv varchar(30),@sodt varchar(10) OUTPUT)
As	
	If Exists (Select sodt From GIAOVIEN Where tengv=@tengv)
		Begin
			Declare @sogiaovien int

			Select @sogiaovien=COUNT(*) From GIAOVIEN Where tengv=@tengv
			If (@sogiaovien=1)
				Select @sodt=sodt From GIAOVIEN Where tengv=@tengv
			Else
				If (sogiaovien>1)
					Print 'Khong the lay so dien thoai vi co'+CAST(@sogiaovien as varchar)+'trung ten!!!'
		End
	Else
		Begin
			Print ' Khong co giao vien co ten:'+@tengv
			Return 0
		End
Go
--Kiem tra

Declare @tengv varchar(30),@sodt varchar(10)
Set @tengv='Nguyen Van A'
Exec Pro_Out_Cau3 @tengv,@sodt OUTPUT
Print 'Giao vien'+@tengv+'co so dien thoai:'+@sodt
Go

--Cau 4


Create PROC Pro_Out_Cau4 (@mshd smallint, @tenchutichhd varchar(30)OUTPUT,@sodt varchar(10) OUTPUT)
As	
	If Exists (Select msgvcthd From HOIDONG Where mshd=@mshd)
		Begin
			Select @tenchutichhd= tengv From GIAOVIEN, HOIDONG Where mshd=@mshd and msgv=msgvcthd
			Select @sodienthoai=sodt From GIAOVIEN, HOIDONG Where mshd=@mshd and msgv=msgvcthd
		End
	Else
		Begin
			Print ' Khong co hoi dong voi ma so:'+CAST(@mshd as varchar)
			Return 0
		End
Go
--Kiem tra

Declare @tenchutichhd varchar(30),@sodienthoai varchar(10), @mshd smallint
Set @mshd=4
Exec Pro_Out_Cau4 @mshd,@tenchutich OUTPUT, @sodienthoai OUTPUT
Print 'Ten chu tich hoi dong so'+CAST(@mshd as varchar)+'la:'+@tenchutich
Print 'So dien thoai cua chu tich hoi dong so'+CAST(@mshd as varchar)+'la:'+@sodienthoai
Go



--Cau 5


Create PROC Pro_Out_Cau6 (@tengv varchar(30),@sodthd int OUTPUT,sodtpb int OUTPUT)
As	
	If Exists (Select msgv From GIAOVIEN Where tengv=@tengv)
		Begin
			Declare @sogiaovien int
			Select @sogiaovien=COUNT(*) From GIAOVIEN Where tengv=@tengv
			If (@sogiaovien=1)
			Begin
				Select sodthd=COUNT(*) From GV_HDDT a, GIAOVIEN b 
				Where a.msgv=b.msgv and b.tengv=@tengv

				Select sodtpb=COUNT(*) From GV_PBDT a, GIAOVIEN b 
				Where a.msgv=b.msgv and b.tengv=@tengv
			End
			Else
			If (@sogiaovien>1)
				Print ' Co'+CAST(@sogiaovien as varchar)+'giao vien trung ten'
		End
	Else
		Begin
			Print ' Khong co giao vien nao ten:'+@tengv
			Return 0
		End
Go
--Kiem tra

Declare @sodetaihuongdan int, @sodetaiphanbien int,@tengv varchar(30)
Set @tengv='Nguyen Thi C'
Exec Pro_Out_Cau6 @tengv,@sodetaihuongdan OUTPUT, @sodetaiphanbien OUTPUT
Print 'So de tai do giao vien'+@tengv+'huong dan la:'+CAST(@sodetaihuongdan as varchar)
Print 'So de tai do giao vien'+@tengv+'phan bien la:'+CAST(@sodetaiphanbien as varchar)
Go