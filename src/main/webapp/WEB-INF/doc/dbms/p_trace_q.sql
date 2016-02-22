1. ���̺� ���
drop table IF EXISTS trace;

CREATE TABLE trace(
    traceno                           MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
    waybil                            BIGINT    UNIQUE NOT NULL COMMENT '�����ȣ',
    waybil2                           BIGINT    UNIQUE NOT NULL COMMENT '�����ȣ2',
    trace_state                       VARCHAR(100)     DEFAULT "��ǰ�غ���"     NOT NULL COMMENT '��ۻ���',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
    mypageno                          MEDIUMINT(10)    NULL  COMMENT '��ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno)
) COMMENT='�������';
-- ��ۻ��� : ��ǰ�غ���, �����, ��ۿϷ�

2. ���
insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '��ǰ�غ���', now(), '�������/02-111-2222', '������', '010-1111-1111', '����������� ��ǰ�� �̵����Դϴ�.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '��ǰ�غ���', now(), '�������/02-111-2222', '������', '010-1111-1111', '�����κ��� ��ǰ�� �μ��޾ҽ��ϴ�.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '��ǰ�غ���', now(), '�������/02-111-2222', '������', '010-1111-1111', '������ ��ǰ�� ����߿� �ֽ��ϴ�.', '1');

3. ���
select traceno, waybil, trace_state, ddate, agent, manger, manager_phone, content, payno
from trace
where waybil='160209001';

select traceno, waybil, waybil2, trace_state, payno, mypageno
from trace
where payno=''

select * from trace;
4. ��ȸ
select t.traceno, t.waybil, t.trace_state, t.tdate, t.agent, t.manager, t.manager_phone, t.content, t.payno, p.payno, p.resive_post, p.resive_addr1, p.resive_addr2, p.resive_phone, p.resive_name, p.item, p.pcnt
from trace t
join payment p on t.payno = p.payno
where t.waybil='160209001'

select traceno, waybil, waybil2, trace_state, payno, mypageno
from trace
where traceno='1';

select traceno, waybil, trace_state, ddate, agent, manager, manager_phone, content, payno
from trace
where waybil='160209001';

select ts.tsno, ts.tsdate, ts.agent, ts.agent_phone, ts.manager, ts.manager_phone, ts.content, ts.traceno, t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno, t.mypageno
from trace_situation as ts
join trace as t on ts.traceno = t.traceno
where waybil and waybil2

5. ����
update trace
set trace_state = '�����';
where traceno='1';

update trace
set trace_state=''
where waybil and waybil2

update trace
set mypageno=''
where payno=''

6. �� ã��
select count(traceno) as cnt
from trace
where waybil='012301230123';

7. ����
delete from trace;

delete from trace
where traceno='1';

update trace
set mypageno=''
where traceno

-- trace
    traceno                           MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
    waybil                            BIGINT    UNIQUE NOT NULL COMMENT '�����ȣ',
    waybil2                           BIGINT    UNIQUE NOT NULL COMMENT '�����ȣ2',
    trace_state                       VARCHAR(100)     DEFAULT "��ǰ�غ���"     NOT NULL COMMENT '��ۻ���',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
    mypageno  
      FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno)
 -- mypage
     mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    orderstate                        VARCHAR(100)     NOT NULL COMMENT '�ֹ�����',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '����Ȯ��',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '����Ʈ',
    my_state                          VARCHAR(30)    NULL  COMMENT '��ۻ���',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
    mno                               INT(10)    NULL  COMMENT 'mno',


select t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno, t.mypageno, m.mypageno, m.orderstate, m.ordersubmit, m.point, m.my_state, m.payno, m.mno
from trace as t
join mypage as m on t.mypageno = m.mypageno
where t.payno = 8

update trace as t join mypage as m on t.mypageno = m.mypageno
set m.my_state=''
where t.payno = 