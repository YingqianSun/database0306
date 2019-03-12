查询

各列值的快速模糊查询
排名前十的密码
create index ind_password on db_csdn.user(password);

select password,count(password)
from db_csdn.user
group by password
order by 2 desc
limit 0,10;

排名前十的邮箱
select email,count(email)
from db_csdn.user
group by email
order by 2 desc
limit 0,10;

/*select *
from db_csdn.user order by email limit 0,10;
*/
用户名和邮箱名相同的数据
密码可能是生日的数据
哪一年出生的用户最多
哪个星座的用户最多
密码是 QQ 号的
密码是手机号的
哪个运营商的用户最多
弱密码用户数据
短密码
纯数字密码
纯字母密码
强密码用户数据
长密码
字母和数字
含特殊符号