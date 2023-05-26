# 流程函数
# if(value,t,f)--如果value为true，则返回t，否则返回f。
select if(true, 'OK', 'error');
select if(false, 'OK', 'error');

# ifnull(value1, value2)--如果value1不为空，返回value1，否则返回value2。
select ifnull('Ok', 'default');
select ifnull('', 'default');
select ifnull(null, 'default');

# case when [val1] then [res1] ... else [default] end --如果val1为true，返回res1,否则返回default默认值。
# CASE [expr] WHEN [val1] THEN [res1] ... ELSE | default] END -- 如果expr的值等于val1，返回res1，…否则返回default默认值。
# 需求：查询emp表的员工姓名和员工地址(北京/上海 ---> 一线城市， 其他 ---> 二线城市)
select
    name,
    workaddress,
    (case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end) as '工作地址'
from emp;



use Test;

create table score(
    id int comment 'ID',
    name varchar(10) comment '姓名',
    chinese int comment '语文',
    math int comment '数学',
    englist int comment '英语'
);
insert into score values (1, 'Tom', 67, 88, 95),(2, 'Rose', 23, 66, 90),(3, 'Jack', 98, 77, 45);
# 案列
# 统计班级各个学员的成绩，展示的规则如下:
# >= 85，展示优秀
# >= 60，展示及格
# 否则，展示不及格
select
    id,
    name,
    chinese,
    case  when chinese >= 85 then '优秀' when chinese >= 60 then '及格' else '不及格' end,
    math,
    case when math >= 85 then '优秀' when math >= 60 then '及格' else '不及格' end,
    englist,
    case when englist >= 85 then '优秀' when englist >= 60 then '及格' else '不及格' end
from score;