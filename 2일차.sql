

--select * from 테이블명
--select * from 테이블명 where 조건

select * from acorntbl;
select * from acorntbl where name like '이_';
select * from acorntbl where name like '이%';



-- 함수 (문자 , 숫자 , 날짜 , 변환 함수 , 일반 함수
select ename , initcap(ename) from emp; -- 첫글자 대문자 변환
select ename , lower(ename) from emp; -- 소문자 변환
select ename , upper(ename) from emp; -- 대문자 변환
select ename , length(ename) from emp; -- 문자열 길이


select * from acorntbl;
select length(name), lengthb(name) from acorntbl; -- lengthb ()바이트 수를 구해줌

select * from emp;
select ename || ' ' || job from emp;
select ename || job as "ename job" from emp;

select concat (ename, job) from emp;

--substr() 문자열의 일부를 추출할 때 
--          문자열,시작위치,가져울개수
select substr (ename, 2, 3) from emp;

select 'abcde' from dual; -- dual 가상테이블
select substr ('abcde',2,1) from dual;

select substr ('hi hello',4,5) from dual;

select substr (name,2,2) from acorntbl;
select substr (name,-2,2) from acorntbl; -- 시작위치가 -이면 오른쪽 기준으로 시작

--instr () 문자열에서 특정 문자의 위치를 반환함
select 'A-B-C-D' from dual;
select instr ('A-B-C-D','-') from dual;
select instr ('A-B-C-D','-',1,3) from dual;

select instr ('032)851-1234',')') from dual;

select * from STUDENT;
SELECT name, tel from STUDENT;
--전화번호 ) 위치 찾기
SELECT name , instr (tel,')') from STUDENT;
-- 전화번호에서 )위치 -1 (가져울 개수 구하기)
SELECT name, substr (tel,1,instr (tel,')')-1) from STUDENT;

--lpad() 함수
select * from STUDENT;
SELECT id from STUDENT;
--lpad (문자열,전체자리수,채울문자)
SELECT lpad(id ,10,'*') from STUDENT;
SELECT rpad(id ,10,'*') from STUDENT;

--trim():공백제거 (양쪽제거)
--ltrim(): 왼쪽 공백제거
--rtrim(): 오른쪽 공백제거
select  '   abc   ' || 'b' from dual;
select trim ('   abc   ') || 'b' from dual;
select ltrim ('   abc   ') || 'b' from dual;
select rtrim ('   abc   ') || 'b' from dual;

--replace 

select * from emp;
select ename, replace(ename, 'M','*') from emp;
select ename, replace(ename ,'SM' , '**') from emp; --SM이라는 문자만 **로
select substr (ename,1,2) from emp;
select ename, replace(ename ,substr(ename, 1,2) , '**') from emp; -- 앞글자 두개를 **로


--문제 풀이
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



--숫자 함수
--round(숫자,자리수) 반올림
-- 자리수가 -이면 소수점 기준 왼쪽
select round(987.654, 2) from dual;
select trunc(987.655,2) from dual; --원단위 절사
select trunc(987.655,-2) from dual; -- 십단위 절사

select ceil(12.3456) from dual; --정수올림
select floor(12.3456) from dual; --정수내림
-- 나머지구하기 mod (피제수,제수)
select mod (10,2) from dual; 


--날짜 함수
--sysdate 현재날짜 구하기
select stsdate from dual;
--months_between(큰날짜, 작은날짜) 두 날짜 사이의 개월 수 구하기
select months_between('20230901','20230801') from dual;
select months_between('23/09/01','23/08/01') from dual;

--next_day() 기분일 다음에 오는 요일에 해당하는 날짜 구하기
select next_day('2023-08-18','월') from dual;

--현재날짜 기준 3일 뒤 구하기
select sysdate +3 from dual;
--특정 날짜를 기준으로 3일뒤 구하기
select to_date('2023/08/18')+3 from dual;

--형변환 함수
--숫자, 날짜로 > 문자로 변환 (원하는 형식으로 포멧해서 조회하기)
select 123456 from dual;
select to_char(123456,'999,999.99') as amt from dual;
select to_char(123456,'L999,999') as amt from dual; --원화표시
select to_char(123456,'$999,999') as amt from dual; --달러표시
--주의사항 표현될 숫자의 자리수보다 9의 개수가 적으면 #### 표현됨
select to_char(123456,'99,999') as amt from dual;
select to_char(123456,'9999,999') as amt from dual;
select to_char(123456,'09999,999') as amt from dual;

--날짜를 > 문자로 변환
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yyyy-mm-dd day') from dual;
select to_char(sysdate, 'yyyy-mm-dd dy') from dual;

select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'yy/mm/dd') from dual;
select to_char(sysdate, 'yyyy"년"mm"월"dd"일"') from dual;


select * from emp;
select empno, ename,sal,comm from emp;
select empno, ename,(sal*12)+comm from emp;
select empno, ename,to_char((sal*12)+comm,'999,999' ) "연봉"from emp;

select * from professor;

desc professor;
select name,pay,bonus from professor;
select name,to_char((pay*12)+bonus , '999,999') from professor;

--to_munber() 함수
select '5' +3 from dual; -- 자동형변환(묵시적형변환)
select to_number('5') +3 from dual; -- 명시적형변환 숫자형태로된 문자를 실제 숫자로 변환하는 함수

--to_date() 함수 : 문자형대로된 날짜데이터를 실제 날짜데이터로 변환하는 함수

select to_date('2023/08/18') +3 from dual;


--일반 함수 nvl(),nvl2()
--null인 경우 다른값으로 치환해주는 함수

select * from professor;
select name, bonus from PROFESSOR;
select name, nvl(bonus, 0) from PROFESSOR;
select name, (pay*12)+bonus as "연봉" from PROFESSOR;
--null인경우
select name, nvl((pay*12)+bonus,0) as "연봉" from PROFESSOR;
--연봉금액에 천단위 표시형식
select name, to_char(nvl((pay*12)+bonus,0),'999,999') as "연봉" from PROFESSOR;


select bonus from professor;
select bonus,nvl2(bonus,bonus*2,100) from PROFESSOR;
--     nvl2(컬럼,null아닌경우,null경우)
select nvl2(bonus,bonus*2,100) from PROFESSOR;

--decode() 함수 
select * from MEMBER_TBL_11;
select m_grade ,decode (m_grade,'01','vip','02','우수','03','브론즈') from MEMBER_TBL_11;
select decode (m_grade,'01','vip','02','우수','03','브론즈') from MEMBER_TBL_11;

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
--SELECT 열이름 , CASE WHEN [조건] THEN [결과값]
--WHEN [조건] THEN [결과값]
--ELSE [결과값]
--END AS 새로운컬럼명
--FROM 테이블명 ;
select * from MEMBER_TBL_11;

select m_point from MEMBER_TBL_11;

select m_point, case 
  when m_point > 2000 then '상' 
    end as "결과" from MEMBER_TBL_11;
    
select m_point, case 
  when m_point >= 2000 then '상' 
  when m_point >= 1500 then '중'
  else '하'
    end as "결과" from MEMBER_TBL_11;

--복수행 함수 집계함수 , sum() ,avg() , max(), min()
--count(*),count(컬럼명)
select * from MEMBER_TBL_11;
select sum(m_point) from MEMBER_TBL_11;
select avg(m_point) from MEMBER_TBL_11;
select max(m_point) from MEMBER_TBL_11;
select min(m_point) from MEMBER_TBL_11;
select count(*) from MEMBER_TBL_11; -- 테이블의 행의 개수를 구한다 . 전체행의 개수 구하기
select count(M_POINT) from MEMBER_TBL_11; --컬럼명으로 할경우 null값은 제회하고 count

--group by , 집계함수와 함께 사용한다.
select * from MEMBER_TBL_11;
select M_GRADE , M_POINT from MEMBER_TBL_11;

select M_GRADE , sum(M_POINT) 
from MEMBER_TBL_11
group by M_GRADE;

-- having 절 사용하기 (선택), group by 결과내에서 조건에 맞는것만 추출할 때
select M_GRADE , M_POINT 
from MEMBER_TBL_11;

select M_GRADE , sum(M_POINT) 
from MEMBER_TBL_11
group by M_GRADE;

select M_GRADE , sum(M_POINT) --4번
from MEMBER_TBL_11            --1번
group by M_GRADE              --2번
having sum(M_POINT) >=5000;   --3번 (select에 있는 별칭을 사용할수 없다 . 쿼리의  순서가있다 )

select M_GRADE , sum(M_POINT) as "total" --4번
from MEMBER_TBL_11            --1번
group by M_GRADE              --2번
having sum(M_POINT) >=5000   --3번 (select에 있는 별칭을 사용할수 없다 . 쿼리의  순서가있다 )
order by sum(m_point) desc;


--count() , count(*) count(컬럼명)

select * from emp;
select count(*)from emp;
select count(ename)from emp;
select count(comm)from emp; -- 해당하는 컬럼의 null을 제외하고 카운트함

select sum (comm) from emp; -- null이 제외되고 합계가 구해진다.

select avg (comm) from emp;
select max (comm) from emp;
select min (comm) from emp;

--group by
select * from emp;
--group by 이전의 조회를 확인하기
select deptno, sal from emp;
--부서별 sal의 평균 구하기
select deptno,sum(sal) 
from emp
group by deptno;
--having은 이전에 group by가 된 상황에서 사용된다.
--group by 없는데 having 없다.
--group된 결과내에서 조건을 사용할 때는 having이 와야함
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


--3번째
select * from MEMBER_TBL_11;
--1.MEMBER_TBL_11 테이블로부터 고객등급 조회하기
select M_GRADE from MEMBER_TBL_11;
--2.MEMBER_TBL_11 테이블로부터 고객등급 조회하기, 중복된 값 제외하고 조회하기
select DISTINCT M_GRADE from MEMBER_TBL_11;
--3.고객테이블로부터 아이디 USERID라는 이름으로 조회하기 (AS 는 생략가능함)
select M_id userid from MEMBER_TBL_11;
--4.고객테이블로부터 이름에 ‘님’자를 붙여 NAME이라는 컬럼으로이 조회되도록 하시오
select M_name || '님' from MEMBER_TBL_11;
--5.고객정보 테이블로부터 주민번호 7번째 숫자 (성별을 나타내는)를 추출하여 GENDER 라는 이름으로 주민번호와 함께 조회하시오
select * from CUST_INFO;
select id,SUBSTR(id,7,1) gender from CUST_INFO;
--6.고객정보 테이블로부터 주민번호, LAST_NM을 모두 소문자로 조회되도록 하시오
select id,lower(LAST_NM) from CUST_INFO;
--7.고객정보 테이블로부터 DM발송을 위해서 NAME이라는 이름으로KIM, JIHOON 과 같은형식으로 조회될 수 있도록 하시오
select LAST_NM||', '||FIRST_NM as NAME from CUST_INFO;
--8.고객정보 테이블로부터 고객 주민번호, 수익을 소수 둘째에서 반올림하여 소수 첫째자리까지 표시될 수 있도록 조회 하시오
select id, round(ANNL_PERF,1) from CUST_INFO;
--9.고객정보 테이블로부터 고객 주민번호, 수익을 소수 첫째에서 버림하여 정수로 나타낼수 있도록 조회하시오
select id, trunc(ANNL_PERF) from CUST_INFO;
--10.현재날짜를 조회하시오
select sysdate from dual;
--11.고객테이블로부터 주민번호 , 수익이 300이상이면 고수익 100이상은 일반수익 0이하이면 손해 , 나머지는 변동없음 내용이 RESULT컬럼명으로 조회될 수 있도록 하시오
select id,case
  when ANNL_PERF >= 300 then '고수익' 
  when ANNL_PERF >= 100 then '일반수익'
  when ANNL_PERF <= 0 then '손해' 
  else '변동없음'
  end result from CUST_INFO;
--12.고객테이블로부터 이름과 포인트를 조회하시오(단 포인트가 적립되지 않은 고객은 0으로 표시되도록 하시오) 힌트:NVL 함수 사용
select * from MEMBER_TBL_11;
select M_NAME,nvl(M_POINT,0) from MEMBER_TBL_11;
--13.힌트: NVL2함수를 사용하세요
--고객테이블로부터 기존포인트 점수에서 100포인트씩 인상하려고 합니다. NEXT_POINT라는 컬럼으로 조회되도록 하
--시오, 고객이름, 포인트와 함께 조회하시오 ( 기존포인트가 없는 사람은 0포인트로 간주합니다)
select M_NAME,nvl2(M_POINT,M_POINT+100,0) from MEMBER_TBL_11;


--4번째
--1.STUD_SCORE 테이블을 사용하여 NULL값을 포함한 행의 개수를 세보자
select * from STUD_SCORE;
select count(*) from STUD_SCORE;
--2.STUD_SCORE 테이블을 사용하여 NULL값을 제외한 제외한 음악 점수 보유자를 세보자
select count(MUSIC_SCORE) from STUD_SCORE;
--3.STUD_SCORE 테이블을 사용하여 수학 점수의 총 합계를 구해보자
select sum(MATH_SCORE) from STUD_SCORE;
--4. STUD_SCORE 테이블을사용하여 음악 점수의 평균을 구해보자
select avg(MUSIC_SCORE) from STUD_SCORE;
--5.STUD_SCORE 테이블을 사용하여 수학점수 최댓값 및 최솟값을 구해보자
select max(MATH_SCORE), min(MATH_SCORE) from STUD_SCORE;
--6. CLERK는 7% , OFFICER는 5% , MANAGER는 3%로 연봉을 인상하기로 했다.
--STAFF_SAL테이블을 사용하여 각 직원별 인상 연봉을 예상해보자 ( CASE WEHN 사용해보기 )
--(현재연봉을 기준으로 직위별 예상연봉을 구해보자)
select * from STAFF_SAL;
select id,case
  when job = 'CLERK' then current_sal*1.07
  when job = 'OFFICER' then current_sal*1.05
  when job = 'MANAGER' then current_sal*1.03
  end as 예상연봉 from STAFF_SAL;
--7. PRC 테이블을 사용하여 고객등급별 인당 평균 연 수익을 계산해 보자( GROUP BY 사용)
select * from prc;
select set2 , ANNL_REV from prc ;

select set2 , avg(ANNL_REV) 
from prc
group by set2 ;

select set2 , round( avg(ANNL_REV),1) 
from prc
group by set2 ;
--8. PRC 테이블을 사용하여 고객등급별 고객 수를 확인해보자(GROUP BY)
select * from prc;
select set2 , count(set2)
from prc
group by set2 ;
--9. 구매횟수가 두 번 이상인 고객에게 마케팅을 하려고 한다. 마케팅 대상자의 고객이름을 조회하시오
select * from PROD_SALES;
select CUST_NM, count(CUST_NM)
from PROD_SALES
group by CUST_NM
having count(CUST_NM) > 1;

select CUST_NM
from PROD_SALES
group by CUST_NM
having count(CUST_NM) > 1;
--10. 구매금액의 합이 7만원 이상인 고객에게 마케팅을 하려고 한다. 마케팅 대상자는 누구일까?
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



insert into tbl_test_customer values( 'H001' ,'김병진', '라스베가스', '010-1111-2222');
insert into tbl_test_customer values( 'H002' ,'이윤', 'L.A', '010-1111-2222');
insert into tbl_test_customer values( 'H003' ,'곽단야', '워싱턴D.C', '010-1111-2222');
insert into tbl_test_customer values( 'H004' ,'허재혁', '뉴욕', '010-1111-2222');
insert into tbl_test_customer values( 'H005' ,'서예진', '텍사스', '010-1111-2222');
insert into tbl_test_customer values( 'H006' ,'이윤정', '서울', '010-1111-2222');


 


insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);
insert into tbl_test_goods values('P005' ,'차카니', 500);



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

--join 열합치기
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