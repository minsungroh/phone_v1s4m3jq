/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE p_box

CREATE TABLE p_box(
    cartno                            SMALLINT     NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
    pcnt                  SMALLINT        NOT NULL COMMENT '수량',
    tot                             INT    NULL  COMMENT '합계',
    mno                               INT   NOT NULL   ,
    p_contentno                         MEDIUMINT     NOT NULL,
    FOREIGN KEY (mno) REFERENCES member (mno),
    FOREIGN KEY (p_contentno) REFERENCES p_content (p_contentno)
) COMMENT='장바구니';

2. 등록
INSERT INTO p_box(pcnt, tot, mno, p_contentno)
VALUES (1, 30000 , 1 , 1 );
 
INSERT INTO p_box(pcnt, tot, mno, p_contentno)
VALUES (1, 40000 , 2 , 2 );

INSERT INTO p_box(pcnt, tot, mno, p_contentno)
VALUES (3, 90000, 3, 1);
 

SELECT * FROM p_box;
 
cartno pcnt tot   mno p_contentno
 ------ ---- ----- --- -----------
      4    1 30000   1           1
      5    1 40000   2           2
      6    3 90000   3           1
 

SELECT cartno,pcnt,tot,mno,p_contentno FROM p_box;
      
 cartno pcnt tot   mno p_contentno
 ------ ---- ----- --- -----------
      4    1 30000   1           1
      5    1 40000   2           2
      6    3 90000   3           1

SELECT b.cartno, c.title, c.money, b.pcnt, b.tot, b.mno, b.p_contentno 
FROM p_content c, p_box b
WHERE c.p_contentno = b.p_contentno and mno = 1
ORDER BY cartno ASC

  cartno title          pcnt tot   mno p_contentno
 ------ -------------- ---- ----- --- -----------
      4 Iphone6+ 젤리케이스    1 30000   1           1
      5 Iphone6+ 가죽케이스    1 40000   2           2
      6 Iphone6+ 젤리케이스    3 90000   3           1



 
      
      
3. 목록
1) 전체 목록
  SELECT b.cartno, c.title, c.money, b.pcnt, b.tot, b.mno, b.p_contentno
   FROM p_content c, p_box b
   WHERE c.p_contentno = b.p_contentno
   ORDER BY cartno ASC

 cartno mno producttitle p_contentno pcnt total
 ------ --- ------------ --------- --- -----
      3   3 충전기                  3   1 10000
      2   2 배터리                  2   1 10000
      1   1 케이스                  1   1 10000



4)조회
SELECT b.cartno, c.title, c.money, b.pcnt, b.tot, b.mno, b.p_contentno, c.file
FROM p_content c, p_box b
WHERE c.p_contentno = b.p_contentno and mno = 1;
 

 cartno mno producttitle p_contentno pcnt total
 ------ --- ------------ --------- --- -----
      2   2 배터리                  2   1 10000


4. 수정
UPDATE p_box
SET pcnt=4 
WHERE cartno=2;
 
 
5. 삭제
DELETE FROM p_box
WHERE cartno=3;
