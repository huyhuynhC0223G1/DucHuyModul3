create database case_study_vu;
use case_study_vu;

CREATE TABLE vi_tri (
    ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
); 

insert into vi_tri(ten_vi_tri)
 value("giám đốc"),("nhân viên");
 
create table trinh_do(
ma_trinh_do int auto_increment primary key,
ten_trinh_do varchar(45)
);

insert into trinh_do(ten_trinh_do)
 value("Trung cấp "),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");

create table bo_phan(
ma_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45)
);

insert into bo_phan(ten_bo_phan)
 value("Sale Marketing"),("Hành Chính"),("Phục Vụ"),("Quản Lý");
 
create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(45)not null,
ngay_sinh DATE not null,
so_cmnd varchar(45)not null,
luong double not null,
so_dien_thoai varchar(45)not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
 value("Nguyễn Văn An",'1970-11-07',"456231786",10000000,"0901234121","nguyenA@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
 ("Lê Văn Bình",'1997-04-09',"654231234",7000000,"0934212314","lebinh@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2),
 ("Hồ Thị Yến",'1995-12-12',"999231723",14000000,"0412352315","hoyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
 ("Võ Công Toản",'1980-04-04',"123231365",17000000,"0374443232","votoan@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
 ("Nguyễn Bỉnh Phát",'1999-12-09',"454363232",6000000,"0902341231","nguyenphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
 ("Khúc Nguyễn An Nghi",'2000-11-08',"964542311",7000000,"0978653213","annghi@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
 ("Nguyễn Hữu Hà",'1993-01-01',"534323231",8000000,"0941234553","nguyenha@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
 ("Tòng Hoang",'1989-09-03',"234414123",9000000,"0642123111","tonghoang@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
 ("Nguyễn Khúc An Nghi",'1982-09-03',"256781231",6000000,"0245144444","nguyennghi@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
 ("Nguyễn Công Đạo",'1994-01-08',"755434343",8000000,"0988767111","nguyencongdao@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);
 
create table loai_khach(
ma_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45)
);

insert into loai_khach(ten_loai_khach)
value("Diamond"),
("Platinum"),
("Gold"),
("Silver"),
("Member");

create table khach_hang(
ma_khach_hang int auto_increment primary key,
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45)not null,
so_dien_thoai varchar(45)not null,
email varchar(45),
dia_chi varchar(45),
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);

insert into khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
value("Nguyễn Thị Hào",'1970-11-07',0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng", 5),	
("Phạm Xuân Diệu",'1992-08-08',1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị", 3),
("Trương Đình Nghệ",'1990-02-27',1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh", 1),
("Dương Văn Quan",'1981-07-08',1,"543432111","0490039241","duongquang@gmail.com","K453/12 Lê Lợi, Đà Nẵng", 1),
("Hoàng Trần Nhi Nhi",'1995-12-09',0,"795453345","0312345678","nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai", 4),
("Nguyễn Thị Hào",'1970-11-07',0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng", 4),
("Tôn Nữ Mộc Châu",'2005-12-06',0,"732434215","0988888844","tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng", 1),
("Nguyễn Thị Hào",'1999-04-08',0,"965656433","0763212345","haohao99@gmail.com","255 Nguyễn Văn Linh, Kon Tum", 3),
("Trần Đại Danh",'1994-07-01',1,"432341235","0643343433","danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi", 1),
("Nguyễn Tâm Đắc",'1989-07-01',1,"344343432","0987654321","dactam@gmail.com","22 Ngô Quyền, Đà Nẵng", 2);

create table kieu_thue(
ma_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45)
);
insert into kieu_thue(ten_kieu_thue)
value("year"),("month"),("day"),("hour");

create table loai_dich_vu(
ma_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);
insert into loai_dich_vu(ten_loai_dich_vu)
value("Villa"),
("House"),
("Room");

create table dich_vu(
ma_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45)not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi int,
so_tang int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
insert into dich_vu(ten_dich_vu, dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong, mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
value("Villa Beach Front",25000,10000000,10,"vip","Có hồ bơi",500,4,3,1),
("House Princess 01",14000,5000000,7,"vip","Có thêm bếp nướng",	null,3,	2,2),
("Room Twin 01",5000,1000000,2,"normal","Có tivi",null,null,4,3),
("Villa No Beach Front",22000,9000000,8	,"normal","Có hồ bơi",300,3,3,1),
("House Princess 02",10000,4000000,5,"normal","Có thêm bếp nướng",null,2,3,2),
("Room Twin 02",3000,900000,2,"normal","Có tivi",null,null,4,3);
create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45)not null,
gia double not null,
don_vi varchar(10)not null,
trang_thai varchar(45)
);
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai)
value("Karaoke",10000,"giờ","tiện nghi, hiện tại"),
("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
("Thuê xe đạp",20000,"chiếc","tốt"),
("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");

create table hop_dong(
ma_hop_dong int auto_increment primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
value(20201208,20201208,0,3,1,3),
(20200714,20200721,	200000,7,3,	1),
(20210315,20210317,	50000,3,4,2),
(20210114,20210118,100000,7,5,5),
(20210714,20210715,0,7,2,6),
(20210601,20210603,0,7,7,6),
(20210902,20210905,100000,7,4,4),
(20210617,20210618,150000,3,4,1),
(20201119,20201119,0,3,4,3),
(20210412,20210414,0,10,3,5),
(20210425,20210425,0,2,2,1),
(20210525,20210527,0,7,10,1);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int auto_increment primary key,
so_luong int not null,
ma_hop_dong int,
ma_dich_vu_di_kem int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
value(5,2,4),	
	(8,2,5),	
	(15,2,6),
	(1,3,1),
	(11,3,2),
	(1,1,3),
	(2,1,2),	
	(2,12,2);	
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
-- --regexp
select *
 from nhan_vien
 where ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%" and char_length(ho_ten)<=15;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
 select  *
 from khach_hang
 where timestampdiff(year,khach_hang.ngay_sinh,curdate())>=18 
 and  timestampdiff(year,khach_hang.ngay_sinh,curdate())<=50
 and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
	select *
    from khach_hang 
    join loai_khach
    on khach_hang.ma_loai_khach=loai_khach.ma_loai_khach
    join hop_dong
    on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
    where ten_loai_khach="Diamond"
	order by khach_hang.ho_ten;
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
ifnull(sum( dich_vu.chi_phi_thue+ifnull((hop_dong_chi_tiet.so_luong*gia ),0)),0) as total
from loai_khach as lk
join khach_hang as kh on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong on kh.ma_khach_hang=hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu=dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem=dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong, kh.ma_khach_hang;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu as dv
join hop_dong as hd
on dv.ma_dich_vu=hd.ma_dich_vu
join loai_dich_vu
on dv.ma_loai_dich_vu=loai_dich_vu.ma_loai_dich_vu
where hd.ma_dich_vu not in(
select ma_dich_vu
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) =2021 and month(hop_dong.ngay_lam_hop_dong) between 1 and 3 )
group by dv.ma_dich_vu;
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu as dv
join hop_dong as hd
on dv.ma_dich_vu=hd.ma_dich_vu
join loai_dich_vu
on dv.ma_loai_dich_vu=loai_dich_vu.ma_loai_dich_vu
where hd.ma_dich_vu not in(
select ma_dich_vu
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) =2021)
group by dv.ma_dich_vu;
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct ho_ten
from khach_hang;

select ho_ten
from khach_hang
group by khach_hang.ho_ten;

select ho_ten
from khach_hang
union 
select ho_ten
from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong), count(ma_khach_hang)
from hop_dong
where year (hop_dong.ngay_lam_hop_dong)=2021
group by month(hop_dong.ngay_lam_hop_dong)
order by month(hop_dong.ngay_lam_hop_dong);
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,ifnull(sum(hop_dong_chi_tiet.so_luong),0)as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet on hd.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
group by hd.ma_hop_dong
order by hd.ma_hop_dong asc;