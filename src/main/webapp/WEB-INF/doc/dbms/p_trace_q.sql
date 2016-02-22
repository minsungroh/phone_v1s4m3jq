1. 테이블 등록
drop table IF EXISTS trace;

CREATE TABLE trace(
    traceno                           MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
    waybil                            BIGINT    UNIQUE NOT NULL COMMENT '송장번호',
    waybil2                           BIGINT    UNIQUE NOT NULL COMMENT '송장번호2',
    trace_state                       VARCHAR(100)     DEFAULT "상품준비중"     NOT NULL COMMENT '배송상태',
    payno                             INT(10)    NULL  COMMENT '번호',
    mypageno                          MEDIUMINT(10)    NULL  COMMENT '번호',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno)
) COMMENT='배송추적';
-- 배송상태 : 물품준비중, 배송중, 배송완료

2. 등록
insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '물품준비중', now(), '용산전자/02-111-2222', '김형석', '010-1111-1111', '배송지역으로 물품이 이동중입니다.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '물품준비중', now(), '용산전자/02-111-2222', '김형석', '010-1111-1111', '고객으로부터 상품을 인수받았습니다.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '물품준비중', now(), '용산전자/02-111-2222', '김형석', '010-1111-1111', '고객님의 상품이 배송중에 있습니다.', '1');

3. 목록
select traceno, waybil, trace_state, ddate, agent, manger, manager_phone, content, payno
from trace
where waybil='160209001';

select traceno, waybil, waybil2, trace_state, payno, mypageno
from trace
where payno=''

select * from trace;
4. 조회
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

5. 수정
update trace
set trace_state = '배송중';
where traceno='1';

update trace
set trace_state=''
where waybil and waybil2

update trace
set mypageno=''
where payno=''

6. 값 찾기
select count(traceno) as cnt
from trace
where waybil='012301230123';

7. 삭제
delete from trace;

delete from trace
where traceno='1';

update trace
set mypageno=''
where traceno

-- trace
    traceno                           MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
    waybil                            BIGINT    UNIQUE NOT NULL COMMENT '송장번호',
    waybil2                           BIGINT    UNIQUE NOT NULL COMMENT '송장번호2',
    trace_state                       VARCHAR(100)     DEFAULT "상품준비중"     NOT NULL COMMENT '배송상태',
    payno                             INT(10)    NULL  COMMENT '번호',
    mypageno  
      FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno)
 -- mypage
     mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    orderstate                        VARCHAR(100)     NOT NULL COMMENT '주문상태',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '구매확정',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '포인트',
    my_state                          VARCHAR(30)    NULL  COMMENT '배송상태',
    payno                             INT(10)    NULL  COMMENT '번호',
    mno                               INT(10)    NULL  COMMENT 'mno',


select t.traceno, t.waybil, t.waybil2, t.trace_state, t.payno, t.mypageno, m.mypageno, m.orderstate, m.ordersubmit, m.point, m.my_state, m.payno, m.mno
from trace as t
join mypage as m on t.mypageno = m.mypageno
where t.payno = 8

update trace as t join mypage as m on t.mypageno = m.mypageno
set m.my_state=''
where t.payno = 