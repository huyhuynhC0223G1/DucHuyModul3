create database quan_li_user;
use quan_li_user;

create table users(
id int not null primary key auto_increment,
name varchar(50),
email varchar(50),
country varchar(50));

insert into users(name, email, country)
 value('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');
