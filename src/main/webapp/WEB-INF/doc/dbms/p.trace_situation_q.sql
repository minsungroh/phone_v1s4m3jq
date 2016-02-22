1. 등록
drop table IF EXISTS trace_situation;

CREATE TABLE trace_situation(
    tsno                              MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    tsdate                            DATETIME     NOT NULL COMMENT '배송날짜',
    agent                             VARCHAR(30)    NOT NULL COMMENT '배송대리점',
    agent_phone                       VARCHAR(30)    NOT NULL COMMENT '배송대리점번호',
    manager                           VARCHAR(30)    NOT NULL COMMENT '배송담당자이름',
    manager_phone                     VARCHAR(30)    NOT NULL COMMENT '배송담당자번호',
    content                           VARCHAR(500)     NOT NULL COMMENT '상세내역',
    traceno                           MEDIUMINT(10)    NULL  COMMENT '배송번호',
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='배송현황';


2. 삽입
insert into trace_situation(tsdate, agent, agent_phone, manager, manager_phone, content, traceno)
values(now(), '1', '1', '1', '1', '1', '4');


3. 목록
select tsno, tsdate, agent, agent_phone, manager, manager_phone, content, traceno
from trace_situation;

4. 조회
select ts.tsno, ts.tsdate, ts.agent, ts.agent_phone, ts.manager, ts.manager_phone, ts.content, ts.traceno, t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno, t.mypageno
from trace_situation as ts
join trace as t on ts.traceno = t.traceno
where ts.tsno = '4'

select tsno, tsdate, agent, agent_phone, manager, manager_phone, content, traceno
from trace_situation
where tsno=''

5. 수정
update trace_situation
set tsdate = now(), agent = '', agent_phone = '', manager='', manager_phone='', content=''
where tsno='1'

6. 삭제
delete from trace_situation
where tsno='1';