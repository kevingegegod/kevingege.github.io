create database ccgc
go
use ccgc
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
--系统存储过程和用户自定义的存储过程
exec sp_help					//得到数据库中所有的对象
exec sp_helpdb ccgc				//查看指定数据库相关的信息
exec sp_tables					//查看表相关的信息
exec sp_tables ccgc				//查看指定表当中列的信息
exec sp_helpconstraint student	//查看指定表中的所有约束
*/

/*
--存储过程的关键字   procedure | proc
--功能 用来执行一组特性的sql语句的集合
（自定义的一些sql语句把它封装到一个存储过程里面，然后去调用的这样的一个过程）
--可以包含逻辑控制语句 if else，where等等 还可以接收用户输入输出的参数
--给我们返回一个或者多个result

--存储过程的基础语法
create proc | procedure 存储过程的名称
--参数
@参数名称  参数类型 [默认值]  output 输出参数
as
自定义的sql语句集合（我们要实现业务逻辑的sql语句）
go
*/

--怎样判断一个数据库中某个指定的存储过程是否已经存在
--object_Id 判断 表 约束  存储过程  函数等等等等是否存在
if OBJECT_ID('zzz') is not null 
--删除对象
drop proc zzz
--以上语句 谨慎使用
go
--创建一个不带参数的存储过程
create proc zzz
as
--开始编写sql的业务逻辑
print '无参的存储过程'
--怎样调用这个无参的存储过程呢
go
exec zzz
go
--带参数的存储过程以及使用
create proc xxx
--创建一个存储过程查找指定姓氏的学生信息
--创建一个参数存储姓氏用于查询
@stuname nvarchar(20)
as
--开始编写sql的业务逻辑
select * from student where name like @stuname +'%'
go
--怎样去调用带参数的存储过程
--调用带参数的存储过程
exec xxx '喜'
go
select * from student
--参数是在调用的时候确定值
go
exec xxx '懒'
go
--创建一个带参数给参数默认值的存储过程
create proc ccc
@stuname nvarchar(20)='沸'--此时参数stuname拥有默认值  沸
as
--开始编写sql的业务逻辑
select * from student where name like @stuname +'%'
go
--调用带参数给参数默认值的存储过程
exec ccc
--默认值是指，当前调用的时候没有给出参数值，此时参数值为默认的值

--如果调用时给了参数值那么调用时以调用时给的参数为准
exec ccc '美'