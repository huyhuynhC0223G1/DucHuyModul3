use case_study_quan_li;

-- 21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Yên Bái” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “2021”.

create view v_nhan_vien as
select nv.* 
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) = 2021 and nv.dia_chi like "%Yên Bái%";

-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

update nhan_vien
set dia_chi = "Liên Chiểu"
where ma_nhan_vien = (select * from( 
select ma_nhan_vien
from v_nhan_vien ) as nv);

-- 23.Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang(id int)
begin
     delete from khach_hang
     where khach_hang.ma_khach_hang = id;
end //
delimiter ;

set foreign_key_checks = 0;
set sql_safe_updates=0;
call sp_xoa_khach_hang(3);
set foreign_key_checks = 1;
set sql_safe_updates=0;

-- 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc 
-- không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
create procedure sp_them_moi_hop_dong( sp_ngay_lam_hop_dong datetime , sp_ngay_ket_thuc datetime ,
									sp_tien_dat_coc double , sp_ma_nhan_vien int, sp_ma_khach_hang int, sp_ma_dich_vu int)
begin
    if sp_ma_nhan_vien not in (select ma_nhan_vien from nhan_vien) 
	then
        signal sqlstate '45000'
		set message_text = 'nhan vien khong ton tai';
	end if;
        if sp_ma_khach_hang not in (select ma_khach_hang from khach_hang) 
	then
        signal sqlstate '45000'
		set message_text = 'khach hang khong ton tai';
	end if;
        if sp_ma_dich_vu not in (select ma_dich_vu from dich_vu) 
	then
        signal sqlstate '45000'
		set message_text = 'dich vu khong ton tai';
	end if;
        insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
		value (sp_ngay_lam_hop_dong, sp_ngay_ket_thuc, sp_tien_dat_coc, sp_ma_nhan_vien, sp_ma_khach_hang, sp_ma_dich_vu);
end //
delimiter ; 

call sp_them_moi_hop_dong( "2021-10-10", "2021-10-12", 2000000, 7, 7, 5);   

-- 25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị 
-- tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

create table xoa_hop_dong(
stt_so_lan_xoa int primary key auto_increment,
old_so_luong_hop_dong int ,
after_so_luong_hop_dong int,
delete_time datetime);

delimiter //
		create procedure sp_xoa_dop_dong(id int)
		begin
			delete from hop_dong hd
			where hd.ma_hop_dong = id;
		end //
delimiter ;



delimiter //
create trigger tr_xoa_hop_dong
after delete on hop_dong
for each row
begin
declare old_so_luong_hop_dong int;
set old_so_luong_hop_dong =( 
select count(ma_hop_dong) as old_so_luong_hop_dong from hop_dong);
insert into xoa_hop_dong(old_so_luong_hop_dong, after_so_luong_hop_dong, delete_time)
value (old_so_luong_hop_dong, old_so_luong_hop_dong - 1 , now());
end //
delimiter ;

set foreign_key_checks = 0;
set sql_safe_updates=0;
call sp_xoa_dop_dong(5);	
call sp_xoa_dop_dong(6);
