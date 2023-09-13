select * from emp;

create table  acorntbl (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10)
);

insert into acorntbl values('dy', '4482', '곽단야');
insert into acorntbl values('mg','1234', '김민규');
insert into acorntbl  values('mj' ,'0000' , '김민지');
insert into acorntbl  values('bj','6666','김병진');
insert into acorntbl values('jy', '1127', '김재열');
insert into acorntbl values('hs', '0317', '김현수');
insert into acorntbl values('nj','9876','문나정');
insert into acorntbl values('jw', '1111', '박지원'); 
insert into acorntbl values('tm', '4482', '박태민');
insert into acorntbl values('yj','0117','서예진'); 
insert into acorntbl values('y','1126','이윤');
insert into acorntbl values('yj2','0625','이윤정');
insert into acorntbl values('jh','6789','이정훈');
insert into acorntbl  values('ek', '1234', '조은경');
insert into acorntbl values('jt','1234','표준태');
insert into acorntbl values('jh1', '7777', '허재혁');
insert into acorntbl values('jh2', '9999', '허재화');
commit;

select * from acorntbl;

--김 씨 조회
select * from acorntbl where name like '김%';


--sql : DBNS (데이터베이스 관리시스템 소프트웨어,데이터베이스) 오라클11g
--sql : DBMS에 질의라는 언어 (문법이 있다)

--DML (insert > creat , select-read , update, delete,delete) CRUD
--DDL
--DDL

--조회하기
--select 컬럼명 , 컬럼명.. form 테이블명;
--테이블 스키마 . 테이블 구조 확인명령어 desc 테이블명;
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
 
 --select 명령에 표현한 (리터럴) 사용하여 출력하기
 --select name , 'good ''morging';
 
 
 --컬럼별칭 사용하여 출력하기
 --컬럼명 뒤에 as (생략가능) "별칭명" (공백도 들어갈수 있음)
 select profno as "Pro's No", name as "Pro's Name", pay
 from professor;
 
 --distinct 중복된 값을 제거하고 출력하기
 
 select deptno from emp;
 select distinct deptno from emp;
 
 --연결 연산자 || 컬럼명 연결해서 조회하고 싶을 때 사용
 select ename || '님' as ename , job from emp;
 select ename || ' ' || job from emp;
 
 
 --원하는 조건만 골라내기 - where 절 사용
 
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
 select * from acorntbl where name like '김%';
 
 select * from emp ;
--where 절에서의 연산자 = 같다
select * from emp where job = 'CLERK';

-- !- , <> 같지 않다
select * from emp where job != 'CLERK';

-- > 크다 , 초과
select * from emp where sal > 1200;

--컬럼이나 테이블명 대소문자 상관없음
-- 데이타는 대소문자를 구분해야함

-- >= 이상
select * from emp where sal >= 800;

-- < 미만
select * from emp where comm <300;

--<= 이하
select * from emp where comm <= 300;

-- berween a and b a와b 사이에있는 범위 값을 조회 (앞에는 작은거 뒤에는 큰거)
select * from emp where sal between 1200 and 2000;

-- and 조건이 여러개 있을때 모두 만족하는 조건
select * from emp where job = 'CLERK' and sal = 1300;
select * from emp where sal >= 1200 and sal <=2000; 

-- or 조건이 여러개 있을때 하나라도 만족하는 조건
select * from emp where job='SALESMAN' or sal > 1200;

-- in 연산자 
select * from emp where deptno in (10,20);
  -- where deptno = 10 or deptno =20;

-- like 연산자로 비슷한것을 모두 찾기 %(0이상), _(언더바 하나가 한 자리)
select * from emp where job like 'S%'; -- 시작이 S 이고 뒤에는 상관없다
select * from emp where job like '%N'; -- 끝이 S로 끝나는 모든것을 찾겠다
select * from emp where job like '%N%'; -- job 컬럼에 N문자가 포함된 것을 모두 찾겠다.

select * from emp where sal like '1%'; 

SELECT * FROM emp WHERE ename like 'W___';

--문자, 날짜 표현시 ''표시해야함.
select * from emp where hiredate >= '80/12/17';

--null 값 is null is not null
--null 값을 확인할 때는 is null,is not null
select * from emp;
--데이터베이스에서 컬링의 값이 null인 것은 값이 정해지지 않은것을 의미한다. 주의사항 => 0의 의미가 아니다
-- 값이 null인 것을 조회할 때는 = 값다라는 조건을 사용하지 못함 is null 사용해야함
select * from emp where comm is null;
select * from emp where comm is not null;

--null값을 다룰 때 주의 사항
--예시) comm 컬럼에 값을 +100증가된 값으로 조회를 한다면 결과는?
--null은 정해지지 않은 값을 의미하므로 여기에 어떤 연산을 수행해도 정해지지 않은 값으로 인식함
select ename,sal,comm+100 from emp;

 --select ename, sal ,nvl(comm, 0) from emp;

--56p 정렬하기 order by
select * from emp;
--sal 높은 순으로 결정
--order by 절 사용 컬럼명 명시 , 컬럼의 순서
select * from emp order by sal desc;

select job, sal from emp order by sal desc;
select job, sal from emp order by 2 desc;

select * 
from emp 
order by deptno ,sal desc;

-- 집합연산자 (union 행합치기)
--union , union all, intersect , minus
-- 회원 테이블(모든 회원정보가 있는 테이블)
--서울 회원 테이블, 경기도 회원 테이블,부산 회원 테이블
--전체를 조회할 때 union 사용함 (중복제거, 정렬해줌)

--주의 사항: 컬럼 수 , 컬럼 타입이 같아야함
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


insert into member_tbl_11 values ('m100' , '1234' , '성기훈', '010-1111-2222' , '2004-01-01' , 100, '01');
insert into member_tbl_11 values ('m101' , '4444' , '김상우', '010-2222-3333' , '2004-01-01' , 1500, '01');
insert into member_tbl_11 values ('m102' , '5555' , '김일남', '010-3333-4444' , '2004-12-10' , 2000, '02');
insert into member_tbl_11 values ('m103' , '6666' , '이준호', '010-4444-5555' , '2004-04-10' , 1900, '02');
insert into member_tbl_11 values ('m104' , '7777' , '김새벽', '010-5555-6666' , '2004-09-12' , 3000, '03');
insert into member_tbl_11 values ('m105' , '8888' , '최덕수', '010-6666-7777' , '2004-08-10' , 4800, '03');
insert into member_tbl_11 values ('m106' , '9999' , '이알리', '010-7777-8888' , '2004-07-10' , 2900, '01');
insert into member_tbl_11 values ('m107' , '0101' , '김미녀', '010-8888-9999' , '2004-06-09' , 1200, '01');
insert into member_tbl_11 values ('m108' , '0404' , '이정재', '010-9999-8888' , '2004-05-19' , 3000, '03');
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday)
values ('m109' , '0448' , '박해수', '010-7878-1111' , '2004-11-27' );
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday)
values ('m110' , '4848' , '위하준', '010-8888-9090' , '2004-11-09');
commit;

-- 첫 번째 문제
--1
select * from member_tbl_11;
--2
select M_NAME,M_BIRTHDAY from member_tbl_11;
--3
select M_ID,M_BIRTHDAY,m_point from member_tbl_11 where m_name = '박해수';
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

--두 번째 문제
--1
SELECT m_id,m_name from MEMBER_TBL_11 where m_grade = '01' and m_point >= 2000;
--2
SELECT m_id,m_name from MEMBER_TBL_11 where m_grade = '01' or m_point >= 2000;
--3
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where m_name like '김%';
--4
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where  m_name like '%수';
--5
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where m_grade in (01,03);
--6
SELECT m_id,m_name,m_grade from MEMBER_TBL_11 where m_grade not in (01,03);
--7
SELECT  m_id,m_name,m_grade from MEMBER_TBL_11 where m_grade = 02 or M_NAME like '이%';
--8
SELECT  m_id,m_name,M_BIRTHDAY from MEMBER_TBL_11 where M_BIRTHDAY <= '04/05/01' or m_grade = 03;