/* �������� ���̺� */
create table notice (
  idnum     NUMBER(5)           PRIMARY KEY,
  title        VARCHAR2(40)       NOT NULL,
  body      VARCHAR2(400)     NOT NULL,
  cdate     DATE                    DEFAULT     SYSDATE,
  hits        NUMBER(5)           NOT NULL
);

INSERT INTO notice (idnum, title, body, cdate, hits) VALUES (1, 'ComproShop�� �����߽��ϴ�', '���� �̿� �ٶ��ϴ� ', sysdate, 0);
INSERT INTO notice (idnum, title, body, cdate, hits)  VALUES (2,'ī������� ���ǻ���', 'ī������ÿ��� ���ȿ� öó�� ...', sysdate, 0);
