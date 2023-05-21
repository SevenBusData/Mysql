create database mySchool;

use mySchool;

CREATE TABLE `student`(
             `studentNo` INT(4) NOT NULL COMMENT '学号' PRIMARY KEY,
	`loginPwd` VARCHAR(20) NOT NULL COMMENT '密码',  
	`studentName` VARCHAR(50) NOT NULL COMMENT '学生姓名',
	`sex` CHAR(2) DEFAULT '男' NOT NULL  COMMENT '性别', 
	`gradeId` INT(4)  UNSIGNED COMMENT '年级编号', 
	`phone` VARCHAR(50)  COMMENT '联系电话',
	`address` VARCHAR(255)  DEFAULT '地址不详'COMMENT '地址',
	`bornDate` DATETIME  COMMENT '出生时间',
	`email` VARCHAR(50) COMMENT'邮件账号',
	`identityCard` VARCHAR(18)  UNIQUE KEY COMMENT '身份证号'
) COMMENT='学生表';


create table result(
	`studentNo` int(4) not null comment '学号',
	`sujectNo` int(4) not null comment '课程编号',
	`examdate` datetime not null comment '考试日期',
	`studentresult` int(4) not null comment '考试成绩'
) comment = '成绩表';

create table Subejct(
	`subjectNo` int(4) not null comment '课程编号' primary key,
    `subjectName` varchar(50) not null comment '课程名称',
    `classHour` int(4) not null comment '学时',
    `gradeID`int(4) not null comment '年级编号'
) comment = '科目表';

create table grade(
	`gradeNo` int(4) not null comment '年级编号',
    `gardeName` varchar(10) not null comment '年级'
) comment = '年级表';