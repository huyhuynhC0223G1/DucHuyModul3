create database quan_li;

create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45));

create table trinh_do(
ma_trinh_do int primary key auto_increment,
te_trinh_do varchar(45));

create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45));

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_va_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
FOREIGN KEY(ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan));

create table loai_khach(
ma_loai_khach int primary key auto_increment,
te_loai_khach varchar(45));

create table khach_hang(
ma_khach_hang int primary key auto_increment,
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach),
ho_va_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45));

create table kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45));

create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45));

create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int,
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int);

create table hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu));










