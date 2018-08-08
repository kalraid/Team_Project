--------------------------------------------------------
--  파일이 생성됨 - 수요일-8월-08-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PLA_THEMA
--------------------------------------------------------

  CREATE TABLE "HR"."PLA_THEMA" 
   (	"THE_NUM" NUMBER, 
	"PLACE_NUM" NUMBER, 
	"S_THEMA_NUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."PLA_THEMA"."THE_NUM" IS '새 컬럼';
   COMMENT ON COLUMN "HR"."PLA_THEMA"."PLACE_NUM" IS '장소번호';
   COMMENT ON COLUMN "HR"."PLA_THEMA"."S_THEMA_NUM" IS '소테마번호';
   COMMENT ON TABLE "HR"."PLA_THEMA"  IS '테마정보';
REM INSERTING into HR.PLA_THEMA
SET DEFINE OFF;
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (9,130,39);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (10,131,39);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (11,132,39);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (12,133,39);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (13,134,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (14,135,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (15,136,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (16,137,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (17,138,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (18,139,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (19,140,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (20,141,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (21,142,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (22,143,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (23,144,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (24,145,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (25,146,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (26,147,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (226,122,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (227,124,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (228,125,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (229,350,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (230,351,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (231,352,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (232,353,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (233,354,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (234,355,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (235,356,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (236,357,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (237,358,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (238,359,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (239,360,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (240,361,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (241,362,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (242,363,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (243,364,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (244,365,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (245,366,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (246,367,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (247,368,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (248,369,16);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (249,370,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (250,371,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (251,372,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (252,373,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (253,374,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (254,375,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (255,376,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (256,377,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (257,378,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (258,219,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (259,218,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (260,381,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (261,382,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (262,383,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (263,220,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (264,385,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (265,386,81);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (266,122,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (267,124,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (268,125,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (269,350,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (27,146,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (28,149,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (29,150,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (30,151,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (31,152,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (32,150,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (33,154,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (34,155,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (35,156,41);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (36,125,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (37,158,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (38,159,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (39,160,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (40,161,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (41,124,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (42,163,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (43,164,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (44,165,45);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (45,166,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (46,167,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (47,168,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (48,169,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (49,170,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (50,171,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (51,172,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (52,173,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (53,174,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (54,175,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (55,176,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (56,177,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (57,178,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (58,179,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (59,180,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (60,181,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (61,182,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (62,183,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (63,184,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (64,185,48);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (5,122,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (6,123,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (7,124,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (8,125,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (65,186,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (66,187,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (67,188,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (68,189,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (69,190,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (70,191,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (71,192,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (72,193,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (73,194,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (74,195,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (75,196,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (76,197,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (77,198,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (78,199,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (79,200,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (80,201,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (81,202,49);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (82,203,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (83,204,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (84,205,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (85,206,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (86,207,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (87,208,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (88,209,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (89,210,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (90,211,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (91,212,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (92,213,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (93,214,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (94,215,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (95,216,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (96,217,51);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (97,218,69);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (98,219,69);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (99,220,69);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (100,221,69);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (101,222,69);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (102,223,70);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (103,224,71);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (104,225,71);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (105,226,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (106,227,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (107,228,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (108,229,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (109,230,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (110,231,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (111,232,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (112,233,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (113,234,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (114,235,72);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (115,236,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (116,237,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (117,238,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (118,239,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (119,240,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (120,241,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (121,242,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (122,243,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (123,244,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (124,245,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (125,246,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (126,202,99);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (127,248,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (128,249,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (129,250,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (130,251,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (131,252,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (132,253,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (133,254,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (134,255,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (135,256,98);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (136,257,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (137,258,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (138,259,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (139,260,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (140,261,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (141,262,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (142,263,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (143,264,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (144,265,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (145,266,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (146,267,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (147,268,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (148,269,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (149,270,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (150,271,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (151,272,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (152,273,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (153,274,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (154,275,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (155,276,97);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (156,277,96);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (157,278,96);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (158,279,96);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (159,280,96);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (160,281,96);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (161,282,96);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (162,283,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (163,284,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (164,285,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (165,286,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (166,287,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (167,288,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (168,289,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (169,290,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (170,291,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (171,292,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (172,293,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (173,294,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (174,295,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (175,296,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (176,297,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (177,298,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (178,299,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (179,300,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (180,301,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (181,302,83);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (182,134,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (183,135,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (184,136,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (185,137,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (186,138,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (187,139,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (188,140,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (189,141,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (190,142,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (191,143,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (192,144,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (193,145,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (194,146,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (195,147,40);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (196,122,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (197,124,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (198,125,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (199,320,33);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (200,122,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (201,124,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (202,125,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (203,324,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (204,325,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (205,326,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (206,327,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (207,328,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (208,329,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (209,330,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (210,331,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (211,332,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (212,333,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (213,334,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (214,335,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (215,334,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (216,337,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (217,338,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (218,339,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (219,340,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (220,341,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (221,342,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (222,343,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (223,344,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (224,345,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (225,346,7);
--------------------------------------------------------
--  DDL for Index PK_PLA_THEMA
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PK_PLA_THEMA" ON "HR"."PLA_THEMA" ("THE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PLA_THEMA
--------------------------------------------------------

  ALTER TABLE "HR"."PLA_THEMA" ADD CONSTRAINT "PK_PLA_THEMA" PRIMARY KEY ("THE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."PLA_THEMA" MODIFY ("S_THEMA_NUM" NOT NULL ENABLE);
  ALTER TABLE "HR"."PLA_THEMA" MODIFY ("PLACE_NUM" NOT NULL ENABLE);
  ALTER TABLE "HR"."PLA_THEMA" MODIFY ("THE_NUM" NOT NULL ENABLE);
