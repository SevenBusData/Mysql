# 字符串函数
# concat--字符串拼接
select concat('Hello', 'MySQL!');

# lower--字符全部转成小写
select lower('Hello');

# upper--字符全部转成大写
select upper('Hello');

# lpad--左填充，用宇符串pad对str的左边进行填充，达到n个字符串长度
select lpad('01', 5, '-');

# rpad--右填充，用字符串pad对str的右边进行填充，达到n个字符串长度
select rpad('01', 5, '-');

# trim--去掉字符串头部和尾部的空格
select trim(' Hello MySQL! ');

# substring--返回从字符串str从star位置起的len个长度的字符串
select substring('Hello MySQL', 1, 5);


# 案列
# 由于业务需求变更，企业员工的工号，统一为5位数，目前不足5位数的全部在前面补0。比如：1号员
# 工的工号应该为00001
update emp set workNo = lpad(workNo, 5, '0');

