
CREATE TABLE `epidemicdb` (
  `NO` int(11) NOT NULL COMMENT '번호',
  `name` varchar(50) NOT NULL COMMENT '이름',
  `Related_word` varchar(500) DEFAULT NULL COMMENT '연관단어',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전염병DB';



INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (1,'아시아 독감','H2N2,');
INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (2,'에이즈','AIDS, HIV,');
INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (3,'신종플루','H1N1, SI, MI, NAI, 신종플루, 신종인플루엔자, 인플루엔자A, ');
INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (4,'사스','SARS');
INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (5,'조류독감','AI, ');
INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (6,'에볼라','Ebola,');
INSERT INTO `epidemicDB` (`NO`,`name`,`Related_word`) VALUES (7,'메르스','MERS, ');