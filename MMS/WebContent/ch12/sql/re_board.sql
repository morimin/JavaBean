/* 자유게시판 테이블 */
create table re_board (
   b_id		NUMBER(5)		primary key,
   b_name		VARCHAR2(10)	 	not null,
   pwd               VARCHAR2(15)		not null,
   b_email		VARCHAR2(30)		not null,  
   b_title		VARCHAR2(40)		not null,
   b_content 	VARCHAR2(1000)	not null,
   b_date		DATE			default Sysdate,
   b_hit		NUMBER(5), 
   b_ip		VARCHAR2(15),
   ref			NUMBER(5),
   step		NUMBER(5),
   anslevel		NUMBER(5));