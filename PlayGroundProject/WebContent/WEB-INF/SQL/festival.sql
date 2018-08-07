--장소 테이블 생성
drop table festival;
--drop sequence seq_fe_no;
commit;
create table festival(
    content_id number primary key,  --축제번호, festivalInfo와 fk로 연결
    fe_place varchar2(80),          -- 지역
    feImg varchar2(100),             --이미지
    title varchar2(150),             --제목
    tel varchar2(150),               --전화번호
    latitude varchar2(30),                --위도 , 연산처리시 자바에서,,
    longitude varchar2(30),               --경도
    eventStart_date date,      --시작일, 날짜별로 데이터 가져올때 연산과정을 거쳐야함
    eventEnd_date date,        --종료일
    a_code number,                  --지역 대분류 코드
    d_no number,                  --지역(구) 코드(시퀀스)
    good number                     --추천별(기본0 추천 클릭시 증가)
);

alter table festival add(sum_area varchar2(30)); -- 칼럼 추가

--지역(구)별 칼럼 데이터 추가
--서울
UPDATE festival SET sum_area='강남권' WHERE a_code=1 and (d_no=1 or d_no=2 or d_no=15 or d_no=18); 
UPDATE festival SET sum_area='강서권' WHERE a_code=1 and (d_no=4 or d_no=8 or d_no=12 or d_no=19 or d_no=20);
UPDATE festival SET sum_area='강북권' WHERE a_code=1 
and (d_no=3 or d_no=6 or d_no=9 or d_no=11 or d_no=13 or d_no=14 or d_no=16 or d_no=17 or d_no=21 or d_no=23 or d_no=24 or d_no=25);

commit;
--경기도
UPDATE festival SET sum_area='경기북부' WHERE a_code=31 
and (d_no=1 or d_no=2 or d_no=6 or d_no=8 or d_no=9 or d_no=10 or d_no=18 or d_no=21 or d_no=25 or d_no=27 or d_no=29);
UPDATE festival SET sum_area='경기서부' WHERE a_code=31 
and (d_no=3 or d_no=4 or d_no=5 or d_no=7 or d_no=11 or d_no=12 or d_no=13 or d_no=14 or d_no=15 or d_no=16 or d_no=17
or d_no=19 or d_no=20 or d_no=22 or d_no=23 or d_no=24 or d_no=26 or d_no=28 or d_no=31);

--강원도
UPDATE festival SET sum_area='철원~횡성' WHERE a_code=32 
and (d_no=2 or d_no=5 or d_no=6 or d_no=7 or d_no=10 or d_no=12 or d_no=13 or d_no=16 or d_no=17 or d_no=18);
UPDATE festival SET sum_area='평창~태백' WHERE a_code=32 
and (d_no=1 or d_no=3 or d_no=4 or d_no=8 or d_no=9 or d_no=11 or d_no=14 or d_no=15);

--페이징 처리
SELECT * FROM (SELECT ROWNUM num, content_id, fe_place, feImg, title, tel, latitude, longitude, eventStart_date,
eventEnd_date, a_code, d_no, good, sum_area FROM festival where a_code=5) WHERE num >= 1 AND num <= 20;

SELECT * FROM (SELECT ROWNUM num, content_id, fe_place, feImg, title, tel, latitude, longitude, eventStart_date,
eventEnd_date, a_code, d_no, good, sum_area FROM festival where a_code=1 and sum_area='강남권')where num >= 1 AND num <=5;

select * from festival where sum_area='철원~횡성';

--main화면 6개 뿌리기
select count(trunc(sysdate,'MM')) from festival;
select last_day(sysdate) from dual;
select content_id, eventEnd_date from(select trunc(sysdate,'MM')from dual) a, (select last_day(sysdate) from dual) b 
where trunc(eventEnd_date,'MM') between a and b;


--1차시도
select a.eventEnd_date from(select trunc(sysdate,'MM') adate, content_id, eventEnd_date from festival) a, 
(select last_day(sysdate) bdate, content_id, eventEnd_date from festival) b 
where a.content_id = b.content_id and a.eventEnd_date >= a.adate and a.eventEnd_date <= b.bdate order by a.eventEnd_date;

--2차시도 , 이번달 축제 페이지 날짜별, 인기순
select * from(SELECT ROWNUM num, a.content_id, a.fe_place, a.feImg, a.title, a.tel, a.latitude, a.longitude, a.eventStart_date,
a.eventEnd_date, a.a_code, a.d_no, a.good, a.sum_area FROM(select trunc(sysdate,'MM') adate, content_id, fe_place, feImg, title, tel, latitude, longitude, eventStart_date,
eventEnd_date, a_code, d_no, good, sum_area from festival  order by eventEnd_date, good desc) a, 
(select last_day(sysdate) bdate, content_id, eventEnd_date from festival) b 
where a.content_id = b.content_id and a.eventEnd_date >= a.adate and a.eventEnd_date <= b.bdate)
where num>=1 and num<=6;



--img, tel => null, d_no => 0 데이터 처리
insert into festival(fe_no,content_id,latitude) values(seq_fe_no.nextval,1,127.2874144269);
select * from festival where latitude is null;
select count(*)from festival;
select count(*) from festival where sum_area = '철원~횡성';
select feimg from festival where feImg is not null;




select * from festival where content_id = 141805;

select distinct a.sum_area, b.a_code from (select distinct content_id, sum_area from festival) a,(select distinct content_id, a_code from festival) b 
where a.content_id = b.content_id and a.sum_area is not null order by b.a_code;

select distinct content_id, a_code from festival;

--festival 찾을때 sum_area의 area_code로 찾기

commit;




--create sequence seq_fe_no -- 수정, 삭제 시에 시퀀스유용
--    start with 1
--    increment by 1;


-- 축제 세부 정보를 담는 테이블 필요 축제장소설명
commit;

drop table festival_info;
--contentId로 정보를 불러옴
create table festival_info( 
    content_id number primary key constraint fk_content_id references festival(content_id) on delete cascade,
    eventplace varchar2(4000),
    placeinfo clob,
    program clob,
    usetimefestival varchar2(4000)
);
-- festival_info 테이블 칼럼 타입 변경(placeinfo)
ALTER TABLE festival_info MODIFY (placeinfo CLOB);

select * from festival where a_code = 1;

--insert시 &nbsp; 문자를 치환해야함 program 넘쳐남..
SET ESCAPE ON;
SHOW ESCAPE;
commit;
--delete from festival_info where a_code = 1307813;

select count(*) from festival_info where eventplace is null;
select * from festival_info;
select * from festival_info where content_id = 1697329;


select a_code from festival order by a_code;
select count(*) from festival;
select count(distinct content_id) from festival; --중복값제거 카운트
select * from festival where latitude = null;
select distinct content_id from festival;
select count(*)from(select content_id from festival where content_id is not null); --null값 제외 조회


--create sequence seq_festival
--    start with 1
--    increment by 1;

-- 지역 테이블 생성   
drop table area_code;
drop sequence seq_place;
create sequence seq_place;
create table area_code(
    name varchar2(100),
    code number primary key
    -- 지역코드와 축제 번호 연결, 지역의 구와 연결, count한후 rownum이 가능하므로 시퀀스x
);

select * from area_code;

select * from area_district order by a_code;

-- 참조된 키로 지역 코드 조인 검색 출력
select a.code "지역코드", a.name "지역",
d.code "세부지역", d.name "구이름"
from area_district d, area_code a  where d.A_CODE = a.CODE and d.a_code = 6 and d.code = 10;

select a.code "지역코드", a.name "지역",
d.code "세부지역", d.name "구이름"
from area_district d, area_code a  where d.A_CODE = a.CODE and d.no = 10; --?

-- 축제의 지역코드와 세부지역 코드를 파라미터로 받아서 ? , ?에 넣는다.
select a.code "지역코드", a.name "지역",
d.code "세부지역", d.name "구이름"
from area_district d, area_code a  where d.A_CODE = a.CODE and d.a_code = 6
and d.code = 11;







--축제와 지역 조인후 축제에 있는 세부지역 코드로 세부지역 검색

drop table area_district ;
select * from area_district ;
select * from festival where fe_place like '%청주시%';
select count(distinct d_no) from festival where fe_place like '서울%';
select * from festival where fe_place like '%강서구%' OR FE_PLACE LIKE '%광진%' OR FE_PLACE LIKE '%동작%';
select * from area_district where name like '공주시%';
create table area_district(
    d_no number primary key,
    a_code number constraint fk_area_c_d references area_code(code) on delete cascade, --외래키로 연결
    code number, -- 지역 정보를 가지고 올때a_code와 code로 가져와야 구에 대한 정보를 가져옴
    name varchar2(30)
);
drop sequence seq_dis_no;
create sequence seq_dis_no -- 수정, 삭제 시에 시퀀스유용
    start with 1
    increment by 1;

commit;

--delete from area_code where code =1;





--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-07-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FESTIVAL_INFO
--------------------------------------------------------

  CREATE TABLE "HR"."FESTIVAL_INFO" 
   (   "CONTENT_ID" NUMBER, 
   "EVENTPLACE" VARCHAR2(4000 BYTE), 
   "PLACEINFO" CLOB, 
   "PROGRAM" CLOB, 
   "USETIMEFESTIVAL" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("PLACEINFO") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("PROGRAM") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into HR.FESTIVAL_INFO
SET DEFINE OFF;
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141805,'호반체육관','유료/ 무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141829,'태권도원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141844,'부산 영화의전당',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141863,'아르코예술극장 대ㆍ소극장, 대학로예술극장 대ㆍ소극장, 아트원씨어터 3관, 동양예술극장 3관, 유니플렉스 2관',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141865,'의정부예술의전당 및 시청 앞 광장','공연별로 상이 (홈페이지 참고)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141890,'서울 종로구 아르코예술극장 소극장 등','전화문의');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141891,'팔봉면 팔봉산 양길리 주차장 일원','입장료 무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141918,'엑스포시민광장 일원','무료 /  단 체험프로그램의 경우 소정의 참가비 있음');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141963,'대구오페라하우스 등 11개 공연장, 대구삼성창조캠퍼스 및 도시 전역','1만원 ~ 7만원 (작품별 상이)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142001,'코엑스 A,B홀, 그랜드볼룸 등','성인 10,000원, 중,고등학생 6,000원, 초등학생 및 유아 4,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487254,'영암 국제자동차경주장','[콘서트]<br />
- 1일권 : 스탠딩석(77,000원), 피크닉석(55,000원) <br />
- 2일권 : 스탠딩석(154,000원), 피크닉석(110,000원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140651,'화성행궁 신풍루','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140660,'국립민속박물관 공연홀',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140665,'한국의 집 민속극장','50,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140752,'해미읍성 일대','프로그램마다 상이');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140764,'구례군 화엄사 시설지구?공설운동장 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140788,'전쟁기념관 평화광장','입장료 : 무료, 체험 : 유·무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140799,'삼락생태공원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140816,'국제조정경기장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140820,'제주국제컨벤션센터, 제주도문예회관, 제주해변공연장, 서귀포예술의전당, 서귀포천지연폭포야외공연장외 제주도내 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140824,'축제극장몸짓, 담작은도서관','무료 (감동 후불제)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140833,'홍천읍 도시산림공원 토리숲','일부 프로그램 유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140879,'벡스코 제1전시장 3홀',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140880,'성읍민속마을','무료 (＊체험마당의 경우 소정의 체험비용 발생)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140897,'와촌면민운동장',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140907,'사우문화체육광장',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140908,'아시아출판문화정보센터 및 파주출판도시 일원','무료(부분 프로그램 유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (140962,'경포해변 중앙통로','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141015,'국립춘천박물관 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141020,'섬진마을 및 시 전역','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141028,'대전 유성문화원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141050,'미산1리 마을회관 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141060,'세종문화회관 세종체임버홀, 에술의전당 콘서트홀, 예술의전당 IBK챔버홀, 안동교회, 윤보선 고택, 한국가톨릭문화원아트센터(실비아홀)','요금 모두 다름 홈페이지 참고 <a href="http://www.seoulspring.org" target="_blank" title="서울스프링실내악축제 페이지로 이동"><font color="blue">http://www.seoulspring.org</font></a>');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141098,'의창구 북면 천주산 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141099,'비음산 포곡정 옆','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141181,'문경새재도립공원','- 1인 : 12,000원 <br />
- 커플권 : 22,000원<br />
- 3인권 : 31,000원<br />
- 4인 가족권 : 40,000원<br />
- 5인 가족권 : 49.000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141210,'봉원사','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141220,'예술의전당 한가람디자인미술관  제1,2,3 전시실','성인 10,000원, 중고생 8,000원, 어린이 5,000원, 실버관객(65세이상) 7,000원, 장애인/국가유공자 3,000원, 단체 20인 이상 3,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141234,'문화체육센터, 미니축구장, 종합운동장, 동진천 일원','무료(체험비용, 구입비용 별도)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141251,'금사 근린공원 일원(금사면 이포리 소재)',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141319,'통영국제음악당','공연에 따라 다름 (홈페이지 참고)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141363,'예술의전당 콘서트홀','R석 100,000원<br />
S석 80,000원<br />
A석 50,000원<br />
B석 30,000원<br />
휠체어 S석 80,000원<br />
휠체어 A석 50,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141370,'낙산해변, 동해신묘, 낙산사',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141375,'울산광역시 울주군 서생면 간절곶 공원 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141379,'소망의탑, 삼척해수욕장, 한치재, 원덕 임원항, 근덕 덕산항 하장 닷재, 도계 건의령','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141380,'상주 은모래비치 공연장, 망산 일출 전망대 일대',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141399,'중문색달해수욕장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141487,'쁘띠첼 씨어터','전석 45,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141546,'국립제주박물관','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141578,'남해군 서면 스포츠파크 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141582,'인제군 북면 용대3리 삼거리','무료체험 / 일부 체험행사 유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141617,'창원시 진해구 공설운동장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141641,'충남 서천군 서면 홍원항 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141647,'청풍문화마을 및 제천시 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141661,'서울 종로구 경복궁, 광화문 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141693,'마산시 진동면 광암항(진동수협 광암위판장 옆)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141703,'동래문화회관','일반 25,000원 /학생 15,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141704,'기지시줄다리기 박물관','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141731,'음성군, 음성 설성공원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141736,'서귀포시 표선면 가시리 산41 (조랑말체험공원)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141759,'서울 종로구 종묘(영녕전, 정전)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (141799,'고양시 호수공원 일원','현장권 성인 : 12,000원 특별할인(외국인 포함) : 8,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142033,'아르코예술극장 대극장·소극장, 아이들극장 외 대학로 일대','전석 20,000원 ~ 30,000원 (좌석 등급별 상이)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142064,'봉화군 봉화읍 내성천 체육공원 및 내성천일원','은어잡이 체험 10,000원(지역상품권 포함)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142069,'축제극장, 돌담극장, 무지개극장, 키프스테이지, 거창문화원 상살미홀','- 일반 : 정가 15,000원, 조기예매 13,000원<br />
- 학생(고등학생 이하) : 정가 10,000원, 조기예매 8,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142080,'시내 주요 5개 해수욕장(해운대, 광안리, 다대포, 송도, 송정)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142086,'부천시청 잔디광장·어울마당·판타스틱큐브, 한국만화박물관, 송내어울마당 솔안아트홀, CGV부천, CGV소풍, 부천시청 앞 잔디광장','* 홈페이지 안내 참고');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142092,'이호테우해변 일원(구. 이호해수욕장)',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142094,'제주시 해변공연장','공연마다 다름');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142095,'오성금 선착장 앞','유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142099,'해운대해변 특설무대,영화의전당 하늘연극장',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142105,'경남 진주시 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142186,'농다리 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142191,'영동체육관일원, 와인코리아, 농촌체험마을 등','체험프로그램마다 다름');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142193,'서울월드컵경기장','일일권 30,000원, 전일권80,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142197,'시흥갯골생태공원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142204,'경상남도 진주시 일대',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (142228,'강원 태백시 구와우마을',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (228985,'코엑스 Hall A & B1','[현장]<br />
- 20세이상 : 5,000원<br />
- 20세미만 : 3,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (229048,'동래문화회관, 읍성광장, 온천천(세병교) 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (229054,'계룡대 비상활주로 일대','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (232325,'강원도 횡성군 횡성읍 섬강둔치 일원','무료입장');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (234232,'사천비행장 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (234235,'단양군 영춘면 온달관광지',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (235076,'광안리해수욕장','무료 (일부 유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292816,'양제동 aT센터 2전시관','홈페이지 참고');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292835,'동강둔치, 장릉, 영월읍 일원','무료 / 부분적 유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292843,'산벚꽃마을 오토캠핑장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292938,'남대천 단오제','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292950,'광주 남구 고싸움놀이테마파크',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292961,'서울 덕수궁 대한문','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292977,'기장군 기장읍 대변항 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292989,'운현궁 앞마당',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (292999,'벡스코','성인 : 9천원 / 학생 : 6천원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (293030,'안성남사당공연장','일반 성인 10,000원 중고등학생 5,000원 어린이 2,000');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (293034,'전주시 일원(국립무형유산원, 전주경기전광장, 한옥마을 일원)',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (293084,'충북 영동 - 영동 하상주차장 일원, 난계사 등','무료(일부체험 유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (293094,'강원도 화천군 붕어섬 일원','체험프로그램마다 다름 홈페이지 참고하기 <a href="http://www.narafestival.com">http://www.narafestival.com</a>');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (293232,'전북 익산시 주얼팰리스',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (293475,'칠갑산 장승공원일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (324460,'삼천포대교','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (386053,'강원 평창군 진부면 오대천 일원 (진부시외버스터미널 앞)','얼음낚시 13,000원 / 맨손잡기 15,000원 /놀이시설 6,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (391562,'시민의 종 타종식 : 용두산공원, 해맞이행사 : 해운대해수욕장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (391883,'평창군 대관령면 송천 일원','- 눈조각공원 평일 : 2,000원(23일~25일만 적용)<br>
 - 눈썰매, 얼음미끄럼틀 평일 5,000원 / 주말 6,000원 / 최대 6회<br> - 종합권 (눈꽃주화 포함) 평일 13,000원 / 주말 15,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (406547,'대학로 두레홀 3관','30,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (406696,'성남아트센터 콘서트홀','전석 25,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (406745,'명동난타극장 (구.명동아트센터)','프리미엄석 70,000원  <br />
VIP석 60,000원<br />
S석 50,000원<br />
A석 40,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (406912,'태백산국립공원, 황지연못, 365세이프타운 등 시내일원','무료(각종 유료체험은 별도 요금있음)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (409187,'충남 홍성군 남당항 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (482133,'휴애리자연생활공원','- 성인:11,000원/단체8,000원/도민:6,000원/장애우,유공자,경로우대:7,000원<br>
- 청소년:9,000원/단체:7,000원/도민:5,000원/장애우:6,000원<br>
- 어린이:8,000원/단체:6,000원/도민:4,000원/장애우:5,000원<br>
- 단체는 30인 이상(학생단체(수학여행)등 방문 시 별도 문의 요망)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506295,'경상북도 문경새재 오픈세트장','유료 (자세한 이용요금 안내는 홈페이지 참조)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506376,'강경포구, 젓갈시장, 젓갈전시관 일대',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506378,'강진군 대구면 고려청자요지 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506386,'대가야역사테마관광지, 대가야읍 일원','체험마다 다름(무료/유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506398,'전남 구례군 지리산온천관광단지 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506465,'금산인삼관 광장 및 인삼약초거리 일원','프로그램마다 상이(무료/유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506473,'남원시 광한루원 및 요천 일원 등','유료 (성인 : 3000원, 청소년 : 2000원, 초등학생 : 1500원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506480,'담양 죽녹원, 관방제림 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506516,'대구광역시 중구 약령시 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506523,'무주군 일원 (마을로가는축제장, 축제주제관(예체문화관), 전통공예문화촌, 지남공원, 남대천, 반디랜드 등)',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506534,'대천해수욕장 및 시내 일원','[일반존]<br />
- 성인(20세~64세) : 월~목 12,000원, 금~일 14,000원<br />
- 청소년(11세~19세) : 월~목 10,000원, 금~일 12,000원<br /><br />

[단체(20인이상)]<br />
- 성인 : 월~목 11,000원, 금~일 13,000원<br /> 
- 청소년 : 월~목 9,000원, 금~일 11,000원 <br /><br />

[패밀리존]<br />
- 보호자 : 월~목 4,000원, 금~일 6,000원<br /> 
- 어린이(만3세 이상~10세 이하) : 월~목 9,000원, 금~일 11,000원<br /> 
- 만 3세 이하 (보호자 동반시 입장가능) : 무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506544,'봉화읍 체육공원, 관내 송이산 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506545,'부산 수영구 광안리해수욕장 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506600,'산청IC 입구 축제광장(부행사장 동의보감촌)','홈페이지 참고');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506616,'서귀포 자구리공원 및 칠십리음식특화거리 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506647,'온양온천역 광장 및 시내일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506670,'탈춤공원, 문화의 거리 등 안동시내 일원','입장료 무료 / 탈춤공연장 성인 7,000원 / 학생경로 5,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506690,'안성맞춤랜드, 안성시내 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506708,'남대천 둔치 및 양양시장, 송이밸리자연휴양림',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506766,'영주시 풍기읍 남원천 둔치',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506774,'울산광역시 울주군 온양읍 외고산 옹기마을 일원','체험별 가격다름');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506788,'원주 한지테마파크 일원','유료/무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506797,'이천 설봉공원 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506838,'한국전통문화전당, 한지산업지원센터',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506895,'정선읍 아라리공원 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506909,'진도군 고군면 회동리','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506926,'진주남강, 진주성 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506935,'천안삼거리공원 및 천안시내 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (506942,'춘천 중앙로, 축제극장 몸짓, 춘천문학공원, 춘천수변공원, KT&G 상상마당 야외무대',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507362,'임진각광장 및 평화누리 일대','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507383,'하동군 화개면, 악양면(차문화센터 일원)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507454,'문화마당 및 병선마당, 통제영, 이순신공원 등 통영시 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507480,'충남 서천군 한산모시관 일원','무료 / 일부 체험 프로그램 유료 운영');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507531,'올림픽공원 일대','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507598,'함평엑스포공원, 생태습지, 화양근린공원','어른 : 7,000원 단체어른 6,000원<br>
 청소년,군인 : 5,000원 단체 청소년,군인 4,000원<br>
 어린이,노인,유치원생 : 3,000원 단체 어린이,노인,유치원 2,000원<br>
 <br>※ 단체 20인이상 적용');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507599,'강원도 화천군 화천천 및 3개읍면 일원','행사 홈페이지 참고<a href="http://www.narafestival.com" target="_blank" title="새창: 산천어 축제 홈페이지로 이동"><font color="blue">http://www.narafestival.com</font></a>');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (507635,'평창군 봉평면 문화마을 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (511801,'고창군 공음면 학원관광농원 일원','체험마다 상이(무료/유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (513291,'세종문화회관 미술관, 광화문 광장, 서울메트로 미술관','관람료는 각기 다르므로 홈페이지 참조');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (513326,'안산문화광장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (523079,'중원로터리 및 진해 일대','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (525249,'제주시 전농로, 애월 장전리','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (525292,'논산천 둔치 및 딸기밭',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2469114,'백학저수지내','성인10,000원 어린이5,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2469685,'백동낚시터','5,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2469849,'안산문화예술의전당','- 공연마다 상이<br />
- 시민 참여 프로그램 무료<br />
- 자세한 요금안내는 홈페이지 참고 https://www.gart.go.kr');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2471936,'경기도 양주시 백석읍 연곡리 연곡저수지 전체','중학생~성인 17,000 원, 6세~초등학생 13,000 원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2476859,'국립전주박물관',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2478421,'청호동 일원','무료 및 유료체험');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2479291,'신천둔치 종합생활체육광장(중동교~상동교 사이)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2479624,'AT Center 한국농수산식품유통공사','8,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2479634,'한국농수산식품유통공사 AT Center','8,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2481445,'안성팜랜드','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2481950,'코엑스','성인 11,000원 / 어린이, 청소년 7,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2482083,'대전예술의전당 / 대전시립연정국악원','경연공연 관람비용 20,000');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2484237,'부산대 지하철역 아래 온천천 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2484272,'에덴벚꽃길 경내 야외무대 앞','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2484871,'산청군 차황면 법평리 1-2',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485123,'순천시 중앙사거리 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485128,'보문수상공연장, 동부사적지 및 보문관광단지 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485661,'마포구 일대(서울 양화나루와 잠두봉유적(사적 제399호), 잠두봉선착장, 당인리발전소, 밤섬,선유도)','뱃길탐방 프로그램: 1인 5,000원, 특별프로그램 선상인문학 1인 30,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485730,'태화루 및 태화마당','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485750,'오죽헌시립박물관 야외공연장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485814,'나주 금성관','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2485816,'화계장터, 최참판댁','- 화개장터 : 입장무료<br />
- 최참판댁 : 성인 2,000원 / 청소년,군인 1,500원 / 어린이 1,000원<br />
20인이상 성인 1,500원 / 청소년,군인1,000원 / 어린이 500원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2486075,'정읍천변 어린이축구장 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2486339,'63빌딩 야외주차장 및 한강공원','유료무대 (일반 55,000원 /VIP 550,000원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487188,'국회 잔디마당','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487211,'수원 화성행궁 신풍루 및 수원화성일원','무료 (만들기체험 3,000원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2524209,'서울특별시 보신각일대','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2524325,'롯데월드타워 및 석촌호수 일대','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2525596,'두창저수지','입장료 5,000원 (7세이상부터)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2525631,'왕송호수공원 잔디광장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2525641,'강원도 고성 삼포해수욕장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2527541,'남이섬 일대','본 축제는 남이섬 입장 시 무료로 참가할 수 있으며, 자세한 내용과 문의는 남이섬 홈페이지(www.namisum.com)에서 확인할 수 있다.');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2529683,'용산역 - 태화강역 - 장생포 고래문화마을','기차 : 119,000원, 비행기 : 129,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2530389,'동대문디자인플라자(DDP) 크레아 오픈라운지','사전등록/현장등록 모두 무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2530829,'벡스코 제 1전시장 및 수영만 요트경기장',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2531393,'치악체육관, 치악체육관 옆 야외돔공연장, 치악예술관','-&nbsp;윈터 댄싱카니발+미니콘서트 : 지정석 20,000원 / 자유석 10,000원<br>
-&nbsp;Olym "Pop" 페스티벌, 윈터 프린지 페스티벌, 하늘 빛 공원길 LED 전시 (예정) : 무료<br>
-&nbsp;유키 구라모토 신년 콘서트 : S석 55,000원 R석 65,000원<br>
-&nbsp;브레이크 아웃 : 20,000만원<br>
 - 전시체험전 &lt;반쪽이의 상상력 박물관 展&gt; : 일반 5,000원 단체 3,000원<br>-&nbsp;전시체험공연 &lt;앤서니 브라운 - 체험뮤지컬 신비한 놀이터&gt; : 28,000원 단체 20,000원<br>');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2531480,'삼척시청(시민회의장), 삼척체육관','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2531702,'공주산성시장 문화공원','무료<br />
단, 체험프로그램의 경우 소정의 참가비 있음');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2533801,'구좌종합운동장','Full코스/Half코스 30,000원, 10km/워킹(10km) 20,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2534521,'삼척이사부광장','무료입장(단, 대게낚시체험 참가비10,000원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2535005,'청와대 사랑채','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2535565,'서울대공원 동물원 정문광장','동물원 입장요금 (성인 5,000원, 청소넌 3,000원, 어린이 2,000원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2535837,'광교호수공원 재미난밭','1인 참가기부금 10,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2536122,'부산광역시 강서구 대저생태공원 및 강서 30리 벚꽃길 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2536198,'강원도 강릉시 경포호 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2536292,'정선 아라리촌',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2536658,'광명동굴 라스코관','어른 10,000원, 군인 및 청소년 7,000원, 어린이 5,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2536676,'네이처월드','성인:9,000원, 청소년 및 단체:7,000원, 경로 및 단체:8,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2537151,'육거리종합시장 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2537208,'건설회관 2F 대강당','R석 110,000원 S석 70,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2538813,'대관령 눈꽃축제장 內','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541254,'디아크문화관 내외',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541370,'경기도 여주시 흥천면 귀백리 38-8번지 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541413,'서울숲 공원 가족마당','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541419,'서대문구 안산 내 연희숲속쉼터 공연장','음악회 무료 (아트마켓 구매, 체험 유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541578,'강원도 고성 삼포해수욕장',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541633,'화암동굴 앞 주차장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541644,'아리랑힐 고개','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541699,'언더스탠드에비뉴 야외광장','무료입장 , 원데이 클래스 유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541883,'강릉대도호부관아','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2542453,'신세계사이먼 부산 프리미엄 아울렛','별도 이용요금 없음');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2542885,'부산문화회관','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2542948,'광화문광장 중앙광장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2543129,'언더스탠드에비뉴 야외광장','무료입장');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2543657,'킨텍스 제2전시장 10홀','[입장료]<br />
- 어린이(초등생 이하) : 무료<br />
- 일반(중학생~성인) : 사전등록시 무료 (현장구매 5,000원)<br /><br /> 
[드림놀이터(놀이체험) 이용권]<br />
- 어린이(초등생 이하) : 12,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2543724,'명주예술마당, 작은공연장 단, 강릉대도호부관아','[사전예매(7월)]<br />
- 1일 관람권 : 10,000원 (1인기준/최대 4편 관람 가능)<br />
- 단체 관람권 : 5,000원 (36개월 이상 20인기준/1편기준)<br /><br />
[현장구입(8월)]<br />
- 오전·오후 관람권 : 8,000원 (1인기준/최대 2편 관람 가능)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2543818,'마로산성(사적 제492호)/광양시사라실예술촌(광양읍 사곡로 201)','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2543846,'거제종합운동장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2543970,'이월드, 83타워 전역','[종일 자유이용권]<br />
- 어른 : 39,000원<br />
- 청소년 : 34,000원<br />
- 어린이 : 29,000원<br /><br />
[야간 자유이용권]<br />
- 어른 : 25,000원<br />
- 청소년/어린이 : 23,000원<br /><br />
자세한 내용은 홈페이지 참고');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2538865,'강릉 올림픽파크 내 코리아하우스 1층 한국홍보관','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2539150,'송도컨벤시아','현장 등록시 5,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2539197,'춘천 백령문화관, 강릉 하키센터, 강릉 아트센터, 강릉 해람문화관, 평창 용평리조트','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2539330,'서울 사직단내 단군성전','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2539468,'목포시 목포문화예술회관 · 진도군 운림산방 일원','보통권 : 10,000원(사전판매 8,000원) ~8.20 까지<br />
특별권 : 4,000원<br />
단체할인권 : 8,000원<br />
* 상세요금 홈페이지 참고');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2539802,'홍천 도시산림공원 토리숲','입장료 무료 (맥주, 안주 유료)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2539810,'법성면 뉴타운 일원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2540000,'SETEC (세택)','현장등록 5,000원');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2540031,'광화문광장 북측광장','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2540280,'진도개 테마파크','입장료 무료 (썰매장, 동물농장, 홍보관, 경기장), 체험 프로그램 무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2540520,'양재천 벚꽃길, 수변무대, 칸트의 산책길, 연인의 거리, 넝쿨장미터널 등','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2540900,'송도 펜타포트(송도달빛축제공원)','참가기부금 : 3만원 / 1인');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2540959,'부여향교 정림사지 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2541119,'제주4·3평화기념관',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487791,'DDP(동대문 디자인 플라자) 미래로','참가단체 외 없음');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487911,'서울 월드컵공원 평화광장','마라톤(10km 3만원, 5km 2만5천원), 걷기(4.5km 1만5천원)');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487926,'장성역~장성공원','무료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2487990,'5.18민주광장, 문화전당하늘정원, 금남로 일대 등','일부 유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2488086,'서구청 앞 샘머리공원 및 보라매공원 일원',null);
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2488259,'강원도 고성군 현내면 대진항 일원','무료, 일부체험 유료');
Insert into HR.FESTIVAL_INFO (CONTENT_ID,EVENTPLACE,USETIMEFESTIVAL) values (2488757,'청산체육공원 일원','무료(일부 체험 행사 유료)');



--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-07-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FESTIVAL
--------------------------------------------------------

  CREATE TABLE "HR"."FESTIVAL" 
   (   "CONTENT_ID" NUMBER, 
   "FE_PLACE" VARCHAR2(80 BYTE), 
   "FEIMG" VARCHAR2(100 BYTE), 
   "TITLE" VARCHAR2(150 BYTE), 
   "TEL" VARCHAR2(150 BYTE), 
   "LATITUDE" VARCHAR2(30 BYTE), 
   "LONGITUDE" VARCHAR2(30 BYTE), 
   "EVENTSTART_DATE" DATE, 
   "EVENTEND_DATE" DATE, 
   "A_CODE" NUMBER, 
   "D_NO" NUMBER, 
   "GOOD" NUMBER, 
   "SUM_AREA" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.FESTIVAL
SET DEFINE OFF;
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2028440,'서울특별시 영등포구 여의동로 330','http://tong.visitkorea.or.kr/cms/resource/53/2376253_image2_1.jpg','서울 밤도깨비 야시장 2018','070-8230-8911','126.9335762507','37.5263358907',to_date('18/03/30','RR/MM/DD'),to_date('18/10/28','RR/MM/DD'),1,20,752367,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (525755,'서울특별시 영등포구 여의서로','http://tong.visitkorea.or.kr/cms/resource/52/1607952_image2_1.jpg','영등포여의도봄꽃축제 2018','02-2670-3114','126.9141334174','37.5320321034',to_date('18/04/07','RR/MM/DD'),to_date('18/04/12','RR/MM/DD'),1,20,744070,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1291408,'서울특별시 종로구 율곡로 99','http://tong.visitkorea.or.kr/cms/resource/58/980658_image2_1.jpg','창덕궁 달빛기행 2018','02-2270-1243','126.9901029261','37.5796251553',to_date('18/04/05','RR/MM/DD'),to_date('18/10/28','RR/MM/DD'),1,23,639311,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1592898,'서울특별시 송파구 잠실로 148','http://tong.visitkorea.or.kr/cms/resource/72/1607872_image2_1.jpg','석촌호수 벚꽃축제 2018','송파구청 02-2147-2800','127.1017724761','37.5111851145',to_date('18/04/05','RR/MM/DD'),to_date('18/04/13','RR/MM/DD'),1,18,360079,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1426106,'서울특별시 강남구 남부순환로 3104','http://tong.visitkorea.or.kr/cms/resource/72/2551772_image2_1.JPG','서울 코믹월드 2018','02-3142-2137','127.0719422966','37.4956752670',to_date('18/07/21','RR/MM/DD'),to_date('18/07/22','RR/MM/DD'),1,1,222750,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2376250,'서울특별시 강남구 남부순환로 3104','http://tong.visitkorea.or.kr/cms/resource/19/2548019_image2_1.jpg','서울디저트페어-수박전 2018','02-6010-8941','127.0719422966','37.4956752670',to_date('18/07/14','RR/MM/DD'),to_date('18/07/15','RR/MM/DD'),1,1,196093,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (228985,'서울특별시 강남구 영동대로 513','http://tong.visitkorea.or.kr/cms/resource/10/2540710_image2_1.JPG','서울국제도서전 2018','070-5221-0333','127.0591874466','37.5117592813',to_date('18/06/20','RR/MM/DD'),to_date('18/06/24','RR/MM/DD'),1,1,164040,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2002493,'서울특별시 중랑구 중랑천로 332','http://tong.visitkorea.or.kr/cms/resource/69/2539969_image2_1.JPG','서울장미축제 2018','02-2094-1820','127.0735276696','37.6143448429',to_date('18/05/18','RR/MM/DD'),to_date('18/05/20','RR/MM/DD'),1,25,142542,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2016706,'서울특별시 여의도한강공원 등','http://tong.visitkorea.or.kr/cms/resource/79/2549879_image2_1.jpg','한강몽땅 여름축제 2018','주)02-120, 야)02-9780-0597~8','126.9335762510','37.5263247807',to_date('18/07/20','RR/MM/DD'),to_date('18/08/19','RR/MM/DD'),1,20,135546,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (531460,'서울특별시 종로구 우정국로 55','http://tong.visitkorea.or.kr/cms/resource/82/2553482_image2_1.jpg','연등회 2019','02-2011-1744∼8','126.9815038890','37.5733035136',to_date('19/05/03','RR/MM/DD'),to_date('19/05/05','RR/MM/DD'),1,23,127593,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1984983,'서울특별시 강남구 영동대로 513','http://tong.visitkorea.or.kr/cms/resource/54/2543754_image2_1.jpg','C-Festival (씨페스티벌) 2018','02-6000-8121','127.0591874466','37.5117592813',to_date('18/05/02','RR/MM/DD'),to_date('18/05/06','RR/MM/DD'),1,1,107574,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2050213,'서울특별시 중구 청계천로 8','http://tong.visitkorea.or.kr/cms/resource/28/2523328_image2_1.jpg','서울 크리스마스 페스티벌 2017','02-904-1159','126.9786237137','37.5691261697',to_date('17/12/09','RR/MM/DD'),to_date('18/01/02','RR/MM/DD'),1,24,89123,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (593570,'서울특별시 종로구 돈화문로 13','http://tong.visitkorea.or.kr/cms/resource/01/2038001_image2_1.jpg','페인터즈: 히어로','02-766-7848','126.9916475119','37.5696846720',to_date('16/01/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,23,83342,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (698886,'서울특별시 서초구 남부순환로 2364','http://tong.visitkorea.or.kr/cms/resource/00/2361000_image2_1.jpg','토요명품공연 2018','02-580-3300','127.0097651306','37.4776567975',to_date('18/01/06','RR/MM/DD'),to_date('18/12/29','RR/MM/DD'),1,15,76545,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (675103,'서울특별시 중구 마른내로 47','http://tong.visitkorea.or.kr/cms/resource/50/2031050_image2_1.jpg','점프','02-722-3995','126.9931947344','37.5646963903',to_date('15/06/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,24,69346,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2496910,'서울특별시 중구 퇴계로34길 28','http://tong.visitkorea.or.kr/cms/resource/60/2546960_image2_1.jpg','1890 남산골야시장 2018','02-2261-0517','126.9935365470','37.5584387906',to_date('18/05/05','RR/MM/DD'),to_date('18/10/27','RR/MM/DD'),1,24,68178,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1998564,'서울특별시 종로구 사직로 161','http://tong.visitkorea.or.kr/cms/resource/40/2487640_image2_1.JPG','궁중문화축전 2018','한국문화재재단 02-2270-1235','126.9769930325','37.5788222356',to_date('18/04/28','RR/MM/DD'),to_date('18/05/06','RR/MM/DD'),1,23,64714,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (650452,'서울특별시 송파구 올림픽로 240','http://tong.visitkorea.or.kr/cms/resource/69/2438669_image2_1.JPG','롯데월드 크리스마스 미라클 2017','02-411-2000','127.0979394903','37.5112294847',to_date('17/11/11','RR/MM/DD'),to_date('17/12/31','RR/MM/DD'),1,18,62819,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1284561,'서울특별시 종로구 대학로12길 22','http://tong.visitkorea.or.kr/cms/resource/34/2037934_image2_1.jpg','연극 라이어 (대학로)','02-3210-0082','127.0030794397','37.5824917217',to_date('17/12/01','RR/MM/DD'),to_date('17/12/31','RR/MM/DD'),1,23,58997,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2005233,'서울특별시 중구 정동','http://tong.visitkorea.or.kr/cms/resource/90/2543790_image2_1.jpg','정동야행(貞洞夜行,Jeong-Dong Culture Night) 2018','02.3396-4613','126.9748047119','37.5657876002',to_date('18/05/11','RR/MM/DD'),to_date('18/05/12','RR/MM/DD'),1,24,56949,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1307813,'서울특별시 강동구 올림픽로 875','http://tong.visitkorea.or.kr/cms/resource/61/2541361_image2_1.JPG','강동선사문화축제 2018','02-3425-5246','127.1303240272','37.5606243328',to_date('18/10/12','RR/MM/DD'),to_date('18/10/14','RR/MM/DD'),1,2,53146,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (140788,'서울특별시 용산구 이태원로 29','http://tong.visitkorea.or.kr/cms/resource/26/2490626_image2_1.JPG','전쟁기념관 어린이날 문화축제 2018','전쟁기념관 교육홍보부 홍보팀 문화이벤트담당 02-709-3108','126.9784385198','37.5373270838',to_date('18/05/05','RR/MM/DD'),to_date('18/05/05','RR/MM/DD'),1,21,51178,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1269314,'서울특별시 서초구 신반포로11길 40','http://tong.visitkorea.or.kr/cms/resource/49/755649_image2_1.jpg','한강 서래섬 유채꽃축제 2018','02-120','126.9899327466','37.5079779213',to_date('18/05/12','RR/MM/DD'),to_date('18/05/13','RR/MM/DD'),1,15,50902,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (507531,'서울특별시 송파구 올림픽로 424','http://tong.visitkorea.or.kr/cms/resource/20/2549420_image2_1.JPG','한성백제문화제 2018','02-2147-2800','127.1224425827','37.5194456386',to_date('18/10/11','RR/MM/DD'),to_date('18/10/14','RR/MM/DD'),1,18,50668,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (142193,'서울특별시 마포구 월드컵로 240','http://tong.visitkorea.or.kr/cms/resource/50/2550250_image2_1.jpg','서울프린지페스티벌 2018','02-325-8150','126.8990115045','37.5699440931',to_date('18/08/15','RR/MM/DD'),to_date('18/08/18','RR/MM/DD'),1,13,48958,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2426733,'서울특별시 중구 세종대로 39','http://tong.visitkorea.or.kr/cms/resource/31/2551431_image2_1.jpg','코리아세일페스타 (Korea Sale FESTA) 2018',null,'126.9715752','37.5606749',to_date('18/09/28','RR/MM/DD'),to_date('18/10/07','RR/MM/DD'),1,24,48751,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1014398,'서울특별시 종로구 대학로10길 24','http://tong.visitkorea.or.kr/cms/resource/10/2035910_image2_1.jpg','옥탑방고양이','02-764-8760','127.0035183141','37.5815918348',to_date('10/04/06','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,23,48391,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1574637,'서울특별시 광진구 능동로 216','http://tong.visitkorea.or.kr/cms/resource/80/2541380_image2_1.JPG','서울동화축제 2018','02-450-7596','127.0809066088','37.5498913551',to_date('18/05/04','RR/MM/DD'),to_date('18/05/06','RR/MM/DD'),1,6,46402,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2392010,'서울특별시 영등포구 여의도동 85','http://tong.visitkorea.or.kr/cms/resource/00/2552400_image2_1.jpg','생명사랑 밤길걷기-해질녘서 동 틀때 까지 2018','02-745-9080','126.9335762510','37.5263247807',to_date('18/09/07','RR/MM/DD'),to_date('18/09/08','RR/MM/DD'),1,20,46368,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2373224,'서울특별시 서초구 강남대로 27','http://tong.visitkorea.or.kr/cms/resource/34/2531334_image2_1.JPG','대한민국 국제요리&제과경연대회 2018','02-802-7666','127.0396016001','37.4672141004',to_date('18/05/17','RR/MM/DD'),to_date('18/05/20','RR/MM/DD'),1,15,45180,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (513291,'서울특별시 종로구 세종대로 175','http://tong.visitkorea.or.kr/cms/resource/90/2037790_image2_1.jpg','광화문국제아트페스티벌 2018','02-723-9484~7','126.9768376800','37.5721757834',to_date('18/04/19','RR/MM/DD'),to_date('18/05/27','RR/MM/DD'),1,23,44858,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (406745,'서울특별시 중구 명동길 26','http://tong.visitkorea.or.kr/cms/resource/86/2034286_image2_1.jpg','난타 (명동)','02-739-8288','126.9837456304','37.5634463660',to_date('16/01/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,24,44062,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1801281,'서울특별시 성동구 응봉동 응봉산','http://tong.visitkorea.or.kr/cms/resource/92/1257992_image2_1.jpg','응봉산 개나리축제 2018','성동구청 문화체육과:02-2286-5202','127.0281837123','37.5470685122',to_date('18/04/06','RR/MM/DD'),to_date('18/04/08','RR/MM/DD'),1,16,42929,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2501785,'서울특별시 중구 퇴계로34길 28','http://tong.visitkorea.or.kr/cms/resource/82/2501782_image2_1.jpg','남산골 바캉스 2018','070-4468-9873','126.9935365470','37.5584387906',to_date('18/07/03','RR/MM/DD'),to_date('18/09/30','RR/MM/DD'),1,24,6270,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2490543,'서울특별시 서대문구 이화여대5길 16','http://tong.visitkorea.or.kr/cms/resource/92/2549592_image2_1.jpg','대한민국 예술대장정 2018','010-2741-4563','126.9447743238','37.5584379163',to_date('18/07/01','RR/MM/DD'),to_date('18/07/08','RR/MM/DD'),1,14,6014,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2381938,'서울특별시 강남구 영동대로 513','http://tong.visitkorea.or.kr/cms/resource/99/2523099_image2_1.jpg','K-핸드메이드페어 2018','02-761-2512','127.0591318945','37.5118092746',to_date('18/11/01','RR/MM/DD'),to_date('18/11/04','RR/MM/DD'),1,1,5984,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2446566,'서울특별시 중구 퇴계로34길 28','http://tong.visitkorea.or.kr/cms/resource/54/2551254_image2_1.jpg','남산골 태권도 상설공연 2018','㈜세상기록 02-6674-4303','126.9935365470','37.5584387906',to_date('18/05/04','RR/MM/DD'),to_date('18/10/31','RR/MM/DD'),1,24,5953,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2540520,'서울특별시 서초구 양재동 양재천 영동1교~영동2교 구간','http://tong.visitkorea.or.kr/cms/resource/14/2540714_image2_1.jpg','양재천 벚꽃 등(燈) 축제 2018','02-2155-8607~9','127.0369572323','37.4730133801',to_date('18/04/12','RR/MM/DD'),to_date('18/04/13','RR/MM/DD'),1,15,5820,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2029539,'서울특별시 광진구 능동로 216','http://tong.visitkorea.or.kr/cms/resource/46/1947046_image2_1.jpg','실버문화 페스티벌 2018','02-704-2311~3','127.0809066088','37.5498913551',to_date('18/09/08','RR/MM/DD'),to_date('18/09/11','RR/MM/DD'),1,6,5710,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2499947,'서울특별시 성북구 종암로5길 14','http://tong.visitkorea.or.kr/cms/resource/73/2554373_image2_1.JPG','성북문화바캉스 2018','02-6906-9271','127.0345539967','37.5949075114',to_date('18/08/03','RR/MM/DD'),to_date('18/08/11','RR/MM/DD'),1,17,5208,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (142001,'서울특별시 강남구 영동대로 513','http://tong.visitkorea.or.kr/cms/resource/48/1829648_image2_1.jpg','캐릭터 라이선싱 페어 2018','02-6000-8570~1','127.0591874466','37.5117592813',to_date('18/07/18','RR/MM/DD'),to_date('18/07/22','RR/MM/DD'),1,1,5183,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2495737,'서울특별시 서대문구 연세로','http://tong.visitkorea.or.kr/cms/resource/30/2551530_image2_1.jpg','프랑스 거리음악 축제 2018','02-330-1364','126.9365417894','37.5567240792',to_date('18/06/23','RR/MM/DD'),to_date('18/06/24','RR/MM/DD'),1,14,5115,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2385582,'서울특별시 용산구 이태원로 29','http://tong.visitkorea.or.kr/cms/resource/82/2494782_image2_1.jpg','전쟁기념관 현충일 글짓기·그림대회 2018','02-709-3108','126.9784385198','37.5373270838',to_date('18/06/06','RR/MM/DD'),to_date('18/06/06','RR/MM/DD'),1,21,5076,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2530389,'서울특별시 중구 을지로 281','http://tong.visitkorea.or.kr/cms/resource/72/2550372_image2_1.png','Dear Market (디어마켓) 2018','070-7779-7128','127.0099125747','37.5675352498',to_date('18/06/23','RR/MM/DD'),to_date('18/06/23','RR/MM/DD'),1,24,4881,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2041979,'서울특별시 종로구 창의문로5가길 2','http://tong.visitkorea.or.kr/cms/resource/77/2041977_image2_1.jpg','종로의 이야기꾼, 전기수!','02-2148-1856','126.9634161250','37.5917815966',to_date('18/03/28','RR/MM/DD'),to_date('18/11/28','RR/MM/DD'),1,23,4616,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2537208,'서울특별시 강남구 언주로 711','http://tong.visitkorea.or.kr/cms/resource/11/2539111_image2_1.jpg','조선일보 부동산 슈퍼콘서트 2018','070-4006-8508/8110','127.0348561577','37.5177609250',to_date('18/03/24','RR/MM/DD'),to_date('18/03/25','RR/MM/DD'),1,1,4423,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (607348,'서울특별시 마포구 하늘공원로 108-1','http://tong.visitkorea.or.kr/cms/resource/61/2543761_image2_1.jpg','전통연희 페스티벌 2018','(재)전통공연예술진흥재단 전통축제팀 02-580-3260~1','126.8785133923','37.5693049125',to_date('18/05/19','RR/MM/DD'),to_date('18/05/20','RR/MM/DD'),1,13,4363,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1925900,'서울특별시 영등포구 여의도동 82-9','http://tong.visitkorea.or.kr/cms/resource/20/2546020_image2_1.jpg','K-Festival 2018','02-6111-8814','126.9141334174','37.5320321034',to_date('18/04/06','RR/MM/DD'),to_date('18/04/08','RR/MM/DD'),1,20,4337,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2492032,'서울특별시 송파구 올림픽로 300','http://tong.visitkorea.or.kr/cms/resource/09/2555009_image2_1.jpg','서울시향 영웅의 생애 2018','1588-1210','127.1042832896','37.5136209882',to_date('18/08/30','RR/MM/DD'),to_date('18/08/30','RR/MM/DD'),1,18,4166,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2492588,'서울특별시 중구 장충단로 59','http://tong.visitkorea.or.kr/cms/resource/00/2548000_image2_1.jpg','여우樂 페스티벌 2018','02-2280-4114','126.9992473208','37.5519729781',to_date('18/07/06','RR/MM/DD'),to_date('18/07/22','RR/MM/DD'),1,24,4026,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2433581,'서울특별시 종로구 창경궁로 185','http://tong.visitkorea.or.kr/cms/resource/03/1965903_image2_1.jpg','창경궁 야간 고궁음악회 2018','1600-0064','126.9938137563','37.5776087901',to_date('18/04/28','RR/MM/DD'),to_date('18/08/04','RR/MM/DD'),1,23,4007,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2490805,'서울특별시 광진구 강변북로 139','http://tong.visitkorea.or.kr/cms/resource/95/2539895_image2_1.JPG','한마음 치매극복 전국걷기행사 2018','1666-0921','127.0739744904','37.5293380619',to_date('18/03/24','RR/MM/DD'),to_date('18/05/19','RR/MM/DD'),1,6,3972,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2444110,'서울특별시 강남구 남부순환로 3104','http://tong.visitkorea.or.kr/cms/resource/02/2444102_image2_1.JPG','한옥박람회 2018','한옥박람회 사무국 전화 : 02-741-3576','127.0719422966','37.4956752670',to_date('18/05/31','RR/MM/DD'),to_date('18/06/03','RR/MM/DD'),1,1,3824,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2481950,'서울특별시 강남구 영동대로 513','http://tong.visitkorea.or.kr/cms/resource/45/2481945_image2_1.png','서울일러스트레이션페어 2018','02-2062-8601','127.0591318945','37.5118092746',to_date('18/07/26','RR/MM/DD'),to_date('18/07/29','RR/MM/DD'),1,1,3808,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2524209,'서울특별시 종로구 종로 54','http://tong.visitkorea.or.kr/cms/resource/06/2524206_image2_1.JPG','제야의 종 타종행사 2017','02-542-2695','126.9836593487','37.5697539650',to_date('17/12/31','RR/MM/DD'),to_date('18/01/01','RR/MM/DD'),1,23,3732,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2542948,'서울특별시 종로구 세종대로 172','http://tong.visitkorea.or.kr/cms/resource/44/2542944_image2_1.jpg','[어디나 책, 누구나 책] 책의 해, 세계 책과 저작권의 날 2018','책의해조직위원회070-5221-0335, 운영사무국 070-4264-7714','126.9768376800','37.5721757834',to_date('18/04/22','RR/MM/DD'),to_date('18/04/23','RR/MM/DD'),1,23,3714,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2490376,'서울특별시 강서구 양천로47길 36','http://tong.visitkorea.or.kr/cms/resource/96/2543596_image2_1.jpg','겸재문화예술제 2018','02-2659-2206~7','126.8383836374','37.5722066362',to_date('18/05/11','RR/MM/DD'),to_date('18/05/12','RR/MM/DD'),1,4,3605,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2455073,'서울특별시 중구 세종대로 110','http://tong.visitkorea.or.kr/cms/resource/73/2513673_image2_1.jpg','서울영상광고제 2017','02-3447-0101','126.9783710306','37.5665986816',to_date('18/01/04','RR/MM/DD'),to_date('18/01/04','RR/MM/DD'),1,24,3554,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2378911,'서울특별시 중구 서린동14-41','http://tong.visitkorea.or.kr/cms/resource/73/2378873_image2_1.jpg','폴란드의 날 2018','02-2265-2247','126.9782154269','37.5688234198',to_date('18/05/06','RR/MM/DD'),to_date('18/05/06','RR/MM/DD'),1,24,3034,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2541699,'서울특별시 성동구 왕십리로 63','http://tong.visitkorea.or.kr/cms/resource/59/2549859_image2_1.jpg','언더스탠드에비뉴 Young Creator''s Market_6월 마주치장 2018','02-725-5527','127.0435657431','37.5436108568',to_date('18/06/09','RR/MM/DD'),to_date('18/06/09','RR/MM/DD'),1,16,3001,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2373391,'서울특별시 서초구 강남대로 27','http://tong.visitkorea.or.kr/cms/resource/65/2553365_image2_1.JPG','G-세라믹페어 2018','031-645-0700','127.0396016001','37.4672141004',to_date('18/11/08','RR/MM/DD'),to_date('18/11/11','RR/MM/DD'),1,15,2919,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2541419,'서울특별시 서대문구 연희로 248','http://tong.visitkorea.or.kr/cms/resource/14/2541414_image2_1.JPG','안산자락길 벚꽃음악회 2018','02-330-1410','126.9367744661','37.5792075807',to_date('18/04/12','RR/MM/DD'),to_date('18/04/15','RR/MM/DD'),1,14,2830,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2398183,'서울특별시 중구 퇴계로36길 10','http://tong.visitkorea.or.kr/cms/resource/76/2398176_image2_1.jpg','KOREA심청','02-2266-9101','126.9945252956','37.5601886048',to_date('18/01/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,24,2811,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (406547,'서울특별시 종로구 대학로8가길 80','http://tong.visitkorea.or.kr/cms/resource/25/2035925_image2_1.jpg','코믹극 뉴보잉보잉','02-741-5978','127.0032683110','37.5825083902',to_date('13/10/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,23,42421,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (561681,'서울특별시 중구 장충단로 281','http://tong.visitkorea.or.kr/cms/resource/18/2378918_image2_1.jpg','서울국제만화애니메이션페스티벌 (시카프) 2018','02-3455-8422','127.0093570175','37.5693766928',to_date('18/08/23','RR/MM/DD'),to_date('18/08/26','RR/MM/DD'),1,24,42076,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1957556,'서울특별시 종로구 창경궁로 185','http://tong.visitkorea.or.kr/cms/resource/99/2005799_image2_1.jpg','창경궁 야간 특별관람 2018','02-762-9515','126.9945052690','37.5807973206',to_date('18/04/28','RR/MM/DD'),to_date('18/11/03','RR/MM/DD'),1,23,41820,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1567429,'서울특별시 금천구 시흥대로73길 70','http://tong.visitkorea.or.kr/cms/resource/42/1616542_image2_1.jpg','금천 하모니 벚꽃축제 2018','금천구 문화체육과 02-2627-1447','126.8946873249','37.4560739122',to_date('18/04/07','RR/MM/DD'),to_date('18/04/08','RR/MM/DD'),1,8,40558,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1301487,'서울특별시 중구 세종대로 99','http://tong.visitkorea.or.kr/cms/resource/08/1965908_image2_1.jpg','덕수궁 풍류 2018','02-2270-1236, 1239','126.9749158128','37.5658042673',to_date('18/05/17','RR/MM/DD'),to_date('18/10/25','RR/MM/DD'),1,24,39741,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1300347,'서울특별시 양천구 목동서로 201','http://tong.visitkorea.or.kr/cms/resource/52/1300352_image2_1.gif','토요일 오후의 실내악 2018','1577-4579','126.8710624268','37.5290622352',to_date('18/01/06','RR/MM/DD'),to_date('18/12/15','RR/MM/DD'),1,19,39313,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1008843,'서울특별시 중구 세종대로 110','http://tong.visitkorea.or.kr/cms/resource/02/2542702_image2_1.JPG','서울드럼페스티벌 2018','02-542-5977','126.9783710306','37.5665986816',to_date('18/05/25','RR/MM/DD'),to_date('18/05/26','RR/MM/DD'),1,24,39258,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2410727,'서울특별시 강남구 남부순환로 3104','http://tong.visitkorea.or.kr/cms/resource/66/2537766_image2_1.jpg','서울보드게임페스타 2018','070-8611-9803','127.0718200835','37.4957585883',to_date('18/05/05','RR/MM/DD'),to_date('18/05/06','RR/MM/DD'),1,1,38996,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1914823,'서울특별시 종로구 종로 54','http://tong.visitkorea.or.kr/cms/resource/47/2487947_image2_1.jpg','보신각타종행사','다산콜센터 국번없이 120<br />보신각관리사무소 02-2133-0983','126.9835621340','37.5697984025',to_date('18/01/02','RR/MM/DD'),to_date('18/12/30','RR/MM/DD'),1,23,37568,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1717921,'서울특별시 종로구 대학로8길 1','http://tong.visitkorea.or.kr/cms/resource/16/2544616_image2_1.jpg','대학로 거리공연축제 D.FESTA 2018','02-741-4188','127.0023906561','37.5809974394',to_date('18/05/17','RR/MM/DD'),to_date('18/05/20','RR/MM/DD'),1,23,37098,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (629023,'서울특별시 마포구 월드컵북로5길 56','http://tong.visitkorea.or.kr/cms/resource/06/2553606_image2_1.jpg','서울세계무용축제 2018','02-3216-1185','126.9157992483','37.5562820926',to_date('18/10/01','RR/MM/DD'),to_date('18/10/19','RR/MM/DD'),1,13,35163,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (292961,'서울특별시 중구 세종대로 99','http://tong.visitkorea.or.kr/cms/resource/24/495224_image2_1.jpg','덕수궁 왕궁수문장교대의식','다산콜센터 02-120','126.9761046145','37.5650460435',to_date('18/01/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,24,34759,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1281866,'서울특별시 종로구 이화장길 72','http://tong.visitkorea.or.kr/cms/resource/41/2032041_image2_1.jpg','연극 죽여주는 이야기','02-6326-1333','127.0046294120','37.5784894370',to_date('16/01/01','RR/MM/DD'),to_date('18/12/31','RR/MM/DD'),1,23,34746,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1839822,'서울특별시 중구 세종대로 110','http://tong.visitkorea.or.kr/cms/resource/21/2554921_image2_1.jpg','서울 문화로 바캉스 2018','02-550-2535','126.9783710306','37.5665986816',to_date('18/08/10','RR/MM/DD'),to_date('18/08/11','RR/MM/DD'),1,24,34693,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2497537,'서울특별시 영등포구 여의동로 330','http://tong.visitkorea.or.kr/cms/resource/15/2536415_image2_1.jpg','한강나이트워크42K 2018','070-4705-2008','126.9335762510','37.5263247807',to_date('18/07/28','RR/MM/DD'),to_date('18/07/29','RR/MM/DD'),1,20,33941,'강서권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (1773755,'서울특별시 강남구 영동대로 513','http://tong.visitkorea.or.kr/cms/resource/88/2509688_image2_1.JPG','서울 살롱 뒤 쇼콜라 2018','02-6000-6698, 6673','127.0591318945','37.5118092746',to_date('18/01/18','RR/MM/DD'),to_date('18/01/21','RR/MM/DD'),1,1,33104,'강남권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (141759,'서울특별시 종로구 종로 157','http://tong.visitkorea.or.kr/cms/resource/28/935328_image2_1.jpg','종묘대제 2018','02-2270-1242','126.9944471257','37.5742897425',to_date('18/05/06','RR/MM/DD'),to_date('18/05/06','RR/MM/DD'),1,23,31617,'강북권');
Insert into HR.FESTIVAL (CONTENT_ID,FE_PLACE,FEIMG,TITLE,TEL,LATITUDE,LONGITUDE,EVENTSTART_DATE,EVENTEND_DATE,A_CODE,D_NO,GOOD,SUM_AREA) values (2032306,'서울특별시 서대문구 창천동 연세로','http://tong.visitkorea.or.kr/cms/resource/33/2551133_image2_1.jpg','신촌맥주축제 2018','02-565-0501','126.9352058303','37.5556575125',to_date('18/09/07','RR/MM/DD'),to_date('18/09/09','RR/MM/DD'),1,14,31045,'강북권');
--------------------------------------------------------------------------------


--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-07-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AREA_CODE
--------------------------------------------------------

  CREATE TABLE "HR"."AREA_CODE" 
   (   "NAME" VARCHAR2(100 BYTE), 
   "CODE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.AREA_CODE
SET DEFINE OFF;
Insert into HR.AREA_CODE (NAME,CODE) values ('서울',1);
Insert into HR.AREA_CODE (NAME,CODE) values ('인천',2);
Insert into HR.AREA_CODE (NAME,CODE) values ('대전',3);
Insert into HR.AREA_CODE (NAME,CODE) values ('대구',4);
Insert into HR.AREA_CODE (NAME,CODE) values ('광주',5);
Insert into HR.AREA_CODE (NAME,CODE) values ('부산',6);
Insert into HR.AREA_CODE (NAME,CODE) values ('울산',7);
Insert into HR.AREA_CODE (NAME,CODE) values ('세종특별자치시',8);
Insert into HR.AREA_CODE (NAME,CODE) values ('경기도',31);
Insert into HR.AREA_CODE (NAME,CODE) values ('강원도',32);
Insert into HR.AREA_CODE (NAME,CODE) values ('충청북도',33);
Insert into HR.AREA_CODE (NAME,CODE) values ('충청남도',34);
Insert into HR.AREA_CODE (NAME,CODE) values ('경상북도',35);
Insert into HR.AREA_CODE (NAME,CODE) values ('경상남도',36);
Insert into HR.AREA_CODE (NAME,CODE) values ('전라북도',37);
Insert into HR.AREA_CODE (NAME,CODE) values ('전라남도',38);
Insert into HR.AREA_CODE (NAME,CODE) values ('제주도',39);
--------------------------------------------------------
--  DDL for Index SYS_C007181
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007181" ON "HR"."AREA_CODE" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table AREA_CODE
--------------------------------------------------------

  ALTER TABLE "HR"."AREA_CODE" ADD PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  
  ------------------------------------------------------------------------------------------------
  
  
  --------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-07-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AREA_DISTRICT
--------------------------------------------------------

  CREATE TABLE "HR"."AREA_DISTRICT" 
   (   "D_NO" NUMBER, 
   "A_CODE" NUMBER, 
   "CODE" NUMBER, 
   "NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.AREA_DISTRICT
SET DEFINE OFF;
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (1,1,1,'강남구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (2,1,2,'강동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (3,1,3,'강북구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (4,1,4,'강서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (5,1,5,'관악구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (6,1,6,'광진구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (7,1,7,'구로구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (8,1,8,'금천구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (9,1,9,'노원구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (10,1,10,'도봉구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (11,1,11,'동대문구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (12,1,12,'동작구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (13,1,13,'마포구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (14,1,14,'서대문구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (15,1,15,'서초구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (16,1,16,'성동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (17,1,17,'성북구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (18,1,18,'송파구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (19,1,19,'양천구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (20,1,20,'영등포구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (21,1,21,'용산구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (22,1,22,'은평구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (23,1,23,'종로구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (24,1,24,'중구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (25,1,25,'중랑구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (26,2,1,'강화군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (27,2,2,'계양구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (28,2,3,'남구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (29,2,4,'남동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (30,2,5,'동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (31,2,6,'부평구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (32,2,7,'서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (33,2,8,'연수구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (34,2,9,'옹진군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (35,2,10,'중구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (36,3,1,'대덕구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (37,3,2,'동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (38,3,3,'서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (39,3,4,'유성구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (40,3,5,'중구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (41,4,1,'남구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (42,4,2,'달서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (43,4,3,'달성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (44,4,4,'동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (45,4,5,'북구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (46,4,6,'서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (47,4,7,'수성구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (48,4,8,'중구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (49,5,1,'광산구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (50,5,2,'남구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (51,5,3,'동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (52,5,4,'북구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (53,5,5,'서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (54,6,1,'강서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (55,6,2,'금정구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (56,6,3,'기장군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (57,6,4,'남구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (58,6,5,'동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (59,6,6,'동래구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (60,6,7,'부산진구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (61,6,8,'북구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (62,6,9,'사상구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (63,6,10,'사하구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (64,6,11,'서구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (65,6,12,'수영구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (66,6,13,'연제구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (67,6,14,'영도구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (68,6,15,'중구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (69,6,16,'해운대구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (70,7,1,'중구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (71,7,2,'남구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (72,7,3,'동구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (73,7,4,'북구');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (74,7,5,'울주군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (75,8,1,'세종특별자치시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (76,31,1,'가평군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (77,31,2,'고양시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (78,31,3,'과천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (79,31,4,'광명시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (80,31,5,'광주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (81,31,6,'구리시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (82,31,7,'군포시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (83,31,8,'김포시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (84,31,9,'남양주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (85,31,10,'동두천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (86,31,11,'부천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (87,31,12,'성남시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (88,31,13,'수원시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (89,31,14,'시흥시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (90,31,15,'안산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (91,31,16,'안성시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (92,31,17,'안양시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (93,31,18,'양주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (94,31,19,'양평군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (95,31,20,'여주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (96,31,21,'연천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (97,31,22,'오산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (98,31,23,'용인시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (99,31,24,'의왕시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (100,31,25,'의정부시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (101,31,26,'이천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (102,31,27,'파주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (103,31,28,'평택시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (104,31,29,'포천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (105,31,30,'하남시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (106,31,31,'화성시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (107,32,1,'강릉시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (108,32,2,'고성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (109,32,3,'동해시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (110,32,4,'삼척시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (111,32,5,'속초시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (112,32,6,'양구군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (113,32,7,'양양군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (114,32,8,'영월군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (115,32,9,'원주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (116,32,10,'인제군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (117,32,11,'정선군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (118,32,12,'철원군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (119,32,13,'춘천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (120,32,14,'태백시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (121,32,15,'평창군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (122,32,16,'홍천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (123,32,17,'화천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (124,32,18,'횡성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (125,33,1,'괴산군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (126,33,2,'단양군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (127,33,3,'보은군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (128,33,4,'영동군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (129,33,5,'옥천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (130,33,6,'음성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (131,33,7,'제천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (132,33,8,'진천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (133,33,9,'청원군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (134,33,10,'청주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (135,33,11,'충주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (136,33,12,'증평군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (137,34,1,'공주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (138,34,2,'금산군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (139,34,3,'논산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (140,34,4,'당진시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (141,34,5,'보령시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (142,34,6,'부여군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (143,34,7,'서산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (144,34,8,'서천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (145,34,9,'아산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (146,34,11,'예산군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (147,34,12,'천안시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (148,34,13,'청양군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (149,34,14,'태안군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (150,34,15,'홍성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (151,34,16,'계룡시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (152,35,1,'경산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (153,35,2,'경주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (154,35,3,'고령군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (155,35,4,'구미시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (156,35,5,'군위군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (157,35,6,'김천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (158,35,7,'문경시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (159,35,8,'봉화군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (160,35,9,'상주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (161,35,10,'성주군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (162,35,11,'안동시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (163,35,12,'영덕군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (164,35,13,'영양군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (165,35,14,'영주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (166,35,15,'영천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (167,35,16,'예천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (168,35,17,'울릉군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (169,35,18,'울진군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (170,35,19,'의성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (171,35,20,'청도군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (172,35,21,'청송군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (173,35,22,'칠곡군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (174,35,23,'포항시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (175,36,1,'거제시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (176,36,2,'거창군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (177,36,3,'고성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (178,36,4,'김해시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (179,36,5,'남해군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (180,36,6,'마산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (181,36,7,'밀양시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (182,36,8,'사천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (183,36,9,'산청군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (184,36,10,'양산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (185,36,12,'의령군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (186,36,13,'진주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (187,36,14,'진해시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (188,36,15,'창녕군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (189,36,16,'창원시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (190,36,17,'통영시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (191,36,18,'하동군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (192,36,19,'함안군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (193,36,20,'함양군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (194,36,21,'합천군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (195,37,1,'고창군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (196,37,2,'군산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (197,37,3,'김제시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (198,37,4,'남원시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (199,37,5,'무주군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (200,37,6,'부안군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (201,37,7,'순창군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (202,37,8,'완주군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (203,37,9,'익산시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (204,37,10,'임실군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (205,37,11,'장수군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (206,37,12,'전주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (207,37,13,'정읍시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (208,37,14,'진안군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (209,38,1,'강진군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (210,38,2,'고흥군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (211,38,3,'곡성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (212,38,4,'광양시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (213,38,5,'구례군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (214,38,6,'나주시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (215,38,7,'담양군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (216,38,8,'목포시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (217,38,9,'무안군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (218,38,10,'보성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (219,38,11,'순천시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (220,38,12,'신안군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (221,38,13,'여수시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (222,38,16,'영광군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (223,38,17,'영암군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (224,38,18,'완도군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (225,38,19,'장성군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (226,38,20,'장흥군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (227,38,21,'진도군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (228,38,22,'함평군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (229,38,23,'해남군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (230,38,24,'화순군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (231,39,1,'남제주군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (232,39,2,'북제주군');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (233,39,3,'서귀포시');
Insert into HR.AREA_DISTRICT (D_NO,A_CODE,CODE,NAME) values (234,39,4,'제주시');
--------------------------------------------------------
--  DDL for Index SYS_C007210
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007210" ON "HR"."AREA_DISTRICT" ("D_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table AREA_DISTRICT
--------------------------------------------------------

  ALTER TABLE "HR"."AREA_DISTRICT" ADD PRIMARY KEY ("D_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
    