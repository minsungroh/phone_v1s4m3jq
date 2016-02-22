/**********************************/
/* Table Name: 코드 code_q.sql */
/**********************************/
1. 테이블 생성
DROP TABLE p_category;

CREATE TABLE p_category(
		p_categoryno                  		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
		title                         		VARCHAR(50)		 NOT NULL COMMENT '제목',
		orderno                       		SMALLINT(5)		DEFAULT 1 NOT NULL COMMENT '정렬순서',
		visible                       		CHAR(1)		DEFAULT 'Y' NOT NULL COMMENT '공개여부',
		ids                           		VARCHAR(100)	 DEFAULT 'admin'	 NOT NULL COMMENT '관리계정',
		cnt                           		MEDIUMINT(7)	DEFAULT 0	 NOT NULL COMMENT '등록된 글 수',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES p_code (codeno)
) COMMENT='카테고리';


2. 등록
INSERT INTO p_category(codeno, title, orderno, visible, ids)
VALUES (1, 'Iphone6', 1, 'Y', 'admin');

INSERT INTO p_category(codeno, title, orderno, visible, ids)
VALUES (1, 'Iphone5', 1, 'Y', 'admin');

INSERT INTO p_category(codeno, title, orderno, visible, ids)
VALUES (2, 'GALAXY6', 1, 'Y', 'admin');


SELECT * FROM p_category;


      
3. 목록
1) 전체 목록
SELECT p_categoryno, title, orderno, visible, ids,cnt,codeno
FROM p_category
ORDER BY p_categoryno ASC;


4. 수정
UPDATE p_category
SET codeno='2', title='AAA', orderno='1', visible='Y', ids='admin', cnt='1' 
WHERE p_categoryno=1;


5. 삭제
DELETE FROM p_category
WHERE p_categoryno=1;



