/**********************************/
/* Table Name: 커스텀주문 */
/**********************************/
1. 테이블 생성
DROP TABLE p_order;

CREATE TABLE p_order(
		orderno                       		MEDIUMINT		 NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '주문번호',
		mno                      		MEDIUMINT		 NOT NULL COMMENT '회원번호',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '내용',
		cnt                           		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '조회수',
		rdate                         		DATETIME		 NULL  COMMENT '날짜'
) COMMENT='커스텀주문';
 

2. 등록
INSERT INTO p_order(mno,title,content,rdate)
VALUES (1,'제목1','내용1',now());
 
INSERT INTO p_order(mno,title,content,rdate)
VALUES (2,'제목2','내용2',now());

INSERT INTO p_order(mno,title,content,rdate)
VALUES (3,'제목3','내용3',now());
 

SELECT * FROM p_order;
 
 orderno mno title content cnt rdate
 ------- --- ----- ------- --- ---------------------
       1   1 제목1   내용1       0 2016-02-02 16:31:52.0
       2   2 제목2   내용2       0 2016-02-02 16:31:53.0
       3   3 제목3   내용3       0 2016-02-02 16:31:54.0
 
      
3. 목록
1) 전체 목록
SELECT orderno,mno,title,content,cnt,rdate
FROM p_order
ORDER BY orderno ASC;
 
  orderno mno title content cnt rdate
 ------- --- ----- ------- --- ---------------------
       1   1 제목1   내용1       0 2016-02-02 16:31:52.0
       2   2 제목2   내용2       0 2016-02-02 16:31:53.0
       3   3 제목3   내용3       0 2016-02-02 16:31:54.0

4)조회
SELECT orderno,mno,title,content,cnt,rdate
FROM p_order
WHERE orderno=2;

orderno mno title content cnt rdate
 ------- --- ----- ------- --- ---------------------
       2   2 제목2   내용 수정     0 2016-02-02 16:31:53.0


4. 수정
UPDATE p_order
SET content='내용 수정'
WHERE orderno=2;
 
 
5. 삭제
DELETE FROM p_order
WHERE orderno=3;
