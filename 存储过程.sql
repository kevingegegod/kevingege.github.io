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
insert into student values('ϲ����','��',20)
insert into student values('������','Ů',19)
insert into student values('������','��',22)
insert into student values('������','��',21)
go
select * from student
go

--�洢���̵Ĵ�����ʹ��
/*
--����
   ϵͳ�洢���̺��û��Զ���Ĵ洢����
exec sp_help					//�õ����ݿ������еĶ���
exec sp_helpdb ccgc				//�鿴ָ�����ݿ���ص���Ϣ
exec sp_tables					//�鿴����ص���Ϣ
exec sp_tables ccgc				//�鿴ָ�������е���Ϣ
exec sp_helpconstraint student	//�鿴ָ�����е�����Լ��
*/

--�洢���̵Ĺؼ���   procedure | proc
--���� ����ִ��һ�����Ե�sql���ļ���
--���Զ����һЩsql��������װ��һ���洢�������棬Ȼ��ȥ���õ�������һ�����̣�
--���԰����߼�������� if else��where�ȵ� �����Խ����û���������Ĳ���
--�����Ƿ���һ�����߶��result

