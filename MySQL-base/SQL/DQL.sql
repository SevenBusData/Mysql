use Test;

create table emp(
    `id` int comment '编号',
    `workNo` varchar(10) comment '工作编号',
    `name` varchar(10) comment '姓名',
    `gender` char(1) comment '性别',
    `age` tinyint unsigned comment '年龄',
    `identityCard` varchar(18) comment '身份证号',
    `workaddress` varchar(50) comment '工作地址',
    `timeOfEntry` date comment '入职时间'
);

insert into emp values (1, '1', '柳岩', '女', 20, '123456789012345678', '北京', '2000-1-1');
insert into emp values (2, '2', '张无忌', '男', 18, '123456789012345678', '北京', '2005-9-1');
insert into emp values (3, '3', '韦一笑', '男', 38, '123456789012345678', '上海', '2005-8-1');
insert into emp values (4, '4', '赵敏', '女', 18, '123456789012345678', '北京', '2009-12-1');
insert into emp values (5, '5', '小昭', '女', 16, '12345678901234567X', '上海', '2007-7-1');
insert into emp values (6, '6', '杨逍', '男', 28, '123456789012345678', '北京', '2006-1-1');
insert into emp values (7, '7', '范遥', '男', 40, '123456789012345678', '北京', '2005-5-1');
insert into emp values (8, '8', '黛绮丝', '女', 38, '123456789012345678', '天津', '2015-5-1');
insert into emp values (9, '9', '范凉凉', '女', 45, '123456789012345678', '北京', '2010-4-1');
insert into emp values (10, '10', '陈友谅', '男', 53, '123456789012345678', '上海', '2011-1-1');
insert into emp values (11, '11', '张士诚', '男', 55, '123456789012345678', '江苏', '2015-5-1');
insert into emp values (12, '12', '常遇春', '男', 32, '123456789012345678', '北京', '2004-2-1');
insert into emp values (13, '13', '张三丰', '男', 88, '123456789012345678', '江苏', '2020-11-1');
insert into emp values (14, '14', '灭绝', '女', 65, '123456789012345678', '西安', '2019-5-1');
insert into emp values (15, '15', '胡青牛', '男', 70, '123456789012345678', '西安', '2018-4-1');
insert into emp (id, workNo, name, gender, age, workaddress, timeOfEntry ) values (16, '16', '周芷若', '女', 18 , '北京', '2012-6-1');



-- 普通查询

-- 1、查询指定字段name，workno，age 返回。
select name, workNo, age from emp;

-- 2.查询所有字段返回。
select id, workNo, name, gender, age, identityCard, workaddress, timeOfEntry from emp;
select * from emp;

-- 3、查询所有员工地址，启别名。
select workaddress as '工作地址' from emp;
select workaddress '工作地址' from emp;

-- 4、查询所有员工地址，不要重复
select distinct workaddress from emp;


-- 条件查询
-- 1、查询年龄等于88的员工信息
select * from emp where age = 88;

-- 2、查询年龄小于88的员工信息
select * from emp where age < 88;

-- 3、查询年龄小于等于20的员工信息
select * from emp where age <= 20;

-- 4、查询没有身份证号的员工信息
select * from emp where identityCard is null;

-- 5、查询有身份证号的员工信息
select * from emp where identityCard is not null;

-- 6、查询年龄不等于88的员工信息
select * from emp where age != 18;
select * from emp where age <> 18;

-- 7、查询年龄在15岁（包含）到 20岁（包含）之间的员工信息
select * from emp where age between 15 and 20;

select * from emp where age >= 15 and age <= 20;
select * from emp where age >= 15 && age <= 20;

-- 8、查询性别为女，并且年龄小于25岁的员工信息
select * from emp where gender = '女' and age < 25;
select * from emp where gender = '女' && age < 25;

-- 9、查询年龄为18 或 20 或 40 的员工信息
select * from emp where age = 18 or age = 20 or age = 40;
select * from emp where age = 18 or age = 20 || age = 40;

select * from emp where age in (18, 20, 40);

-- 10、查询姓名为两个字的员工信息
select * from emp where name like '__';

-- 11、查询身份证号最后一位为X的员工信息
select * from emp where emp.identityCard like '%X';
select * from emp where emp.identityCard like '_________________X';




-- 聚合函数
-- 1、统计该企业员工数量
select count(*) from emp;

-- 2、统计该企业员工的平均年龄
select avg(age) from emp;

-- 3、统计该企业员工的最大年龄
select max(age) from emp;

-- 4、统计该企业员工的最小年龄
select min(age) from emp;

-- 5、统计西安地区的员工年龄之和
select sum(age) from emp where workaddress = '西安';




-- 分组查询
-- 1、根据性别分组，统计男性员工 和 女性员工对数量
select gender, count(*) from emp group by gender;


select gender, count(*) from emp group by gender having gender = '男';
select gender, count(*) from emp group by gender having gender = '女';

-- 2、根据性别分组，统计男性员工 和 女性员工的平均年龄
select gender, avg(age) from emp group by gender;

select gender, avg(age) from emp group by gender having gender = '男';
select gender, avg(age) from emp group by gender having gender = '女';

-- 3、查询年龄小于45的员工，并根据工作地址分组，获取员工数量大于等于3的工作地址
select workaddress, count(*) from emp where age < 45 group by workaddress having count(*) >= 3;

select workaddress, count(*) as address_count from emp where age < 45 group by workaddress having address_count >= 3;





-- 排序查询
-- 1、根据年龄对公司对员工进行升序排序。
select * from emp order by age ASC;

-- 2、根据入职时间，对公司员工进行降序排序。
select * from emp order by timeOfEntry DESC;

-- 3、根据年龄对公司员工进行升序排序，如果年龄相同，才根据入职时间进行降序排序。
select * from emp order by age ASC, timeOfEntry Desc;








-- 分页查询
-- 1、查询第一页员工数据，每页显示10条数据。
select * from  emp limit 0,10;

-- 2、查询第二页员工数据，每页显示10条数据。  --------------> 页码-1）* 页面展示记录数。
select * from  emp limit 10,10;








--  -------------------  DQL 语句练习  -------------------
-- 1、查询年龄为20，21，22，23岁的女性员工信息。
select * from emp where age in (20, 21, 22, 23) and (gender = '女') ;

-- 2、查询性别年龄为 男 ，并且年龄在 20～40 岁(含)以内的姓名为3个字的员工。
select * from emp where gender = '男' and age between 20 and 40 and name like '___';
-- 3、统计员工表中，年龄小于60岁的，男性员工与女性员工的人数。
select gender,count(*) as 数量 from emp where age < 60 group by gender;

-- 4、查询所有小于等于35岁员工的姓名和年龄，并对查询结果按年龄升序排序，如果年龄相同按入职时间降序排序。
select name, age from emp where age <= 35 order by age ASC ,timeOfEntry DESC;

-- 5、查询性别为男，且年龄在20~40岁(含)以内的前5个员工信息，对查询结果按年龄升序排序，年龄相同按入职时间降序排序。
select * from emp where gender = '男' and age between 20 and 40 order by age ASC ,timeOfEntry DESC limit 0,5;