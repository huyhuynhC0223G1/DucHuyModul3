create database quan_li_quan_internet;
use quan_li_quan_internet;

-- Mỗi một máy tính gồm có các thông tín: mã máy, hãng sản xuất, vị trí đặt máy 
create table may_tinh ( 
ma_may_tinh int primary key auto_increment,
hang_san_xuat varchar(50),
vi_tri_dat_may int);

insert into may_tinh(hang_san_xuat, vi_tri_dat_may)
value ("Asus",1),
("Asus",2),
("Dell",3),
("Dell",4),
("Dell",5);


-- Loại khách hàng gồm ( vip, member, other)
create table loai_khach_hang(
ma_loai_khach_hang int primary key,
ten_loai_khach_hang varchar(50));

insert into loai_khach_hang(ma_loai_khach_hang, ten_loai_khach_hang)
value (1,"vip"),
(2,"member"),
(3, "other"); 

-- Mỗi khách hàng khi sử dụng dịch vụ cần có thông tin : CCDC, tên, SĐT, Email, Loại khách hàng
create table khach_hang(
ma_khach_hang int primary key auto_increment, 
cccd varchar(12),
ten_khach_hang varchar(60),
so_dien_thoai varchar(10),
email varchar(60),
ma_loai_khach_hang int,
foreign key (ma_loai_khach_hang) references loai_khach_hang(ma_loai_khach_hang));

insert into khach_hang(cccd, ten_khach_hang, so_dien_thoai, email, ma_loai_khach_hang)
value ("012345678912", "Nguyen A", "0123456789", "a@gmail", 1),
("147852963258", "Thi B", "0369852147", "b@gmail",2),  
("156332144781", "Van H", "0358741234", "h@gmail",3);  


create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment ,
ten_dich_vu_di_kem varchar(50),
gia double,
don_vi varchar(50));

insert into dich_vu_di_kem( ten_dich_vu_di_kem, gia, don_vi)
value ("nuoc ngot", 10000, "chai"),
("banh mi", 15000, "cai"),
("thuoc la", 20000, "goi");

-- + Các thông tin cần quản lý  khi khách hàng sử dụng dịch vụ: Mã máy, Mã khách hàng, 
-- thời gian bắt đầu, thời gian kết thúc, dịch vụ đi kèm, tổng tiền thanh toán
create table dich_vu_su_dung(
ma_dich_vu int primary key auto_increment,
ma_may_tinh int,
foreign key (ma_may_tinh) references may_tinh(ma_may_tinh),
ma_khach_hang int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
thanh_toan double
);

insert into dich_vu_su_dung(ma_may_tinh, ma_khach_hang, thoi_gian_bat_dau, thoi_gian_ket_thuc, thanh_toan)
value( 1, 2, "2023-05-22 00:00:00" , "2023-05-22 02:00:00", 20000),
( 2, 1, "2023-05-22 00:00:00" , "2023-05-22 02:00:00", 30000),
( 3, 3, "2023-05-22 00:00:00" , "2023-05-22 02:00:00", 50000);

create table chi_tiet_dich_vu(
ma_chi_tiet_dich_vu int primary key auto_increment,
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu_su_dung(ma_dich_vu),
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int);


insert into chi_tiet_dich_vu(ma_dich_vu, ma_dich_vu_di_kem, so_luong) 
value (1, null, null),
(2, 1, 1),
(3, 3, 1);

create view v_tong_tien_dich_vu as
select dvsd.ma_dich_vu, sum(ctdv.so_luong * dvdk.gia) as tien_dich_vu_di_kem
from dich_vu_su_dung dvsd
join chi_tiet_dich_vu ctdv on ctdv.ma_dich_vu = dvsd.ma_dich_vu
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = ctdv.ma_dich_vu_di_kem
group by dvsd.ma_dich_vu;



