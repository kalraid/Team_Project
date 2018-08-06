CREATE TABLE gesipan(
    no NUMBER PRIMARY KEY, --번호
    id VARCHAR2(20 CHAR), -- 아이디
    people VARCHAR2(10 CHAR), -- 작성자
    linklist VARCHAR2(100 CHAR), -- 제목
    gesimul VARCHAR2(500 CHAR), -- 게시물 내용
    tablenum NUMBER, -- 테이블 번호 1 번은 일반게시판 2번은 추천게시판
    dbdate TIMESTAMP,-- 날짜
    good NUMBER, --조회수
    pass VARCHAR2(25 CHAR),
    File1 VARCHAR2(50 CHAR)
);
ALTER TABLE gesipan
ADD (pass VARCHAR2(25));


DESC gesipan;



CREATE SEQUENCE seq_gesipan
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 100000;
  
SELECT pass FROM gesipan;

INSERT INTO gesipan VALUES(seq_gesipan.NEXTVAL,'cksgh', '찬호','부산 여행!', '친구들이랑 부산 여행 추천 게시판에서 추천받구 갔다왔어요! 완전 개꿀!', 2 ,SYSDATE,105,'1234','?');
INSERT INTO gesipan VALUES(seq_gesipan.NEXTVAL,'gowls','해진', '정말 유용한 사이트!','이 사이트 정말 유용하네요! 여기서 관광지 추천받아서 혼자 여행다녀왔어요!',1,SYSDATE,94,'1234','?');
INSERT INTO gesipan VALUES(seq_gesipan.NEXTVAL,'rudals', '경민','휴가 후기!', '휴가 갔다온 다음날 마음이 편해졌어요! 스트레스 이제 여행으로 날리세요!',2,SYSDATE,95,'1234','?');
INSERT INTO gesipan VALUES(seq_gesipan.NEXTVAL,'dyd', '용','대학 여행!', '대학 동기들이랑 간단한 여행지 찾구있었는데 여기 정말 좋네요!',1,SYSDATE,78,'1234','?');
COMMIT;
SELECT *FROM gesipan;
DROP TABLE gesipan;
DROP SEQUENCE seq_gesipan;

UPDATE gesipan SET  linklist='휴ㅏ', id='eew',pass='1234' ,people='영', dbdate=SYSDATE , good='32', gesimul='좋아ㅕㅇㄴ' WHERE no="" ;




CREATE TABLE ProjectReply(
	no NUMBER(7) PRIMARY KEY,
	projectNo NUMBER(7) NOT NULL,
	projectreply VARCHAR2(500 CHAR),
	projectwriter VARCHAR2(20 CHAR) NOT NULL,
	projectdbdate TIMESTAMP NOT NULL,	
	CONSTRAINT ProjectReply_fk FOREIGN KEY(projectNo) REFERENCES gesipan(no)
);

-- 댓글 테이블의 시퀀스
DROP SEQUENCE ProjectReply_seq;
CREATE SEQUENCE ProjectReply_seq
      MAXVALUE 9999999
      INCREMENT BY 1      
      NOCACHE
      NOORDER
      NOCYCLE;


-- 댓글 데이터 추가하기 - 1번만 실행한다. --
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '항상 감사합니다.' || CHR(13) || CHR(10) || ' 땡큐!~', 'midas', '2016-05-08 13:44:32');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '저두 감사드립니다.', 'servlet', '2016-05-09 05:24:57');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '저두요~ ^_^', 'midas', '2016-05-09 09:19:23');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '나두 관심이 많은뎅~', 'servlet', '2016-05-09 11:54:45');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '헤헷~ 감사 합니다.', 'admin', '2016-05-09 12:16:51');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '아~ 다들 이 사이트가 잘되길 바라는 군요', 'midas', '2016-05-09 13:34:11');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '관리자님께서 워낙 신경을 쓰시니...' || CHR(13) || CHR(10) || '잘될 겁니다. ', 'servlet', '2016-05-09 14:03:37');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '저두 사이트 발전에 관심이 많습니다.' || CHR(13) || CHR(10) || '감사합니다.' , 'midas', '2016-05-09 14:39:29');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '와~ 대단하네요 우리 사이트~' || CHR(13) || CHR(10) || 'ㅋㅋㅋ~', 'servlet', '2016-05-09 14:41:18');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '우리 관리자님이 워낙 열심이시라~' || CHR(13) || CHR(10) || '그리고 회원님들도 열성으로 사이트에 충성 접속하시니...'|| CHR(13) || CHR(10) ||' 않될 수가 있나요...^_^', 'admin', '2016-05-09 14:52:48');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '네 맞아요~', 'admin', '2016-05-10 15:42:12');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '그렇죠 그렇고 말구요', 'servlet', '2016-05-11 15:44:57');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '항상 감사합니다.', 'midas', '2016-05-15 16:19:23');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '땡큐!~', 'servlet', '2016-05-16 17:31:45');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '저두요~ 땡큐!~', 'servlet', '2016-05-19 18:16:51');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '모두들 열성이네요~' || CHR(13) || CHR(10) || '헤헤~' || CHR(13) || CHR(10) || '땡큐!~', 'admin', '2016-05-20 10:34:11');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '땡큐~ 여기 붙어라~ ^_^', 'midas', '2016-05-20 11:33:27');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '땡큐~ 붙었어요~', 'admin', '2016-05-20 13:19:59');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 2, '당연 회원이면 관심 가져야죠~', 'servlet', '2016-06-10 13:41:17');
INSERT INTO ProjectReply(no, projectNo, projectreply, projectwriter, projectdbdate)VALUES(ProjectReply_seq.NEXTVAL, 1, '동감 합니다.' || CHR(13) || CHR(10) ||' 땡큐!~', 'midas', '2016-06-12 14:52:48');

commit;
SELECT * FROM ProjectReply;