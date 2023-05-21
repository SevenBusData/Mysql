# 创建用户 seven , 只能够在当前主机localhost访问，密码123456。
create user 'seven'@'localhost' identified by '123456';

# 创建用户 Felicia ，可以在任意主机访问该数据库，密码123456 。
create user 'Felicia'@'%' identified by '123456';

# 修改用户 Felicia 的访问密码 1234。
alter user 'Felicia'@'%' identified with mysql_native_password by '1234';

# 删除用户 seven 和 Felicia。
drop user 'seven'@'localhost';
drop user 'Felicia'@'%';


# 查询权限
show grants for 'Felicia'@'%';

# 授予权限
grant all on Test.* to 'Felicia'@'%';

# 撤销权限
revoke all on Test.* from 'Felicia'@'%'; 