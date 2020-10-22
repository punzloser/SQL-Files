--TRIGGER
--Cau1: Khi xoa 1 de tai se xoa tat ca cac thong tin lien quan
If Exists (Select name Frm sysobjects Where name like 'trigger_xoadetai')
	Drop Trigger trigger_xoadetai
Go

Create TRIGGER trigger_xoadetai on DETAI for DELETE
As
	If (@@rowcount=0)
	Begin
		Print 'Table DETAI khong co du lieu'
		Return --Neu ko con dong nao thi khoi xoa
	End
--Xoa du lieu trong cac table lien quan voi table DETAI

	Delete SV_DETAI From SV_DETAI t1, DETAI t2 Where t1.mssv=t2.mssv
	Delete GV_HDDT  From GV_HDDT  t1, DETAI t2 Where t1.mssv=t2.mssv
	Delete GV_PBDT  From GV_PBDT  t1, DETAI t2 Where t1.mssv=t2.mssv
	Delete GV_UVDT  From GV_UVDT  t1, DETAI t2 Where t1.mssv=t2.mssv
	Delete HOIDONG_DT From HOIDONG_DT t1, DETAI t2 Where t1.mssv=t2.mssv

	Print 'Da xoa du lieu trong cac table DETAI,SV_DETAI,GV_HDDT,GV_PBDT,GV_UVDT,HOIDONG_DT'
Go

--Tao thu tuc de kiem tra trigger tren
Create PROC xoadetai @msdt char(6)
As
	If Exists (Select * From DETAI Where msdt=@msdt)
	Begin
		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table SV_DETAI nocheck Constraint all
		Alter table GV_HDDT nocheck Constraint all
		Alter table GV_PBDT nocheck Constraint all
		Alter table GV_UVDT nocheck Constraint all
		Alter table HOIDONG_DT nocheck Constraint all

		--Trigger se thuc thi khi dog lenh nay thuc 
		Delete From DETAI Where msdt=@msdt 
		-- Kich hoat lai cac rang buoc
		Alter table SV_DETAI check Constraint all
		Alter table GV_HDDT check Constraint all
		Alter table GV_PBDT check Constraint all
		Alter table GV_UVDT check Constraint all
		Alter table HOIDONG_DT check Constraint all
	End
	Else
		Print ' Khong co de tai nao co ma so:'+@msdt
Go
--Cho thuc thi thu tuc tren
Exec xoadetai '97006'
Go

--Cau2: Khi xoa 1 sinh vien se xoa tat ca cac thong tin lien quan
If Exists (Select name Frm sysobjects Where name like 'trigger_xoasinhvien')
	Drop Trigger trigger_xoasinhvien
Go

Create TRIGGER trigger_xoasinhvien on SINHVIEN for DELETE
As
	If (@@rowcount=0)
	Begin
		Print 'Table SINHVIEN khong co du lieu'
		Return --Neu ko con dong nao thi khoi xoa
	End
--Xoa du lieu trong cac table lien quan voi table DETAI

	Delete SV_DETAI From SV_DETAI t1, SINHVIEN t2 Where t1.mssv=t2.mssv
	Print 'Da xoa du lieu trong cac table SINHVIEN,SV_DETAI'
Go

--Tao thu tuc de kiem tra trigger tren
Create PROC xoasinhvien @mssv char(6)
As
	If Exists (Select * From SINHVIEN Where mssv=@mssv)
	Begin
		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table SV_DETAI nocheck Constraint all
		
		--Trigger se thuc thi khi dog lenh nay thuc 
		Delete From SINHVIEN Where mssv=@mssv 
		-- Kich hoat lai cac rang buoc
		Alter table SV_DETAI check Constraint all
	End
	Else
		Print ' Khong co sinh vien nao co ma so:'+@mssv
Go
--Cho thuc thi thu tuc tren
Exec xoasinhvien '97TH05'
Go

--Cau3: Khi xoa 1 hoi dong se xoa tat ca cac thong tin lien quan
If Exists (Select name Frm sysobjects Where name like 'trigger_xoahoidong')
	Drop Trigger trigger_xoahoidong
Go

Create TRIGGER trigger_xoahoidong on HOIDONG for DELETE
As
	If (@@rowcount=0)
	Begin
		Print 'Table HOIDONG khong co du lieu'
		Return --Neu ko con dong nao thi khoi xoa
	End
--Xoa du lieu trong cac table lien quan voi table HOIDONG

	Delete HOIDONG_DT From HOIDONG_DT t1, HOIDONG t2 Where t1.mshd=t2.mshd
	Delete HOIDONG_GV From HOIDONG_GV t1, HOIDONG t2 Where t1.mshd=t2.mshd
	Print 'Da xoa du lieu trong cac table SINHVIEN,HOIDONG_DT,HOIDONG_GV'
Go

--Tao thu tuc de kiem tra trigger tren
Create PROC xoahoidong @mshd smallint
As
	If Exists (Select * From HOIDONG Where mshd=@mshd)
	Begin
		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table HOIDONG_DT nocheck Constraint all
		Alter table HOIDONG_GV nocheck Constraint all
		
		--Trigger se thuc thi khi dog lenh nay thuc 
		Delete From HOIDONG Where mshd=@mshd 
		-- Kich hoat lai cac rang buoc
		Alter table HOIDONG_DT check Constraint all
		Alter table HOIDONG_GV check Constraint all
		
	End
	Else
		Print ' Khong co hoi dong nao co ma so:'+@mshd
Go
--Cho thuc thi thu tuc tren
Exec xoahoidong 3
Go

