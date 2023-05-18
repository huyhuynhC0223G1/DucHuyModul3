create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
id_class int primary key auto_increment,
name_class varchar(60) not null,
start_date datetime not null,
`status` bit);

insert into class (name_class, start_date, `status`)
value ( 'A1', '2008-12-20', 1),
('A2', '2008-12-22', 1),
('B3', current_date, 0);

create table student(
id_student int primary key auto_increment,
name_student varchar(60),
address varchar(60),
phone varchar(60),
`status` bit,
id_class int,
foreign key(id_class) references class(id_class)
);

insert into student(name_student, address, phone, `status`, id_class)
value ("Hung", 'Ha Noi', '0912113113', 1, 1),
("Hoa", 'Hai phong', null,  1, 1),
("Manh", 'HCM', '0123123123', 0, 2);  

create table `subject`(
id_subject int primary key auto_increment,
name_subject varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
`status` bit default 1);

insert into `subject` (name_subject, credit, `status`)
value ('CF', 5, 1),
       ( 'C', 6, 1),
       ( 'HDJ', 5, 1),
       ( 'RDBMS', 10, 1);

create table mark(
id_mark int primary key auto_increment,
id_subject int not null,
id_student int not null,
mark float default 0 check ( mark between 0 and 100 ),
exem_time tinyint default 1,
unique( id_subject, id_student),
foreign key (id_subject) references `subject`(id_subject),
foreign key (id_student) references student(id_student));

insert into mark (id_subject, id_student, mark, exem_time)
value (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
	
select * 
from student 
where name_student like "h%";

select * 
from class
where month(start_date) = '12';

select *
from `subject` sub
where sub.credit >=3 and sub.credit <=5;

 
set sql_safe_updates = 0;
update student 
set id_class = 2 
where  name_student = "Hung";
set sql_safe_updates = 1;

select * from student;

select name_student, name_subject, mark
from student s
join mark m on s.id_student = m.id_student
join `subject` sub  on m.id_subject = sub.id_subject
order by mark desc, s.name_student ;
       


