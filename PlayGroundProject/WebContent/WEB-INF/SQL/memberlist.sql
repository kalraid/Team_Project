ALTER TABLE memberlist
	DROP
		UNIQUE (
			id
		)
		CASCADE
		KEEP INDEX;

ALTER TABLE memberlist
	DROP
		UNIQUE (
			email
		)
		CASCADE
		KEEP INDEX;

ALTER TABLE memberlist
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX UIX_memberlist;

DROP INDEX UIX_memberlist2;

DROP INDEX PK_memberlist;

/* 회원정보 */
DROP TABLE memberlist 
	CASCADE CONSTRAINTS;

/* 회원정보 */
CREATE TABLE memberlist (
	memnum NUMBER NOT NULL, /* 회원번호 */
	name VARCHAR2(8 CHAR) NOT NULL, /* 이름 */
	id VARCHAR2(16 CHAR) NOT NULL, /* 아이디 */
	password VARCHAR2(16 CHAR) NOT NULL, /* 비밀번호 */
	birthday DATE NOT NULL, /* 생년월일 */
	address VARCHAR2(30 CHAR) NOT NULL, /* 지역 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	gender VARCHAR2(6 CHAR) NOT NULL, /* 성별 */
	phone VARCHAR2(20 CHAR) NOT NULL, /* 전화번호 */
	admin VARCHAR2(6 CHAR) NOT NULL /* 회원등급 */
);

CREATE CEQUENCE memberList_seq;

COMMENT ON TABLE memberlist IS '회원정보';

COMMENT ON COLUMN memberlist.memnum IS '회원번호';

COMMENT ON COLUMN memberlist.name IS '이름';

COMMENT ON COLUMN memberlist.id IS '아이디';

COMMENT ON COLUMN memberlist.password IS '비밀번호';

COMMENT ON COLUMN memberlist.birthday IS '생년월일';

COMMENT ON COLUMN memberlist.address IS '지역';

COMMENT ON COLUMN memberlist.email IS '이메일';

COMMENT ON COLUMN memberlist.gender IS '성별';

COMMENT ON COLUMN memberlist.phone IS '전화번호';

COMMENT ON COLUMN memberlist.admin IS '회원등급';

CREATE UNIQUE INDEX PK_memberlist
	ON memberlist (
		memnum ASC
	);

CREATE UNIQUE INDEX UIX_memberlist
	ON memberlist (
		id ASC
	);

CREATE UNIQUE INDEX UIX_memberlist2
	ON memberlist (
		email ASC
	);

ALTER TABLE memberlist
	ADD
		CONSTRAINT PK_memberlist
		PRIMARY KEY (
			memnum
		);

ALTER TABLE memberlist
	ADD
		CONSTRAINT UK_memberlist
		UNIQUE (
			id
		);

ALTER TABLE memberlist
	ADD
		CONSTRAINT UK_memberlist2
		UNIQUE (
			email
		);