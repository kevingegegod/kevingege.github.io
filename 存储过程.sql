create database abc
go
use abc
go
create table student(
Id int primary key  identity(1,1),
name varchar(32),
sex varchar(2),
age int
)
go
insert into student values('喜羊羊','男',20)
insert into student values('美羊羊','女',19)
insert into student values('懒羊羊','男',22)
insert into student values('沸羊羊','男',21)
go
select * from student
go

--存储过程的创建与使用
/*
--分类
   系统存储过程和用户自定义的存储过程
exec sp_help					//得到数据库中所有的对象
exec sp_helpdb ccgc				//查看指定数据库相关的信息
exec sp_tables					//查看表相关的信息
exec sp_tables ccgc				//查看指定表当中列的信息
exec sp_helpconstraint student	//查看指定表中的所有约束
*/

--存储过程的关键字   procedure | proc
--功能 用来执行一组特性的sql语句的集合
--（自定义的一些sql语句把它封装到一个存储过程里面，然后去调用的这样的一个过程）
--可以包含逻辑控制语句 if else，where等等 还可以接收用户输入输出的参数
--给我们返回一个或者多个result

