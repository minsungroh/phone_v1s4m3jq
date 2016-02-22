1. ���̺� ���
drop table IF EXISTS deliveryaddr;

CREATE TABLE deliveryaddr(
    dno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    dcategory                         VARCHAR(30)    NULL COMMENT 'ī�װ�',
    dname                             VARCHAR(30)    NOT NULL COMMENT '�̸�',
    dzipcode                          VARCHAR(10)    NULL  COMMENT '�����ȣ',
    daddr1                            VARCHAR(80)    NULL  COMMENT '�ּ�1',
    daddr2                            VARCHAR(50)    NULL  COMMENT '�ּ�2',
    dphone                            VARCHAR(20)    NULL  COMMENT '�޴���ȭ',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����ּҷ�';


2. ���
insert into deliveryaddr(dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno)
values('�츮��', '�Ƹ���', '12345', '����� ���α�', '����3��', '010-1111-1111', '1');

insert into deliveryaddr(dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno)
values('ȸ��', '�Ƹ���', '12345', '����� ������', '���ﵿ', '010-1111-1111', '3');

insert into deliveryaddr(dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno)
values('�츮��2', '�Ƹ���', '12345', '��⵵ ���ν�', '���ﱸ', '010-1111-1111', '2');


3. ���
select dno, dcategory, dname, dzipcode, daddr1, dadd2, dphone, mno
from deliveryaddr
order by dno asc;

4. ��ȸ
select dno, dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno
from deliveryaddr
where mno='1';

5. ����
update deliveryaddr 
set dcategory='ȸ��', dname = '����', dzipcode='12312', daddr1='�츮����', daddr2='����', dphone='010-2222-2222'
where dno='1';

6. �� ã��
select count(dno) as cnt
from deliveryaddr
where dcategory='�츮��';

7. ����
delete from deliveryaddr;

delete from deliveryaddr 
where dno='1';