drop database if exists db_b;
create database db_b;

drop table if exists db_b.user;
create table db_b.user
(
  id       int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'username NN',
  password varchar(255) not null comment 'username password NN',
  role     int(1)       not null default 0 comment 'role 0-student 1-admin NN'
) comment 'user table';

drop table if exists db_b.books;
create table db_b.books
(
  id    int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'book title NN',
  count int          not null comment 'books count NN'
) comment 'books table';

drop table if exists db_b.enroll;
create table db_b.enroll
(
  id     int auto_increment primary key comment 'id PK',
  time   datetime not null default now() comment 'enroll time NN',
  userId int      not null comment 'user id FK',
  bookId int      not null comment 'book id FK'
) comment 'enroll table';

drop table if exists db_b.return;
create table db_b.return
(
  id     int auto_increment primary key comment 'id PK',
  time   datetime not null default now() comment 'enroll time NN',
  userId int      not null comment 'user id FK',
  bookId int      not null comment 'book id FK'
) comment 'return table';

alter table db_b.enroll
  add constraint
    enroll_fk_userId
    foreign key (userId)
      references db_b.user (id);

alter table db_b.enroll
  add constraint
    enroll_fk_book
    foreign key (bookId)
      references db_b.user (id);

alter table db_b.return
  add constraint
    return_fk_userId
    foreign key (userId)
      references db_b.user (id);

alter table db_b.return
  add constraint
    return_fk_book
    foreign key (bookId)
      references db_b.user (id);

-- add admin
insert into db_b.user value (null, 'admin', md5('123'), 1);

-- create
insert into db_b.books VALUE (null, '计算机网络', 4);
insert into db_b.books VALUE (null, '计算机组成原理', 7);

-- delete
delete
from db_b.books
where id = 1;

-- update
update db_b.books
set title = ''
where id = 1;

-- retrieve
select *
from db_b.books;

-- student sign up
insert into db_b.user(username, password) value ('Tom', md5('abc'));
insert into db_b.user(username, password) value ('Jerry', md5('def'));
insert into db_b.user(username, password) value ('Allen', md5('ghi'));

set foreign_key_checks = 0;
delete
from db_b.user;
set foreign_key_checks = 1;

-- student enroll
insert into db_b.enroll(id, userId, bookId) value (null, 3, 1);
update db_b.books
set count = db_b.books.count-1
where id = 1;
insert into db_b.enroll(id, userId, bookId) value (null, 1, 2);
update db_b.books
set count = db_b.books.count-1
where id = 2;

-- student return
insert into db_b.return(id, userId, bookId) value (null, 3, 1);
update db_b.books
set count = db_b.books.count+1
where id = 1;
insert into db_b.return(id, userId, bookId) value (null, 1, 2);
update db_b.books
set count = db_b.books.count+1
where id = 2;



-- admin sign in retrieve
select u.username, e.time, b.title
from db_b.user u
       inner join db_b.enroll e
                  on u.id = e.userId
       inner join db_b.books b
                  on e.bookId = b.id;
# where b.id = 1;

select *
from db_b.user;
select *
from db_b.books;
select *
from db_b.enroll;