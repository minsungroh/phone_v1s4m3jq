1.  ���̺� ����

drop table member;

CREATE TABLE member(
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
    id                                VARCHAR(20)    NOT NULL COMMENT 'id',
    passwd                            VARCHAR(20)    NOT NULL COMMENT 'passwd',
    mname                             VARCHAR(20)    NOT NULL COMMENT 'mname',
    nname                             VARCHAR(20)    NOT NULL COMMENT 'nname',
    grade                             CHAR(1)    DEFAULT 'F'     NOT NULL COMMENT 'ȸ�� ���',
    money                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '���űݾ�',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '����Ʈ',
    tel                               VARCHAR(14)    NOT NULL COMMENT 'tel',
    zipcode                           VARCHAR(5)     NULL  COMMENT 'zipcode',
    address1                          VARCHAR(80)    NULL  COMMENT 'address1',
    address2                          VARCHAR(50)    NULL  COMMENT 'address2',
    mdate                             DATETIME     NOT NULL COMMENT 'mdate',
  CONSTRAINT id UNIQUE (id)
) COMMENT='ȸ��';

 -- 'A' : VIP(total 50��, 100���� �̻� ���Ű�), B : ���ȸ��(total 30��, 50���� �̻� ���Ű�), C: ����ȸ��(total : 10��, 10���� �̻� ���� ��), F: �ű�ȸ��
2. ���
insert into member(id, passwd, mname, nname, grade, money, point, tel, zipcode, address1, address2, mdate)
values ('user1', '1234', '�մ���', 'E', 'F', 0, 0, '010-1234-5678', '12345', '����� ��ö��', '��ö��', now());

insert into member(id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate)
values ('user2', '1234', 'ö��', 'J', 'F', 0, 0, '010-1234-5678', '12345', '����� ��ö��', '��ö��', now());

insert into member(id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate)
values ('user3', '1234', '����', 'B', 'F', 0, 0, '010-1234-5678', '12345', '����� ��ö��', '��ö��', now());

insert into member(id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate)
values ('user4', '1234', '����', 'H', 'A', 0, 0, '010-1234-5678', '12345', '����� ��ö��', '��ö��', now());

3. ���
select mno, id, passwd, mname, nname, grade, money, point, tel, zipcode, address1, address2, mdate
from member;


4. ��ȸ
select mno, id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate
from member
where mno='2';


5. ����
update member
set passwd='1111'
where mno='1';

6. �� ã��
select count(int mno) as cnt
from member
where passwd='1234';

7. ����
delete from member
where mno='1';

