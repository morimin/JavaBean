/* 묻고답하기 테이블 */
create table qna (
  qnaid	NUMBER(5)  primary key,
  title		varchar(40), 
  name	varchar(10),
  pwd 	varchar2(15),
  type	varchar(1),
  email	varchar(30),
  p_id          NUMBER(5),
  body	VARCHAR2(400),
  hits		NUMBER(5),
  cdate	date  default sysdate);

insert into qna values(1,'안녕하세요','운영자','1234','I','hncho@ync.ac.kr',1,'컴퓨터전문쇼핑몰 사이트를 오픈하였습니다.',0,sysdate);