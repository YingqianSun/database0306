show databases ;

drop database  if exists db_school;
create database  db_school;

show tables from  db_school;

drop table if exists db_school.student;
create table db_school.student(
    id int auto_increment primary key  comment 'id PK',
    -- 字段名 数据类型 [数据范围] [约束] 注释，
    sno varchar(225) unique comment '学号',
    name nvarchar(20) comment '学生姓名',
    age int(2) comment'年龄',
    height double(3,2) comment '身高x.yz米',
    dob date comment '出生年月日 Date Of Birth',
    courseId int comment '课程 id'
)comment '学生表';
select *from db_school.student;
insert  into db_school.student value (null,'001','张三',19,1.72,'2000-01-24',2);
insert  into db_school.student value (null,'002','李红',18,1.7,'2001-08-24',4);
insert  into db_school.student value (null,'003','赵斌',19,1.8,'2000-05-04',1);
insert  into db_school.student value (null,'004','韩梅',17,1.69,'2002-03-19',5);
#update db_school.student set age = 20;
delete from db_school.student;
drop table db_school.student;
#drop database db_school;
show full columns from db_school.student;


drop table if exists db_school.course;
create table db_school.course(
   id int auto_increment primary key comment 'id PK',
   subject nvarchar(20) comment '科目',
   teacher nvarchar(20) comment '老师',
   time nvarchar(20) comment'时间'
)comment '课程表';

-- 为学生表追加外键约束
alter table db_school.student
  add constraint
    student_fk_courseId -- 外键别名 表明_fk_列名
    foreign key (courseId)
      references db_school.course(id);


select *from db_school.course;
insert into db_school.course value (null,'Java','王老师','周二');
insert into db_school.course value (null,'C#','李老师','周一');
insert into db_school.course value (null,'网络','赵老师','周四');
insert into db_school.course value (null,'Linux','刘老师','周三');
insert into db_school.course value (null,'数据库','孙老师','周五');
delete from db_school.course;
drop table db_school.course;
#drop database db_school;
show full columns from db_school.course;

desc db_school.course; -- desc:describe

select s.sno,s.name,c.subject,c.time
from db_school.student s
    inner join db_school.course c
          on c.id = s.courseId


# create table db_school.sc(
#   sno varchar(20) comment '学号',
#   name varchar(20) comment '姓名',
#   subject varchar(20) comment '课程',
#   teacher varchar(20) comment '老师',
#   time varchar(20) comment '时间'
# );
/*select *from db_school.sc;
insert into db_school.sc value ('003','赵斌','Java','王老师','周二');
insert into db_school.sc value ('001','张三','数据库','孙老师','周五');
insert into db_school.sc value ('002','李红','Linux','刘老师','周三');
insert into db_school.sc value ('004','韩梅','网络','赵老师','周四');
delete from db_school.sc;
drop table db_school.sc;
drop database db_school;
show full columns from db_school.sc;
*/
