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


    
    