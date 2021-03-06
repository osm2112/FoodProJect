/*예약 정보 저장 테이블 */
CREATE TABLE RESERVATION 
(	
	RESERVATION_ID 	VARCHAR2(1000 BYTE), 
	USER_ID 		VARCHAR2(50 BYTE) 							NOT NULL ENABLE, 
	STORE_ID 		VARCHAR2(50 BYTE) 							NOT NULL ENABLE, 
	RESERVE_NAME 	VARCHAR2(100 BYTE) 							NOT NULL ENABLE, 
	RESERVE_DATE 	DATE 										NOT NULL ENABLE, 
	RESERVE_TIME 	NVARCHAR2(100) 								NOT NULL ENABLE, 
	RESERVE_SEAT 	NUMBER(8,0) 								NOT NULL ENABLE, 
	REG_DATE 		DATE  					DEFAULT sysdate		NOT NULL ENABLE, 
	RESERVE_TEL 	VARCHAR2(50 BYTE) 							NOT NULL ENABLE, 
	RESERVE_EMAIL 	VARCHAR2(200 BYTE) 							NOT NULL ENABLE, 
	RESERVE_COMMENT VARCHAR2(4000 BYTE) 						NOT NULL ENABLE, 
  	PRIMARY KEY (RESERVATION_ID) 
);
   COMMENT ON COLUMN RESERVATION.RESERVATION_ID IS '예약번호';
   COMMENT ON COLUMN RESERVATION.USER_ID IS '예약고객ID';
   COMMENT ON COLUMN RESERVATION.STORE_ID IS '가게ID';
   COMMENT ON COLUMN RESERVATION.RESERVE_NAME IS '예약자명';
   COMMENT ON COLUMN RESERVATION.RESERVE_DATE IS '예약일';
   COMMENT ON COLUMN RESERVATION.RESERVE_TIME IS '예약시간';
   COMMENT ON COLUMN RESERVATION.RESERVE_SEAT IS '예약좌석수';
   COMMENT ON COLUMN RESERVATION.REG_DATE IS '등록일자';
   COMMENT ON COLUMN RESERVATION.RESERVE_TEL IS '예약자연락처';
   COMMENT ON COLUMN RESERVATION.RESERVE_EMAIL IS '예약자이메일';
   COMMENT ON COLUMN RESERVATION.RESERVE_COMMENT IS '예약자코멘트';
   
/*에약 좌석 정보 테이블 */
CREATE TABLE RESERVE_SEAT_CHECK 
(	
	STORE_ID 				VARCHAR2(50 BYTE) 				NOT NULL ENABLE, 
	RESERVE_DATE 			DATE 							NOT NULL ENABLE, 
	RESERVE_TIME 			VARCHAR2(100 BYTE) 				NOT NULL ENABLE, 
	RESERVE_SEAT 			NUMBER(10,0)		DEFAULT 0	NOT NULL ENABLE, 
	RESERVE_PERMIT_SEAT 	NUMBER(10,0) 					NOT NULL ENABLE, 
	CONSTRAINT PK_RESERVE_SEAT_CHECK PRIMARY KEY (STORE_ID, RESERVE_DATE, RESERVE_TIME)
)
   COMMENT ON COLUMN RESERVE_SEAT_CHECK.STORE_ID IS '가게ID';
   COMMENT ON COLUMN RESERVE_SEAT_CHECK.RESERVE_DATE IS '일자';
   COMMENT ON COLUMN RESERVE_SEAT_CHECK.RESERVE_TIME IS '시간';
   COMMENT ON COLUMN RESERVE_SEAT_CHECK.RESERVE_SEAT IS '예약된 좌석수';
   COMMENT ON COLUMN RESERVE_SEAT_CHECK.RESERVE_PERMIT_SEAT IS '최대 허용 좌석수';
   
/*예약 번호 */
CREATE SEQUENCE  RESERV_ID_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 341 CACHE 20 NOORDER  NOCYCLE ;

/*예약 삭제를 위한 프로시저 */
CREATE OR REPLACE PROCEDURE DELETE_RESERVATION ( 

      V_RESERVATION_ID VARCHAR2,
      V_USER_ID VARCHAR2,
      v_RESULT OUT INT
      
)
IS

      P_STORE_ID VARCHAR(100);
      p_RESERVE_DATE DATE;
      P_RESERVE_TIME VARCHAR(100);
      P_RESERVE_SEAT NUMBER(5);
      
BEGIN
      SELECT STORE_ID, RESERVE_DATE,
             RESERVE_TIME, RESERVE_SEAT
        INTO P_STORE_ID, p_RESERVE_DATE, 
             P_RESERVE_TIME, P_RESERVE_SEAT
        FROM RESERVATION 
       WHERE RESERVATION_ID = V_RESERVATION_ID
         AND USER_ID = V_USER_ID;
       
      DELETE FROM RESERVATION
       WHERE RESERVATION_ID = V_RESERVATION_ID
         AND USER_ID = V_USER_ID ;
              
      UPDATE RESERVE_SEAT_CHECK
         SET RESERVE_SEAT = RESERVE_SEAT - P_RESERVE_SEAT
       WHERE STORE_ID = p_STORE_ID
         AND RESERVE_DATE = p_RESERVE_DATE
         AND RESERVE_TIME = p_RESERVE_TIME;
        commit;
        v_RESULT :=1;
END DELETE_RESERVATION;

/*예약 등록을 위한 프로시저 */
CREATE OR REPLACE PROCEDURE INSERT_RESERVATION ( 
      V_USER_ID 		IN VARCHAR2, 
      V_STORE_ID 		IN VARCHAR2, 
      V_RESERVE_NAME 	IN VARCHAR2,
      V_RESERVE_DATE 	IN DATE, 
      v_RESERVE_TIME 	IN VARCHAR2, 
      V_RESERVE_SEAT 	IN NUMBER,
      v_RESERVE_TEL 	IN VARCHAR2, 
      V_RESERVE_EMAIL 	IN VARCHAR2, 
      V_RESERVE_COMMENT IN VARCHAR2,
      v_RESERVATION_ID 	OUT VARCHAR2 
)
IS
  P_RESERVATION_ID VARCHAR2(1000) :=TO_CHAR(sysdate,'yyyymmdd')||V_STORE_ID||LPAD(RESERV_ID_SEQ.NEXTVAL,8,0);
BEGIN
      INSERT INTO RESERVATION ( RESERVATION_ID, USER_ID, STORE_ID, RESERVE_NAME,
                                RESERVE_DATE, RESERVE_TIME, RESERVE_SEAT, REG_DATE, 
                                RESERVE_TEL, RESERVE_EMAIL, RESERVE_COMMENT )
      VALUES (P_RESERVATION_ID, V_USER_ID, V_STORE_ID, V_RESERVE_NAME, V_RESERVE_DATE, 
              V_RESERVE_TIME, V_RESERVE_SEAT, SYSDATE, v_RESERVE_TEL, V_RESERVE_EMAIL, 
              V_RESERVE_COMMENT );
              
      UPDATE RESERVE_SEAT_CHECK
      SET RESERVE_SEAT = RESERVE_SEAT + V_RESERVE_SEAT
      WHERE STORE_ID = V_STORE_ID
      AND RESERVE_DATE = V_RESERVE_DATE
      AND RESERVE_TIME = V_RESERVE_TIME;
      v_RESERVATION_ID:=P_RESERVATION_ID;
      
      commit;
END INSERT_RESERVATION;


 
