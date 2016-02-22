1. ���
drop table IF EXISTS trace_situation;

CREATE TABLE trace_situation(
    tsno                              MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    tsdate                            DATETIME     NOT NULL COMMENT '��۳�¥',
    agent                             VARCHAR(30)    NOT NULL COMMENT '��۴븮��',
    agent_phone                       VARCHAR(30)    NOT NULL COMMENT '��۴븮����ȣ',
    manager                           VARCHAR(30)    NOT NULL COMMENT '��۴�����̸�',
    manager_phone                     VARCHAR(30)    NOT NULL COMMENT '��۴���ڹ�ȣ',
    content                           VARCHAR(500)     NOT NULL COMMENT '�󼼳���',
    traceno                           MEDIUMINT(10)    NULL  COMMENT '��۹�ȣ',
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='�����Ȳ';


2. ����
insert into trace_situation(tsdate, agent, agent_phone, manager, manager_phone, content, traceno)
values(now(), '1', '1', '1', '1', '1', '4');


3. ���
select tsno, tsdate, agent, agent_phone, manager, manager_phone, content, traceno
from trace_situation;

4. ��ȸ
select ts.tsno, ts.tsdate, ts.agent, ts.agent_phone, ts.manager, ts.manager_phone, ts.content, ts.traceno, t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno, t.mypageno
from trace_situation as ts
join trace as t on ts.traceno = t.traceno
where ts.tsno = '4'

select tsno, tsdate, agent, agent_phone, manager, manager_phone, content, traceno
from trace_situation
where tsno=''

5. ����
update trace_situation
set tsdate = now(), agent = '', agent_phone = '', manager='', manager_phone='', content=''
where tsno='1'

6. ����
delete from trace_situation
where tsno='1';