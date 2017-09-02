/* 회원관리 테이블 */
CREATE TABLE Member (
  m_uid		VARCHAR2(15)    PRIMARY KEY,
  m_pwd		VARCHAR2(15)    NOT NULL,
  m_name		VARCHAR2(20)    NOT NULL,
  m_ssn		VARCHAR2(14)    NOT NULL,
  m_email		VARCHAR2(30),
  m_phone		VARCHAR2(13),
  m_regdate	DATE		DEFAULT SYSDATE,
  m_visit	 	NUMBER(5)	DEFAULT 0,
  m_lastvisit	DATE )
/
