create
database qua_li_sinh_vien;
use
qua_li_sinh_vien;

create table class
(
    id     int primary key,
    `name` varchar(45)
);

create table teacher
(
    id      int primary key,
    `name`  varchar(45),
    age     int,
    country varchar(45)
);

select *
from class;
select *
from teacher;