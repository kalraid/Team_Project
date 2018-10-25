## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS spring;
use spring;

# 테이블 생성
DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
	id VARCHAR(20) PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	pass VARCHAR(20) NOT NULL,
	email VARCHAR(30) NOT NULL,
	mobile VARCHAR(13) NOT NULL,
	zipcode VARCHAR(5) NOT NULL,
	address1 VARCHAR(80) NOT NULL,
	address2 VARCHAR(60) NOT NULL,
	phone VARCHAR(13),
	email_get VARCHAR(1),
	reg_date TIMESTAMP NOT NULL,
	is_admin char(1) default 'F'
)engine=InnoDB default char set=utf8;

# 회원 정보 추가
INSERT INTO member VALUES('leecm', '이창명', '1234', 
	'leecm8989@daum.net', '010-1234-5678', '14409', 
	'경기 부천시 오정구 수주로 18 (고강동, 동문미도아파트)', '미도아파트 1동 513호', 
	'032-1234-5678', '1', '2016-06-06 12:10:30','T');


commit;
SELECT * FROM member;
