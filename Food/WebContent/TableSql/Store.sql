/*매장 기본 테이블*/
CREATE TABLE STORE 
(	
	COUNT           NUMBER(30,0) NOT NULL ENABLE, 
	STOREID         VARCHAR2(50 BYTE), 
	ID              VARCHAR2(50 BYTE), 
	NAME            VARCHAR2(50 BYTE), 
	STORENAME       VARCHAR2(50 BYTE), 
	CATEGORY        VARCHAR2(50 BYTE), 
	STOREADDRNUM    VARCHAR2(20 BYTE), 
	STOREADDR       VARCHAR2(1000 BYTE), 
	STOREADDRDETAIL VARCHAR2(1000 BYTE), 
	STORETEL        VARCHAR2(50 BYTE), 
	PERMIT          VARCHAR2(50 BYTE), 
	THUMBNAILIMG    VARCHAR2(100 BYTE), 
	TN_IMG_PATH     vARCHAR2(4000 BYTE)
);
   COMMENT ON COLUMN STORE.STOREID IS '가게아이디';
   COMMENT ON COLUMN STORE.ID IS '점주 아이디';
   COMMENT ON COLUMN STORE.NAME IS '점주 이름';
   COMMENT ON COLUMN STORE.STORENAME IS '가게 이름';
   COMMENT ON COLUMN STORE.CATEGORY IS '음식 카테고리 ex)한식, 분식';
   COMMENT ON COLUMN STORE.STOREADDRNUM IS '우편번호';
   COMMENT ON COLUMN STORE.STOREADDR IS '기본주소';
   COMMENT ON COLUMN STORE.STOREADDRDETAIL IS '상세주소';
   COMMENT ON COLUMN STORE.STORETEL IS '가게 연락처';
   COMMENT ON COLUMN STORE.PERMIT IS '가게 등록 승인여부';
   COMMENT ON COLUMN STORE.THUMBNAILIMG IS '매장 미리보기 사진';
   COMMENT ON COLUMN STORE.TN_IMG_PATH IS '미리보기 사진 경로';

/*관리자로부터 매장등록 승인을 받은 후
	점주가 최종수정·등록할때 매장의 추가정보가 들어가는 테이블*/

CREATE TABLE REG_STORE 
(	
	STOREID 	VARCHAR2(50 BYTE) 		NOT NULL ENABLE, 
	MENU 		VARCHAR2(1000 BYTE), 
	FILENAME1 	VARCHAR2(100 BYTE), 
	FILENAME2 	VARCHAR2(100 BYTE), 
	FILENAME3 	VARCHAR2(100 BYTE), 
	FILENAME4 	VARCHAR2(100 BYTE), 
	FILENAME5 	VARCHAR2(100 BYTE), 
	IMG_PATH 	VARCHAR2(4000 BYTE)
) ;
 COMMENT ON COLUMN REG_STORE.STOREID IS '가게아이디';
 COMMENT ON COLUMN REG_STORE.MENU IS '메뉴';
 COMMENT ON COLUMN REG_STORE.FILENAME1 IS '상세 이미지1';
 COMMENT ON COLUMN REG_STORE.FILENAME2 IS '상세 이미지2';
 COMMENT ON COLUMN REG_STORE.FILENAME3 IS '상세 이미지3';
 COMMENT ON COLUMN REG_STORE.FILENAME4 IS '상세 이미지4';
 COMMENT ON COLUMN REG_STORE.FILENAME5 IS '상세 이미지5';
 COMMENT ON COLUMN REG_STORE.IMG_PATH IS '이미지path';
 
 CREATE SEQUENCE STORE_SEQ;