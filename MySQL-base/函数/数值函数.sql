# 数值函数
# ceil--向上取整
select ceil(1.34);

# floor--向下取整
select floor(1.34);

# mod--返回x/y的模
select mod(10, 7);

# rand--返回O~1内的随机数
select rand();

# round--求参数x的四舍五入的值，保留y位小数
select round(1.455, 2);
select round(1.454, 2);



# 案列
# 通过数据库的函数，生成一个随机6位数的验证码。
select lpad(round(rand() * 100000, 0), 6, '0');