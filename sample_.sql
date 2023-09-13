create table panmae
( p_date varchar2(8) not null,
  p_code number not null,
  p_qty  number ,
  p_total number ,
  p_store varchar2(5) ) ;
  
  insert into panmae values ('20110101',100,3,2400,'1000');
insert into panmae values ('20110101',101,5,4500,'1001');
insert into panmae values ('20110101',102,2,2000,'1003');
insert into panmae values ('20110101',103,6,5400,'1004');
insert into panmae values ('20110102',102,2,2000,'1000');
insert into panmae values ('20110102',103,5,4500,'1002');
insert into panmae values ('20110102',104,3,2400,'1002');
insert into panmae values ('20110102',105,2,3000,'1000');
insert into panmae values ('20110103',100,10,8000,'1004');
insert into panmae values ('20110103',100,2,1600,'1000');
insert into panmae values ('20110103',100,3,2400,'1001');
insert into panmae values ('20110103',101,4,3600,'1003');
insert into panmae values ('20110104',100,2,1600,'1002');
insert into panmae values ('20110104',100,4,3200,'1003');
insert into panmae values ('20110104',100,5,4000,'1004');
insert into panmae values ('20110104',101,3,2700,'1001');
insert into panmae values ('20110104',101,4,3600,'1002');
insert into panmae values ('20110104',101,3,2700,'1003');
insert into panmae values ('20110104',102,4,4000,'1001');
insert into panmae values ('20110104',102,2,2000,'1002');
insert into panmae values ('20110104',103,2,1800,'1003');


commit;

create table member_tbl_12(
m_id varchar2(5) not null primary key ,
m_pw varchar2(5) ,
m_name varchar2(10) ,
m_tel varchar2(13) ,
m_birthday date ,
m_point number(6) ,
m_grade varchar2(2)
);
commit;

insert into member_tbl_12 values ('m100' , '1234' , '������', '010-1111-2222' , '2004-01-01' , 100, '01');
insert into member_tbl_12 values ('m101' , '4444' , '����', '010-2222-3333' , '2004-01-01' , 1500, '01');
insert into member_tbl_12 values ('m102' , '5555' , '���ϳ�', '010-3333-4444' , '2004-12-10' , 2000, '02');
insert into member_tbl_12 values ('m103' , '6666' , '����ȣ', '010-4444-5555' , '2004-04-10' , 1900, '02');
insert into member_tbl_12 values ('m104' , '7777' , '�����', '010-5555-6666' , '2004-09-12' , 3000, '03');
insert into member_tbl_12 values ('m105' , '8888' , '�ִ���', '010-6666-7777' , '2004-08-10' , 4800, '03');
insert into member_tbl_12 values ('m106' , '9999' , '�̾˸�', '010-7777-8888' , '2004-07-10' , 2900, '01');
insert into member_tbl_12 values ('m107' , '0101' , '��̳�', '010-8888-9999' , '2004-06-09' , 1200, '01');
insert into member_tbl_12 values ('m108' , '0404' , '������', '010-9999-8888' , '2004-05-19' , 3000, '03');
insert into member_tbl_12 ( m_id, m_pw, m_name , m_tel , m_birthday)
values ('m109' , '0448' , '���ؼ�', '010-7878-1111' , '2004-11-27' );
insert into member_tbl_12 ( m_id, m_pw, m_name , m_tel , m_birthday)
values ('m110' , '4848' , '������', '010-8888-9090' , '2004-11-09');
commit;

create table TBLCALL_LIST
( regno number(3) not null primary key,
regtime number(10),
rddate date,
cusno varchar2(10),
startpoint varchar2(20),
destination varchar2 (20),
taxino varchar2(10),
state varchar2(1)
) ;
insert into tblcall_list values( 1,0830,'20210101','P001','���', '����' , 'T001', 'P' );
insert into tblcall_list values( 2,1210,'20210102','P002','����', '������' , 'T002', 'R' );
insert into tblcall_list values( 3,1120,'20210510','P003','����', '�λ�' , 'T003', 'P' );
insert into tblcall_list values( 4,1510,'20210520','P003','����', '����' , 'T001', 'P' );
insert into tblcall_list values( 5,1610,'20210530','P001','������', '����' , '����', 'R' );


create table tblcust(
   id varchar2(10) not null primary key,
   name varchar2(20),
   tel varchar2(20)
);

insert into tblcust values('P001','���',  '01011112222');
insert into tblcust values('P002','�̰�',  '01022223333');
insert into tblcust values('P003','�ڰ�',  '01033334444');

create table tbl_taxi(
   id varchar2(10) not null primary key,
   name varchar2(20) ,
   kind varchar2(20)
);

insert into tbl_taxi values('T001' , '���ý�' ,  '����');
insert into tbl_taxi values('T002' , '���ý�' ,  '����');
insert into tbl_taxi values('T003' , '���ý�' ,  '����');

commit;

select * from tbl_taxi;
select * from tblcust;
select * from tblcall_list;

select REGNO,REGTIME,to_char(RDDATE, 'yyyy-mm-dd'),CUSNO,STARTPOINT,DESTINATION,TAXINO,STATE from tblcall_list;

--ȣ�� ��Ȳ
select substr(c.TEL, 1, 3) || '-' || substr(c.TEL, 4, 4)  || '-' || substr(c.TEL, 8, 4),l.REGNO ,
 substr( lpad( l.REGTIME, 4, '0') , 1 ,2 )  || ':' || substr( lpad( l.REGTIME, 4, '0') , 3 ,2 ),
to_char(l.RDDATE, 'yyyy-mm-dd') ,c.NAME ,l.STARTPOINT ,l.DESTINATION ,l.TAXINO ,
decode (l.STATE ,'P','�����Ϸ�','R','�����غ�','X','��������' ) 
from tblcall_list l join tblcust c on l.CUSNO = c.ID;

create table goodstbl(
id varchar2(20) primary key,
name varchar2(40) not null,
price number(4) not null);

DROP TABLE goodstbl;

insert into goodstbl values ('c001','���̽��Ƹ޸�ī��',2000);
insert into goodstbl values ('c002','ī��Ḷ���ƶ�',3000);
insert into goodstbl values ('c003','������',2500);

SELECT * FROM goodstbl;

SELECT * FROM acorntbl;

create   table  foodtbl(
   name varchar2(20) primary key, 
   price varchar2(10)
);

insert into foodtbl values( '���İ�Ƽ', '10000');
insert into foodtbl values( '�ʹ�', '12000');
insert into foodtbl values( '���', '12000');
insert into foodtbl values( '¥����', '9000');
commit;

create   table  movietbl(
   name varchar2(20) primary key, 
   time varchar2(10)
);

insert into movietbl values( '���Ű����', '160');
insert into movietbl values( '�����', '220');
insert into movietbl values( '�����ī', '180');
insert into movietbl values( '����', '200');
insert into movietbl values( '����', '200');
commit;

SELECT * from movietbl;

-- pageSize:4�϶�  ( �� �������� 4���� ���� ���ڴ�)
-- 1 page -> 1~ 4
-- 2 page -> 5~ 8
-- 3 page -> 9~ 12
--�ѷ��ڵ�� :11��
--���������� : 11/ 4  =>3������ ( 2 +1)

--rownum �̿��ؼ� ������ ��� ��������
--rownum ���� ���ǻ���!
select * from MEMBER_TBL_11
where rownum between 1 and 4;

select * from MEMBER_TBL_11
where rownum between 5 and 8;

SELECT * from (select rownum num,m_id,m_pw,m_name 
from MEMBER_TBL_11)
where num between 5 and 8;

SELECT * from(SELECT rownum num,m_id,m_pw,m_name,m_tel,m_birthday,m_point,m_grade
from MEMBER_TBL_11) where num BETWEEN 5 and 8;

select * from acorntbl;