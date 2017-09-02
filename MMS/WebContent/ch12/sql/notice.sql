/* 공지사항 테이블 */
create table notice (
  idnum     NUMBER(5)           PRIMARY KEY,
  title        VARCHAR2(40)       NOT NULL,
  body      VARCHAR2(400)     NOT NULL,
  cdate     DATE                    DEFAULT     SYSDATE,
  hits        NUMBER(5)           NOT NULL
);

INSERT INTO notice (idnum, title, body, cdate, hits) VALUES (1, 'ComproShop이 오픈했습니다', '많은 이용 바랍니다 ', sysdate, 0);
INSERT INTO notice (idnum, title, body, cdate, hits)  VALUES (2,'카드결제시 주의사항', '카드결제시에는 보안에 철처히 ...', sysdate, 0);
