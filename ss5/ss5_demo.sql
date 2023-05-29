create
database demo;
use
demo;

create table product
(
    id                  int primary key auto_increment,
    product_code        int not null,
    product_name        varchar(50),
    product_price       varchar(15),
    product_amount      varchar(50),
    product_description varchar(50),
    product_status      varchar(45)
);

-- id, product_code, product_name, product_price, product_amount, product_description, product_status 
insert into product
    value (1, 1, "but chi", "3000", "3000", "3000", "1"),
 (2, 2, "but bi", "5000", "5000", "5000", "2"),
 (3, 3, "but mau", "9000", "9000", "9000", "3");

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create unique index index_product on product (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_composite on product (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào 
explain
select *
from product;



-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.-- 
create view view_product as
select product_code, product_name, product_price, product_status
from product;

select *
from view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter
//
create procedure full_product()
begin
select *
from product;
end
//
delimiter ;

call full_product;

-- Tạo store procedure thêm một sản phẩm mới 
delimiter
//
create procedure create_product(id int, product_code int, product_name varchar (50), product_price varchar (15),
                                product_amount varchar (50), product_description varchar (50),
                                product_status varchar (45))
begin
insert into product
    value(id, product_code, product_name, product_price, product_amount, product_description, product_status);
end
//
delimiter ;

call create_product(4, 4, "but kim", "4000", "4000", "4000", "4");

delimiter
//
create procedure edit_product(id int, product_code int, product_name varchar (50), product_price varchar (15),
                              product_amount varchar (50), product_description varchar (50),
                              product_status varchar (45))
begin
update product
set product_code        = product_code,
    product_name        = product_name,
    product_price       = product_price,
    product_amount      = product_amount,
    product_description = product_description,
    product_status      = product_status
where product.id = id;
end
//
delimiter ;

call edit_product(2, 2 , "but bi", "5000", "4000", "3000", "2");
select *
from product;

-- Tạo store procedure xoá sản phẩm theo id

delimiter
//
create procedure delete_product(id int)
begin
delete
from product
where product.id = id;
end
//
delimiter ;

call delete_product(3);
select *
from product;
		


