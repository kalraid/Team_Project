
/* 소테마 */
CREATE TABLE smallthema (
	s_thama_num NUMBER NOT NULL, /* 소테마번호 */
	s_thama_name VARCHAR2(16 CHAR) NOT NULL, /* 소테마이름 */
	thema_num NUMBER NOT NULL /* 테마번호 */
);


COMMENT ON TABLE smallthema IS '소테마';

COMMENT ON COLUMN smallthema.s_thama_num IS '소테마번호';

COMMENT ON COLUMN smallthema.s_thama_name IS '소테마이름';

COMMENT ON COLUMN smallthema.thema_num IS '테마번호';

CREATE UNIQUE INDEX PK_smallthema
	ON smallthema (
		s_thama_num ASC
	);

CREATE UNIQUE INDEX UIX_smallthema
	ON smallthema (
		s_thama_name ASC
	);

ALTER TABLE smallthema
	ADD
		CONSTRAINT PK_smallthema
		PRIMARY KEY (
			s_thama_num
		);

ALTER TABLE smallthema
	ADD
		CONSTRAINT UK_smallthema
		UNIQUE (
			s_thama_name
		);

ALTER TABLE smallthema
	ADD
		CONSTRAINT FK_thema_TO_smallthema
		FOREIGN KEY (
			thema_num
		)
		REFERENCES thema (
			thema_num
		);
		
select * FROM smallthema;

delete from smallthema;
select * from smallthema ORDER BY s_THeMA_NUM;
create sequence smallthema_seq;
commit;

-- 시퀸스 초기화 구문
select smallthema_seq.currval from dual;
-- 위의 currval에 나온값 -1을 아래 숫자에 집어넣고 음수화
ALTER SEQUENCE smallthema_seq INCREMENT BY  -172;

select smallthema_seq.NEXTVAL from dual;
select smallthema_seq.currval from dual;

ALTER SEQUENCE smallthema_seq INCREMENT BY 1;
commit;
ALTER TABLE smallthema RENAME COLUMN S_THAMA_Num TO S_THEMA_Num;
ALTER TABLE smallthema RENAME COLUMN S_THAMA_NAME TO S_THEMA_NAME;
-- 실제 자료 currval
insert into smallthema values(smallthema_seq.currval, '고양이카페',1);
-- insert into smallthema values(smallthema_seq.NEXTVAL, '고양이카페',1);
insert into smallthema values(smallthema_seq.NEXTVAL, '동물병원',1);
insert into smallthema values(smallthema_seq.NEXTVAL, '강아지카페',1);
insert into smallthema values(smallthema_seq.NEXTVAL, '동물원',1);
insert into smallthema values(smallthema_seq.NEXTVAL, '보드게임카페',2);
insert into smallthema values(smallthema_seq.NEXTVAL, '방탈출',2);
insert into smallthema values(smallthema_seq.NEXTVAL, '오락실',2);
insert into smallthema values(smallthema_seq.NEXTVAL, '노래방',2);
insert into smallthema values(smallthema_seq.NEXTVAL, '클럽',2);
insert into smallthema values(smallthema_seq.NEXTVAL, '일반카페',3);
insert into smallthema values(smallthema_seq.NEXTVAL, '한식',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '서양식',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '일식',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '중식',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '아시아식',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '패밀리레스토랑',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '이색음식점',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '채식전문점',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '술집',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '빵집',4);
insert into smallthema values(smallthema_seq.NEXTVAL, '5일장',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '상설시장',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '백화점',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '면세점',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '할인매장',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '전문상가',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '공예,공방',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '관광기념품점',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '특산물판매점',5);
insert into smallthema values(smallthema_seq.NEXTVAL, '고궁',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '성',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '문',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '고택',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '생가',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '유적지',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '사찰',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '종교성지',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '기념탑및전망대',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '분수',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '박물관',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '기념관',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '전시관',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '컨벤션센터',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '화랑',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '공연장',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '문화원',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '외국문화원',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '도서관',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '대형서점',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '문화전수시설',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '영화관',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '어학당',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '전통공연',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '연극',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '뮤지컬',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '오페라',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '전시회',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '박람회',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '고궁',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '무용',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '클래식음악회',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '대중콘서트',6);
insert into smallthema values(smallthema_seq.NEXTVAL, '국립공원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '도립공원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '군립공원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '산',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '자연생태관광지',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '자연휴양림',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '수목원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '폭포',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '계곡',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '약수터',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '해안절경',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '섬',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '항구',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '어촌',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '등대',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '호수',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '강',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '희귀동식물',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '식물원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '테마공원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '공원',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '민물낚시',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '바다낚시',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '아쿠아리움',7);
insert into smallthema values(smallthema_seq.NEXTVAL, '유원지',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '헬스투어',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '스포츠경기',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '기타행사',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '스포츠센터',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '수련시설',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '경기장',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '경마',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '경륜',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '카지노',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '체육관',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '볼링장',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '사격장',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '복합레포츠',8);
insert into smallthema values(smallthema_seq.NEXTVAL, '동굴',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '기암괴석',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '민속마을',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '안보관광',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '관광단지',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '유람선/잠수함',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '농어촌체험',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '전통체험',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '산사체험',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '이색체험',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '관광농원',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '이색거리',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '대교',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '동상',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '터널',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '유명건물',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '관광호텔',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '수상관광호텔',9);
insert into smallthema values(smallthema_seq.NEXTVAL, '해수욕장',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '야영장',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '카누',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '요트',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '스킨스쿠버',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '수영',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '래프팅',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '스카이다이빙',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '온천',11);
insert into smallthema values(smallthema_seq.NEXTVAL, '이색찜질방',11);
insert into smallthema values(smallthema_seq.NEXTVAL, '스키및보드',11);
insert into smallthema values(smallthema_seq.NEXTVAL, '썰매장',11);
insert into smallthema values(smallthema_seq.NEXTVAL, '빙벽등반',11);
insert into smallthema values(smallthema_seq.NEXTVAL, '스키대여점',11);
insert into smallthema values(smallthema_seq.NEXTVAL, '제트스키',10);
insert into smallthema values(smallthema_seq.NEXTVAL, '인라인',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '자전거점',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '자전거하이킹',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '카트',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '골프',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '승마',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '스케이트',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '수렵장',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '암벽등반',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '서바이벌',12);
insert into smallthema values(smallthema_seq.NEXTVAL, 'ATV',12);
insert into smallthema values(smallthema_seq.NEXTVAL, 'MTB',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '오프로드',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '번지점프',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '자동자경주',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '트래킹',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '초경량비행',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '행글라이딩',12);
insert into smallthema values(smallthema_seq.NEXTVAL, '열기구',12);

COMMIT;
select * from smallthema ORDER BY s_THeMA_NUM;

