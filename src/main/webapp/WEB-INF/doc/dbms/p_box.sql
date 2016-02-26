/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
DROP TABLE p_box

CREATE TABLE p_box(
    cartno                            SMALLINT     NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '��ٱ��Ϲ�ȣ',
    pcnt                  SMALLINT        NOT NULL COMMENT '����',
    tot                             INT    NULL  COMMENT '�հ�',
    mno                               INT   NOT NULL   ,
    p_contentno                         MEDIUMINT     NOT NULL,
    FOREIGN KEY (mno) REFERENCES member (mno),
    FOREIGN KEY (p_contentno) REFERENCES p_content (p_contentno)
) COMMENT='��ٱ���';

2. ���
INSERT INTO p_box(pcnt, tot, mno, p_contentno)
VALUES (1, 30000 , 1 , 1  );
 
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
 

SELECT cartno,pcnt,tot,mno,p_contentno,rdate FROM p_box;
      
 cartno pcnt tot   mno p_contentno rdate
 ------ ---- ----- --- ----------- ----------
      1    1 30000   1           1 2016-02-26


SELECT b.cartno, c.title, c.money, b.pcnt, b.tot, b.mno, b.p_contentno 
FROM p_content c, p_box b
WHERE c.p_contentno = b.p_contentno and mno = 1
ORDER BY cartno ASC

  cartno title          pcnt tot   mno p_contentno
 ------ -------------- ---- ----- --- -----------
      4 Iphone6+ �������̽�    1 30000   1           1
      5 Iphone6+ �������̽�    1 40000   2           2
      6 Iphone6+ �������̽�    3 90000   3           1



 
      
      
3. ���
1) ��ü ���
  SELECT b.cartno, c.title, c.money, b.pcnt, b.tot, b.mno, b.p_contentno
   FROM p_content c, p_box b
   WHERE c.p_contentno = b.p_contentno
   ORDER BY cartno ASC

 cartno mno producttitle p_contentno pcnt total
 ------ --- ------------ --------- --- -----
      3   3 ������                  3   1 10000
      2   2 ���͸�                  2   1 10000
      1   1 ���̽�                  1   1 10000



4)��ȸ
SELECT b.cartno, c.title, c.money, b.pcnt, b.tot, b.mno, b.p_contentno, c.file, c.p_categoryno
FROM p_content c, p_box b
WHERE c.p_contentno = b.p_contentno and mno = 1;
 
 cartno title          money  pcnt tot mno p_contentno file            p_categoryno
 ------ -------------- ------ ---- --- --- ----------- --------------- ------------
     27 fhf             30000    3   0   1           9 12_mini.jpg                1
     25 iphone6 + ?���̽� 500000   20   0   1          10 cookie_mini.jpg            1
     26 iphone6 + ?���̽� 500000   30   0   1          10 cookie_mini.jpg            1
     28 iphone6 + ?���̽� 500000    1   0   1          10 cookie_mini.jpg            1
     30 iphone6 + ?���̽� 500000    1   0   1          10 cookie_mini.jpg            1
     34 iphone6 + ?���̽� 500000    1   0   1          10 cookie_mini.jpg            1



4. ����
UPDATE p_box
SET pcnt=4 
WHERE cartno=2;
 
 
5. ����
DELETE FROM p_box
WHERE cartno=3;
