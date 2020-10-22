create database dbdetai
-------------------------------------------
cau 1
-----------------------------------------------------------
create view bai1vw([Ten de tai],[Ten SV],[Ten GVHD], [ten GVPB])
as
select tendt, tensv, t7.tengv, t1.tengv
from giaovien t1, gv_hddt t2, gv_pbdt t3, detai t4, sv_detai t5, sinhvien t6, giaovien t7
where t6.mssv=t5.mssv and t5.msdt = t4.msdt and t4.msdt = t3.msdt and t4.msdt = t2.msdt and t3.msgv = t1.msgv and t2.msgv = t7.msgv

-------------------------------------------------------------------
cau 2
----------------------------------------------------------------
create view bai2vw ([tengv],[ten de tai hd])
as
select tengv, tendt
from detai t1, gv_hddt t2, giaovien t3
where t1.msdt = t2.msdt and t2.msgv = t3.msgv
----------------------------------------------------------
cau 3
-----------------------------------------------------------
create view bai3vw ([tengv],[ten de tai pb])
as
select tengv, tendt
from detai t1, gv_pbdt t2, giaovien t3
where t1.msdt = t2.msdt and t2.msgv = t3.msgv
------------------------------------------------------------
cau 4
-----------------------------------------------------------
alter view bai4vw ([Ten dt], [quyet dinh])
as
select tendt, quyetdinh
from detai t1, hoidong_dt t2,hoidong t3
where t1.msdt = t2.msdt and t2.mshd = t3.mshd and t3.tintrang = N'Thử' and t2.quyetdinh= N'Được'


-----------------------------------------------------------------------
cau 5
-------------------------------------------------------------------------
create view bai5vw ([Ten dt], [diemtb])
as
select tendt,(t2.diem+t3.diem+ sum(t4.diem))/5 as dtb
from detai t1,gv_hddt t2, gv_pbdt t3,gv_uvdt t4,hoidong_dt t5, hoidong t6
where t1.msdt= t2.msdt and t1.msdt = t3.msdt and t1.msdt = t4.msdt and t1.msdt=t5.msdt and t5.mshd=t6.mshd and t6.tinhtrang=N'Thật'
group by tendt, t2.diem, t3.diem

--------------------------------------------------------------------------
cau 6
--------------------------------------------------------------------
create view cau6 ([ten de tai],[ten sinh vien],[diem gv_hddt],[diem gv_pbdt],[diem gv_uv])
as
	select t1.tendt,t3.tensv,t4.diem,t5.diem,sum(t6.diem)
	from detai t1, sv_detai t2,sinhvien t3,gv_hddt t4,gv_pbdt t5, gv_uvdt t6
	where t1.msdt=t2.msdt and t2.mssv=t3.mssv and t1.msdt=t4.msdt and t1.msdt=t5.msdt and t1.msdt = t6.msdt
	group by t1.tendt,t3.tensv,t4.diem,t5.diem
--------------------------------------------------------------------------
cau 7
--------------------------------------------------------------------
create view Cau7([Thoi gian bd],[ngay hd],[so luong de tai],[ten gv])
as
select convert(varchar(8),t3.tgbd,108) as tgbd,convert(varchar(10),t3.ngayhd,103) as ngayhd,count(t1.msdt) as sl,t4.tengv
from detai t1,hoidong_dt t2, hoidong t3, giaovien t4
where t4.msgv=t3.msgvcthd and t3.mshd=t2.mshd and t2.msdt=t1.msdt
group by t3.tgbd,t3.ngayhd,t4.tengv

--------------------------------------------------------------------------
cau 8
--------------------------------------------------------------------
create view cau8([ma so hd],[ms gv],[ten gv],[so dien thoai])
as
	select t1.mshd,t3.msgv,t3.tengv, t3.sodt
	from hoidong t1, hoidong_gv t2, giaovien t3
	where t1.mshd=t2.mshd and t3.msgv=t2.msgv

--------------------------------------------------------------------------
cau 9
--------------------------------------------------------------------

create view cau9v1([msgv],[so de tai hd])
as

	select t2.msgv, count(t1.msdt)
	from detai t1, gv_hddt t2
	where t1.msdt = t2.msdt
	group by t2.msgv

create view cau9v2([msgv],[so de tai pb])
as

	select t2.msgv, count(t1.msdt)
	from detai t1, gv_pbdt t2
	where t1.msdt = t2.msdt
	group by t2.msgv


create view cau9v3([msgv],[so de tai uv])
as

	select t2.msgv, count(t1.msdt)
	from detai t1, gv_uvdt t2
	where t1.msdt = t2.msdt
	group by t2.msgv
--ket ca 3 view tren
create view cau9([msgv],[Ten gv],[so de tai hd],[so de tai pb],[so de tai uv])
as
select t1.msgv,t1.tengv,
coalesce(cau9v1.[so de tai hd],0),
coalesce(cau9v2.[so de tai pb],0),
coalesce(cau9v3.[so de tai uv],0)
from Giaovien t1 
left join cau9v1 on t1.msgv = cau9v1 .msgv
 left join  cau9v2  on   t1.msgv =cau9v2.msgv
 left  join   cau9v3  on t1.msgv = cau9v3.msgv


