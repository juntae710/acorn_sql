create table t_customer(
id  NUMBER(4) primary key,
name  varchar2(10)  not null ,
tel char(13) check (tel like '010-____-____') not null unique,
age varchar2(10) not null
);

INSERT into t_customer VALUES (0001,'김민지','010-1111-2222','청소년');
INSERT into t_customer VALUES (0002,'표준태','010-2222-1111','청소년');
INSERT into t_customer VALUES (0003,'곽단야','010-3333-4444','성인');
INSERT into t_customer VALUES (0004,'김현수','010-4444-3333','성인');
INSERT into t_customer VALUES (0005,'김지현','010-5555-6666','어린이');
INSERT into t_customer VALUES (0006,'이민우','010-6666-5555','어린이');
INSERT into t_customer VALUES (0007,'안은수','010-7777-8888','어린이');
INSERT into t_customer VALUES (0008,'박지윤','010-8888-7777','성인');
INSERT into t_customer VALUES (0009,'김현우','010-9999-0000','청소년');
INSERT into t_customer VALUES (0010,'우수미','010-0000-9999','성인');
commit;

SELECT * from acorntbl;
desc acorntbl;


create table ticket_tbl(
  ticket_id varchar2(20) not null primary key,
  ticket_type varchar2(20) not null,
  ticket_time_type varchar2(20),
  ticket_available_time varchar2(40) check(ticket_available_time like '__:__~__:__') not null,
  ticket_age varchar2(20) not null,
  ticket_price number(20) not null
);

insert into ticket_tbl values('t001','자유이용권','종일권','09:00~21:00','성인',50000);
insert into ticket_tbl values('t002','자유이용권','오전권','09:00~15:00','성인',30000);
insert into ticket_tbl values('t003','자유이용권','오후권','16:00~21:00','성인',30000);

insert into ticket_tbl values('t004','자유이용권','종일권','09:00~21:00','청소년',40000);
insert into ticket_tbl values('t005','자유이용권','오전권','09:00~15:00','청소년',20000);
insert into ticket_tbl values('t006','자유이용권','오후권','16:00~21:00','청소년',20000);

insert into ticket_tbl values('t007','자유이용권','종일권','09:00~21:00','어린이',25000);
insert into ticket_tbl values('t008','자유이용권','오전권','09:00~15:00','어린이',15000);
insert into ticket_tbl values('t009','자유이용권','오후권','16:00~21:00','어린이',15000);

insert into ticket_tbl values('t010','5회이용권',null,'09:00~21:00','성인',30000);
insert into ticket_tbl values('t011','5회이용권',null,'09:00~21:00','청소년',25000);
insert into ticket_tbl values('t012','5회이용권',null,'09:00~21:00','어린이',20000);

insert into ticket_tbl values('t013','3회이용권',null,'09:00~21:00','성인',20000);
insert into ticket_tbl values('t014','3회이용권',null,'09:00~21:00','청소년',15000);
insert into ticket_tbl values('t015','3회이용권',null,'09:00~21:00','어린이',10000);

insert into ticket_tbl values('t016','1회이용권',null,'09:00~21:00','성인',10000);
insert into ticket_tbl values('t017','1회이용권',null,'09:00~21:00','청소년',5000);
insert into ticket_tbl values('t018','1회이용권',null,'09:00~21:00','어린이',3000);
commit;

create table t_receipt(
no NUMBER(4) primary key,
t_id REFERENCES t_customer(id),
ticket_id REFERENCES ticket_tbl(ticket_id),
day date not null,
buy_type  NUMBER(2) not null
);

insert into t_receipt values(0001,0001,'t001','2023-08-23',01);
insert into t_receipt values(0002,0001,'t001','2023-08-23',01);
insert into t_receipt values(0003,0001,'t001','2023-08-23',01);
insert into t_receipt values(0004,0002,'t001','2023-08-23',01);
insert into t_receipt values(0005,0003,'t001','2023-08-23',01);
insert into t_receipt values(0006,0005,'t001','2023-08-23',01);
insert into t_receipt values(0007,0008,'t001','2023-08-23',01);
insert into t_receipt values(0008,0007,'t001','2023-08-23',01);

create table receipt_tbl(
  receipt_id varchar(20) not null primary key,
  ticket_id  varchar2(20) not null references ticket_tbl(ticket_id),
  cus_id  NUMBER(4) not null references t_customer(id),
  receipt_date date not null,
  receipt_pay varchar(20) not null,
  receipt_count number(10) not null
);

insert into receipt_tbl values('r001','t004',0001,'20230729', '현금', 2);
insert into receipt_tbl values('r002','t006',0002,'20230822', '카드', 1);
insert into receipt_tbl values('r003','t001',0003,'20230603', '카드', 4);
insert into receipt_tbl values('r004','t013',0004,'20230410', '네이버페이', 2);
insert into receipt_tbl values('r005','t015',0005,'20230808', '현금', 3);
insert into receipt_tbl values('r006','t018',0006,'20230714', '현금', 4);
insert into receipt_tbl values('r007','t015',0007,'20230723', '현금', 1);
insert into receipt_tbl values('r008','t002',0008,'20230511', '카카오페이', 2);
insert into receipt_tbl values('r009','t004',0009,'20230628', '카드', 1);
insert into receipt_tbl values('r010','t013',0010,'20230801', '카드', 2);
insert into receipt_tbl values('r011','t006',0002,'20230801', '카드', 1);
insert into receipt_tbl values('r012','t013',0004,'20230808', '현금', 1);
insert into receipt_tbl values('r013','t018',0006,'20230808', '현금', 1);
insert into receipt_tbl values('r014','t002',0008,'20230914', '카드', 1);
insert into receipt_tbl values('r015','t013',0010,'20230914', '카드', 1);

commit;

--DROP TABLE t_customer;
select * from t_customer;
select * from ticket_tbl;
select * from receipt_tbl;

--자유이용권만 보기
select 
ticket_id,
ticket_type,
TICKET_TIME_TYPE,
TICKET_AVAILABLE_TIME,
TICKET_AGE,
TICKET_PRICE 
from ticket_tbl 
where ticket_type = '자유이용권';
--성인 요금만 보기
select 
ticket_id,
ticket_type,
nvl(TICKET_TIME_TYPE,' '),
TICKET_AVAILABLE_TIME,
TICKET_AGE,
TICKET_PRICE 
from ticket_tbl 
where TICKET_AGE = '성인';
--성인만 보기
select id,name,tel,age from t_customer where age = '성인';
--나이별 회원 수 보기
select
count (age) "총 가입수",
COUNT (case when age = '성인' then 1 end) 성인,
COUNT (case when age = '청소년' then 1 end) 청소년,
COUNT (case when age = '어린이' then 1 end) 어린이
from t_customer;
--영수증
select *
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
;

select 
r.RECEIPT_ID "영수증 번호",
r.RECEIPT_DATE 구매날짜,
t.TICKET_TYPE 이용권종류,
nvl(t.TICKET_TIME_TYPE,' ') 이용시간종류,
t.TICKET_AVAILABLE_TIME 이용시간,
c.NAME 이름,
t.TICKET_AGE 나이,
t.TICKET_PRICE 금액,
r.RECEIPT_COUNT 개수,
t.TICKET_PRICE * r.RECEIPT_COUNT 총합
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
;
--230914 방문 고객찾기
select 
r.RECEIPT_ID "영수증 번호",
r.RECEIPT_DATE 구매날짜,
t.TICKET_TYPE 이용권종류,
nvl(t.TICKET_TIME_TYPE,' ') 이용시간종류,
t.TICKET_AVAILABLE_TIME 이용시간,
c.NAME 이름,
t.TICKET_AGE 나이,
t.TICKET_PRICE 금액,
r.RECEIPT_COUNT 개수,
t.TICKET_PRICE * r.RECEIPT_COUNT 총합
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
where r.RECEIPT_DATE = '20230914';
--총매출 계산
select 
nvl(t.TICKET_AGE,'총')|| '티켓 판매량' 나이,
sum (t.TICKET_PRICE * r.RECEIPT_COUNT) 총합
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
GROUP by rollup (t.TICKET_AGE);