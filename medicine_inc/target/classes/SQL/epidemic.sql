-- 전염병DB
ALTER TABLE epidemicDB
	DROP PRIMARY KEY; -- 전염병DB 기본키

-- 전염병DB
DROP TABLE IF EXISTS epidemicDB RESTRICT;

-- 전염병DB
CREATE TABLE epidemicDB (
	NO           INT          NOT NULL COMMENT '번호', -- 번호
	name         varchar(50)  NOT NULL COMMENT '이름', -- 이름
	Related_word varchar(500) NULL     COMMENT '연관단어' -- 연관단어
)ENGINE = InnoDB DEFAULT CHARSET = utf8
COMMENT '전염병DB';

-- 전염병DB
ALTER TABLE epidemicDB
	ADD CONSTRAINT PK_epidemicDB -- 전염병DB 기본키
		PRIMARY KEY (
			NO -- 번호
		);




-- 감염자DB
ALTER TABLE Infected 
	DROP PRIMARY KEY; -- 감염자DB 기본키

-- 감염자DB
DROP TABLE IF EXISTS Infected  RESTRICT;

-- 감염자DB
CREATE TABLE Infected  (
	NO       INT         NOT NULL COMMENT '감염자번호', -- 감염자번호
	i_gender varchar(10) NULL     COMMENT '감염자성별', -- 감염자성별
	i_name   varchar(20) NULL     COMMENT '감염자이름', -- 감염자이름
	i_age    INT         NULL     COMMENT '감염자나이' -- 감염자나이
)ENGINE = InnoDB DEFAULT CHARSET = utf8
COMMENT '감염자DB';

-- 감염자DB
ALTER TABLE Infected 
	ADD CONSTRAINT PK_Infected  -- 감염자DB 기본키
		PRIMARY KEY (
			NO -- 감염자번호
		);
        
        
        
        
        -- 전염병croling
ALTER TABLE epidemic
	DROP FOREIGN KEY FK_epidemicDB_TO_epidemic; -- 전염병DB -> 전염병croling

-- 전염병croling
ALTER TABLE epidemic
	DROP FOREIGN KEY FK_Infected_TO_epidemic; -- 감염자DB -> 전염병croling

-- 전염병croling
ALTER TABLE epidemic
	DROP PRIMARY KEY; -- 전염병croling 기본키

-- 전염병croling
DROP TABLE IF EXISTS epidemic RESTRICT;

-- 전염병croling
CREATE TABLE epidemic (
	NO    INT          NOT NULL COMMENT '번호', -- 번호
	E_NO  INT          NOT NULL COMMENT '전염병번호', -- 전염병번호
	lat   varchar(50)  NULL     COMMENT '위도', -- 위도
	lng   varchar(50)  NULL     COMMENT '경도', -- 경도
	src   varchar(500) NOT NULL COMMENT '뉴스주소', -- 뉴스주소
	a_num INT          NULL     COMMENT '폐사동물수', -- 폐사동물수
	i_num INT          NULL     COMMENT '감염자수', -- 감염자수
	d_num INT          NULL     COMMENT '사망자수', -- 사망자수
	I_NO  INT          NULL     COMMENT '감염자번호', -- 감염자번호
	date  TIMESTAMP    NULL     COMMENT '뉴스날자' -- 뉴스날자
)ENGINE = InnoDB DEFAULT CHARSET = utf8
COMMENT '전염병croling';

-- 전염병croling
ALTER TABLE epidemic
	ADD CONSTRAINT PK_epidemic -- 전염병croling 기본키
		PRIMARY KEY (
			NO -- 번호
		);

ALTER TABLE epidemic
	MODIFY COLUMN NO INT NOT NULL AUTO_INCREMENT COMMENT '번호';

ALTER TABLE epidemic
	AUTO_INCREMENT = 1;

-- 전염병croling
ALTER TABLE epidemic
	ADD CONSTRAINT FK_epidemicDB_TO_epidemic -- 전염병DB -> 전염병croling
		FOREIGN KEY (
			E_NO -- 전염병번호
		)
		REFERENCES epidemicDB ( -- 전염병DB
			NO -- 번호
		);

-- 전염병croling
ALTER TABLE epidemic
	ADD CONSTRAINT FK_Infected_TO_epidemic -- 감염자DB -> 전염병croling
		FOREIGN KEY (
			I_NO -- 감염자번호
		)
		REFERENCES Infected  ( -- 감염자DB
			NO -- 감염자번호
		);
        
        
select * from epidemic;
select * from epidemicDB;
select * from infected;
select * from ill_list;


show databases;
select * from ill_list;
SELECT 	COUNT(code) FROM ill_list 
WHERE (name RLIKE '^(ㄱ|ㄲ)' OR (name >= '가' AND name < '나' ));

SELECT *from ill_list where name LIKE '%';


select * from food;

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `질환` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `질병` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `이름` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `효능` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

