SELECT * FROM spring.epidemicDB;
SELECT * FROM spring.epidemic;
select * from food;
select * from food2;
select * from ill_list;
select * from infected;


DROP TABLE infected;

DROP TABLE epidemic;


CREATE TABLE `infected` (
  `NO` int(11) auto_increment NOT NULL COMMENT '감염자번호',
  `i_gender` varchar(10) DEFAULT NULL COMMENT '감염자성별',
  `i_age` int(11) DEFAULT NULL COMMENT '감염자나이',
  `epidemic` varchar(20) DEFAULT NULL COMMENT '전염병 종류',
  `hospital` varchar(300) DEFAULT NULL COMMENT '병원',
  `dateset` date DEFAULT NULL COMMENT '날짜',
  `link` varchar(300) unique DEFAULT NULL COMMENT '링크주소',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='감염자DB';

select * from infected;