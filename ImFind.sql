--------------------------------------------------------
--  파일이 생성됨 - 토요일-2월-20-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_CHAT_GROUP
--------------------------------------------------------

   CREATE SEQUENCE  "IMFIND"."SEQ_CHAT_GROUP"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CODE
--------------------------------------------------------

   CREATE SEQUENCE  "IMFIND"."SEQ_CODE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 268141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_LOST_POSTNUM
--------------------------------------------------------

   CREATE SEQUENCE  "IMFIND"."SEQ_LOST_POSTNUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3840 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PET_POSTNUM
--------------------------------------------------------

   CREATE SEQUENCE  "IMFIND"."SEQ_PET_POSTNUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 441 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ALARM_LIST
--------------------------------------------------------

  CREATE TABLE "IMFIND"."ALARM_LIST" 
   (	"POSTNUM" NUMBER, 
	"ALARM_CONTENT" VARCHAR2(1000 BYTE), 
	"ID" VARCHAR2(300 BYTE), 
	"SENDER" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AREA
--------------------------------------------------------

  CREATE TABLE "IMFIND"."AREA" 
   (	"SICODE" VARCHAR2(50 BYTE), 
	"SI" VARCHAR2(50 BYTE), 
	"GUCODE" VARCHAR2(50 BYTE), 
	"GU" VARCHAR2(50 BYTE), 
	"DONGCODE" VARCHAR2(50 BYTE), 
	"DONG" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "IMFIND"."CHAT" 
   (	"NOT_NUM" NUMBER, 
	"SENT_ID" VARCHAR2(50 BYTE), 
	"RECEIVE_ID" VARCHAR2(50 BYTE), 
	"NOT_CONTENT" VARCHAR2(4000 BYTE), 
	"NOT_OR_FILE" VARCHAR2(500 BYTE), 
	"NOT_UP_FILE" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CHAT_GROUP_ONE_TO_ONE
--------------------------------------------------------

  CREATE TABLE "IMFIND"."CHAT_GROUP_ONE_TO_ONE" 
   (	"SENDER" VARCHAR2(50 BYTE), 
	"RECIEVER" VARCHAR2(50 BYTE), 
	"GROUP_ID" NUMBER, 
	"HEADER" VARCHAR2(500 BYTE), 
	"CREATE_DATE" DATE, 
	"LOST_POSTNUM" NUMBER, 
	"PET_POSTNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CHAT_MESSAGE
--------------------------------------------------------

  CREATE TABLE "IMFIND"."CHAT_MESSAGE" 
   (	"SEND_DATE" DATE, 
	"MESSAGE" VARCHAR2(4000 BYTE), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"GROUP_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CHAT_USERS
--------------------------------------------------------

  CREATE TABLE "IMFIND"."CHAT_USERS" 
   (	"ID" VARCHAR2(50 BYTE), 
	"GROUP_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table GRADE
--------------------------------------------------------

  CREATE TABLE "IMFIND"."GRADE" 
   (	"F_ID" VARCHAR2(10 BYTE), 
	"GRADE" NUMBER(4,0), 
	"ID" VARCHAR2(10 BYTE), 
	"LOST_POSTNUM" NUMBER(4,0), 
	"PET_POSTNUM" NUMBER(4,0), 
	"GRADE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LIKETO
--------------------------------------------------------

  CREATE TABLE "IMFIND"."LIKETO" 
   (	"LIKENO" NUMBER(*,0), 
	"LOST_POSTNUM" NUMBER(*,0), 
	"ID" VARCHAR2(100 BYTE), 
	"PET_POSTNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOSTCOM
--------------------------------------------------------

  CREATE TABLE "IMFIND"."LOSTCOM" 
   (	"COM_NUM" NUMBER, 
	"COM_CONTENT" VARCHAR2(4000 BYTE), 
	"COM_DATE" DATE, 
	"ID" VARCHAR2(50 BYTE), 
	"LOST_POSTNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOSTPOST
--------------------------------------------------------

  CREATE TABLE "IMFIND"."LOSTPOST" 
   (	"LOST_POSTNUM" NUMBER, 
	"LOST_TITLE" VARCHAR2(500 BYTE), 
	"LOST_CONTENT" VARCHAR2(4000 BYTE), 
	"LOST_RE_DATE" DATE, 
	"LOST_RE_COUNT" NUMBER, 
	"LOST_UP_FILE" VARCHAR2(2000 BYTE), 
	"LOST_PAY" NUMBER, 
	"LOST_ITEM" VARCHAR2(500 BYTE), 
	"LOST_LOC" VARCHAR2(1000 BYTE), 
	"LOST_DATE" DATE, 
	"ID" VARCHAR2(50 BYTE), 
	"PAYCODE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_POSTNUM" IS '분실물글번호';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_TITLE" IS '글제목';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_CONTENT" IS '글내용';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_RE_DATE" IS '날짜(등록)';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_RE_COUNT" IS '조회수';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_UP_FILE" IS 'UP파일';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_PAY" IS '사례금액';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_ITEM" IS '분실물명';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_LOC" IS '분실위치';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."LOST_DATE" IS '분실날짜';
   COMMENT ON COLUMN "IMFIND"."LOSTPOST"."ID" IS '회원ID';
   COMMENT ON TABLE "IMFIND"."LOSTPOST"  IS '분실물게시글(LostPost)';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "IMFIND"."MEMBER" 
   (	"ID" VARCHAR2(50 BYTE), 
	"PW" VARCHAR2(100 BYTE), 
	"NAME" VARCHAR2(10 BYTE), 
	"CONTACT" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"ACCOUNT_NUM" NUMBER, 
	"BANK" VARCHAR2(200 BYTE), 
	"ACCOUNT_HOLDER" VARCHAR2(200 BYTE), 
	"JOIN_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PAY
--------------------------------------------------------

  CREATE TABLE "IMFIND"."PAY" 
   (	"PAYCODE" VARCHAR2(200 BYTE), 
	"PAY_AMOUNT" NUMBER, 
	"PAY_STATE" VARCHAR2(100 BYTE), 
	"PAY_DATE" DATE, 
	"DEAL_STATE" VARCHAR2(100 BYTE), 
	"DEAL_DATE" DATE, 
	"ID" VARCHAR2(50 BYTE), 
	"F_ID" VARCHAR2(50 BYTE), 
	"LOST_POSTNUM" NUMBER, 
	"PET_POSTNUM" NUMBER, 
	"CANCEL_DATE" DATE, 
	"DEAL_COMPLETED_DATE" VARCHAR2(200 BYTE), 
	"ADJUSTMENT_STATE" VARCHAR2(200 BYTE), 
	"ADJUSTMENT_DATE" DATE, 
	"DEFERMENT_PERIOD" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PETCOM
--------------------------------------------------------

  CREATE TABLE "IMFIND"."PETCOM" 
   (	"PET_COMNUM" NUMBER, 
	"PET_COMCONTENT" VARCHAR2(4000 BYTE), 
	"PET_COMDATE" DATE, 
	"ID" VARCHAR2(50 BYTE), 
	"PET_POSTNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PETPOST
--------------------------------------------------------

  CREATE TABLE "IMFIND"."PETPOST" 
   (	"PET_POSTNUM" NUMBER, 
	"PET_TITLE" VARCHAR2(500 BYTE), 
	"PET_CONTENT" VARCHAR2(4000 BYTE), 
	"PET_RE_DATE" DATE, 
	"PET_PAY" VARCHAR2(20 BYTE), 
	"PET_UP_FILE" VARCHAR2(2000 BYTE), 
	"PET_NAME" VARCHAR2(100 BYTE), 
	"PET_LOSTDATE" DATE, 
	"PET_LOC" VARCHAR2(200 BYTE), 
	"ID" VARCHAR2(50 BYTE), 
	"PAYCODE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PET_COMMENT
--------------------------------------------------------

  CREATE TABLE "IMFIND"."PET_COMMENT" 
   (	"COM_NUM" NUMBER, 
	"RE_COM_NUM" NUMBER, 
	"COM_CONTENT" VARCHAR2(4000 BYTE), 
	"RE_COM_CONTENT" VARCHAR2(4000 BYTE), 
	"COM_DATE" DATE, 
	"RE_COM_DATE" DATE, 
	"ID" VARCHAR2(50 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"SECRET_COM" VARCHAR2(10 BYTE), 
	"LOST_POSTNUM" NUMBER, 
	"RE_LEV" NUMBER, 
	"RE_SEQ" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PET_REPLY
--------------------------------------------------------

  CREATE TABLE "IMFIND"."PET_REPLY" 
   (	"RE_NUM" NUMBER, 
	"RE_CONTENT" VARCHAR2(4000 BYTE), 
	"RE_DATE" DATE, 
	"ID" VARCHAR2(100 BYTE), 
	"COM_NUM" NUMBER, 
	"PET_POSTNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_LOST
--------------------------------------------------------

  CREATE TABLE "IMFIND"."P_LOST" 
   (	"CODE" NUMBER, 
	"LOST_DATE" DATE, 
	"KIND" VARCHAR2(100 BYTE), 
	"ITEM" VARCHAR2(200 BYTE), 
	"PLACEID" VARCHAR2(100 BYTE), 
	"INFO" VARCHAR2(3000 BYTE), 
	"PHOTO" VARCHAR2(3000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table P_PLACE
--------------------------------------------------------

  CREATE TABLE "IMFIND"."P_PLACE" 
   (	"PLACEID" VARCHAR2(100 BYTE), 
	"CITY" VARCHAR2(100 BYTE), 
	"GU" VARCHAR2(100 BYTE), 
	"DONG" VARCHAR2(100 BYTE), 
	"DEPPLACE" VARCHAR2(100 BYTE), 
	"ADDR" VARCHAR2(100 BYTE), 
	"TEL" VARCHAR2(100 BYTE), 
	"X" VARCHAR2(100 BYTE), 
	"Y" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "IMFIND"."REPLY" 
   (	"RE_NUM" NUMBER, 
	"RE_CONTENT" VARCHAR2(4000 BYTE), 
	"RE_DATE" DATE, 
	"ID" VARCHAR2(100 BYTE), 
	"COM_NUM" NUMBER, 
	"LOST_POSTNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RE_COMMENT
--------------------------------------------------------

  CREATE TABLE "IMFIND"."RE_COMMENT" 
   (	"COM_NUM" NUMBER, 
	"RE_COM_NUM" NUMBER, 
	"COM_CONTENT" VARCHAR2(4000 BYTE), 
	"RE_COM_CONTENT" VARCHAR2(4000 BYTE), 
	"COM_DATE" DATE, 
	"RE_COM_DATE" DATE, 
	"ID" VARCHAR2(50 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"SECRET_COM" VARCHAR2(10 BYTE), 
	"LOST_POSTNUM" NUMBER, 
	"RE_LEV" NUMBER, 
	"RE_SEQ" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table S_LOST
--------------------------------------------------------

  CREATE TABLE "IMFIND"."S_LOST" 
   (	"CODE" VARCHAR2(100 BYTE), 
	"LOST_DATE" DATE, 
	"KIND" VARCHAR2(100 BYTE), 
	"ITEM" VARCHAR2(100 BYTE), 
	"DEPPLACE" VARCHAR2(100 BYTE), 
	"COM" VARCHAR2(100 BYTE), 
	"TEL" VARCHAR2(100 BYTE), 
	"STATE" VARCHAR2(100 BYTE), 
	"INFO" VARCHAR2(4000 BYTE), 
	"PHOTO" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table S_PLACE
--------------------------------------------------------

  CREATE TABLE "IMFIND"."S_PLACE" 
   (	"TEL" VARCHAR2(100 BYTE), 
	"CITY" VARCHAR2(100 BYTE), 
	"GU" VARCHAR2(100 BYTE), 
	"DONG" VARCHAR2(100 BYTE), 
	"DEPPLACE" VARCHAR2(100 BYTE), 
	"ADDR" VARCHAR2(100 BYTE), 
	"X" VARCHAR2(100 BYTE), 
	"Y" VARCHAR2(100 BYTE), 
	"PLACEID" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CHAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_CHAT" ON "IMFIND"."CHAT" ("NOT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_LOSTCOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_LOSTCOM" ON "IMFIND"."LOSTCOM" ("COM_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_LOSTPOST
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_LOSTPOST" ON "IMFIND"."LOSTPOST" ("LOST_POSTNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_MEMBER" ON "IMFIND"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PATCOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_PATCOM" ON "IMFIND"."PETCOM" ("PET_COMNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PATPOST
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_PATPOST" ON "IMFIND"."PETPOST" ("PET_POSTNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PAY
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."PK_PAY" ON "IMFIND"."PAY" ("PAYCODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index P_LOST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."P_LOST_PK" ON "IMFIND"."P_LOST" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0011105
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."SYS_C0011105" ON "IMFIND"."P_PLACE" ("PLACEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007159
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."SYS_C007159" ON "IMFIND"."LIKETO" ("LIKENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007185
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."SYS_C007185" ON "IMFIND"."CHAT_GROUP_ONE_TO_ONE" ("GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007187
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMFIND"."SYS_C007187" ON "IMFIND"."CHAT_USERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger CODE_SET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMFIND"."CODE_SET" 
   before insert on "IMFIND"."P_LOST" 
   for each row 
begin  
   if inserting then 
      if :NEW."CODE" is null then 
         select SEQ_CODE.nextval into :NEW."CODE" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "IMFIND"."CODE_SET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOST_POSTNUM_SET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMFIND"."LOST_POSTNUM_SET" 
   before insert on IMFIND.LOSTPOST
   for each row
begin
   if inserting then
      if :NEW.LOST_POSTNUM is null then
         select SEQ_Lost_PostNum.nextval into :NEW.LOST_POSTNUM from dual;
      end if;
   end if;
end;

/
ALTER TRIGGER "IMFIND"."LOST_POSTNUM_SET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAY_LOST_POSTNUM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMFIND"."PAY_LOST_POSTNUM" 
   before insert on "IMFIND"."PAY" 
   for each row 
begin  
   if inserting then 
      if :NEW."LOST_POSTNUM" is null then 
         select SEQ_LOST_POSTNUM.nextval into :NEW."LOST_POSTNUM" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "IMFIND"."PAY_LOST_POSTNUM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PET_POSTNUM_SET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMFIND"."PET_POSTNUM_SET" before insert on IMFIND.PETPOST
   for each row
begin
   if inserting then
      if :NEW.PET_POSTNUM is null then
         select SEQ_PET_PostNum.nextval into :NEW.PET_POSTNUM from dual;
      end if;
   end if;
end;
/
ALTER TRIGGER "IMFIND"."PET_POSTNUM_SET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_DEFERMENT_PERIOD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMFIND"."SET_DEFERMENT_PERIOD" 
after INSERT on pay
begin
    update pay set DEFERMENT_PERIOD = PAY_DATE + 14;
end;

/
ALTER TRIGGER "IMFIND"."SET_DEFERMENT_PERIOD" ENABLE;
--------------------------------------------------------
--  DDL for Procedure CHECK_DEFERMENT_DATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "IMFIND"."CHECK_DEFERMENT_DATE" 
     IS
        -- Cursor 선언
        CURSOR pay_cursor IS
        SELECT paycode, pay_date, DEFERMENT_PERIOD, pay_state
        FROM pay;
     BEGIN
       FOR pay_cur IN pay_cursor LOOP
             DBMS_OUTPUT.PUT_LINE('거치기간 : ' || pay_cur.DEFERMENT_PERIOD);
             IF(TO_DATE(SYSDATE, 'yyyy mm dd')  = TO_DATE(pay_cur.DEFERMENT_PERIOD, 'yyyy mm dd'))
                 THEN
                    update pay set pay_state = 'expired_deferment_period' where paycode = pay_cur.paycode and pay_state != 'expired_deferment_period';
                    DBMS_OUTPUT.PUT_LINE('거치기간 만료 paycode : ' || pay_cur.paycode);
            END IF;
       END LOOP;
     EXCEPTION
       WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러 발생 ');
   END;
--------------------------------------------------------
--  DDL for Procedure FORCURSOR_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "IMFIND"."FORCURSOR_TEST" 
     IS
        -- Cursor 선언
        CURSOR dept_sum IS
        SELECT paycode
        FROM pay;
     BEGIN
       -- Cursor를 FOR문에서 실행시킨다
       FOR emp_list IN dept_sum LOOP
          DBMS_OUTPUT.PUT_LINE('부서명 : ' || emp_list.paycode);
       END LOOP;
     EXCEPTION
       WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러 발생 ');

   END;

/
--------------------------------------------------------
--  DDL for Procedure SET_DEFERMENT_STATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "IMFIND"."SET_DEFERMENT_STATE" 
(
    pay_cursor out SYS_REFCURSOR
)
   IS
   BEGIN
    OPEN pay_cursor FOR
        SELECT * FROM pay
    END;

    BEGIN
        IF(pay_cursor.pay_date + 14 = DEFERMENT_PERIOD)
        THEN 
            update pay set pay_state = 'expired_date_refund' where paycode = pay_cursor.paycode;
        END IF;
    END;
END SET_DEFERMENT_STATE;

/
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "IMFIND"."CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY ("NOT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."CHAT" MODIFY ("NOT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."CHAT" MODIFY ("RECEIVE_ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."CHAT" MODIFY ("SENT_ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."CHAT" MODIFY ("NOT_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHAT_GROUP_ONE_TO_ONE
--------------------------------------------------------

  ALTER TABLE "IMFIND"."CHAT_GROUP_ONE_TO_ONE" ADD PRIMARY KEY ("GROUP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."CHAT_GROUP_ONE_TO_ONE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHAT_USERS
--------------------------------------------------------

  ALTER TABLE "IMFIND"."CHAT_USERS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."CHAT_USERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LIKETO
--------------------------------------------------------

  ALTER TABLE "IMFIND"."LIKETO" ADD PRIMARY KEY ("LIKENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."LIKETO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LIKETO" MODIFY ("LIKENO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOSTCOM
--------------------------------------------------------

  ALTER TABLE "IMFIND"."LOSTCOM" ADD CONSTRAINT "PK_LOSTCOM" PRIMARY KEY ("COM_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."LOSTCOM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTCOM" MODIFY ("COM_CONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOSTPOST
--------------------------------------------------------

  ALTER TABLE "IMFIND"."LOSTPOST" ADD CONSTRAINT "PK_LOSTPOST" PRIMARY KEY ("LOST_POSTNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("LOST_DATE" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("LOST_ITEM" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("LOST_RE_DATE" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("LOST_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("LOST_TITLE" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."LOSTPOST" MODIFY ("LOST_POSTNUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "IMFIND"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."MEMBER" MODIFY ("CONTACT" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."MEMBER" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAY
--------------------------------------------------------

  ALTER TABLE "IMFIND"."PAY" ADD CONSTRAINT "PK_PAY" PRIMARY KEY ("PAYCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "IMFIND"."PAY" MODIFY ("PAYCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PETCOM
--------------------------------------------------------

  ALTER TABLE "IMFIND"."PETCOM" ADD CONSTRAINT "PK_PATCOM" PRIMARY KEY ("PET_COMNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PETPOST
--------------------------------------------------------

  ALTER TABLE "IMFIND"."PETPOST" ADD CONSTRAINT "PK_PATPOST" PRIMARY KEY ("PET_POSTNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PET_COMMENT
--------------------------------------------------------

  ALTER TABLE "IMFIND"."PET_COMMENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."PET_COMMENT" MODIFY ("COM_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."PET_COMMENT" MODIFY ("COM_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table P_PLACE
--------------------------------------------------------

  ALTER TABLE "IMFIND"."P_PLACE" ADD PRIMARY KEY ("PLACEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RE_COMMENT
--------------------------------------------------------

  ALTER TABLE "IMFIND"."RE_COMMENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."RE_COMMENT" MODIFY ("COM_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "IMFIND"."RE_COMMENT" MODIFY ("COM_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CHAT_MESSAGE
--------------------------------------------------------

  ALTER TABLE "IMFIND"."CHAT_MESSAGE" ADD CONSTRAINT "CHAT_MSG_GROUP_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "IMFIND"."CHAT_GROUP_ONE_TO_ONE" ("GROUP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHAT_USERS
--------------------------------------------------------

  ALTER TABLE "IMFIND"."CHAT_USERS" ADD CONSTRAINT "GROUP_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "IMFIND"."CHAT_GROUP_ONE_TO_ONE" ("GROUP_ID") ENABLE;
