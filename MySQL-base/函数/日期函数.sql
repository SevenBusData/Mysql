# 日期函数
# curdate--返回当前日期
select curdate();

# curtime--返回当前时间
select curtime();

# now--返回当前日期和时间
select now();

# year--获取指定date的年份
select year(curdate());

# month--获取指定date的月份
select month(curdate());

# day--获取指定date的日期
select day(curdate());

# date_add--返回一个日期/时间值加上一个时间间隔expr后的时问值
select date_add(now(), interval 70 year );

# datediff--返回起始时间date1和结束时间date2之间的天数
select datediff('2023-5-1', '2023-5-21');



# 案列
# 查询所有员工的入职天数，并根据入职天数倒叙排序。
select name, datediff(now(), timeOfEntry) from emp order by datediff(now(), timeOfEntry) desc  ;