/**********************************/
/* Table Name: �ڵ� code_q.sql */
/**********************************/
1. ���̺� ����
DROP TABLE p_content;

CREATE TABLE p_content(
    p_contentno                         MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ǰ��ȣ',
    title                             VARCHAR(200)     NOT NULL COMMENT '��ǰ�̸�',
    content                           MEDIUMTEXT     NOT NULL COMMENT '����',
    file                              VARCHAR(100)     NULL  COMMENT 'Thumb����',
    file1                             VARCHAR(300)     NULL  COMMENT '÷������',
    replycnt                              INT(5)     DEFAULT 0  NULL  COMMENT '��ۼ�',
    money                             MEDIUMINT(10)    NOT NULL COMMENT '��ǰ��',
      p_categoryno                      MEDIUMINT(7)     NULL  COMMENT 'ī�װ���ȣ',
      meterial                          TEXT     NOT NULL COMMENT '����',
  FOREIGN KEY (p_categoryno) REFERENCES p_category (p_categoryno)
) COMMENT='��ǰ����';



2. ���
INSERT INTO p_content(title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno)
VALUES ('Iphone6+ �������̽�', '�������̽�����', 'mainpicture.jpg', 'subpicture.jpg/subpicture2.jpg', 0, '20000', 1, 'Poly', 1);

INSERT INTO p_content(title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno)
VALUES ('Iphone6+ �������̽�', '�������̽�����', 'mainpicture.jpg', 'subpicture.jpg/subpicture2.jpg', 0, '25000', 1, 'Poly',  1);

INSERT INTO p_content(title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno)
VALUES ('Iphone6+ �м����̽�', '�м����̽�����', 'mainpicture.jpg', 'subpicture.jpg/subpicture2.jpg', 0, '30000', 1, 'Poly',  1);


SELECT * FROM p_content;


      
3. ���
1) ��ü ���
SELECT p_contentno, title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno
FROM p_content
ORDER BY p_contentno ASC;

SELECT p_contentno, title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno
FROM p_content
where p_contentno='3';


4. ����
UPDATE p_content
SET title='', content='', file='', file1='', money='',  meterial = '', productcnt=''
WHERE p_contentno=1;


5. ����
DELETE FROM p_content
WHERE p_contentno=1;



