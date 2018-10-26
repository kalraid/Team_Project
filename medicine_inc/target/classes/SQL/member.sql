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
	is_admin char(1) default 'F'
)engine=InnoDB default char set=utf8;

INSERT INTO member VALUES('leecm', '이창명', '1234', 
	'leecm8989@daum.net' ,'T'	
	);
    
    
commit;
