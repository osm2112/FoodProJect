--Member--
CREATE TABLE MEMBER  (	
	ID 			VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	PASSWORD 	VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	NAME 		VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	GENDER 		VARCHAR2(10 BYTE), 
	BIRTHDAY	 DATE, 
	EMAIL 		VARCHAR2(100 BYTE), 
	PHONE_NUM 	VARCHAR2(50 BYTE), 
 	REG_DATE	DATE DEFAULT sysdate, 
	ADDR_NUM 	VARCHAR2(20 BYTE),  
  	ADDR 		VARCHAR2(1000 BYTE),
	ADDR_DETAIL VARCHAR2(1000 BYTE), 
	USER_STATE 	VARCHAR2(50 BYTE),
	CONSTRAINT PK_MEMBER PRIMARY KEY (ID)
  );
  
   COMMENT ON COLUMN MEMBER.ID IS '회원 id';
   COMMENT ON COLUMN MEMBER.PASSWORD IS '비밀번호';
   COMMENT ON COLUMN MEMBER.NAME IS '회원 이름';
   COMMENT ON COLUMN MEMBER.GENDER IS '성별';
   COMMENT ON COLUMN MEMBER.BIRTHDAY IS '생년월일';
   COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
   COMMENT ON COLUMN MEMBER.PHONE_NUM IS '휴대폰 번호';
   COMMENT ON COLUMN MEMBER.REG_DATE IS '가입날짜';
   COMMENT ON COLUMN MEMBER.ADDR_NUM IS '우편번호';
   COMMENT ON COLUMN MEMBER.ADDR IS '우편 주소';
   COMMENT ON COLUMN MEMBER.ADDR_DETAIL IS '우편 주소 자세히';
   COMMENT ON COLUMN MEMBER.USER_STATE IS '회원 구분(점주/일반회원)';

insert into member(id,password,name) values('admin','admin','관리자');

--post--
create table post
( 
	post_id			varchar2(50) not null primary key,
	write_id 		varchar2(50),
	write_name 		varchar2(50),
	post_date		date,
	post_title 		varchar2(500),
	post_sub		varchar2(1000),
	post_content 		varchar2(4000),
	post_tag 		varchar2(1000),
	post_like 		number,
	post_commend		number,
	main_img		varchar2(500),
	img_path		varchar2(1000)
);

   COMMENT ON COLUMN POST.POST_ID IS '포스트 번호';
   COMMENT ON COLUMN POST.WRITE_ID IS '글쓴이 id';
   COMMENT ON COLUMN POST.WRITE_NAME IS '글쓴이 이름';
   COMMENT ON COLUMN POST.POST_DATE IS '포스트 작성 날짜';
   COMMENT ON COLUMN POST.POST_TITLE IS '포스트 제목';
   COMMENT ON COLUMN POST.POST_SUB IS '포스트 부제목';
   COMMENT ON COLUMN POST.POST_CONTENT IS '포스트 내용';
   COMMENT ON COLUMN POST.POST_TAG IS '포스트 tag(안씀)';
   COMMENT ON COLUMN POST.POST_LIKE IS '포스트 좋아요 수';
   COMMENT ON COLUMN POST.POST_COMMEND IS '포스트 추천 수';
   COMMENT ON COLUMN POST.MAIN_IMG IS '포스트 메인이미지';
   COMMENT ON COLUMN POST.IMG_PATH IS '이미지 경로';
create sequence post_seq;

--POST의 좋아요, 추천 TABLE--
create table likeCommend 
(
	post_id 		varchar2(50),
	write_id 		varchar2(50),
	like_check	 	varchar2(50),
	commend_check  	varchar2(50)
);

   COMMENT ON COLUMN LIKECOMMEND.POST_ID IS '포스트 글 번호';
   COMMENT ON COLUMN LIKECOMMEND.WRITE_ID IS '글쓴이 id';
   COMMENT ON COLUMN LIKECOMMEND.LIKE_CHECK IS '좋아요 눌렀는지 체크(Y/NULL)';
   COMMENT ON COLUMN LIKECOMMEND.COMMEND_CHECK IS '추천 눌렀는지 체크(Y/NULL)';

---------------------------------EVALUATION------------------------------
CREATE TABLE eval
(
	eval_id 	VARCHAR2(50) NOT NULL PRIMARY KEY,
	store_id 	VARCHAR2(50) NOT NULL,
	write_id 	VARCHAR2(50) NOT NULL,
	eval_date	DATE	default sysdate,
	total		number(5)	NOT NULL,
	tasty		number(5)	NOT NULL,
	price		number(5)	NOT NULL,
	service		number(5)	NOT NULL,
	eval_content	VARCHAR2(2000),
	fileName1	VARCHAR2(500),
	fileName2	VARCHAR2(500),
	fileName3	VARCHAR2(500),
	eval_path 		VARCHAR2(1000)
);


   COMMENT ON COLUMN EVAL.EVAL_ID IS '평가 번호';
   COMMENT ON COLUMN EVAL.STORE_ID IS '매장 id';
   COMMENT ON COLUMN EVAL.WRITE_ID IS '글쓴이 id';
   COMMENT ON COLUMN EVAL.EVAL_DATE IS '평가 작성 날짜';
   COMMENT ON COLUMN EVAL.TOTAL IS '매장 전체 별점';
   COMMENT ON COLUMN EVAL.TASTY IS '매장 맛 별점';
   COMMENT ON COLUMN EVAL.PRICE IS '매장 가격 별점';
   COMMENT ON COLUMN EVAL.SERVICE IS '매장 서비스 별점';
   COMMENT ON COLUMN EVAL.EVAL_CONTENT IS '매장 후기';
   COMMENT ON COLUMN EVAL.FILENAME1 IS '매장 사진 첨부1';
   COMMENT ON COLUMN EVAL.FILENAME2 IS '매장 사진 첨부';
   COMMENT ON COLUMN EVAL.FILENAME3 IS '매장 사진 첨부3';
   COMMENT ON COLUMN EVAL.EVAL_PATH IS '사진 서버 경로';

create sequence eval_seq;

CREATE OR REPLACE PROCEDURE pro_log (
        p_id        in varchar2,
        p_pwd       in varchar2,
        checknum    out number
) 
is
        i_pwd varchar2(4000);
begin  
        select  password
          into  i_pwd
          from  member
         where  id = p_id;
  
        if i_pwd = p_pwd then
            checknum := 1;
        else
            checknum := 0;
        end if; 
        exception
          when NO_DATA_FOUND then
          checknum := -1;
end;


create or replace procedure updateMember(p_id varchar2,
                                         p_pwd varchar2,
                                         p_gender varchar2,
                                         p_bday varchar2,
                                         p_email varchar2,
                                         p_pnum varchar2,
                                         p_addrNum varchar2,
                                         p_addr varchar2,
                                         p_addrD varchar2,
                                         p_check out number) is
i_id varchar2(50);                                         
begin
select id into i_id from member where id = p_id;
if i_id = p_id then
  update member set
  password = p_pwd,
  gender = p_gender,
  birthday = p_bday,
  email = p_email,
  phone_num = p_pnum,
  addr_num = p_addrNum,
  addr = p_addr,
  addr_detail = p_addrD
  where id = p_id;
  p_check := 1;
commit;
else 
  p_check := 0;
  end if;
exception 
  when NO_DATA_FOUND then
  p_check := -1;
end;

create or replace procedure updatePost  (
        p_id          varchar2,
        p_title       varchar2,
        p_sub         varchar2,
        p_content     varchar2,
        p_mainImg     varchar2,
        p_imgPath     varchar2,
        p_check   out number
) 
is
begin
        update  post 
           set  post_title = p_title,
                post_sub = p_sub,
                post_content = p_content,
                main_img = p_mainImg,
                img_path = p_imgPath
         where  post_id = p_id;
        p_check := 1;
exception 
        when NO_DATA_FOUND then
        p_check := 0;
end;


create or replace procedure likeUpdate ( p_id       varchar2,
                                         p_writeId    varchar2,
                                          p_count   out  varchar2)is
v_like varchar2(20);
v_count number(2);
v_likeCount number(2);
BEGIN
  SELECT count(*) INTO  v_count 
  FROM likeCommend
  WHERE write_id = p_writeId and post_id = p_id;
  IF v_count = 0 THEN
   INSERT INTO likeCommend
   (post_id, write_id,like_check)
   VALUES(p_id, p_writeId,'Y');
   UPDATE post 
   SET post_like = post_like + 1
   WHERE post_id = p_id;
  ELSE 
    SELECT like_check INTO v_like
    FROM likeCommend
    WHERE write_id = p_writeId and post_id = p_id;
    IF v_like = 'Y' THEN
      UPDATE likeCommend
      SET like_check = null
      WHERE write_id = p_writeId and post_id = p_id;
      UPDATE post 
     SET post_like = post_like - 1
     WHERE post_id = p_id;
    ELSE
       UPDATE likeCommend
       SET like_check = 'Y'
       WHERE write_id = p_writeId and post_id = p_id;
       UPDATE post 
       SET post_like = post_like + 1
       WHERE post_id = p_id;
     END IF;
   END IF;
   
   SELECT post_like INTO v_likeCount
   FROM post
   WHERE post_id = p_id;
   
   IF v_likeCount < 0 THEN
     update post
     set post_like = 0
     where post_id = p_id;
     
     v_likeCount := 0;
     
   END IF;
   p_count := v_likeCount;
END;

create or replace procedure commendUpdate ( p_id       varchar2,
                                            p_writeId    varchar2,
                                            p_count      out varchar2)is
v_commend varchar2(20);
v_count number(2);
v_commendCount number(2);
BEGIN
  SELECT count(*) INTO  v_count 
  FROM likeCommend
  WHERE write_id = p_writeId and post_id = p_id;
  IF v_count = 0 THEN
   INSERT INTO likeCommend
   (post_id, write_id,commend_check)
   VALUES(p_id, p_writeId,'Y');
   UPDATE post 
   SET post_commend = post_commend + 1
   WHERE post_id = p_id;
  ELSE 
    SELECT commend_check INTO v_commend
    FROM likeCommend
    WHERE write_id = p_writeId and post_id = p_id;
    IF v_commend = 'Y' THEN
      UPDATE likeCommend
      SET commend_check = null
      WHERE write_id = p_writeId and post_id = p_id;
      UPDATE post 
     SET post_commend = post_commend - 1
     WHERE post_id = p_id;
    ELSE
       UPDATE likeCommend
       SET commend_check = 'Y'
       WHERE write_id = p_writeId and post_id = p_id;
       UPDATE post 
       SET post_commend = post_commend + 1
       WHERE post_id = p_id;
     END IF; 
   END IF;
   SELECT post_commend INTO v_commendCount
   FROM post
   WHERE post_id = p_id;
   
   IF v_commendCount < 0 THEN
     update post
     set post_commend = 0
     where post_id = p_id;
     v_commendCount := 0;
   END IF;
   p_count := v_commendCount;
END;

create or replace procedure evalCount (	
  			p_id            varchar2,
			p_five    out   number,
			p_four    out   number,
			p_three   out   number,
			p_two     out   number,
			p_one     out   number
)
is

BEGIN
        select count(*) INTO p_five
          from eval
         where store_id = p_id and total = 5;

        select count(*) INTO p_four
      	  from eval
         where store_id = p_id and total = 4;
	
        select count(*) INTO p_three
          from eval
         where store_id = p_id and total = 3;
	
        select count(*) INTO p_two
          from eval
         where store_id = p_id and total = 2;
	
        select count(*) INTO p_one
          from eval
         where store_id = p_id and total = 1;
END;
