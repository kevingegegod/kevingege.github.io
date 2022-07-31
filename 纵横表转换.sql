create database biao
use biao
go
create table scores
(
name varchar(20),
course varchar(20),
grade varchar(20)
)

insert into scores values
('张三','语文','88'),('张三','数学','90'),('张三','英语','95'),
('李四','语文','89'),('李四','数学','86'),('李四','英语','90')
insert into scores values
('王五','语文','89'),('王五','数学','86'),('侯七','英语','90'),('王五','英语','90')
select * from scores
select * from scores3
--1.纵 横表的优缺点
--优缺点：

--横表：表结构更加的清晰明了，关联查询的一些sql语句也更容易，方便易于后续开发人员的接手，但是如果字段不够，需要新增字段，会改动表结构。
--纵表：扩展性更高，如果要增加一个字段，不需要改变表结构，但是一些关联查询会更加麻烦，也不便于维护与后续人员接手。
--平常开发，尽量能用横表就不要用纵表，维护成本比较高昂，而且一些关联查询也很麻烦。

--1.分析：首先查成绩需要学生姓名，那么就需要根据姓名进行分组
--select 姓名 from scores group by 姓名 
select name from scores group by name 

--分析：
--我们先拿到语文这个科目的分数。既然我们用到了group by 语句，这里肯定要用聚合函数来求分数。
--而且我们只需要语文这一科的成绩，分组出来的 一共有 3列 ，分别是 语文、数学、英语  。  那么就需要判断科目来取分数。
--这里符合我们需求的 case 语句就登场了。它和c#中switch-case 作用一样。

--sql case 语句语法：
--case 字段  when 值1 then 结果     when 值2 then 结果2   ... else 默认结果  end

--select 姓名,SUM(case 课程 when  '课程名' then grade else 0 end) as 课程名 from scores group by name 
 
 select name,
 sum(case course when'英语' then grade  else 0 end)as'英语',
 sum(case course when'数学' then grade  else 0 end)as'数学',
 sum(case course when'语文' then grade  else 0 end)as'语文'
 from scores group by name

 --使用select ...into 会自动生成临时表，不需要事先创建
  select name,
 sum(case course when'英语' then grade  else 0 end)as'英语',
 sum(case course when'数学' then grade  else 0 end)as'数学',
 sum(case course when'语文' then grade  else 0 end)as'语文'
 into score7
 from scores group by name

select  * from score7
select * from scores


--横表转纵表
SELECT   name,'语文'   AS     科目,语文   AS   成绩   FROM   score7   UNION    
SELECT   name,'数学'   AS     科目,数学   AS   成绩   FROM   score7   UNION  
SELECT   name,'英语'   AS     科目,英语   AS   成绩   FROM   score7
ORDER BY name,科目 DESC

如果我们需要将两个select语句的结果作为一个整体显示出来，我们就需要用到union或者union all关键字。
union(或称为联合)的作用是将多个结果合并在一起显示出来。
 union和union all的区别是,union会自动压缩多个结果集合中的重复结果，而union all则将所有的结果全部显示出来，不管是不是重复。
 union：对两个结果集进行并集操作，不包括重复行，同时进行默认规则的排序；union在进行表链接后会筛选掉重复的记录，
 所以在表链接后会对所产生的结果集进行排序运算，删除重复的记录再返回结果。实际大部分应用中是不会产生重复的记录，
 最常见的是过程表与历史表union。
 union all：对两个结果集进行并集操作，包括重复行，不进行排序； 如果返回的两个结果集中有重复的数据，那么返回的结果集就会包含重复的数据了。
