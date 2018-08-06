--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-07-2018   
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

CREATE SEQUENCE p_thema_SEQ;
SET DEFINE OFF;
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,61,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,62,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,63,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,64,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,65,3);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,66,3);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,67,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,68,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,69,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,70,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,71,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,72,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,73,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,74,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,75,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,76,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,77,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,78,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,79,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,80,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,81,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,82,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,83,2);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,84,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,85,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,86,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,87,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,88,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,89,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,90,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,91,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,92,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,93,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,94,5);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,95,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,96,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,97,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,98,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,99,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,100,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,101,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,102,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,103,6);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,104,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,105,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,106,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,107,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,108,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,109,7);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,110,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,111,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,112,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,113,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,114,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,115,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,116,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,117,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,118,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,119,8);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,120,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,121,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,122,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,123,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,124,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,125,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,126,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,127,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,128,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,129,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,130,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,131,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,129,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,133,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,134,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,135,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,136,9);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,61,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,62,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,63,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,64,4);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,141,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,142,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,143,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,144,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,145,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,146,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,147,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,148,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,149,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,150,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,151,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,152,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,153,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,154,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,155,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,156,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,157,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,158,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,159,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,160,23);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,161,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,162,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,163,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,164,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,165,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,166,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,167,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,168,24);
Insert into HR.PLA_THEMA (THE_NUM,PLACE_NUM,S_THEMA_NUM) values (p_thema_SEQ.nextval,169,24);
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
