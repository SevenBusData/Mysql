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
#### DML
#### DQL
#### DCL
