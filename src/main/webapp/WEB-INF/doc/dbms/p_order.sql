/**********************************/
/* Table Name: Ŀ�����ֹ� */
/**********************************/
1. ���̺� ����
DROP TABLE p_order;

CREATE TABLE p_order(
		orderno                       		MEDIUMINT		 NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '�ֹ���ȣ',
		mno                      		MEDIUMINT		 NOT NULL COMMENT 'ȸ����ȣ',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '����',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '����',
		cnt                           		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '��ȸ��',
		rdate                         		DATETIME		 NULL  COMMENT '��¥'
) COMMENT='Ŀ�����ֹ�';
 

2. ���
INSERT INTO p_order(mno,title,content,rdate)
VALUES (1,'����1','����1',now());
 
INSERT INTO p_order(mno,title,content,rdate)
VALUES (2,'����2','����2',now());

INSERT INTO p_order(mno,title,content,rdate)
VALUES (3,'����3','����3',now());
 

SELECT * FROM p_order;
 
 orderno mno title content cnt rdate
 ------- --- ----- ------- --- ---------------------
       1   1 ����1   ����1       0 2016-02-02 16:31:52.0
       2   2 ����2   ����2       0 2016-02-02 16:31:53.0
       3   3 ����3   ����3       0 2016-02-02 16:31:54.0
 
      
3. ���
1) ��ü ���
SELECT orderno,mno,title,content,cnt,rdate
FROM p_order
ORDER BY orderno ASC;
 
  orderno mno title content cnt rdate
 ------- --- ----- ------- --- ---------------------
       1   1 ����1   ����1       0 2016-02-02 16:31:52.0
       2   2 ����2   ����2       0 2016-02-02 16:31:53.0
       3   3 ����3   ����3       0 2016-02-02 16:31:54.0

4)��ȸ
SELECT orderno,mno,title,content,cnt,rdate
FROM p_order
WHERE orderno=2;

orderno mno title content cnt rdate
 ------- --- ----- ------- --- ---------------------
       2   2 ����2   ���� ����     0 2016-02-02 16:31:53.0


4. ����
UPDATE p_order
SET content='���� ����'
WHERE orderno=2;
 
 
5. ����
DELETE FROM p_order
WHERE orderno=3;
