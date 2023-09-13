create table t_customer(
id  NUMBER(4) primary key,
name  varchar2(10)  not null ,
tel char(13) check (tel like '010-____-____') not null unique,
age varchar2(10) not null
);

INSERT into t_customer VALUES (0001,'�����','010-1111-2222','û�ҳ�');
INSERT into t_customer VALUES (0002,'ǥ����','010-2222-1111','û�ҳ�');
INSERT into t_customer VALUES (0003,'���ܾ�','010-3333-4444','����');
INSERT into t_customer VALUES (0004,'������','010-4444-3333','����');
INSERT into t_customer VALUES (0005,'������','010-5555-6666','���');
INSERT into t_customer VALUES (0006,'�̹ο�','010-6666-5555','���');
INSERT into t_customer VALUES (0007,'������','010-7777-8888','���');
INSERT into t_customer VALUES (0008,'������','010-8888-7777','����');
INSERT into t_customer VALUES (0009,'������','010-9999-0000','û�ҳ�');
INSERT into t_customer VALUES (0010,'�����','010-0000-9999','����');
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

insert into ticket_tbl values('t001','�����̿��','���ϱ�','09:00~21:00','����',50000);
insert into ticket_tbl values('t002','�����̿��','������','09:00~15:00','����',30000);
insert into ticket_tbl values('t003','�����̿��','���ı�','16:00~21:00','����',30000);

insert into ticket_tbl values('t004','�����̿��','���ϱ�','09:00~21:00','û�ҳ�',40000);
insert into ticket_tbl values('t005','�����̿��','������','09:00~15:00','û�ҳ�',20000);
insert into ticket_tbl values('t006','�����̿��','���ı�','16:00~21:00','û�ҳ�',20000);

insert into ticket_tbl values('t007','�����̿��','���ϱ�','09:00~21:00','���',25000);
insert into ticket_tbl values('t008','�����̿��','������','09:00~15:00','���',15000);
insert into ticket_tbl values('t009','�����̿��','���ı�','16:00~21:00','���',15000);

insert into ticket_tbl values('t010','5ȸ�̿��',null,'09:00~21:00','����',30000);
insert into ticket_tbl values('t011','5ȸ�̿��',null,'09:00~21:00','û�ҳ�',25000);
insert into ticket_tbl values('t012','5ȸ�̿��',null,'09:00~21:00','���',20000);

insert into ticket_tbl values('t013','3ȸ�̿��',null,'09:00~21:00','����',20000);
insert into ticket_tbl values('t014','3ȸ�̿��',null,'09:00~21:00','û�ҳ�',15000);
insert into ticket_tbl values('t015','3ȸ�̿��',null,'09:00~21:00','���',10000);

insert into ticket_tbl values('t016','1ȸ�̿��',null,'09:00~21:00','����',10000);
insert into ticket_tbl values('t017','1ȸ�̿��',null,'09:00~21:00','û�ҳ�',5000);
insert into ticket_tbl values('t018','1ȸ�̿��',null,'09:00~21:00','���',3000);
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

insert into receipt_tbl values('r001','t004',0001,'20230729', '����', 2);
insert into receipt_tbl values('r002','t006',0002,'20230822', 'ī��', 1);
insert into receipt_tbl values('r003','t001',0003,'20230603', 'ī��', 4);
insert into receipt_tbl values('r004','t013',0004,'20230410', '���̹�����', 2);
insert into receipt_tbl values('r005','t015',0005,'20230808', '����', 3);
insert into receipt_tbl values('r006','t018',0006,'20230714', '����', 4);
insert into receipt_tbl values('r007','t015',0007,'20230723', '����', 1);
insert into receipt_tbl values('r008','t002',0008,'20230511', 'īī������', 2);
insert into receipt_tbl values('r009','t004',0009,'20230628', 'ī��', 1);
insert into receipt_tbl values('r010','t013',0010,'20230801', 'ī��', 2);
insert into receipt_tbl values('r011','t006',0002,'20230801', 'ī��', 1);
insert into receipt_tbl values('r012','t013',0004,'20230808', '����', 1);
insert into receipt_tbl values('r013','t018',0006,'20230808', '����', 1);
insert into receipt_tbl values('r014','t002',0008,'20230914', 'ī��', 1);
insert into receipt_tbl values('r015','t013',0010,'20230914', 'ī��', 1);

commit;

--DROP TABLE t_customer;
select * from t_customer;
select * from ticket_tbl;
select * from receipt_tbl;

--�����̿�Ǹ� ����
select 
ticket_id,
ticket_type,
TICKET_TIME_TYPE,
TICKET_AVAILABLE_TIME,
TICKET_AGE,
TICKET_PRICE 
from ticket_tbl 
where ticket_type = '�����̿��';
--���� ��ݸ� ����
select 
ticket_id,
ticket_type,
nvl(TICKET_TIME_TYPE,' '),
TICKET_AVAILABLE_TIME,
TICKET_AGE,
TICKET_PRICE 
from ticket_tbl 
where TICKET_AGE = '����';
--���θ� ����
select id,name,tel,age from t_customer where age = '����';
--���̺� ȸ�� �� ����
select
count (age) "�� ���Լ�",
COUNT (case when age = '����' then 1 end) ����,
COUNT (case when age = 'û�ҳ�' then 1 end) û�ҳ�,
COUNT (case when age = '���' then 1 end) ���
from t_customer;
--������
select *
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
;

select 
r.RECEIPT_ID "������ ��ȣ",
r.RECEIPT_DATE ���ų�¥,
t.TICKET_TYPE �̿������,
nvl(t.TICKET_TIME_TYPE,' ') �̿�ð�����,
t.TICKET_AVAILABLE_TIME �̿�ð�,
c.NAME �̸�,
t.TICKET_AGE ����,
t.TICKET_PRICE �ݾ�,
r.RECEIPT_COUNT ����,
t.TICKET_PRICE * r.RECEIPT_COUNT ����
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
;
--230914 �湮 ��ã��
select 
r.RECEIPT_ID "������ ��ȣ",
r.RECEIPT_DATE ���ų�¥,
t.TICKET_TYPE �̿������,
nvl(t.TICKET_TIME_TYPE,' ') �̿�ð�����,
t.TICKET_AVAILABLE_TIME �̿�ð�,
c.NAME �̸�,
t.TICKET_AGE ����,
t.TICKET_PRICE �ݾ�,
r.RECEIPT_COUNT ����,
t.TICKET_PRICE * r.RECEIPT_COUNT ����
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
where r.RECEIPT_DATE = '20230914';
--�Ѹ��� ���
select 
nvl(t.TICKET_AGE,'��')|| 'Ƽ�� �Ǹŷ�' ����,
sum (t.TICKET_PRICE * r.RECEIPT_COUNT) ����
from receipt_tbl r
join t_customer c
on r.CUS_ID = c.ID
join ticket_tbl t
on r.TICKET_ID = t.TICKET_ID 
GROUP by rollup (t.TICKET_AGE);