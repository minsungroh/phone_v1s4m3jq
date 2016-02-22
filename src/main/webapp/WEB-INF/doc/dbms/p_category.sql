/**********************************/
/* Table Name: �ڵ� code_q.sql */
/**********************************/
1. ���̺� ����
DROP TABLE p_category;

CREATE TABLE p_category(
		p_categoryno                  		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
		title                         		VARCHAR(50)		 NOT NULL COMMENT '����',
		orderno                       		SMALLINT(5)		DEFAULT 1 NOT NULL COMMENT '���ļ���',
		visible                       		CHAR(1)		DEFAULT 'Y' NOT NULL COMMENT '��������',
		ids                           		VARCHAR(100)	 DEFAULT 'admin'	 NOT NULL COMMENT '��������',
		cnt                           		MEDIUMINT(7)	DEFAULT 0	 NOT NULL COMMENT '��ϵ� �� ��',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES p_code (codeno)
) COMMENT='ī�װ�';


2. ���
INSERT INTO p_category(codeno, title, orderno, visible, ids)
VALUES (1, 'Iphone6', 1, 'Y', 'admin');

INSERT INTO p_category(codeno, title, orderno, visible, ids)
VALUES (1, 'Iphone5', 1, 'Y', 'admin');

INSERT INTO p_category(codeno, title, orderno, visible, ids)
VALUES (2, 'GALAXY6', 1, 'Y', 'admin');


SELECT * FROM p_category;


      
3. ���
1) ��ü ���
SELECT p_categoryno, title, orderno, visible, ids,cnt,codeno
FROM p_category
ORDER BY p_categoryno ASC;


4. ����
UPDATE p_category
SET codeno='2', title='AAA', orderno='1', visible='Y', ids='admin', cnt='1' 
WHERE p_categoryno=1;


5. ����
DELETE FROM p_category
WHERE p_categoryno=1;



