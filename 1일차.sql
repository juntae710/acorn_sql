select * from emp;

create table  acorntbl (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10)
);

insert into acorntbl values('dy', '4482', '���ܾ�');
insert into acorntbl values('mg','1234', '��α�');
insert into acorntbl  values('mj' ,'0000' , '�����');
insert into acorntbl  values('bj','6666','�躴��');
insert into acorntbl values('jy', '1127', '���翭');
insert into acorntbl values('hs', '0317', '������');
insert into acorntbl values('nj','9876','������');
insert into acorntbl values('jw', '1111', '������'); 
insert into acorntbl values('tm', '4482', '���¹�');
insert into acorntbl values('yj','0117','������'); 
insert into acorntbl values('y','1126','����');
insert into acorntbl values('yj2','0625','������');
insert into acorntbl values('jh','6789','������');
insert into acorntbl  values('ek', '1234', '������');
insert into acorntbl values('jt','1234','ǥ����');
insert into acorntbl values('jh1', '7777', '������');
insert into acorntbl values('jh2', '9999', '����ȭ');
commit;

select * from acorntbl;

--�� �� ��ȸ
select * from acorntbl where name like '��%';


--sql : DBNS (�����ͺ��̽� �����ý��� ����Ʈ����,�����ͺ��̽�) ����Ŭ11g
--sql : DBMS�� ���Ƕ�� ��� (������ �ִ�)

--DML (insert > creat , select-read , update, delete,delete) CRUD
--DDL
--DDL

--��ȸ�ϱ�
--select �÷��� , �÷���.. form ���̺��;
--���̺� ��Ű�� . ���̺� ���� Ȯ�θ�ɾ� desc ���̺��;
desc emp;
 select * from emp;
 
 select empno, ename, job
 from emp;
 

 
  create table professor
(profno number(4) primary key,
 name  varchar2(20) not null, 
 id  varchar2(15) not null,
 position varchar2 (30) not null,
 pay number (3) not null,
 hiredate  date not null,
 bonus number(4) ,
 deptno  number(3),
 email  varchar2(50),
 hpage  varchar2(50));
 
 insert into professor
values(1001,'Audie Murphy','Murphy','a full professor',550,to_date('1980-06-23','YYYY-MM-DD'),100,101,'captain@abc.net','http://www.abc.net');

insert into professor
values(1002,'Angela Bassett','Bassett','assistant professor',380,to_date('1987-01-30','YYYY-MM-DD'),60,101,'sweety@abc.net','http://www.abc.net');

insert into professor
values (1003,'Jessica Lange','Lange','instructor',270,to_date('1998-03-22','YYYY-MM-DD'),null,101,'pman@power.com','http://www.power.com');

insert into professor
values (2001,'Winona Ryder','Ryder','instructor',250,to_date('2001-09-01','YYYY-MM-DD'),null,102,'lamb1@hamail.net',null);

insert into professor
values (2002,'Michelle Pfeiffer','Pfeiffer','assistant professor',350,to_date('1985-11-30','YYYY-MM-DD'),80,102,'number1@naver.com','http://num1.naver.com');

insert into professor
values (2003,'Whoopi Goldberg','Goldberg','a full professor',490,to_date('1982-04-29','YYYY-MM-DD'),90,102,'bdragon@naver.com',null);

insert into professor
values (3001,'Emma Thompson','Thompson','a full professor',530,to_date('1981-10-23','YYYY-MM-DD'),110,103,'angel1004@hanmir.com',null);

insert into professor
values (3002,'Julia Roberts','Roberts','assistant professor',330,to_date('1997-07-01','YYYY-MM-DD'),50,103,'naone10@empal.com',null);

insert into professor
values (3003,'Sharon Stone','Stone','instructor',290,to_date('2002-02-24','YYYY-MM-DD'),null,103,'only_u@abc.com',null);

insert into professor
values (4001,'Meryl Streep','Streep','a full professor',570,to_date('1981-10-23','YYYY-MM-DD'),130,201,'chebin@daum.net',null);

insert into professor
values (4002,'Susan Sarandon','Sarandon','assistant professor',330,to_date('2009-08-30','YYYY-MM-DD'),null,201,'gogogo@def.com',null);

insert into professor
values (4003,'Nicole Kidman','Kidman','assistant professor',310,to_date('1999-12-01','YYYY-MM-DD'),50,202,'mypride@hanmail.net',null);

insert into professor
values (4004,'Holly Hunter','Hunter','instructor',260,to_date('2009-01-28','YYYY-MM-DD'),null,202,'ironman@naver.com',null);

insert into professor
values (4005,'Meg Ryan','Ryan','a full professor',500,to_date('1985-09-18','YYYY-MM-DD'),80,203,'standkang@naver.com',null);

insert into professor 
values (4006,'Andie Macdowell','Macdowell','instructor',220,to_date('2010-06-28','YYYY-MM-DD'),null,301,'napeople@jass.com',null);

insert into professor
values (4007,'Jodie Foster','Foster','assistant professor',290,to_date('2001-05-23','YYYY-MM-DD'),30,301,'silver-her@daum.net',null);

commit;

 select * from professor;
 
 --select ��ɿ� ǥ���� (���ͷ�) ����Ͽ� ����ϱ�
 --select name , 'good ''morging';
 
 
 --�÷���Ī ����Ͽ� ����ϱ�
 --�÷��� �ڿ� as (��������) "��Ī��" (���鵵 ���� ����)
 select profno as "Pro's No", name as "Pro's Name", pay
 from professor;
 
 --distinct �ߺ��� ���� �����ϰ� ����ϱ�
 
 select deptno from emp;
 select distinct deptno from emp;
 
 --���� ������ || �÷��� �����ؼ� ��ȸ�ϰ� ���� �� ���
 select ename || '��' as ename , job from emp;
 select ename || ' ' || job from emp;
 
 
 --���ϴ� ���Ǹ� ��󳻱� - where �� ���
 
 select empno , ename 
 from emp 
 where empno= 7900;
 
 select empno, ENAME
 from emp
 where sal < 900;
 
 select empno, sal, ename
 from emp
 where sal>1500;
 
 select * from acorntbl;
 select * from acorntbl where name like '��%';
 
 select * from emp ;
--where �������� ������ = ����
select * from emp where job = 'CLERK';

-- !- , <> ���� �ʴ�
select * from emp where job != 'CLERK';

-- > ũ�� , �ʰ�
select * from emp where sal > 1200;

--�÷��̳� ���̺�� ��ҹ��� �������
-- ����Ÿ�� ��ҹ��ڸ� �����ؾ���

-- >= �̻�
select * from emp where sal >= 800;

-- < �̸�
select * from emp where comm <300;

--<= ����
select * from emp where comm <= 300;

-- berween a and b a��b ���̿��ִ� ���� ���� ��ȸ (�տ��� ������ �ڿ��� ū��)
select * from emp where sal between 1200 and 2000;

-- and ������ ������ ������ ��� �����ϴ� ����
select * from emp where job = 'CLERK' and sal = 1300;
select * from emp where sal >= 1200 and sal <=2000; 

-- or ������ ������ ������ �ϳ��� �����ϴ� ����
select * from emp where job='SALESMAN' or sal > 1200;

-- in ������ 
select * from emp where deptno in (10,20);
  -- where deptno = 10 or deptno =20;

-- like �����ڷ� ����Ѱ��� ��� ã�� %(0�̻�), _(����� �ϳ��� �� �ڸ�)
select * from emp where job like 'S%'; -- ������ S �̰� �ڿ��� �������
select * from emp where job like '%N'; -- ���� S�� ������ ������ ã�ڴ�
select * from emp where job like '%N%'; -- job �÷��� N���ڰ� ���Ե� ���� ��� ã�ڴ�.

select * from emp where sal like '1%'; 

SELECT * FROM emp WHERE ename like 'W___';

--����, ��¥ ǥ���� ''ǥ���ؾ���.
select * from emp where hiredate >= '80/12/17';

--null �� is null is not null
--null ���� Ȯ���� ���� is null,is not null
select * from emp;
--�����ͺ��̽����� �ø��� ���� null�� ���� ���� �������� �������� �ǹ��Ѵ�. ���ǻ��� => 0�� �ǹ̰� �ƴϴ�
-- ���� null�� ���� ��ȸ�� ���� = ���ٶ�� ������ ������� ���� is null ����ؾ���
select * from emp where comm is null;
select * from emp where comm is not null;

--null���� �ٷ� �� ���� ����
--����) comm �÷��� ���� +100������ ������ ��ȸ�� �Ѵٸ� �����?
--null�� �������� ���� ���� �ǹ��ϹǷ� ���⿡ � ������ �����ص� �������� ���� ������ �ν���
select ename,sal,comm+100 from emp;

 --select ename, sal ,nvl(comm, 0) from emp;

--56p �����ϱ� order by
select * from emp;
--sal ���� ������ ����
--order by �� ��� �÷��� ��� , �÷��� ����
select * from emp order by sal desc;

select job, sal from emp order by sal desc;
select job, sal from emp order by 2 desc;

select * 
from emp 
order by deptno ,sal desc;

-- ���տ����� (union ����ġ��)
--union , union all, intersect , minus
-- ȸ�� ���̺�(��� ȸ�������� �ִ� ���̺�)
--���� ȸ�� ���̺�, ��⵵ ȸ�� ���̺�,�λ� ȸ�� ���̺�
--��ü�� ��ȸ�� �� union ����� (�ߺ�����, ��������)

--���� ����: �÷� �� , �÷� Ÿ���� ���ƾ���
select STUDNO,name,DEPTNO1 from student;
select profno , name , deptno from professor;

select STUDNO,name,DEPTNO1 from student
union
select profno , name , deptno from professor;


create table member_tbl_11(
m_id varchar2(5) not null primary key ,
m_pw varchar2(5) ,
m_name varchar2(10) ,
m_tel varchar2(13) ,
m_birthday date ,
m_point number(6) ,
m_grade varchar2(2)
);
commit;


insert into member_tbl_11 values ('m100' , '1234' , '������', '010-1111-2222' , '2004-01-01' , 100, '01');
insert into member_tbl_11 values ('m101' , '4444' , '����', '010-2222-3333' , '2004-01-01' , 1500, '01');
insert into member_tbl_11 values ('m102' , '5555' , '���ϳ�', '010-3333-4444' , '2004-12-10' , 2000, '02');
insert into member_tbl_11 values ('m103' , '6666' , '����ȣ', '010-4444-5555' , '2004-04-10' , 1900, '02');
insert into member_tbl_11 values ('m104' , '7777' , '�����', '010-5555-6666' , '2004-09-12' , 3000, '03');
insert into member_tbl_11 values ('m105' , '8888' , '�ִ���', '010-6666-7777' , '2004-08-10' , 4800, '03');
insert into member_tbl_11 values ('m106' , '9999' , '�̾˸�', '010-7777-8888' , '2004-07-10' , 2900, '01');
insert into member_tbl_11 values ('m107' , '0101' , '��̳�', '010-8888-9999' , '2004-06-09' , 1200, '01');
insert into member_tbl_11 values ('m108' , '0404' , '������', '010-9999-8888' , '2004-05-19' , 3000, '03');
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday)
values ('m109' , '0448' , '���ؼ�', '010-7878-1111' , '2004-11-27' );
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday)
values ('m110' , '4848' , '������', '010-8888-9090' , '2004-11-09');
commit;

-- ù ��° ����
--1
select * from member_tbl_11;
--2
select M_NAME,M_BIRTHDAY from member_tbl_11;
--3
select M_ID,M_BIRTHDAY,m_point from member_tbl_11 where m_name = '���ؼ�';
--4
select m_name,m_tel from member_tbl_11 where m_point >=2000;
--5
SELECT m_name,m_tel from member_tbl_11 where m_point BETWEEN 2000 and 3000;
SELECT m_name,m_tel from member_tbl_11 where m_point >=2000 and m_point <=3000;
--6
SELECT m_name,m_tel,m_point from member_tbl_11 where m_grade = '01';
--7
select m_name,m_tel from member_tbl_11 where M_BIRTHDAY >= '04/06/01';
--8
select m_name,M_BIRTHDAY from member_tbl_11 where M_BIRTHDAY <= '04/05/01';
--9
SELECT m_name,m_tel,m_grade from member_tbl_11 where m_grade != '01';
--10
SELECT m_name,m_tel,M_ID from member_tbl_11 where m_grade = '02';
--11
select m_name,m_tel from member_tbl_11 where m_point <1500;
--12
select * from MEMBER_TBL_11 where m_point is null;
--13
select * from MEMBER_TBL_11 where m_point is not null;
--14
select DISTINCT m_grade from  MEMBER_TBL_11;

--�� ��° ����
--1
SELECT m_id,m_name from MEMBER_TBL_11 where m_grade = '01' and m_point >= 2000;
--2
SELECT m_id,m_name from MEMBER_TBL_11 where m_grade = '01' or m_point >= 2000;
--3
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where m_name like '��%';
--4
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where  m_name like '%��';
--5
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where m_grade in (01,03);
--6
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where m_grade not in (01,03);
--7
SELECT  m_id,m_name,m_grade from MEMBER_TBL_11 where m_grade = 02 or M_NAME like '��%';
--8
SELECT  m_id,m_name,M_BIRTHDAY from MEMBER_TBL_11 where M_BIRTHDAY <= '04/05/01' or m_grade = 03;