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
--ϵͳ�洢���̺��û��Զ���Ĵ洢����
exec sp_help					//�õ����ݿ������еĶ���
exec sp_helpdb ccgc				//�鿴ָ�����ݿ���ص���Ϣ
exec sp_tables					//�鿴����ص���Ϣ
exec sp_tables ccgc				//�鿴ָ�������е���Ϣ
exec sp_helpconstraint student	//�鿴ָ�����е�����Լ��
*/

/*
--�洢���̵Ĺؼ���   procedure | proc
--���� ����ִ��һ�����Ե�sql���ļ���
���Զ����һЩsql��������װ��һ���洢�������棬Ȼ��ȥ���õ�������һ�����̣�
--���԰����߼�������� if else��where�ȵ� �����Խ����û���������Ĳ���
--�����Ƿ���һ�����߶��result

--�洢���̵Ļ����﷨
create proc | procedure �洢���̵�����
--����
@��������  �������� [Ĭ��ֵ]  output �������
as
�Զ����sql��伯�ϣ�����Ҫʵ��ҵ���߼���sql��䣩
go
*/

--�����ж�һ�����ݿ���ĳ��ָ���Ĵ洢�����Ƿ��Ѿ�����
--object_Id �ж� �� Լ��  �洢����  �����ȵȵȵ��Ƿ����
if OBJECT_ID('zzz') is not null 
--ɾ������
drop proc zzz
--������� ����ʹ��
go
--����һ�����������Ĵ洢����
create proc zzz
as
--��ʼ��дsql��ҵ���߼�
print '�޲εĴ洢����'
--������������޲εĴ洢������
go
exec zzz
go
--�������Ĵ洢�����Լ�ʹ��
create proc xxx
--����һ���洢���̲���ָ�����ϵ�ѧ����Ϣ
--����һ�������洢�������ڲ�ѯ
@stuname nvarchar(20)
as
--��ʼ��дsql��ҵ���߼�
select * from student where name like @stuname +'%'
go
--����ȥ���ô������Ĵ洢����
--���ô������Ĵ洢����
exec xxx 'ϲ'
go
select * from student
--�������ڵ��õ�ʱ��ȷ��ֵ
go
exec xxx '��'
go
--����һ��������������Ĭ��ֵ�Ĵ洢����
create proc ccc
@stuname nvarchar(20)='��'--��ʱ����stunameӵ��Ĭ��ֵ  ��
as
--��ʼ��дsql��ҵ���߼�
select * from student where name like @stuname +'%'
go
--���ô�����������Ĭ��ֵ�Ĵ洢����
exec ccc
--Ĭ��ֵ��ָ����ǰ���õ�ʱ��û�и�������ֵ����ʱ����ֵΪĬ�ϵ�ֵ

--�������ʱ���˲���ֵ��ô����ʱ�Ե���ʱ���Ĳ���Ϊ׼
exec ccc '��'