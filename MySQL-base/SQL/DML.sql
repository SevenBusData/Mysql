create database Test;

use Test;

create table employee(
    `id` int comment '编号',
    `workNo` varchar(10) comment '工作编号',
    `name` varchar(10) comment '姓名',
    `gender` char(1) comment '性别',
    `age` tinyint unsigned comment '年龄',
    `identityCard` varchar(18) comment '身份证号',
    `timeOfEntry` date comment '入职时间'
)comment = '员工表' ;

-- 添加表中指定字段
insert into employee(id, workNo, name, gender, age, identityCard, timeOfEntry) values (1, '1', 'seven1', '男', 18, '123456789012345678', '2023-05-12');
insert into employee(id, workNo, name, gender, age, identityCard, timeOfEntry) values (2, '2', 'seven2', '男', 18, '123456789012345678', '2023-05-12');
insert into employee(id, workNo, name, gender, age, identityCard, timeOfEntry) values (3, '3', 'seven3', '男', 18, '123456789012345678', '2023-05-12');
insert into employee(id, workNo, name, gender, age, identityCard, timeOfEntry) values (4, '4', 'seven4', '男', 18, '123456789012345678', '2023-05-12');
insert into employee(id, workNo, name, gender, age, identityCard, timeOfEntry) values (5, '5', 'seven5', '男', 18, '123456789012345678', '2023-05-12');

-- 添加表中所有字段
insert into employee values (6, '6', 'seven6', '女', 18, '123456789012345678', '2023-5-12');
insert into employee values (7, '7', 'seven7', '女', 18, '123456789012345678', '2023-5-12');
insert into employee values (8, '8', 'seven8', '女', 18, '123456789012345678', '2023-5-12');
insert into employee values (9, '9', 'seven9', '女', 18, '123456789012345678', '2023-5-12');
insert into employee values (10, '10', 'seven10', '女', 18, '123456789012345678', '2023-5-12');

-- 批量添加数据
insert into employee (id, workNo, name, gender, age, identityCard, timeOfEntry) values (11, '11', 'seven11', '男', 18, '123456789012345678', '2023-05-12'),(12, '12', 'seven12', '男', 18, '123456789012345678', '2023-05-12');
insert into employee values (13, '13', 'seven13', '女', 18, '123456789012345678', '2023-05-12'),(14, '14', 'seven14', '女', 18, '123456789012345678', '2023-05-12');

-- 修改id为1的数据，将name改为sevenbus；
update employee set name = 'sevenbus' where id = 1;

-- 修改id为1的数据，将name改为sevenbusdata，gender改成女；
update employee set name = 'sevenbusdata', gender = '女' where id = 1;

-- 将所有员工的入职时间timeOfEntry都改为2023-05-13；
update employee set timeOfEntry = '2023-05-13';

-- 删除gender为女的员工
delete from employee where gender = '女';

-- 删除所有数据
delete from employee;
select * from employee;

