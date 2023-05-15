create database ss2_bai_1;
use ss2_bai_1;

create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(50) not null,
dia_chi varchar(50)
);

create table so_dien_thoai(
so_dien_thoai varchar(10) primary key,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
so_dat_hang int primary key,
ngay_dat_hang date,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(50)
);


create table chi_tiet_don_dat_hang(
so_dat_hang int,
ma_vat_tu int,
primary key(so_dat_hang, ma_vat_tu),
foreign key(so_dat_hang) references don_dat_hang(so_dat_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int,
so_phieu_nhap int,
don_gia_nhap varchar(50),
so_luong_nhap int,
primary key(ma_vat_tu, so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);

create table chi_tiet_phieu_xuat(
ma_vat_tu int,
so_phieu_xuat int,
don_gia_xuat varchar(50),
so_luong_xuat int,
primary key(ma_vat_tu, so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat)
);
