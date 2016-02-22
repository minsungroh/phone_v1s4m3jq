/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE p_box

CREATE TABLE p_box(
		cartno                        		SMALLINT		 NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
		mno                      		MEDIUMINT		 NOT NULL COMMENT '회원번호',
		producttitle                  		VARCHAR(200)		 NOT NULL COMMENT '상품이름',
		productno                     		SMALLINT		 NOT NULL COMMENT '상품번호',
		cnt 									SMALLINT        NOT NULL COMMENT '수량',
		total                         		INT		 NULL  COMMENT '합계'
) COMMENT='장바구니';

2. 등록
INSERT INTO p_box(mno, producttitle, productno, cnt, total)
VALUES (1, '케이스' , 1 , 1 ,10000);
 
INSERT INTO p_box(mno,producttitle,productno,cnt,total)
VALUES (2,'배터리',2,1,10000);

INSERT INTO p_box(mno,producttitle,productno,cnt,total)
VALUES (3,'충전기',3,1,10000);
 

SELECT * FROM p_box;
 
 cartno mno producttitle productno cnt total
 ------ --- ------------ --------- --- -----
      1   1 케이스                  1   1 10000
      2   2 배터리                  2   1 10000
      3   3 충전기                  3   1 10000

 
      
3. 목록
1) 전체 목록
SELECT cartno,mno,producttitle,productno,cnt,total
FROM p_box
ORDER BY cartno DESC;


 cartno mno producttitle productno cnt total
 ------ --- ------------ --------- --- -----
      3   3 충전기                  3   1 10000
      2   2 배터리                  2   1 10000
      1   1 케이스                  1   1 10000

 

4)조회
SELECT cartno,mno,producttitle,productno,cnt,total
FROM p_box
WHERE cartno=2;

 cartno mno producttitle productno cnt total
 ------ --- ------------ --------- --- -----
      2   2 배터리                  2   1 10000


4. 수정
UPDATE p_box
SET cnt=4 
WHERE cartno=2;
 
 
5. 삭제
DELETE FROM p_box
WHERE cartno=3;
