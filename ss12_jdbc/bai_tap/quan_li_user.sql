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

delimiter //
create procedure SELECT_ALL_USERS()
begin
select * from users;
end //
delimiter ;

call SELECT_ALL_USERS;

delimiter //
create procedure UPDATE_USERS_SQL(sp_id int, sp_name varchar(50), sp_email varchar(50), sp_country varchar(50))
begin
set foreign_key_checks = 0;
set sql_safe_updates=0;
update users 
set name = sp_name, email= sp_email, country = sp_country where id = sp_id;
set sql_safe_updates=1;
set foreign_key_checks = 1;
end //
delimiter ;

call UPDATE_USERS_SQL(2,"Thanh", "thanh@gmail.com", "Việt Nam");

delimiter //
create procedure DELETE_USERS_SQL(sp_id int)
begin
delete from users where id = sp_id;
end //
delimiter ;

call DELETE_USERS_SQL(3); 
