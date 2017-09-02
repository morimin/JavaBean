/* 장바구니 테이블 */
 CREATE TABLE basket (
   id			NUMBER(5)         PRIMARY KEY,
   user_id		VARCHAR2(15)     NOT NULL,
   product_id	NUMBER(7)          NOT NULL,
   qty			NUMBER(3)          NOT NULL,
   buydate		DATE                   DEFAULT  SYSDATE,
   gubun		VARCHAR2(10)     DEFAULT 'N',
   message		VARCHAR2(100),
  CONSTRAINT  basket_fk  FOREIGN KEY (user_id)
	               REFERENCES       member)
/
