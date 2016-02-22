1.  테이블 생성

drop table member;

CREATE TABLE member(
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
    id                                VARCHAR(20)    NOT NULL COMMENT 'id',
    passwd                            VARCHAR(20)    NOT NULL COMMENT 'passwd',
    mname                             VARCHAR(20)    NOT NULL COMMENT 'mname',
    nname                             VARCHAR(20)    NOT NULL COMMENT 'nname',
    grade                             CHAR(1)    DEFAULT 'F'     NOT NULL COMMENT '회원 등급',
    money                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '구매금액',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '포인트',
    tel                               VARCHAR(14)    NOT NULL COMMENT 'tel',
    zipcode                           VARCHAR(5)     NULL  COMMENT 'zipcode',
    address1                          VARCHAR(80)    NULL  COMMENT 'address1',
    address2                          VARCHAR(50)    NULL  COMMENT 'address2',
    mdate                             DATETIME     NOT NULL COMMENT 'mdate',
  CONSTRAINT id UNIQUE (id)
) COMMENT='회원';

 -- 'A' : VIP(total 50건, 100만원 이상 구매고객), B : 우수회원(total 30건, 50만원 이상 구매고객), C: 보통회원(total : 10건, 10만원 이상 구매 고객), F: 신규회원
2. 등록
insert into member(id, passwd, mname, nname, grade, money, point, tel, zipcode, address1, address2, mdate)
values ('user1', '1234', '왕눈이', 'E', 'F', 0, 0, '010-1234-5678', '12345', '서울시 관철동', '관철동', now());

insert into member(id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate)
values ('user2', '1234', '철수', 'J', 'F', 0, 0, '010-1234-5678', '12345', '서울시 관철동', '관철동', now());

insert into member(id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate)
values ('user3', '1234', '영희', 'B', 'F', 0, 0, '010-1234-5678', '12345', '서울시 관철동', '관철동', now());

insert into member(id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate)
values ('user4', '1234', '영희', 'H', 'A', 0, 0, '010-1234-5678', '12345', '서울시 관철동', '관철동', now());

3. 목록
select mno, id, passwd, mname, nname, grade, money, point, tel, zipcode, address1, address2, mdate
from member;


4. 조회
select mno, id, passwd, mname, nname, grade, money, point,  tel, zipcode, address1, address2, mdate
from member
where mno='2';


5. 수정
update member
set passwd='1111'
where mno='1';

6. 값 찾기
select count(int mno) as cnt
from member
where passwd='1234';

7. 삭제
delete from member
where mno='1';

