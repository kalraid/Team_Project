CREATE TABLE Recommendgesipan(
    no NUMBER PRIMARY KEY, --번호
    id VARCHAR2(20 CHAR), -- 아이디
    people VARCHAR2(10 CHAR), -- 작성자
    linklist VARCHAR2(100 CHAR), -- 제목
    gesimul VARCHAR2(500 CHAR), -- 게시물 내용
    tablenum NUMBER, -- 게시물번호
    dbdate TIMESTAMP,-- 날짜
    good NUMBER, --조회수wlrm
    pass VARCHAR2(25 CHAR),
    File1 VARCHAR2(50 CHAR)
);
ALTER TABLE gesipan
ADD (pass VARCHAR2(25));


DESC gesipan;
ALTER TABLE gesipan
ADD (good2 NUMBER);


CREATE SEQUENCE seq_Recommendgesipan
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 100000;
  
SELECT* FROM gesipan;

INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'cksgh', '찬호','부산 여행!', '친구들이랑 부산 여행 추천 게시판에서 추천받구 갔다왔어요! 완전 개꿀!', 2 ,SYSDATE,105,'1234','?',);
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'gowls','해진', '정말 유용한 사이트!','이 사이트 정말 유용하네요! 여기서 관광지 추천받아서 혼자 여행다녀왔어요!',1,SYSDATE,94,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'rudals', '경민','휴가 후기!', '휴가 갔다온 다음날 마음이 편해졌어요! 스트레스 이제 여행으로 날리세요!',2,SYSDATE,95,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'dyd', '용','대학 여행!', '대학 동기들이랑 간단한 여행지 찾구있었는데 여기 정말 좋네요!',1,SYSDATE,70,'1234','?','?');

INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'alscjf', '민철','대구 여행!', '친구들이랑 대구 여행 추천 게시판에서 추천받구 갔다왔어요! 완전 개꿀!', 2 ,SYSDATE,150,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'gusrl','현기', '놀자! 게임!','이 사이트에 잠시 들렸는데 미니게임 도 있고  관광지 추천받아서 여행다녀왔어요!',1,SYSDATE,40,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'bono', '보노','자유여행!', '자유여행으로 여러군데 돌면서 스트레스좀 많이풀고 왔어요 사이트 추천드립니당!',2,SYSDATE,69,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'dogml', '애희','대학 여행!', '대학 동기들이랑 간단한 여행지 찾구있었는데 여기 정말 좋네요!',1,SYSDATE,78,'1234','?');

INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'niga', '공도','제주도 여행!', '친구들이랑 제주도 여행 추천 게시판에서 추천받구 갔다왔어요! 힐링 제주도 !', 2 ,SYSDATE,29,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'dnjswls','원진', '정말 유용한 사이트!','이 사이트 정말 유용하네요! 여기서 관광지 추천받아서 혼자 여행다녀왔어요!',1,SYSDATE,56,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'ckdaud', '창명','휴가 후기!', '휴가 갔다온 다음날 마음이 편해졌어요! 스트레스 이제 여행으로 날리세요!',2,SYSDATE,49,'1234','?');
INSERT INTO Recommendgesipan VALUES(seq_Recommendgesipan.NEXTVAL,'gusrb', '현규','스터디 여행!', '스터디 하는 분들이랑 같이 여행 다녀왔어요 ! 생각 이상으로 여행지 추천이 잘되있어서 좋았습니다!',1,SYSDATE,32,'1234','?');

Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,null,'kimrie','해외 풍경 좋은곳 추천','ㅇㅁㄴㅇ',1,to_timestamp('18/08/08 07:26:20.000000000','RR/MM/DD HH24:MI:SSXFF'),0,null,'114.jpg');
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'kimriesadads','ㅂㅈㄷ','ㅂㅈㄷ','ㅂㅈㄷㅈㅂㄷ',1,to_timestamp('18/08/08 07:28:10.000000000','RR/MM/DD HH24:MI:SSXFF'),0,null,null);
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'kimrie','박찬호','해외 풍경 좋은곳 추천','1231231',1,to_timestamp('18/08/08 07:28:28.000000000','RR/MM/DD HH24:MI:SSXFF'),215,'1234','115.jpg');
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'rudals','박경민','여기 가고싶다..','ㄴㅇㅎㄶㅎ',1,to_timestamp('18/08/08 07:28:40.000000000','RR/MM/DD HH24:MI:SSXFF'),474,'1234','22.jpg');
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'hejin','곽해진','잠...','풍경',1,to_timestamp('18/08/08 07:29:16.000000000','RR/MM/DD HH24:MI:SSXFF'),664,'1234','44.jpg');
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'h1234','정현용','어제 다녀온 해외여행지 추천합니다','무려 영화촬영지로도 쓰였다더라고요',1,to_timestamp('18/08/08 07:29:43.000000000','RR/MM/DD HH24:MI:SSXFF'),787,'1234','129575007_14931880312131n.jpg');
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'kimrie','박찬호','잠깐 들렸다왔던곳 추천요','여기여기',1,to_timestamp('18/08/08 07:30:15.000000000','RR/MM/DD HH24:MI:SSXFF'),315,'1234','77.jpg');
Insert into HR.RECOMMENDGESIPAN (NO,ID,PEOPLE,LINKLIST,GESIMUL,TABLENUM,DBDATE,GOOD,PASS,FILE1) values (seq_Recommendgesipan.NEXTVAL,'kimrie','박찬호','잠깐 들렸다왔던곳 추천요','여기여기',1,to_timestamp('18/08/08 07:32:26.000000000','RR/MM/DD HH24:MI:SSXFF'),245,'1234','771.jpg');
COMMIT;
COMMIT;
SELECT *    FROM gesipan order by no desc;
DROP TABLE Recommendgesipan;
DROP SEQUENCE seq_Recommendgesipan;

UPDATE gesipan SET  linklist='휴ㅏ', id='eew',pass='1234' ,people='영', dbdate=SYSDATE , good='32', gesimul='좋아ㅕㅇㄴ' WHERE no="" ;

UPDATE gesipan set good2=good2 + 1 WHERE no=;
SELECT pass FROM Recommendgesipan;