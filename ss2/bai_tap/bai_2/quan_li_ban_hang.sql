create database ss2_quan_li_ban_hang;
use ss2_quan_li_ban_hang;

create table costomer(
costomer_id int primary key auto_increment,
costomer_name varchar(45),
costomer_age int
);

create table product(
product_id int primary key auto_increment,
product_name varchar(45),
product_price varchar(45)
);

create table `order`(
order_id int primary key auto_increment,
costomer_id int,
foreign key(costomer_id) references costomer(costomer_id),
order_date date,
order_total_price varchar(45)
);

create table order_detail(
order_id int,
product_id int,
primary key(order_id, product_id),
order_detail_quantity int check (order_detail_quantity >= 1),
foreign key(order_id) references `order`(order_id),
foreign key(product_id) references product(product_id)
);
