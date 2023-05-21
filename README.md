# Mysql
## 基础
### 概述-数据模型
#### MySQL数据库
**关系型数据库（RDBMS）**  
概念：建立在关系模型基础上，由多张相互连接的二位表组成数据库。  
特点：
1. 使用表存储数据，格式统一，便于维护
2. 使用SQL语言操作，标准统一，使用方便
<img width="730" alt="基础-概述-数据模型-关键型数据库01" src="https://user-images.githubusercontent.com/122709756/236872643-dc98e96f-a511-4add-940d-4ee900a3e977.png">

**数据模型**
<img width="1185" alt="基础-概括-数据模型-关键型数据库02" src="https://user-images.githubusercontent.com/122709756/236874165-4b88ee43-66eb-4793-acb8-c158a8ca3809.png">

### SQL-通用语法及分类
#### SQL通用语法
1. SQL语句可以单行或多行书写，以分号结尾。
2. SQL语句可以用空格/缩进来增强语句的可读性。
3. MySQL数据库的SQL语句不分大小写区别，关键字建议使用大写。
4. 注释
  - 单行注释：--注释内容 或 #注释内容（MySQL所特有）
  - 多行注释：注释内容在两个*之间 /**/
|分类|全称|说明|
|---|---|---|
|DDL|Data Definition Language|数据定义语言，用来定义数据库的对象（数据库，表，字段）|
|DML|Data Manipulation Language|数据操作语言，用来对数据库表中的数据进行增删改|
|DQL|Data Query Language|数据查询语言，用来查询数据库表的记录|
|DCL|Data Control Language|数据控制语言，用来创建数据库用户、控制数据的访问权限|
#### DDL-数据库操作
##### 查询
查询所有数据库
```
SHOW DATABASES;
```
选择数当前据库
```
SELECT DATABASE();
```
##### 创建
```
CREATE DATABASE [IF NOT EXISTS] 数据库名 [DEFAULT CHARSET 字符集] [COLLATE 排序顺序]; 
#其中DEFAULT CHARSET 是设置字符集例如uft8或者utf8mb4
```
##### 删除
```
DROP DATABASE [IF EXISTS] 数据库名
```
##### 使用
```
USE 数据库名
```
#### DDL-表操作
##### 查询表
查询当前所有表的内容
```
SHOW TABLES;
```
查询表结构
```
DESC 表名;
```
查询指定表的建表语句
```
SHOW CREATE TABLE 表名;
```
##### 创建
创建表
```
CREATE TABLE 表名(
    字段一 字段一类型 [COMMENT 字段1注释],
    字段二 字段二类型 [COMMENT 字段2注释],
    字段三 字段三类型 [COMMENT 字段3注释],
    ...
    字段N 字段N类型 [COMMENT 字段N注释]   #最后一行不加","
) [COMMENT 表注释]; 
```
实例
```
CREATE TABLE student(
    stuID int(4) COMMENT "学号",
    stuName varchar(10) COMMENT “学生姓名”,
    phone varchar(20) COMMENT "联系电话",
    adress varchar(50) COMMENT "家庭地址"
) COMEMENT "学生信息表"; 
```
##### 数据结构类型
<img width="1264" alt="基础-SQL-DDL-数据类型-数值类型" src="https://github.com/SevenBusData/Mysql/assets/122709756/dc32e21c-f34b-4315-a769-8d4901cffbe0">

##### 字符串类型
<img width="509" alt="基础-SQL-DDL-数据类型-字符串类型" src="https://github.com/SevenBusData/Mysql/assets/122709756/c5bd062c-fb80-431c-b578-b3b93b205a3b">

##### 日期时间类型
<img width="585" alt="基础-SQL-DDL-数据类型-日期时间类型" src="https://github.com/SevenBusData/Mysql/assets/122709756/ae6be237-cb6f-4fab-a5ae-32c480468f09">

***类型案列***
**根据案列需求创建表(设计合理的数据类型、长度)**   
设计一张员工表，要求如下：   
1. 编号（纯数字）
2. 员工工号（字符串类型，长度不超过10位）
3. 员工姓名（字符串类型，长度不超过10位）
4. 性别（男/女，存储一个汉字）
5. 年龄（正常人年龄，不能为负数）
6. 身份证号（二代身份证号均为18位，身份证上有X这样的字符）
7. 入职时间（取值年月日即可）
```
create table employers(
    `ID` int(4) comment '编号',
    `employerNo` varchar(10) comment '员工工号',
    `employerName` varchar(10) comment '员工姓名',
    `sex` char(1) comment '性别',
    `age` tinyint unsigned comment '年龄',
    `identityCard` varchar(18) comment '身份证号',
    `timeOfEntry` date comment '入职时间'
) comment = '员工表';
```
---
##### 修改
添加字段  
```
alter table 表名 add 字段名 类型(长度) [comment ‘注释’] [约束];
```
**案列**  
为employers表增加一个新的字段‘昵称’为nickName，类型varchar(20),
```
alter table employers add nickName varchar(20) comment '昵称';
```
修改数据类型
```
alter table 表名 modify 字段名 新数据类型(长度);
```
修改字段名和字段类型
```
alter table 表名 change 旧字段名 新字段名 新数据类型(长度) [comment 注释] [约束]; 
```
**案列**  
将employers表中的nickName字段修改为userName，类型为varchar(30)，
```
alter table employers change nickName userName varchar(30);
```
删除字段
```
alter table 表名 drop 字段名;
```
**案列**
将employers表中的userName删除,
```
alter table employers drop userName;
```
修改表名   
```
alter table 表名 rename to 新表名;
```
**案列**
将employers表改成employees,
```
alter table employers rename to employees;
```
##### 删除
删除表
```
drop table 表名;
```
删除指定表，并重新该表
```
truncate table 表名;
```
**注意：在删除表的同时，表中的所有数据也全部被删除**
#### DML-添加数据
1. 给指定字段添加数据
```
insert into 表名 (字段一，字段二，字段三...) values (值一，值二，值三...);
```
2. 给所有字段添加数据
```
insert into 表名 values (值一，值二，值三...);
```
3. 批量添加数据
```
insert into 表名 (字段一，字段二，字段三...) values (值一，值二，值三...),(值一，值二，值三...),(值一，值二，值三...)...;
```
```
insert into 表名 values (值一，值二，值三...),(值一，值二，值三...),(值一，值二，值三...)...;
```
**注意:**
1. 插入数据时，指定的字段顺序需要与值的顺序是一一对应的
2. 字符串和日期型数据应该包含在引号中。
3. 插入的数据大小，应该在字段的规定范围内。
#### DML—修改数据
修改数据
```
update 表名 set 字段名1=值1, 字段名 2=值2, ... [where 条件];
```
**注意:**
修改语句的条件可以有，也可以没有，如果没有条件，则会修改整张表的所有数据。
#### DML-删除数据
删除数据
```
delete from 表名 [where 条件];
```
**注意:**
1. delete语句的条件可以有，也可以没有，如果没有田间，则会删除所有语句。
2. delete语句不能删除某个字段的值(可以使用update)。
#### DQL-介绍
DQL英文全称是Data Query Language(数据查询语言),用来查询表中的记录。  
**查询关键字:**  ***select***
#### DQL-语法
```
select
        字段列表
from
        表名列表
where
        条件列表
group by
        分组字段列表
havign
        分组后条件列表
order by
        排序字段列表
limit
        分页列表
```
#### DQL-基本查询
1. 查询多个字段
```
select 字段1,字段2,字段3,... from 表名;
```
```
-- 返回所有字段
select * from 表名;
```
2. 设置别名
```
select 字段1 [as 别名1], 字段2 [别名2]... from 表名;
```
3. 删除重复记录
```
select distinct 字段列表 from 表名;
```
#### DQL-条件查询
1. 语法
```
select 字段列表 from 表名 where 条件列表;
```
2. 条件
<img width="534" alt="基础-SQL-DQL-条件查询-比较运算符" src="https://github.com/SevenBusData/Mysql/assets/122709756/90d0139b-29f6-4d61-a587-56e2450c40dc">

<img width="511" alt="基础-SQL-DQL-条件查询-逻辑运算符" src="https://github.com/SevenBusData/Mysql/assets/122709756/a30a0563-92a8-44ab-84b7-8cbff9ccd38e">

#### DQL-聚合函数
1. 介绍  
将一列数据作为一个整体，进行纵向计算。
2. 常见的聚合函数
<img width="560" alt="基础-SQL-DQL-聚合函数-常见聚合函数" src="https://github.com/SevenBusData/Mysql/assets/122709756/3627bed1-938b-4933-bb6b-03b8cbb8fa3c">

3. 语法
```
select 聚合函数(字段列表) from 表名;
```
**注意：** null值不参与所有的聚合函数的计算。
#### DQL-分组查询
1. 语法
```
select 字段列表 from 表名 [where 条件] group by 分组字段名 [having 分组后过滤条件];
```
2. where和having的区别
* 执行时机不同:where是分组之前进行过滤，不满足where条件，不参与分组；而having是分组之后对结果进行过滤。
* 判断条件不同:where不能对聚合函数进行判断，而having可以。 

**注意:** 
* 执行顺序：where>聚合函数>having。
* 分组之后，查询的字段一般为聚合函数和分组字段，查询其他字段均无任何意义。
#### DQL—排序查询
1. 语法
```
select 字段列表 from 表名 order by 字段1 排序方式1, 字段2 排序方式2 ...;
```
2. 排序方式
* ASC:升序方式(默认方式)
* DESC:降序方式

**注意:** 如果是多字段排序，第一个字段相同时，才会进入第二个字段的排序。 
#### DQL—分页查询
1. 语法
```
select 字段列表 from 表名 limit 起始索引,查询记录数;
```
**注意:** 
* 起始索引开始从0开始，起始索引 = (查询页码 - 1) * 每页记录显示数。
* 分页查询是数据库的方言，不同的数据库有不同的实现，MySQL中使用的是LIMIT。
* 如果查询的是第一页数据，起始索引可以省略，直接简写为limit 10。
#### DQL-案列
**按照需求完成如下DQL语句编写**
1. 查询年龄为20，21，22，23岁的女性员工信息。
2. 查询性别年龄为 男 ，并且年龄在 20～40 岁(含)以内的姓名为3个字的员工。
3. 统计员工表中，年龄小于60岁的，男性员工与女性员工的人数。
4. 查询所有小于等于35岁员工的姓名和年龄，并对查询结果按年龄升序排序，如果年龄相同按入职时间降序排序。
5. 查询性别为男，且年龄在20~40岁(含)以内的前5个员工信息，对查询结果按年龄升序排序，年龄相同按入职时间降序排序。

```
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
```
#### DQL-执行顺序
<img width="465" alt="基础-SQL-DQL-执行顺序-编写顺序" src="https://github.com/SevenBusData/Mysql/assets/122709756/0bb40ebf-9519-4253-98e2-0539606ad4b1">

<img width="471" alt="基础-SQL-DQL-执行顺序-执行顺序" src="https://github.com/SevenBusData/Mysql/assets/122709756/90b02b36-83a5-4f3b-84c7-2c87aec58de5">

#### DCL-介绍
DCL英文全称是Data Control Language(数据控制语言)，用来管理数据库用户、控制数据库的访问权限。
#### DCL-管理用户
1. 查询用户
```
use mysql;
select * from user;
```
2. 创建用户
```
create user '用户名'@'主机名' identified by ‘密码‘;
```
3. 修改用户密码
```
alter user '用户名'@'主机名' identified with mysql_native_password by '新密码';
```
4. 删除用户
```
drop user '主机名'@'用户名';
```
**注意:**
* 主机名可以使用%通配。
* 这类SQL开发人员操作比较少，主要是DBA(Database Administrator 数据库管理人员)使用。
#### DCL-权限控制
MySQL中定义了很多种权限，但是常用的就以下几种:
<img width="1079" alt="基础-SQL-DCL-权限控制-常见权限" src="https://github.com/SevenBusData/Mysql/assets/122709756/f87e48b5-3c9f-410f-8ca2-9fedee190621">

1. 查询权限
```
show grants for '用户名'@'主机名';
```
2. 授予权限
```
grant 权限列表 on 数据库名.表名 to '用户名'@'主机名';
``` 
3. 撤销权限
```
revoke 权限列表 on 数据库名.表名 from '用户名'@'主机名';
```
**注意:**
* 多个权限之间，可以使用逗号分隔。
* 授权时，数据库名和表名可以使用* 进行通配，代表所有。
