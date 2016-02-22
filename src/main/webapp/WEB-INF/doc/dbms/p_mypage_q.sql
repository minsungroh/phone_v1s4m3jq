1. ���̺� ����
drop table IF EXISTS mypage;

CREATE TABLE mypage(
    mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    orderstate                        VARCHAR(100)     NOT NULL COMMENT '�ֹ�����',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '����Ȯ��',
    my_state                          VARCHAR(30)    NULL  COMMENT '��ۻ���',
    mwaybil                           BIGINT     NOT NULL COMMENT '�����ȣ',
    mwaybil2                          BIGINT     NOT NULL COMMENT '�����ȣ2',
    takeback_state                    VARCHAR(10)    DEFAULT 'N'     NOT NULL COMMENT '��ǰ����',
    takeback_reason                   VARCHAR(100)     NULL  COMMENT '��ǰ����',
    resive_money                      VARCHAR(10)    NULL  COMMENT '��ǰ���',
    replace_state                     VARCHAR(10)    DEFAULT 'N'     NOT NULL COMMENT '��ȯ����',
    replace_reason                    VARCHAR(100)     NULL  COMMENT '��ȯ����',
    replace_money                     VARCHAR(10)    NULL  COMMENT '��ȯ���',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='�ֹ�����';

    select m.mypageno, m.orderstate, m.ordersubmit, m.point, m.payno, m.mno, p.paycharge, p.paymoney
    from mypage as m
    join payment as p on m.payno = p.payno
    where m.mno=#{mno} and m.waybil=#{waybil}
    
    select Count(payno) as cnt
    from mypage
    
    select m.mypageno, p.item, p.payfile1, p.pcnt, p.paymoney, p.payday, p.orderno, m.orderstate, m.mno, m.ordersubmit, p.paycharge, m.payno, m.my_state,
    t.waybil, t.waybil2, t.trace_state, p.payfile1, p.p_contentno, p.p_categoryno, p.payday, m.takeback_state, m.replace_state
    from mypage as m
    join payment as p on m.payno = p.payno
    join trace as t on m.mypageno = t.mypageno
    where m.mno=1
    order by p.payday desc
    limit 0, 3
    
    
2. ���
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery_wait', 'N', '0', '1', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery_wait', 'N', '0', '1', '2', '2');


insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_ok', 'N', '0', '2', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_ok', 'N', '0', '2', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('product_ready', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('product_ready', 'N', '0', '3', '2', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery', 'N', '0', '1', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('complate', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('complate', 'N', '0', '3', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('ok_wait', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('ok_wait', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('ok_wait', 'N', '0', '3', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_wait', 'N', '0', '3', '5', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_wait', 'N', '0', '3', '3', '1');


3. ���
select mypageno, orderstate, ordersubmit, point, traceno, payno, mno
from mypage;


4. ��ȸ
select mypageno, orderstate, ordersubmit, point, traceno, payno, mno
from mypage
where mypageno='1'

select * from mypage;

select m.mypageno, m.orderstate, m.ordersubmit, m.point, m.mwaybil, m.mwaybil2, m.payno, m.mno, t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno
from mypage as m
join trace as t on m.mypageno = t.mypageno
where m.mwaybil='' and m.mwaybil2=''

    select m.mypageno, m.orderstate, m.ordersubmit, m.point, m.payno, m.mno, p.paycharge, p.paymoney
    from mypage as m
    join payment as p on m.payno = p.payno
    where m.payno=7 and m.mno=1

        update mypage
    set my_state='��ǰ�����'
    where payno=8
    
5. ����
update mypage
set orderstate='�߼���'
where mypageno='201602020001';

    mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    orderstate                        VARCHAR(100)     NOT NULL COMMENT '�ֹ�����',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '����Ȯ��',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '����Ʈ',
    my_state                          VARCHAR(30)    NULL  COMMENT '��ۻ���',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
    mno   
    
    select m.mypageno, m.orderstate, m.ordersubmit, m.point, m.payno, m.mno, p.paycharge, p.paymoney
    from mypage as m
    join payment as p on m.payno = p.payno
    where m.payno=#{payno}

update trace
set my_state=''
where and 

      update mypage as m join payment as p on m.payno = p.payno
      set m.ordersubmit='N'
      where m.mno = 1

update trace
set takeback_state='Y', takeback_reason=''
where payno='';
6. �� ã��
select count(mypageno) as cnt
from mypage
where orderstate = 'product_ready' and mno='1'

7. ����
delete from mypage
where mypageno='201602020001';

delete from mypage

8. ����
-- ����
    select p.item, p.payfile1, p.pcnt, p.paymoney, p.payday, p.orderno, m.orderstate, t.traceno, t.waybil, p.resive_name, p.p_contentno, p.p_categoryno,
    p.resive_phone, p.resive_post, p.resive_addr1, p.resive_addr2, p.paymeans, p.card_input, p.discount, p.deposit_input, p.phone_input, p.paymoney, p.paymeans,
    m.orderstate, m.ordersubmit, m.payno, m.mno, m.my_state, t.waybil2, t.payno
    from mypage m
    join payment p on m.payno = p.payno
    join trace t on m.mypageno = t.mypageno
    where m.mno=#{mno} and t.waybil=#{waybil}

    
    select t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno, t.mypageno, m.mypageno, m.orderstate, m.ordersubmit, m.my_state, m.payno, m.mno
    from mypage as m
    join trace as t on m.mypageno = t.mypageno
    where m.payno = #{payno}
    
    
    update mypage
    set replace_state=#{replace_state}, replace_reason=#{replace_reason}, replace_money=#{replace_money}, my_state=#{my_state}
    where payno=#{payno}