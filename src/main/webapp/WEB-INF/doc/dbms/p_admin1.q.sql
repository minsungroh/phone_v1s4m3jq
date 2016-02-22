DROP TABLE admin1; 

CREATE TABLE admin1(
		admin1no                      		INT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		email                         		VARCHAR(50)		 NOT NULL COMMENT '�̸���',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '�н�����',
		auth                          		VARCHAR(20)		 NOT NULL COMMENT '���������ڵ�',
		act                           		CHAR(1)		 NOT NULL COMMENT '����',
		confirm                       		CHAR(1)		 NOT NULL COMMENT '�̸��ϸ�ũŬ������',
		mdate                         		DATETIME		 NOT NULL COMMENT '��¥',
		mno                           		INT		 NULL  COMMENT '��ȣ',
		art3no                        		MEDIUMINT		 NULL  COMMENT '��ȣ',
  CONSTRAINT email UNIQUE (email)
) COMMENT='������';

1) �ߺ� �̸��� SQL 
    SELECT COUNT(email) as cnt
    FROM admin1
    WHERE email = 'test1@mail.com';

    cnt
    ---
     1

2) MASTER ���� ��ȸ
    SELECT COUNT(admin1no) as cnt
    FROM admin1
    WHERE act = 'M';

3) ������ ���   
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
 4) �̸��� ����
UPDATE admin1
SET confirm = 'Y'
WHERE email='vermouth232@gmail.com' AND auth='AXD0123456789012';

3. ���

   SELECT admin1no, email, auth, act, confirm, mdate
   FROM admin1
   ORDER BY admin1no ASC;

2) ������ ����
UPDATE admin1
SET act='Y' 
WHERE admin1no=1;

        

8. ȸ�� ���� ��ȸ
   SELECT admin1no, email, passwd, auth, act, confirm, mdate
   FROM admin1
   WHERE admin1no = 1;

9. �н����� ����
1) ���� �н����� �˻� 
- DAO: public int countPasswd(int admin1no, String passwd){ ... }
SELECT count(*) as cnt
FROM admin1
WHERE admin1no = 1 AND passwd='123';

2) �н����� ���� 
- DAO: public int updatePasswd(int admin1no, String passwd){ ... }
 UPDATE admin1
 SET passwd='';
 WHERE admin1no=1;


10.  ȸ�� ���� ���� 

   UPDATE admin1
   SET email='';
   WHERE admin1no = 1;     
   
   UPDATE admin1
   SET act = 'M'
   WHERE email='test1@mail.com';
   
11. 'admin1' ȸ�� ���� 
   DELETE FROM admin1;

   DELETE FROM admin1
   WHERE admin1no = 2;


12. �α��� ���� SQL 
- DAO: public int login(String email, String passwd){ ... }

SELECT * FROM admin1 ORDER BY email ASC;

1)�Ϲ����� �α���
SELECT count(*) as cnt 
FROM admin1
WHERE email = 'test1@mail.com' AND passwd='1234';
   
    