
delete from thema;
select * from thema ORDER BY THEMA_NUM;



CREATE TABLE thema (
	thema_num NUMBER NOT NULL, /* 테마번호 */
	thema_name VARCHAR2(16 CHAR) NOT NULL /* 테마이름 */
);

create sequence thema_seq;
commit;
COMMENT ON TABLE thema IS '테마';

COMMENT ON COLUMN thema.thema_num IS '테마번호';

COMMENT ON COLUMN thema.thema_name IS '테마이름';

CREATE UNIQUE INDEX PK_thema
	ON thema (
		thema_num ASC
	);

CREATE UNIQUE INDEX UIX_thema
	ON thema (
		thema_name ASC
	);

ALTER TABLE thema
	ADD
		CONSTRAINT PK_thema
		PRIMARY KEY (
			thema_num
		);

ALTER TABLE thema
	ADD
		CONSTRAINT UK_thema
		UNIQUE (
			thema_name
		);
		
select THEMA_SEQ.currval from dual;
-- 위의 currval에 나온값 -1을 아래 숫자에 집어넣고 음수화
ALTER SEQUENCE THEMA_SEQ INCREMENT BY  -30;

select THEMA_SEQ.NEXTVAL from dual;
select THEMA_SEQ.currval from dual;

ALTER SEQUENCE THEMA_SEQ INCREMENT BY 1;
commit;

insert into thema values(THEMA_SEQ.currval, '동물이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '친구랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '커피랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '밥이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '쇼핑이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '교양이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '자연이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '실내에서');
insert into thema values(THEMA_SEQ.NEXTVAL, '관광이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '여름이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '겨울이랑');
insert into thema values(THEMA_SEQ.NEXTVAL, '실외에서');
COMMIT;
select * from thema ORDER BY THEMA_NUM;