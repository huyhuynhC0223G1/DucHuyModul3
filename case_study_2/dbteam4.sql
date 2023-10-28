create database team4;
use team4;
SET FOREIGN_KEY_CHECKS = 0;
create table roles(
role_id int primary key auto_increment,
role_name varchar(25) not null
);
create table account_users(
account_id int primary key auto_increment,
user_email varchar(50) unique not null,
user_password varchar(50) not null
);
create table user_role(
role_id int,
account_id int,
primary key(role_id, account_id),
foreign key (role_id) references roles(role_id),
foreign key (account_id) references account_users(account_id)
);
create table customers(
customer_id int primary key auto_increment,
customer_name varchar(50) not null,
email varchar(50),
phone_number varchar(15),
address text,
account_id int,
foreign key (account_id) references account_users(account_id)
);
-- employee
CREATE TABLE employee(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
    foreign key (account_id) references account_users(account_id)
    );
create table product_type(
product_type_id int primary key auto_increment,
product_type_name varchar(25)
);
create table products(
product_id int primary key auto_increment,
product_name varchar(100) not null,
product_description text not null,
price double not null,
image text not null,
product_type_id int,
foreign key (product_type_id) references product_type(product_type_id)
);
-- cart details
create table cart_details(
id int primary key auto_increment,
customer_id int,
product_id int,
product_name varchar(100),
product_type_id int,
price double,
image text,
quantity int,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
);
create table orders(
order_id int primary key auto_increment,
order_date timestamp default current_timestamp,
customer_id int,
employee_id int,
order_status varchar(25) default("processing"), -- "complete"
foreign key (customer_id) references customers(customer_id),
foreign key (employee_id) references employee(employee_id)
);
create table order_details(
order_details_id int primary key auto_increment,
order_id int not null,
product_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);
insert into account_users(user_email, user_password)
values("hannah@gmail.com", "hannah"),
 ("admin@gmail.com", "admin"),
 ("nam@gmail.com", "nam"),
 ("hai@gmail.com", "hai"),
 ("tin@gmail.com", "tin"),
 ("kiet@gmail.com", "kiet"),
 ("nhan@gmail.com", "nhan"),
 ("hoa@gmail.com", "hoa"),
 ("minh@gmail.com", "minh"),
 ("huy@gmail.com", "huy"),
 ("dinh@gmail.com", "dinh"),
 ("thanh@gmail.com", "thanh") ;
insert into roles(role_name) values ("employee"), ("customer");
insert into user_role(role_id, account_id) values (1,1), (1,2);
-- check account in db
delimiter //
create procedure check_account(email varchar(50), user_password varchar(50))
begin
select * from account_users au
where au.user_email = email and au.user_password = user_password;
end //
delimiter ;
-- check role
delimiter //
create procedure check_role(account_id int)
begin
select role_name from roles r
join user_role ur on ur.role_id = r.role_id
where ur.account_id = account_id;
end //
delimiter ;
-- create new product
delimiter //
create procedure add_product(p_name varchar(100),p_description text,
price double, image text, product_type_id int)
begin
insert into products(product_name, product_description, price, image, product_type_id)
values (p_name, p_description, price, image, product_type_id);
end //
delimiter ;
-- update product
delimiter //
create procedure update_product( p_name varchar(100),p_description text,
price double, image text, product_type_id int, p_id int)
begin
update products
set product_name = p_name, product_description = p_description, price = price,
image = image, product_type_id = product_type_id
where product_id = p_id;
end //
delimiter ;
insert into product_type(product_type_name) values ("merch"),("music");
insert into products(product_name, product_description, price, image, product_type_id)
values ("SMITHEREENS Black Pullover Hoodie","Double fabric hood with self colour drawcord.", 60.00, "/view/images/3.png", 1),
("SMITHEREENS Black T-Shirt","Twin needle sleeves and hem.", 35.00 , "/view/images/6.png", 1),
("SMITHEREENS Grey Hoodie","Soft cotton faced fabric", 60.00 , "/view/images/1.png", 1),
("SMITHEREENS Ash Longsleeve","Taped neck and shoulders.", 45.00 , "/view/images/2.png", 1),
("SMITHEREENS Exclusive Highlighter Yellow 12' Vinyl","Glimpse Of Us",  27.99, "/view/images/9.png", 2),
("SMITHEREENS CD","Die For You", 10.99 , "/view/images/12.png", 2),
("SMITHEREENS Cassette","Exclusive Smoky Tint Shell", 13.99 , "/view/images/11.png", 2),
("SMITHEREENS Digital Album","You will receive a separate email to download the album.", 8.99 , "/view/images/10.png", 2),
("Black SMITHEREENS Circular Print T-Shirt","Ribbed collar.", 30.00 , "/view/images/7.png", 1),
("White Silhouette Longsleeve","Ribbed collar.",  40.00, "/view/images/5.png", 1),
("SMITHEREENS Yellow Print T-Shirt","Ribbed collar.",  30.00, "/view/images/4.png", 1),
("Black Silhouette Longsleeve","Classic fit.", 40.00 , "/view/images/8.png", 1);
insert into customers(customer_name, email, phone_number, address, account_id)
values("Công Nam", "nam@gmail.com", "0358963147", "Huế", 3),
("Thanh Hải", "hai@gmail.com", "0347852963", "Đà Nẵng", 4),
("Hữu Tín", "tin@gmail.com", "098554214", "Đà Nẵng", 5),
("Tuấn Kiệt", "kiet@gmail.com", "0369852741", "Gia Lai", 6),
("Anh Nhàn", "nhan@gmail.com", "0358963369", "Quảng Nam", 7),
("Yến Hoa", "hoa@gmail.com", "0214785299", "Quảng Nam", 8),
("Minh Minh", "Minh@gmail.com", "0336985247", "Đà Nẵng", 9),
("Đức Huy", "huy@gmail.com", "0359456123", "Gia Lai", 10),
("Đình Đình", "dinh@gmail.com", "0343353637", "Huế", 11),
("Thanh Thanh", "thanh@gmail.com", "0362728299", "Đà Nẵng", 12);
insert into employee(employee_name, email, phone_number, address, account_id)
values("Minh Hạnh", "hannah@gmail.com", "0336677888", "Đà Nẵng", 1),
("Admin", "admin@gmail.com", "0324567899", "Đà Nẵng",2);
insert into orders(customer_id, employee_id, order_status)
values(2, 2, "complete"),
(1, 2, "complete"),
(3, 2, "complete"),
(4, 2, "complete"),
(5, 1, "complete"),
(9, 2, "complete"),
(10, 1, "complete"),
(7, 2, "processing"),
(3, 1, "processing"),
(8, 1, "processing");
insert into order_details(order_id, product_id, quantity)
values(1, 4, 2),
(2,8,3),
(3,1,2),
(4,9,2),
(5,7,1),
(6,6,1),
(7,5,3),
(8,4,2),
(9,10,5),
(10,12,1);
-- mn de y phan tren ni thoi nghe :) khuc duoi ni dung quan tam
-- select all merch
delimiter //
create procedure select_merch()
begin
select * from products
where product_type_id = 1;
end //
delimiter ;
-- select all music
delimiter //
create procedure select_music()
begin
select * from products
where product_type_id = 2;
end //
delimiter ;
-- create new account
delimiter //
create procedure create_customer_account(first_name varchar(25), last_name varchar(25), username varchar(50), password varchar(50))
begin
insert into account_users(user_email,user_password) values (username, password);
insert into user_role(role_id, account_id) values (2, last_insert_id());
insert into customers(customer_name, email, account_id) values (concat(first_name, " ", last_name), username, last_insert_id());
end //
delimiter ;
-- update cart quantity if product already exists
delimiter //
create procedure update_cart(cus_id int, prod_id int, new_quantity int)
begin
update cart_details cd
set cd.quantity = cd.quantity + new_quantity
where cd.customer_id = cus_id and cd.product_id = prod_id;
end //
delimiter ;
-- retrieve carts with total
delimiter //
create procedure view_cart(cus_id int)
begin
select customer_id, product_id, product_name, product_type_id, price, image, quantity, sum(price * quantity) as total
from cart_details cd
where cus_id = cd.customer_id
group by product_id, id;
end //
delimiter ;
-- get latest order_id to create order_details
delimiter //
create procedure get_latest_order_id()
begin
select order_id
from orders
order by order_id desc
limit 1;
end //
delimiter ;
-- delete account-user
delimiter //
create procedure delete_account_user(account_id int)
begin
SET FOREIGN_KEY_CHECKS = 0;
delete from account_users au where au.account_id = account_id;
delete from customers c where c.account_id = account_id;
-- SET FOREIGN_KEY_CHECKS = 1;
end //
delimiter ;
-- delete order
delimiter //
create procedure delete_order(id_delete int)
begin
SET FOREIGN_KEY_CHECKS = 0;
delete from orders o where o.order_id = id_delete;
delete from order_details od where od.order_details_id = id_delete;
-- SET FOREIGN_KEY_CHECKS = 1;
end //
delimiter ;
-- show order management
delimiter //
create procedure show_order_management()
begin
select o.order_id,e.employee_name,c.customer_name,o.order_date,o.order_status from employee e
join orders o on e.employee_id = o.employee_id
join customers c on c.customer_id = o.customer_id
join order_details od on od.order_id = o.order_id
join products p on p.product_id = od.product_id
order by o.order_id;
end //
delimiter ;
-- find order by name customer
delimiter //
create procedure find_order_by_name_customer(name_customer varchar(50))
begin
select o.order_id,e.employee_name,c.customer_name,o.order_date,o.order_status from employee e
join orders o on e.employee_id = o.employee_id
join customers c on c.customer_id = o.customer_id
join order_details od on od.order_id = o.order_id
join products p on p.product_id = od.product_id
where c.customer_name like name_customer
order by o.order_id;
end //
delimiter ;
call show_order_management();
-- get total price
delimiter //
create procedure get_total_price()
begin
select o.order_id,sum(p.price * od.quantity) as total_price from orders o
join order_details od on o.order_id = od.order_id
join products p on p.product_id = od.product_id
group by o.order_id;
end //
delimiter ;
-- get detail list
delimiter //
create procedure get_details(id int)
begin
select od.order_details_id,p.product_name,p.price,od.quantity from order_details od
join orders o on od.order_id = o.order_id
join products p on p.product_id = od.product_id
where o.order_id = id;
end //
delimiter ;
alter table customers
add is_delete int(1) default 0;
DELIMITER //
CREATE PROCEDURE addCustomer(customer_name varchar(50),phone varchar(11),customer_email varchar(50) ,address varchar(50),customer_password varchar(50))
BEGIN
insert into account_users(user_email, user_password)
value (customer_email,customer_password);
insert into user_role(role_id,account_id)
value(2,last_insert_id());
insert into customers(customer_name, email, phone_number, address, account_id)
value(customer_name,customer_email,phone,address,last_insert_id());
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE findCustomer(customer_name varchar(50),customer_address varchar(50))
BEGIN
SELECT *FROM customers
where customers.customer_name like concat("%",customer_name,"%") and customers.address like concat("%",customer_address,"%") and customers.is_delete=0;
END //
DELIMITER ;
call findCustomer("h","Đà")