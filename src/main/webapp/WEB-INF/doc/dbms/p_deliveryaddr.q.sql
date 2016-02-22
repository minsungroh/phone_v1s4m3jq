1. 테이블 등록
drop table IF EXISTS deliveryaddr;

CREATE TABLE deliveryaddr(
    dno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    dcategory                         VARCHAR(30)    NULL COMMENT '카테고리',
    dname                             VARCHAR(30)    NOT NULL COMMENT '이름',
    dzipcode                          VARCHAR(10)    NULL  COMMENT '우편번호',
    daddr1                            VARCHAR(80)    NULL  COMMENT '주소1',
    daddr2                            VARCHAR(50)    NULL  COMMENT '주소2',
    dphone                            VARCHAR(20)    NULL  COMMENT '휴대전화',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='배송주소록';


2. 등록
insert into deliveryaddr(dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno)
values('우리집', '아름이', '12345', '서울시 종로구', '종로3가', '010-1111-1111', '1');

insert into deliveryaddr(dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno)
values('회사', '아름이', '12345', '서울시 강남구', '역삼동', '010-1111-1111', '3');

insert into deliveryaddr(dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno)
values('우리집2', '아름이', '12345', '경기도 용인시', '기흥구', '010-1111-1111', '2');


3. 목록
select dno, dcategory, dname, dzipcode, daddr1, dadd2, dphone, mno
from deliveryaddr
order by dno asc;

4. 조회
select dno, dcategory, dname, dzipcode, daddr1, daddr2, dphone, mno
from deliveryaddr
where mno='1';

5. 수정
update deliveryaddr 
set dcategory='회사', dname = '투투', dzipcode='12312', daddr1='우리나라', daddr2='만세', dphone='010-2222-2222'
where dno='1';

6. 값 찾기
select count(dno) as cnt
from deliveryaddr
where dcategory='우리집';

7. 삭제
delete from deliveryaddr;

delete from deliveryaddr 
where dno='1';