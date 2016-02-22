1. 테이블 생성
drop table IF EXISTS point;

CREATE TABLE point(
    pointno                           MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    pointdate                         DATETIME     NOT NULL COMMENT '포인트발생일시',
    point_content                     VARCHAR(300)     NOT NULL  COMMENT '포인트내역',
    givepoint                         MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '지급포인트',
    usepoint                          MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '사용포인트',
    totalpoint                        MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '총포인트',
    mno                               INT(10)    NULL  COMMENT 'mno',
    payno                             INT(10)    NULL  COMMENT '번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='포인트';



2. 삽입
insert into point(pointdate, point_content, givepoint, usepoint, totalpoint, mno)
values(now(), '회원가입', 10000, 0, 10000, 1);


select * from point;


3. 수정
update point
set totalpoint='100000'
where mno='1'


4. 조회
select pointno, pointdate, point_content, givepoint, usepoint, totalpoint, mno, payno
from point
where mno='' point_content=''