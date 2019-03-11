# 1. 查找部门 30 中员工的详细信息
select *
from scott.emp where DEPTNO = 30;
# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
select EMPNO,ENAME,DEPTNO
from scott.emp where JOB='CLERK';
# 3. 检索出奖金多于基本工资的员工信息
select *
from scott.emp where COMM>SAL;
# 4. 检索出奖金多于基本工资 30% 员工信息
select *
from scott.emp where COMM>SAL*0.3;
# 5. 希望看到 10 部门的经理或者 20 部门的职员 clerk 的信息
select *
from scott.emp where (DEPTNO = 10 and JOB = 'MANAGER') or (DEPTNO = 20 and  JOB = 'CLERK');
# 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是高于 2000 元的员工信息
select *
from scott.emp where (DEPTNO = 10 and  JOB = 'MANAGER') or (DEPTNO = 20 and JOB = 'CLERK') or (JOB not in ('MANAGER','CLERK')and SAL > 2000);
# 7. 找出获得奖金的员工的工作
#select *from scott.emp where (COMM is not null and COMM > 0);
select distinct JOB
from scott.emp where COMM is not null;
# 8. 找出奖金少于 100 或者没有获得奖金的员工的信息
select *
from scott.emp where (COMM < 100) or (COMM is null);
# 9. 查找员工雇佣日期是当月的最后一天的员工信息

# 10. 检索出雇佣年限超过 35 年的员工信息
# 11. 找出姓名以 A、B、S 开始的员工信息
select *
from emp where ENAME like 'A%' or ENAME like 'B%' or ENAME like 'S%';
# 12. 找到名字长度为 4 个字符的员工信息

# 13. 名字中不包含 R 字符的员工信息
select *
from emp where ENAME not like '%R%';
# 14. 找出员工名字的前3个字符
# 15. 将名字中 A 改为 a
update scott.emp
set ENAME =
# 16. 将员工的雇佣日期拖后 10 年
# 17. 返回员工的详细信息并按姓名排序
select *
from emp order by ENAME;
# 18. 返回员工的信息并按员工的工作年限降序排列
select *
from emp order by HIREDATE desc;
# 19. 返回员工的信息并按工作降序、工资升序排列
select *
from emp order by JOB desc ,SAL;
# 20. 返回员工的姓名、雇佣年份和月份，并按月份和雇佣日期排序
# 21. 计算员工的日薪，每月按 30 天
# 22. 找出 2 月份雇佣的员工
# 23. 至今为止，员工被雇佣的天数
# 24. 找出姓名中包含 A 的员工信息
select *
from emp where ENAME like '%A%';
# 25. 计算出员工被雇佣了多少年、多少月、多少日


-- distinct 重复数据只显示一次
select distinct JOB
from emp;

-- SQL inner join内部连接（可省略 inner）
select e.ENAME,e.DEPTNO,d.DNAME,d.DEPTNO
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;

-- left outer join 左外连接(可省略outer)
select *
from emp e
       left outer join dept d
                       on e.DEPTNO = d.DEPTNO

union  -- 上下两个表全部连接

-- right outer join 右外连接
select *
from emp e
       right outer join dept d
                        on e.DEPTNO = d.DEPTNO;  -- operation