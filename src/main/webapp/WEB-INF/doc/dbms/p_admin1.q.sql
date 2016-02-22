DROP TABLE admin1; 

CREATE TABLE admin1(
		admin1no                      		INT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		email                         		VARCHAR(50)		 NOT NULL COMMENT '이메일',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '패스워드',
		auth                          		VARCHAR(20)		 NOT NULL COMMENT '메일인증코드',
		act                           		CHAR(1)		 NOT NULL COMMENT '권한',
		confirm                       		CHAR(1)		 NOT NULL COMMENT '이메일링크클릭여부',
		mdate                         		DATETIME		 NOT NULL COMMENT '날짜',
		mno                           		INT		 NULL  COMMENT '번호',
		art3no                        		MEDIUMINT		 NULL  COMMENT '번호',
  CONSTRAINT email UNIQUE (email)
) COMMENT='관리자';

1) 중복 이메일 SQL 
    SELECT COUNT(email) as cnt
    FROM admin1
    WHERE email = 'test1@mail.com';

    cnt
    ---
     1

2) MASTER 계정 조회
    SELECT COUNT(admin1no) as cnt
    FROM admin1
    WHERE act = 'M';

3) 관리자 등록   
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test1@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());

   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test2@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
   
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test3@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());

   SELECT * FROM admin1;
    cnt
    ---
    0
 4) 이메일 인증
UPDATE admin1
SET confirm = 'Y'
WHERE email='vermouth232@gmail.com' AND auth='AXD0123456789012';

3. 목록

   SELECT admin1no, email, auth, act, confirm, mdate
   FROM admin1
   ORDER BY admin1no ASC;

2) 권한의 변경
UPDATE admin1
SET act='Y' 
WHERE admin1no=1;

        

8. 회원 정보 조회
   SELECT admin1no, email, passwd, auth, act, confirm, mdate
   FROM admin1
   WHERE admin1no = 1;

9. 패스워드 변경
1) 기존 패스워드 검사 
- DAO: public int countPasswd(int admin1no, String passwd){ ... }
SELECT count(*) as cnt
FROM admin1
WHERE admin1no = 1 AND passwd='123';

2) 패스워드 변경 
- DAO: public int updatePasswd(int admin1no, String passwd){ ... }
 UPDATE admin1
 SET passwd='';
 WHERE admin1no=1;


10.  회원 정보 수정 

   UPDATE admin1
   SET email='';
   WHERE admin1no = 1;     
   
   UPDATE admin1
   SET act = 'M'
   WHERE email='test1@mail.com';
   
11. 'admin1' 회원 삭제 
   DELETE FROM admin1;

   DELETE FROM admin1
   WHERE admin1no = 2;


12. 로그인 관련 SQL 
- DAO: public int login(String email, String passwd){ ... }

SELECT * FROM admin1 ORDER BY email ASC;

1)일반적인 로그인
SELECT count(*) as cnt 
FROM admin1
WHERE email = 'test1@mail.com' AND passwd='1234';
   
    