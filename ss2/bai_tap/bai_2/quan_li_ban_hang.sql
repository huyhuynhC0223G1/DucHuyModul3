create
database ss2_quan_li_ban_hang;
use
ss2_quan_li_ban_hang;

create table costomer
(
    costomer_id   int primary key auto_increment,
    costomer_name varchar(45),
    costomer_age  int
);

create table product
(
    product_id    int primary key auto_increment,
    product_name  varchar(45),
    product_price varchar(45)
);

create table `order`
(
    order_id          int primary key auto_increment,
    costomer_id       int,
    foreign key (costomer_id) references costomer (costomer_id),
    order_date        date,
    order_total_price varchar(45)
);

create table order_detail
(
    order_id              int,
    product_id            int,
    primary key (order_id, product_id),
    order_detail_quantity int check (order_detail_quantity >= 1),
    foreign key (order_id) references `order` (order_id),
    foreign key (product_id) references product (product_id)
);

insert into costomer(costomer_name, costomer_age)
    value ("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

insert into `order`(costomer_id, order_date, order_total_price)
    value (1, '20060321', null),
(2, '20060323', null),
(1, '20060316', null);

insert into product (product_name, product_price)
    value ("May giac" , 3),
("Tu lanh", 5),
("Dieu hoa", 7),
("Quat", 1),
("Bep dien", 2);

insert into order_detail(order_id, product_id, order_detail_quantity)
    value (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select order_id, order_date, order_total_price
from `order`;

select costomer_name, product_name
from costomer c
         join `order` o on c.costomer_id = o.costomer_id
         join order_detail od on o.order_id = od.order_id
         join product p on p.product_id = od.product_id;

select *
from costomer c
         left join `order` o on c.costomer_id = o.costomer_id
where o.costomer_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
select o.order_id, o.order_date, sum(od.order_detail_quantity * p.product_price) as order_detail_quantity
from `order` o
         join order_detail od on o.order_id = od.order_id
         join product p on p.product_id = od.product_id
group by o.order_id;




