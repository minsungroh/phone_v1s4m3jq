/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
DROP TABLE p_box

CREATE TABLE p_box(
		cartno                        		SMALLINT		 NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '��ٱ��Ϲ�ȣ',
		mno                      		MEDIUMINT		 NOT NULL COMMENT 'ȸ����ȣ',
		producttitle                  		VARCHAR(200)		 NOT NULL COMMENT '��ǰ�̸�',
		productno                     		SMALLINT		 NOT NULL COMMENT '��ǰ��ȣ',
		cnt 									SMALLINT        NOT NULL COMMENT '����',
		total                         		INT		 NULL  COMMENT '�հ�'
) COMMENT='��ٱ���';

2. ���
INSERT INTO p_box(mno, producttitle, productno, cnt, total)
VALUES (1, '���̽�' , 1 , 1 ,10000);
 
INSERT INTO p_box(mno,producttitle,productno,cnt,total)
VALUES (2,'���͸�',2,1,10000);

INSERT INTO p_box(mno,producttitle,productno,cnt,total)
VALUES (3,'������',3,1,10000);
 

SELECT * FROM p_box;
 
 cartno mno producttitle productno cnt total
 ------ --- ------------ --------- --- -----
      1   1 ���̽�                  1   1 10000
      2   2 ���͸�                  2   1 10000
      3   3 ������                  3   1 10000

 
      
3. ���
1) ��ü ���
SELECT cartno,mno,producttitle,productno,cnt,total
FROM p_box
ORDER BY cartno DESC;


 cartno mno producttitle productno cnt total
 ------ --- ------------ --------- --- -----
      3   3 ������                  3   1 10000
      2   2 ���͸�                  2   1 10000
      1   1 ���̽�                  1   1 10000

 

4)��ȸ
SELECT cartno,mno,producttitle,productno,cnt,total
FROM p_box
WHERE cartno=2;

 cartno mno producttitle productno cnt total
 ------ --- ------------ --------- --- -----
      2   2 ���͸�                  2   1 10000


4. ����
UPDATE p_box
SET cnt=4 
WHERE cartno=2;
 
 
5. ����
DELETE FROM p_box
WHERE cartno=3;
