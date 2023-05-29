use
case_study_quan_li;

-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.*
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
         join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
         join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = "Diamond"
  and (kh.dia_chi like "%Vinh" or "%Quảng Ngãi")
group by dvdk.ma_dich_vu_di_kem;

-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong,
       nv.ho_va_ten,
       kh.ho_va_ten,
       kh.so_dien_thoai,
       dv.ten_dich_vu,
       sum(ifnull(so_luong, 0)) as so_luong_dich_vu_di_kem,
       hd.tien_dat_coc
from hop_dong hd
         join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
         join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where ((month(hd.ngay_lam_hop_dong) between 10 and 12) and (year(hd.ngay_lam_hop_dong) = 2020))
  and hd.ma_dich_vu not in (
    select ma_dich_vu
    from hop_dong
    where (month(ngay_lam_hop_dong) between 1 and 6)
      and (year(ngay_lam_hop_dong) = 2021))
group by hd.ma_hop_dong;

-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.*, sum(so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
having sum(so_luong) = (
    select sum(so_luong)
    from hop_dong_chi_tiet
    group by ma_dich_vu_di_kem
    order by sum(so_luong) desc
    limit 1);

-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu,
--  ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem)
from loai_dich_vu ldv
         join dich_vu dv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
         join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
         join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where hdct.ma_dich_vu_di_kem in (
    select ma_dich_vu_di_kem
    from hop_dong_chi_tiet
    group by ma_dich_vu_di_kem
    having count(ma_dich_vu_di_kem) = 1
)
group by hdct.ma_hop_dong_chi_tiet;

-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien,
       nv.ho_va_ten,
       td.ten_trinh_do,
       bp.ten_bo_phan,
       nv.so_dien_thoai,
       nv.dia_chi,
       count(hd.ma_nhan_vien) as so_lan_lap_hop_dong
from nhan_vien nv
         join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
         join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
         join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

-- delimiter //
-- create procedure delete_product(id int)
-- begin
--      delete from product
--      where nhan_vien.ma_nhan_vien = id;
-- end //
-- delimiter ;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set
sql_safe_updates = 0 ;
delete
from nhan_vien
where ma_nhan_vien not in (
    select *
    from (
             select nv.ma_nhan_vien
             from nhan_vien nv
                      join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
             where year (hd.ngay_lam_hop_dong) between 2019 and 2021) as nhan_vien_khong_xoa
);
set
sql_safe_updates = 1 ;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 

set
sql_safe_updates = 0 ;
update khach_hang kh
    join loai_khach lk
on lk.ma_loai_khach = kh.ma_loai_khach
    set kh.ma_loai_khach = 1
where kh.ma_khach_hang = (
    select ma_khach_hang from view_tong_tien
    where ten_loai_khach like "Platinium"
  and (year (ngay_lam_hop_dong)) = 2021
  and tong_tien
    > 10000000);
set
sql_safe_updates = 1 ;

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- set sql_safe_updates = 0 ;
-- delete from khach_hang kh
-- where kh.ho_va_ten  in (select * from(
-- select kh.ho_va_ten
-- from khach_hang kh
-- join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
-- where year(hd.ngay_lam_hop_dong) < 2021) as khach_hang_truoc_nam_2021);

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem = (
    select *
    from (
             select dvdk.ma_dich_vu_di_kem
             from dich_vu_di_kem dvdk
                      join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                      join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
             where year (hd.ngay_lam_hop_dong) = 2020
             group by dvdk.ma_dich_vu_di_kem
             having sum (so_luong) > 10)
             as cap_nhat_dich_vu);