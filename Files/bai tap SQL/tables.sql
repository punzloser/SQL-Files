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
--Tao khoa ngoai
alter table sv_detai
	 add foreign key (mssv) references sinhvien(mssv),
	 foreign key (msdt) references detai(msdt)
go
alter table giaovien
	add foreign key (mshham) references hocham(mshh)
go
alter table gv_hd_cn
	add foreign key (msgv) references giaovien(msgv),
	foreign key(mshv)references hocvi(mshv),
	foreign key(mscn)references chuyennganh(mscn)
go 
alter table gv_hddt
	add foreign key(msgv) references giaovien(msgv),
	foreign key(msdt) references detai(msdt)
go
alter table gv_pbdt
	add foreign key(msgv) references giaovien(msgv),
	foreign key(msdt) references detai(msdt)
go
alter table gv_uvdt
	add foreign key(msgv) references giaovien(msgv),
	foreign key(msdt) references detai(msdt)
go
alter table hoidong
	add foreign key(msgvcthd) references giaovien(msgv)
go
alter table hoidong_gv
	add foreign key(mshd) references hoidong(mshd),
	foreign key(msgv) references giaovien(msgv)
go
alter table hoidong_dt
	add foreign key(mshd) references hoidong(mshd),
	foreign key(msdt) references detai(msdt)
go

--Chen du lieu vao table
insert into sinhvien values('97TH01','Nguy?n Van An','12NTMK','97TH01','9688543')
insert into sinhvien values('97TH02','Lý An','13/4 LCT','97TH01','8454433')
insert into sinhvien values('97TH03','Ðinh Thúy Vân','20 Pastuer','97TH01','8455789')
insert into sinhvien values('97TH04','Tr?n Van Ng?c','54/12 LHP','97TH02','8149023')
insert into sinhvien values('97TH05','Hà Khánh Ly','12 HBT','97TH02','9851623')
insert into sinhvien values('97TH06','Nguy?n Bá Tòan','31 THÐ','97TH01','9688531')
go
insert into detai values('97001','Qu?n lý thu vi?n')
insert into detai values('97002','Nh?n d?ng vân tay')
insert into detai values('97003','Bán d?u giá trên m?ng')
insert into detai values('97004','Qu?n lý siêu th?')
insert into detai values('97005','X? lý ?nh')
insert into detai values('97006','Qu?n tr? m?ng')
go
insert into sv_detai values('97TH01','97004')
insert into sv_detai values('97TH02','97005')
insert into sv_detai values('97TH03','97001')
insert into sv_detai values('97TH04','97002')
insert into sv_detai values('97TH05','97003')
insert into sv_detai values('97TH06','97005')
go
insert into hocvi values(1,'KS')
insert into hocvi values(2,'CN')
insert into hocvi values(3,'Th.S')
insert into hocvi values(4,'TS')
insert into hocvi values(5,'TSKH')
go
insert into chuyennganh values(1,'H? th?ng thông tin')
insert into chuyennganh values(2,'M?ng')
insert into chuyennganh values(3,'Ð? h?a')
insert into chuyennganh values(4,'Công ngh? ph?n m?m')
go
insert into hocham values(1,'Phó giáo su')
insert into hocham values(2,'Giáo su')
go
insert into giaovien values(1,'Tr?n Lan','11 NVT','8751515',1,1996)
insert into giaovien values(2,'Nguy?n Van A','23/5 LQÐ','8515186',1,1996)
insert into giaovien values(3,'Lê Trung','4 TC','8235464',1,1996)
insert into giaovien values(4,'Nguy?n B?o Thy','78 NTMK','8775588',2,1997)
insert into giaovien values(5,'Chu Hòai Ân','71/4 TL','8997859',2,1997)
insert into giaovien values(6,'Nguy?n Ng?c An','11 HBT','8456789',2,1997)
go


insert into gv_hd_cn values(1,1,1,1999)
insert into gv_hd_cn values(1,1,2,1999)
insert into gv_hd_cn values(1,2,1,1998)
insert into gv_hd_cn values(2,3,2,1997)
insert into gv_hd_cn values(3,2,4,1997)
insert into gv_hd_cn values(4,3,2,1996)

insert into gv_hddt values(1,'97001',7)
insert into gv_hddt values(2,'97002',8)
insert into gv_hddt values(5,'97003',9)
insert into gv_hddt values(4,'97004',8.5)
insert into gv_hddt values(3,'97005',7)

insert into gv_pbdt values(1,'97005',5)
insert into gv_pbdt values(2,'97001',7)
insert into gv_pbdt values(5,'97004',6)
insert into gv_pbdt values(4,'97003',8.5)
insert into gv_pbdt values(3,'97002',8)

insert into gv_uvdt values(5,'97005',6)
insert into gv_uvdt values(2,'97005',6)
insert into gv_uvdt values(4,'97005',6)
insert into gv_uvdt values(3,'97001',6)
insert into gv_uvdt values(4,'97001',6)
insert into gv_uvdt values(5,'97001',6)
insert into gv_uvdt values(3,'97003',6)
insert into gv_uvdt values(1,'97003',6)
insert into gv_uvdt values(2,'97003',6)
insert into gv_uvdt values(1,'97004',6)
insert into gv_uvdt values(2,'97004',6)
insert into gv_uvdt values(3,'97004',6)
insert into gv_uvdt values(1,'97002',6)
insert into gv_uvdt values(4,'97002',6)
insert into gv_uvdt values(5,'97002',6)
insert into gv_uvdt values(1,'97006',6)
insert into gv_uvdt values(2,'97006',6)
insert into gv_uvdt values(4,'97006',6)

insert into hoidong values(1,'002','7:00',30/10/2001,'Th?t',1)
insert into hoidong values(2,'102','7:00',30/10/2001,'Th?',2)
insert into hoidong values(3,'003','8:00',31/10/2001,'Th?t',3)


insert into hoidong_gv values(1,1)
insert into hoidong_gv values(1,2)
insert into hoidong_gv values(1,3)
insert into hoidong_gv values(1,4)
insert into hoidong_gv values(2,3)
insert into hoidong_gv values(2,2)
insert into hoidong_gv values(2,5)
insert into hoidong_gv values(2,4)
insert into hoidong_gv values(3,1)
insert into hoidong_gv values(3,2)
insert into hoidong_gv values(3,3)
insert into hoidong_gv values(3,4)
insert into hoidong_gv values(4,3)
insert into hoidong_gv values(4,2)
insert into hoidong_gv values(4,5)
insert into hoidong_gv values(4,4)

insert into hoidong_dt values(1,'97001','Ðu?c')
insert into hoidong_dt values(1,'97002','Ðu?c')
insert into hoidong_dt values(2,'97003','Không')
insert into hoidong_dt values(2,'97004','Không')
insert into hoidong_dt values(1,'97005','Ðu?c')
insert into hoidong_dt values(3,'97001','Không')
insert into hoidong_dt values(3,'97002','Ðu?c')
insert into hoidong_dt values(3,'97004','Không')
insert into hoidong_dt values(4,'97003','Không')
insert into hoidong_dt values(4,'97005','Không')
insert into hoidong_dt values(4,'97006','Ðu?c')


----Xoa table
--drop table sinhvien
--drop table detai
--drop table sv_detai
--drop table giaovien
--drop table hocvi
--drop table chuyennganh
--drop table gv_hd_cn
--drop table hocham
--drop table gv_hddt
--drop table gv_pbdt
--drop table gv_uvdt
--drop table hoidong
--drop table hoidong_gv
--drop table hoidong_dt