

--select * from ���̺��
--select * from ���̺�� where ����

select * from acorntbl;
select * from acorntbl where name like '��_';
select * from acorntbl where name like '��%';



-- �Լ� (���� , ���� , ��¥ , ��ȯ �Լ� , �Ϲ� �Լ�
select ename , initcap(ename) from emp; -- ù���� �빮�� ��ȯ
select ename , lower(ename) from emp; -- �ҹ��� ��ȯ
select ename , upper(ename) from emp; -- �빮�� ��ȯ
select ename , length(ename) from emp; -- ���ڿ� ����


select * from acorntbl;
select length(name), lengthb(name) from acorntbl; -- lengthb ()����Ʈ ���� ������

select * from emp;
select ename || ' ' || job from emp;
select ename || job as "ename job" from emp;

select concat (ename, job) from emp;

--substr() ���ڿ��� �Ϻθ� ������ �� 
--          ���ڿ�,������ġ,�����ﰳ��
select substr (ename, 2, 3) from emp;

select 'abcde' from dual; -- dual �������̺�
select substr ('abcde',2,1) from dual;

select substr ('hi hello',4,5) from dual;

select substr (name,2,2) from acorntbl;
select substr (name,-2,2) from acorntbl; -- ������ġ�� -�̸� ������ �������� ����

--instr () ���ڿ����� Ư�� ������ ��ġ�� ��ȯ��
select 'A-B-C-D' from dual;
select instr ('A-B-C-D','-') from dual;
select instr ('A-B-C-D','-',1,3) from dual;

select instr ('032)851-1234',')') from dual;

select * from STUDENT;
SELECT name, tel from STUDENT;
--��ȭ��ȣ ) ��ġ ã��
SELECT name , instr (tel,')') from STUDENT;
-- ��ȭ��ȣ���� )��ġ -1 (������ ���� ���ϱ�)
SELECT name, substr (tel,1,instr (tel,')')-1) from STUDENT;

--lpad() �Լ�
select * from STUDENT;
SELECT id from STUDENT;
--lpad (���ڿ�,��ü�ڸ���,ä�﹮��)
SELECT lpad(id ,10,'*') from STUDENT;
SELECT rpad(id ,10,'*') from STUDENT;

--trim():�������� (��������)
--ltrim(): ���� ��������
--rtrim(): ������ ��������
select  '   abc   ' || 'b' from dual;
select trim ('   abc   ') || 'b' from dual;
select ltrim ('   abc   ') || 'b' from dual;
select rtrim ('   abc   ') || 'b' from dual;

--replace 

select * from emp;
select ename, replace(ename, 'M','*') from emp;
select ename, replace(ename ,'SM' , '**') from emp; --SM�̶�� ���ڸ� **��
select substr (ename,1,2) from emp;
select ename, replace(ename ,substr(ename, 1,2) , '**') from emp; -- �ձ��� �ΰ��� **��


--���� Ǯ��
--79p
SELECT * from STUDENT;

select name, tel, substr(tel, 1,instr(tel,')')-1)  as "AREA CODE" from student where deptno1='201';
--84p
--1
select * from emp;
select * from emp where deptno=20;
select ename from emp where deptno=20;

select substr(ename, 2,2) from emp;
select  replace( ename,  substr(ename, 2,2) ,'--') from emp; 
select  replace( ename,  substr(ename, 2,2) ,'--') from emp  where deptno=20; 
--select ename , replace (ename,substr(ename,2,2) ,'--') where deptno = '20' from emp;
--2
select * from student;
select name,jumin, replace( jumin, substr(jumin,7,7) ,'-/-/-/-') from student;
--3
select name, tel,replace (tel,substr(tel,5,3) ,'***') from STUDENT where DEPTNO1 = 102;
--4
select name, tel,replace (tel,substr(tel,instr (tel,'-')+1,4) ,'****') from STUDENT where DEPTNO1 = 101;



--���� �Լ�
--round(����,�ڸ���) �ݿø�
-- �ڸ����� -�̸� �Ҽ��� ���� ����
select round(987.654, 2) from dual;
select trunc(987.655,2) from dual; --������ ����
select trunc(987.655,-2) from dual; -- �ʴ��� ����

select ceil(12.3456) from dual; --�����ø�
select floor(12.3456) from dual; --��������
-- ���������ϱ� mod (������,����)
select mod (10,2) from dual; 


--��¥ �Լ�
--sysdate ���糯¥ ���ϱ�
select stsdate from dual;
--months_between(ū��¥, ������¥) �� ��¥ ������ ���� �� ���ϱ�
select months_between('20230901','20230801') from dual;
select months_between('23/09/01','23/08/01') from dual;

--next_day() ����� ������ ���� ���Ͽ� �ش��ϴ� ��¥ ���ϱ�
select next_day('2023-08-18','��') from dual;

--���糯¥ ���� 3�� �� ���ϱ�
select sysdate +3 from dual;
--Ư�� ��¥�� �������� 3�ϵ� ���ϱ�
select to_date('2023/08/18')+3 from dual;

--����ȯ �Լ�
--����, ��¥�� > ���ڷ� ��ȯ (���ϴ� �������� �����ؼ� ��ȸ�ϱ�)
select 123456 from dual;
select to_char(123456,'999,999.99') as amt from dual;
select to_char(123456,'L999,999') as amt from dual; --��ȭǥ��
select to_char(123456,'$999,999') as amt from dual; --�޷�ǥ��
--���ǻ��� ǥ���� ������ �ڸ������� 9�� ������ ������ #### ǥ����
select to_char(123456,'99,999') as amt from dual;
select to_char(123456,'9999,999') as amt from dual;
select to_char(123456,'09999,999') as amt from dual;

--��¥�� > ���ڷ� ��ȯ
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yyyy-mm-dd day') from dual;
select to_char(sysdate, 'yyyy-mm-dd dy') from dual;

select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'yy/mm/dd') from dual;
select to_char(sysdate, 'yyyy"��"mm"��"dd"��"') from dual;


select * from emp;
select empno, ename,sal,comm from emp;
select empno, ename,(sal*12)+comm from emp;
select empno, ename,to_char((sal*12)+comm,'999,999' ) "����"from emp;

select * from professor;

desc professor;
select name,pay,bonus from professor;
select name,to_char((pay*12)+bonus , '999,999') from professor;

--to_munber() �Լ�
select '5' +3 from dual; -- �ڵ�����ȯ(����������ȯ)
select to_number('5') +3 from dual; -- ���������ȯ �������·ε� ���ڸ� ���� ���ڷ� ��ȯ�ϴ� �Լ�

--to_date() �Լ� : ��������ε� ��¥�����͸� ���� ��¥�����ͷ� ��ȯ�ϴ� �Լ�

select to_date('2023/08/18') +3 from dual;


--�Ϲ� �Լ� nvl(),nvl2()
--null�� ��� �ٸ������� ġȯ���ִ� �Լ�

select * from professor;
select name, bonus from PROFESSOR;
select name, nvl(bonus, 0) from PROFESSOR;
select name, (pay*12)+bonus as "����" from PROFESSOR;
--null�ΰ��
select name, nvl((pay*12)+bonus,0) as "����" from PROFESSOR;
--�����ݾ׿� õ���� ǥ������
select name, to_char(nvl((pay*12)+bonus,0),'999,999') as "����" from PROFESSOR;


select bonus from professor;
select bonus,nvl2(bonus,bonus*2,100) from PROFESSOR;
--     nvl2(�÷�,null�ƴѰ��,null���)
select nvl2(bonus,bonus*2,100) from PROFESSOR;

--decode() �Լ� 
select * from MEMBER_TBL_11;
select m_grade ,decode (m_grade,'01','vip','02','���','03','�����') from MEMBER_TBL_11;
select decode (m_grade,'01','vip','02','���','03','�����') from MEMBER_TBL_11;

--120p
--1
select * from STUDENT;
select name,jumin from STUDENT;
select jumin, SUBSTR(JUMIN,7,1) from STUDENT;
select jumin, decode(SUBSTR(JUMIN,7,1),'1','MAN','2','WOMAN') Gender from STUDENT;
--2
select * from STUDENT;
select name,tel from STUDENT;
select tel,instr(tel ,')') from STUDENT;
select tel,substr(tel,1,instr(tel,')')-1) from STUDENT;
select name, tel,decode(substr(tel,1,instr(tel,')')-1),'02','SEOUL','031','GYEONGGI','051','BUSAN','052','ULSAN','055','GYEONGNAM') as LOC from STUDENT where deptno1 = 101;

--case when
--SELECT ���̸� , CASE WHEN [����] THEN [�����]
--WHEN [����] THEN [�����]
--ELSE [�����]
--END AS ���ο��÷���
--FROM ���̺�� ;
select * from MEMBER_TBL_11;

select m_point from MEMBER_TBL_11;

select m_point, case 
  when m_point > 2000 then '��' 
    end as "���" from MEMBER_TBL_11;
    
select m_point, case 
  when m_point >= 2000 then '��' 
  when m_point >= 1500 then '��'
  else '��'
    end as "���" from MEMBER_TBL_11;

--������ �Լ� �����Լ� , sum() ,avg() , max(), min()
--count(*),count(�÷���)
select * from MEMBER_TBL_11;
select sum(m_point) from MEMBER_TBL_11;
select avg(m_point) from MEMBER_TBL_11;
select max(m_point) from MEMBER_TBL_11;
select min(m_point) from MEMBER_TBL_11;
select count(*) from MEMBER_TBL_11; -- ���̺��� ���� ������ ���Ѵ� . ��ü���� ���� ���ϱ�
select count(M_POINT) from MEMBER_TBL_11; --�÷������� �Ұ�� null���� ��ȸ�ϰ� count

--group by , �����Լ��� �Բ� ����Ѵ�.
select * from MEMBER_TBL_11;
select M_GRADE , M_POINT from MEMBER_TBL_11;

select M_GRADE , sum(M_POINT) 
from MEMBER_TBL_11
group by M_GRADE;

-- having �� ����ϱ� (����), group by ��������� ���ǿ� �´°͸� ������ ��
select M_GRADE , M_POINT 
from MEMBER_TBL_11;

select M_GRADE , sum(M_POINT) 
from MEMBER_TBL_11
group by M_GRADE;

select M_GRADE , sum(M_POINT) --4��
from MEMBER_TBL_11            --1��
group by M_GRADE              --2��
having sum(M_POINT) >=5000;   --3�� (select�� �ִ� ��Ī�� ����Ҽ� ���� . ������  �������ִ� )

select M_GRADE , sum(M_POINT) as "total" --4��
from MEMBER_TBL_11            --1��
group by M_GRADE              --2��
having sum(M_POINT) >=5000   --3�� (select�� �ִ� ��Ī�� ����Ҽ� ���� . ������  �������ִ� )
order by sum(m_point) desc;


--count() , count(*) count(�÷���)

select * from emp;
select count(*)from emp;
select count(ename)from emp;
select count(comm)from emp; -- �ش��ϴ� �÷��� null�� �����ϰ� ī��Ʈ��

select sum (comm) from emp; -- null�� ���ܵǰ� �հ谡 ��������.

select avg (comm) from emp;
select max (comm) from emp;
select min (comm) from emp;

--group by
select * from emp;
--group by ������ ��ȸ�� Ȯ���ϱ�
select deptno, sal from emp;
--�μ��� sal�� ��� ���ϱ�
select deptno,sum(sal) 
from emp
group by deptno;
--having�� ������ group by�� �� ��Ȳ���� ���ȴ�.
--group by ���µ� having ����.
--group�� ��������� ������ ����� ���� having�� �;���
select deptno,sum(sal) 
from emp
group by deptno
having sum(sal) >= 7000;

select deptno,job,sal 
from emp;

select deptno,job,sum(sal) 
from emp
group by deptno, job
order by 1;

select deptno,job,sum(sal) 
from emp
group by deptno, job
order by 1,3 desc;

CREATE TABLE CUST_INFO(
ID VARCHAR2(13) NOT NULL PRIMARY KEY ,
FIRST_NM VARCHAR2(10) ,
LAST_NM VARCHAR2(10) ,
ANNL_PERF NUMBER(10,2)
);
COMMIT;

INSERT INTO CUST_INFO VALUES ('8301111567897' , 'JHUN' , 'KIM', 330.08);
INSERT INTO CUST_INFO VALUES ('9302112567897' , 'JINYOUNG' , 'LEE', 857.61);
INSERT INTO CUST_INFO VALUES ('8801111567897' , 'MIJA' , 'HAN', -76.77);
INSERT INTO CUST_INFO VALUES ('9901111567897' , 'YOUNGJUN' , 'HA', 468.54);
INSERT INTO CUST_INFO VALUES ('9801112567897' , 'DAYOUNG' , 'SUNG', -890);
INSERT INTO CUST_INFO VALUES ('9701111567897' , 'HYEJIN' , 'SEO', 47.44);
COMMIT;

CREATE TABLE STUD_SCORE(
  STUDENT_ID        VARCHAR2(13) NOT NULL PRIMARY KEY ,
  MATH_SCORE      NUMBER(5) ,
  ENG_SCORE        NUMBER(5)   ,
  PHIL_SCORE       NUMBER(5)   ,
  MUSIC_SCORE    NUMBER(5) 
);
COMMIT;

INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE,   ENG_SCORE, PHIL_SCORE , MUSIC_SCORE)   VALUES ('0123511' , 89,78,78,90);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE,   ENG_SCORE,  MUSIC_SCORE)   VALUES ('0255475' , 88,90,90);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE  , MUSIC_SCORE)   VALUES ('9921100' , 87,98);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE, ENG_SCORE, PHIL_SCORE , MUSIC_SCORE)   VALUES ('9732453' , 69,98,78,78);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE, ENG_SCORE, PHIL_SCORE )   VALUES ('0578981' , 59,90,89);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE, ENG_SCORE, PHIL_SCORE , MUSIC_SCORE)   VALUES ('0768789' , 94,80,87,99);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE, ENG_SCORE, PHIL_SCORE , MUSIC_SCORE)   VALUES ('9824579' , 90,90,78,87);
INSERT INTO  STUD_SCORE ( STUDENT_ID , MATH_SCORE, ENG_SCORE, PHIL_SCORE )   VALUES ('0565789' , 58,64,72);



commit;

 

CREATE TABLE STAFF_SAL(
  ID         VARCHAR2(13) NOT NULL PRIMARY KEY ,
  JOB       VARCHAR2(13) ,
  CURRENT_SAL      NUMBER(10)   ,
  ENG_SCORE        NUMBER(5)    
);
COMMIT;

INSERT INTO  STAFF_SAL    VALUES ('2148', 'OFFICER' , 40000, 90);
INSERT INTO  STAFF_SAL    VALUES ('5780', 'CLERK' , 32000, 98);
INSERT INTO  STAFF_SAL    VALUES ('6870', 'MANAGER' , 100000, 81);
INSERT INTO  STAFF_SAL    VALUES ('4565', 'CLERK' , 30000, 79);
INSERT INTO  STAFF_SAL    VALUES ('9687', 'CLERK' , 33000, 66);
INSERT INTO  STAFF_SAL    VALUES ('7337', 'MANAGER' , 100000, 95);
INSERT INTO  STAFF_SAL    VALUES ('1321', 'OFFICER' , 43000, 80);
INSERT INTO  STAFF_SAL    VALUES ('9896', 'CLERK' , 30000, 50);
 COMMIT;
 
 CREATE TABLE PRC(
CUST_ID      VARCHAR2(13) NOT NULL PRIMARY KEY ,
SET2            VARCHAR2(13) ,
CARD_FLAG     NUMBER(1)   ,
LOAN_FLAG     NUMBER(1)   ,
INSURANCE_FLAG     NUMBER(1)   ,
CTB_FLAG     NUMBER(1)   ,
FUND_FLAG    NUMBER(1)   ,
ANNL_REV   NUMBER(10)      
);
COMMIT;

INSERT INTO  PRC    VALUES ('546515' , 'SILVER' , 1,1,1,1,1,1000);
INSERT INTO  PRC    VALUES ('46780' , 'GOLD' , 0,0,1,1,0,20000);
INSERT INTO  PRC    VALUES ('237848' , 'GOLD' , 1,1,0,1,1,30000);
INSERT INTO  PRC    VALUES ('56432' , 'DIAMOND' , 1,0,1,1,1,10000);
INSERT INTO  PRC    VALUES ('89647' , 'SILVER' , 0,0,1,1,0,3000);
INSERT INTO  PRC    VALUES ('52333' , 'SILVER' , 1,1,0,1,0,2500 );
INSERT INTO  PRC    VALUES ('89669' , 'GOLD' , 1,0,1,1,0,60000);
INSERT INTO  PRC    VALUES ('21004' , 'SILVER' , 0,0,1,1,0,1000);
INSERT INTO  PRC    VALUES ('17890' , 'DIAMOND' , 1,1,0,1,0,300000);
COMMIT;

CREATE TABLE   PROD_SALES(
CUST_NM         VARCHAR2(13)  ,
PRD_ID             VARCHAR2(5) ,
SALES_AMT       NUMBER(10)      
);
COMMIT;

INSERT INTO   PROD_SALES   VALUES ('LEE', 546 , 3000);
INSERT INTO   PROD_SALES   VALUES ('KIM', 326 , 4780);
INSERT INTO   PROD_SALES   VALUES ('KANG', 564 , 87900);
INSERT INTO   PROD_SALES   VALUES ('KWON', 556 , 45478);
INSERT INTO   PROD_SALES   VALUES ('KIM', 254 , 3000);
INSERT INTO   PROD_SALES   VALUES ('YOO', 567 , 78900);
INSERT INTO   PROD_SALES   VALUES ('PARK', 877 , 89787);
INSERT INTO   PROD_SALES   VALUES ('LEE', 890 , 10000);
INSERT INTO   PROD_SALES   VALUES ('KIM', 787 , 2341);
INSERT INTO   PROD_SALES   VALUES ('PARK', 566 , 50000);
COMMIT;


--3��°
select * from MEMBER_TBL_11;
--1.MEMBER_TBL_11 ���̺�κ��� ����� ��ȸ�ϱ�
select M_GRADE from MEMBER_TBL_11;
--2.MEMBER_TBL_11 ���̺�κ��� ����� ��ȸ�ϱ�, �ߺ��� �� �����ϰ� ��ȸ�ϱ�
select DISTINCT M_GRADE from MEMBER_TBL_11;
--3.�����̺�κ��� ���̵� USERID��� �̸����� ��ȸ�ϱ� (AS �� ����������)
select M_id userid from MEMBER_TBL_11;
--4.�����̺�κ��� �̸��� ���ԡ��ڸ� �ٿ� NAME�̶�� �÷������� ��ȸ�ǵ��� �Ͻÿ�
select M_name || '��' from MEMBER_TBL_11;
--5.������ ���̺�κ��� �ֹι�ȣ 7��° ���� (������ ��Ÿ����)�� �����Ͽ� GENDER ��� �̸����� �ֹι�ȣ�� �Բ� ��ȸ�Ͻÿ�
select * from CUST_INFO;
select id,SUBSTR(id,7,1) gender from CUST_INFO;
--6.������ ���̺�κ��� �ֹι�ȣ, LAST_NM�� ��� �ҹ��ڷ� ��ȸ�ǵ��� �Ͻÿ�
select id,lower(LAST_NM) from CUST_INFO;
--7.������ ���̺�κ��� DM�߼��� ���ؼ� NAME�̶�� �̸�����KIM, JIHOON �� ������������ ��ȸ�� �� �ֵ��� �Ͻÿ�
select LAST_NM||', '||FIRST_NM as NAME from CUST_INFO;
--8.������ ���̺�κ��� �� �ֹι�ȣ, ������ �Ҽ� ��°���� �ݿø��Ͽ� �Ҽ� ù°�ڸ����� ǥ�õ� �� �ֵ��� ��ȸ �Ͻÿ�
select id, round(ANNL_PERF,1) from CUST_INFO;
--9.������ ���̺�κ��� �� �ֹι�ȣ, ������ �Ҽ� ù°���� �����Ͽ� ������ ��Ÿ���� �ֵ��� ��ȸ�Ͻÿ�
select id, trunc(ANNL_PERF) from CUST_INFO;
--10.���糯¥�� ��ȸ�Ͻÿ�
select sysdate from dual;
--11.�����̺�κ��� �ֹι�ȣ , ������ 300�̻��̸� ����� 100�̻��� �Ϲݼ��� 0�����̸� ���� , �������� �������� ������ RESULT�÷������� ��ȸ�� �� �ֵ��� �Ͻÿ�
select id,case
  when ANNL_PERF >= 300 then '�����' 
  when ANNL_PERF >= 100 then '�Ϲݼ���'
  when ANNL_PERF <= 0 then '����' 
  else '��������'
  end result from CUST_INFO;
--12.�����̺�κ��� �̸��� ����Ʈ�� ��ȸ�Ͻÿ�(�� ����Ʈ�� �������� ���� ���� 0���� ǥ�õǵ��� �Ͻÿ�) ��Ʈ:NVL �Լ� ���
select * from MEMBER_TBL_11;
select M_NAME,nvl(M_POINT,0) from MEMBER_TBL_11;
--13.��Ʈ: NVL2�Լ��� ����ϼ���
--�����̺�κ��� ��������Ʈ �������� 100����Ʈ�� �λ��Ϸ��� �մϴ�. NEXT_POINT��� �÷����� ��ȸ�ǵ��� ��
--�ÿ�, ���̸�, ����Ʈ�� �Բ� ��ȸ�Ͻÿ� ( ��������Ʈ�� ���� ����� 0����Ʈ�� �����մϴ�)
select M_NAME,nvl2(M_POINT,M_POINT+100,0) from MEMBER_TBL_11;


--4��°
--1.STUD_SCORE ���̺��� ����Ͽ� NULL���� ������ ���� ������ ������
select * from STUD_SCORE;
select count(*) from STUD_SCORE;
--2.STUD_SCORE ���̺��� ����Ͽ� NULL���� ������ ������ ���� ���� �����ڸ� ������
select count(MUSIC_SCORE) from STUD_SCORE;
--3.STUD_SCORE ���̺��� ����Ͽ� ���� ������ �� �հ踦 ���غ���
select sum(MATH_SCORE) from STUD_SCORE;
--4. STUD_SCORE ���̺�������Ͽ� ���� ������ ����� ���غ���
select avg(MUSIC_SCORE) from STUD_SCORE;
--5.STUD_SCORE ���̺��� ����Ͽ� �������� �ִ� �� �ּڰ��� ���غ���
select max(MATH_SCORE), min(MATH_SCORE) from STUD_SCORE;
--6. CLERK�� 7% , OFFICER�� 5% , MANAGER�� 3%�� ������ �λ��ϱ�� �ߴ�.
--STAFF_SAL���̺��� ����Ͽ� �� ������ �λ� ������ �����غ��� ( CASE WEHN ����غ��� )
--(���翬���� �������� ������ ���󿬺��� ���غ���)
select * from STAFF_SAL;
select id,case
  when job = 'CLERK' then current_sal*1.07
  when job = 'OFFICER' then current_sal*1.05
  when job = 'MANAGER' then current_sal*1.03
  end as ���󿬺� from STAFF_SAL;
--7. PRC ���̺��� ����Ͽ� ����޺� �δ� ��� �� ������ ����� ����( GROUP BY ���)
select * from prc;
select set2 , ANNL_REV from prc ;

select set2 , avg(ANNL_REV) 
from prc
group by set2 ;

select set2 , round( avg(ANNL_REV),1) 
from prc
group by set2 ;
--8. PRC ���̺��� ����Ͽ� ����޺� �� ���� Ȯ���غ���(GROUP BY)
select * from prc;
select set2 , count(set2)
from prc
group by set2 ;
--9. ����Ƚ���� �� �� �̻��� ������ �������� �Ϸ��� �Ѵ�. ������ ������� ���̸��� ��ȸ�Ͻÿ�
select * from PROD_SALES;
select CUST_NM, count(CUST_NM)
from PROD_SALES
group by CUST_NM
having count(CUST_NM) > 1;

select CUST_NM
from PROD_SALES
group by CUST_NM
having count(CUST_NM) > 1;
--10. ���űݾ��� ���� 7���� �̻��� ������ �������� �Ϸ��� �Ѵ�. ������ ����ڴ� �����ϱ�?
select CUST_NM, sum(SALES_AMT)
from PROD_SALES
group by CUST_NM
having sum(SALES_AMT) >= 70000;

select CUST_NM
from PROD_SALES
group by CUST_NM
having sum(SALES_AMT) >= 70000;

create table tbl_test_customer(
    id varchar2(20) not null primary key ,
    name varchar2(20) ,
    address varchar2(20),
    tel varchar2(20)
);

create table tbl_test_goods(
  pcode varchar2(20) not null primary key,
  pname varchar(20) ,
  price number(4)
);

create table tbl_test_order(
  ocode varchar2(20) not null primary key,
  odate date,
  id varchar2(20),
 pcode varchar2(20),
 sale_cnt number(6)
);



insert into tbl_test_customer values( 'H001' ,'�躴��', '�󽺺�����', '010-1111-2222');
insert into tbl_test_customer values( 'H002' ,'����', 'L.A', '010-1111-2222');
insert into tbl_test_customer values( 'H003' ,'���ܾ�', '������D.C', '010-1111-2222');
insert into tbl_test_customer values( 'H004' ,'������', '����', '010-1111-2222');
insert into tbl_test_customer values( 'H005' ,'������', '�ػ罺', '010-1111-2222');
insert into tbl_test_customer values( 'H006' ,'������', '����', '010-1111-2222');


 


insert into tbl_test_goods values('P001' ,'�˵��', 1000);
insert into tbl_test_goods values('P002' ,'�������', 100);
insert into tbl_test_goods values('P003' ,'������', 200);
insert into tbl_test_goods values('P004' ,'��Ƣ��', 2000);
insert into tbl_test_goods values('P005' ,'��ī��', 500);



insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);

select * from tbl_test_customer;
select * from tbl_test_goods;
select * from tbl_test_order;

--join ����ġ��
select *
from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID;

select o.OCODE,o.ODATE,c.NAME,c.TEL,g.PNAME,g.PRICE , o.SALE_CNT
from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID
join tbl_test_goods g
on o.PCODE = g.PCODE;

select o.OCODE,o.ODATE,c.NAME,c.TEL,g.PNAME,g.PRICE * o.SALE_CNT
from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID
join tbl_test_goods g
on o.PCODE = g.PCODE ;

select o.OCODE, o.ODATE,o.ID,o.PCODE
from tbl_test_order o
join tbl_test_goods g
on o.PCODE = g.PCODE;

select c.NAME,c.ADDRESS, sum(g.PRICE),sum(o.SALE_CNT)
from tbl_test_order o
join tbl_test_customer c
on o.ID = c.ID
join tbl_test_goods g
on o.PCODE = g.PCODE 
group by  c.NAME,c.ADDRESS;