1 ���̺� ���
drop table IF EXISTS payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    item                              TEXT     NOT NULL COMMENT '������ ��ǰ',
    orderno                           VARCHAR(10000)     NOT NULL COMMENT '��ǰ��ȣ',
    caseno                            BIGINT     NOT NULL COMMENT '��ٱ��Ϲ�ȣ',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '������ ��ǰ ����',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '��ǰ ����',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '�����ݾ�',
    discount_money                    MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '���αݾ�',
    paycharge                         CHAR(1)    DEFAULT 'N'     NOT NULL COMMENT '��������',
    resive_name                       VARCHAR(30)    NULL  COMMENT '�޴»��',
    resive_post                       VARCHAR(10)    NULL  COMMENT '�޴»�������ȣ',
    resive_addr1                      VARCHAR(80)    NULL  COMMENT '�޴��ּ�1',
    resive_addr2                      VARCHAR(50)    NULL  COMMENT '�޴��ּ�2',
    resive_phone                      VARCHAR(20)    NULL  COMMENT '�޴»����ȭ��ȣ',
    paymeans                          VARCHAR(10)    NULL  COMMENT '������',
    card_input                        VARCHAR(20)    NULL  COMMENT 'ī�����',
    discount                          MEDIUMINT    DEFAULT 0     NULL  COMMENT 'ī���Һ�',
    deposit_input                     VARCHAR(20)    NULL  COMMENT '�������Ա�',
    phone_input                       VARCHAR(10)    NULL  COMMENT '�ڵ�������',
    payday                            DATETIME     NULL  COMMENT '���糯¥',
    delivery_memo                     VARCHAR(500)     NULL  COMMENT '��۸޸�',
    pwaybil                           BIGINT(10)     NULL  COMMENT '�ù�����ȣ1',
    pwaybil2                          MEDIUMINT(10)    NULL  COMMENT '�ù�����ȣ2',
    p_categoryno                      MEDIUMINT    NOT NULL COMMENT 'ī�װ���ȣ',
    mno                               INT(10)    NULL  COMMENT 'mno',
    p_contentno                       MEDIUMINT(7)     NULL  COMMENT 'p_contentno',
  FOREIGN KEY (p_contentno) REFERENCES p_content (p_contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  CONSTRAINT  UNIQUE (caseno)
) COMMENT='�ֹ�/����';


2. ���
insert into payment(item, orderno, caseno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, p_contentno, mno, dno)
values('���̽�', '201602020101', '123123', 'file1.jpg', '1', '35000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '1', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, p_contentno, mno, dno)
values('�̾���', '201602030101', 'file2.jpg', '1', '15000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '2', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, p_contentno, mno, dno)
values('���͸�', '201602040101', 'file3.jpg', '1', '50000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '3', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, p_contentno, mno, dno)
values('���͸�', '201602050101', 'file3.jpg', '1', '50000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '5', '1');

3. ���
select payno, item, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, p_contentno, mno, dno
from payment;
l
select * from payment;

4. ��ȸ
select payno, item, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, p_contentno, mno, dno
from payment
where mno = '1';

select payno, item, orderno, caseno, payfile1, pcnt, paymoney
from payment
where caseno='', 

select * from payment
where orderno='201602020101';

select payno, item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, p_contentno, mno, dno
from payment
where mno=1
    
select payno, item, orderno, caseno, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr1, resive_addr2, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, p_contentno, mno
from payment
where mno='1' and paycharge='Y' and caseno;
    
5. ����
update payment
set pcnt='2'
where contentno='1';

update payment
set paycharge='Y', resive_name='', resive_post='', resive_addr1='', resive_addr2= '', resive_phone='', paymeans='', payday='', card_input='', discount='', deposit_input='', phone_input=''
where payno='1';

6. �� ã��
select count(payno) as cnt
from payment
where paymoney='30000';

7. ����
delete from payment

delete from payment
where payno='1';

select * from deliveryaddr

8. ����
select p.p_contentno, p.mno, c.title, c.content, c.file, c.money, c.productcnt
from payment as p
join p_content as c on p.p_contentno = c.p_contentno
where p.p_contentno=1 and p.mno=1;


    select p.p_contentno, p.mno, c.title, c.content, c.file, c.money, c.productcnt, d.dno, p.caseno
    from payment as p
    join p_content as c on p.p_contentno = c.p_contentno
    join deliveryaddr as d on p.dno = d.dno
    where p.p_contentno=1 and p.caseno=42545 and p.mno=1
    
    
        select payno, item, orderno, caseno, payfile1, pcnt, paymoney, paycharge, paymeans, p_contentno, mno, dno
    from payment
    where p_contentno=1 and caseno=42545 and mno=1
    
      update payment as p join point as pnt on p.payno = pnt.payno
      set p.discount_money = #{discount_money}, pnt.totalpoint=#{totalpoint}, pnt.usepoint=#{usepoint}
      where pnt.mno = #{mno}
      
      select p.discount_money, pnt.totalpoint, pnt.usepoint, p.payno
      from payment as p
      join point as pnt on p.payno = pnt.payno
      where p.mno=1
      
      update payment as p join point as pnt on p.payno = pnt.payno
      set p.discount_money=#{discount_money}, pnt.totalpoint=#{totalpoint}, pnt.usepoint=#{usepoint}
      where p.mno=#{mno} and p.payno=#{payno}