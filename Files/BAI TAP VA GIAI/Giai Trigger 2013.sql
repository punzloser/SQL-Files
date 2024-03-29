--TRIGGER
--Cau1: Khi xoa 1 de tai se xoa tat ca cac thong tin lien quan
Create TRIGGER trigger_xoadetai on DETAI for DELETE
As
	--Xoa du lieu trong cac table lien quan voi table DETAI

	Delete SV_DETAI From SV_DETAI t1, DELETED t2 Where t1.msdt=t2.msdt
	Delete GV_HDDT  From GV_HDDT  t1, DELETED t2 Where t1.msdt=t2.msdt
	Delete GV_PBDT  From GV_PBDT  t1, DELETED t2 Where t1.msdt=t2.msdt
	Delete GV_UVDT  From GV_UVDT  t1, DELETED t2 Where t1.msdt=t2.msdt
	Delete HOIDONG_DT From HOIDONG_DT t1, DELETED t2 Where t1.msdt=t2.msdt

	Print 'Da xoa du lieu trong cac table DETAI,SV_DETAI,GV_HDDT,GV_PBDT,GV_UVDT,HOIDONG_DT'
Go

--Test
EXEC sp_MSforeachtable @command1="ALTER TABLE ? NOCHECK CONSTRAINT ALL"
GO
EXEC sp_MSforeachtable @command1="ALTER TABLE ? CHECK CONSTRAINT ALL"
GO
		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table SV_DETAI nocheck Constraint all
		Alter table GV_HDDT nocheck Constraint all
		Alter table GV_PBDT nocheck Constraint all
		Alter table GV_UVDT nocheck Constraint all
		Alter table HOIDONG_DT nocheck Constraint all

		--Trigger se thuc thi khi dog lenh nay thuc 
		Delete From DETAI Where msdt='97004' 
		-- Kich hoat lai cac rang buoc
		Alter table SV_DETAI check Constraint all
		Alter table GV_HDDT check Constraint all
		Alter table GV_PBDT check Constraint all
		Alter table GV_UVDT check Constraint all
		Alter table HOIDONG_DT check Constraint all
	

--Cau2: Khi xoa 1 sinh vien se xoa tat ca cac thong tin lien quan

Create TRIGGER trigger_xoasinhvien on SINHVIEN for DELETE
As
--Xoa du lieu trong cac table lien quan voi table DETAI

	Delete SV_DETAI From SV_DETAI t1, DELETED t2 Where t1.mssv=t2.mssv
	Print 'Da xoa du lieu trong cac table SINHVIEN,SV_DETAI'
Go

--Test

		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table SV_DETAI nocheck Constraint all
		
		--Trigger se thuc thi khi dog lenh nay thuc 
		Delete From SINHVIEN Where mssv='97TH05'
		-- Kich hoat lai cac rang buoc
		Alter table SV_DETAI check Constraint all
	

--Cau3: Khi xoa 1 hoi dong se xoa tat ca cac thong tin lien quan

Create TRIGGER trigger_xoahoidong on HOIDONG for DELETE
As
	
--Xoa du lieu trong cac table lien quan voi table HOIDONG

	Delete HOIDONG_DT From HOIDONG_DT t1, DELETED t2 Where t1.mshd=t2.mshd
	Delete HOIDONG_GV From HOIDONG_GV t1, DELETED t2 Where t1.mshd=t2.mshd
	Print 'Da xoa du lieu trong cac table HOIDONG, HOIDONG_DT,HOIDONG_GV'
Go

--Test
		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table HOIDONG_DT nocheck Constraint all
		Alter table HOIDONG_GV nocheck Constraint all
		
		--Trigger se thuc thi khi dog lenh nay thuc 
		Delete From HOIDONG Where mshd=3
		-- Kich hoat lai cac rang buoc
		Alter table HOIDONG_DT check Constraint all
		Alter table HOIDONG_GV check Constraint all
-------------------------------cau 4----------------------------------------
--Tạo trigger thỏa mãn ràng buộc là khi đổi một mã số đề tài (MSDT) sẽ thay đổi các thông tin liên quan.
Create TRIGGER trigger_capnhatdetai on DETAI for UPDATE
As
	
	UPDATE t1
	SET t1.msdt=t3.msdt 
	From SV_DETAI t1, DELETED t2, INSERTED t3
	Where t1.msdt=t2.msdt
	
	--Sinh vien tu viet phan update GV_HDDT,GV_PBDT, GV_UVDT, HOIDONG_DT

	Print 'Da cap nhat xong du lieu'
Go

--Test

		-- Tam thoi vo hieu hoa cac rang buoc
		Alter table SV_DETAI nocheck Constraint all
		Alter table GV_HDDT nocheck Constraint all
		Alter table GV_PBDT nocheck Constraint all
		Alter table GV_UVDT nocheck Constraint all
		Alter table HOIDONG_DT nocheck Constraint all

		--Trigger se thuc thi khi dog lenh nay thuc 
		update DETAI SET msdt='97001'
		where msdt='97011' 
		-- Kich hoat lai cac rang buoc
		Alter table SV_DETAI check Constraint all
		Alter table GV_HDDT check Constraint all
		Alter table GV_PBDT check Constraint all
		Alter table GV_UVDT check Constraint all
		Alter table HOIDONG_DT check Constraint all

----Cau 5,cau 6 tuong tu cau 4-------------------------------------------
---------------Cau 7------------------------------------------------------
--Tạo trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài
create trigger trg_detaiHOIDONG on HOIDONG_DT for INSERT, UPDATE
as
 if (select count(t1.mshd) from HOIDONG_DT t1, INSERTED t2
		where t1.mshd = t2.mshd) >=10
	begin
		print 'Khong the qua 10 de tai'
		rollback tran
	end
Go

--Test
	insert into HOIDONG_DT(mshd,msdt) values(1,'97004')

---------------------------cau 8-----------------------------------------
--Tạo trigger thỏa mãn ràng buộc là 1 giáo viên không thể vừa phản biện vừa hướng dẫn 1 đề tài.
create trigger trg_Cau8 on gv_hddt for insert, update
as
	if(exists(select * from gv_pbdt t2, inserted t1 where t1.msgv=t2.msgv and t1.msdt=t2.msdt))
	begin
			print 'Ma so giao vien huong dan da co trong phan bien de tai'
			rollback tran 
		
	end
----sinh tu lam phan nguoc lai cua cau 8
------------------------Cau 9----------------------------------
-----Tạo trigger thỏa mãn ràng buộc là 1 đề tài không quá 3 sinh viên.
create trigger trg_detaiSINHVIEN on SV_DETAI for INSERT, UPDATE
as
 if (select count(t1.mssv) from SV_DETAI t1, INSERTED t2
		where t1.msdt = t2.msdt) >3
	begin
		print 'Khong the qua 3 tren 1 de tai'
		rollback tran
	end
Go
--Test sinh vien tu viet phan test


---cau 10--------------
create trigger trg_Cau10 on giaovien for insert, update
as
if update(mshham)
begin 
---Muon co hoc ham PGS
	if(exists(select * from hocham t2, inserted t1
				where t1.mshham=t2.mshh 
				and t2.tenhh like '%Phó giáo su%'))
		begin
---Ma chua co bang Tien Si
			if(not exists(select * from gv_hd_cn t1, hocvi t2, inserted t3
				where t1.mshv=t2.mshv AND t1.msgv=t3.msgv
				and t2.tenhv like '%TS%'))
			begin
				print N'Ban muốn có học hàm PGS phải là Tiến sĩ'		
				rollback tran 
			end
		end	
end
--test--------------------------------------------------------------------------
update giaovien
set mshham=1
where msgv=4

insert giaovien values(9,'aaa','ss','888',1,null)
------------cau 11-------------------------------------------------------------------
create trigger trg_Cau11 on giaovien for insert, update
as
if update(mshham)
begin 
---neu muon co hoc ham GS
	if(exists(select mshham from  inserted t1, hocham t2
				where t1.mshham=t2.mshh 
				and t2.tenhh like '%Giao su%'))
		begin
-----Ma chua co hoc vi tien si khoa hoc
			if(not exists(select t1.mshv from GV_HD_CN t1, HOCVI t2, inserted t3
				where t2.mshv =t1.mshv and t1.msgv=t3.msgv 	and t2.tenhv like '%TSKH%'))
			begin
				print N'Ban muốn có học hàm GS phải là TSKH'		
				rollback tran 
			end
		end	
end

-------------------------Cau 12----------------------------------------------------
alter trigger trg_cau12 on gv_hd_cn for insert, update
as
	if Not exists(select * from  inserted t1, giaovien t2
				where t1.msgv = t2.msgv and (t1.nam <=t2.namhh))
		begin
			print N'Mâu thuẫn năm nhận học vị và năm nhận học hàm'
			rollback tran
		end
---Test---------------
update gv_hd_cn
set nam='1999'
where msgv=4 and mshv=3 and mscn=2