1. ���̺� ����
drop table IF EXISTS point;

CREATE TABLE point(
    pointno                           MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    pointdate                         DATETIME     NOT NULL COMMENT '����Ʈ�߻��Ͻ�',
    point_content                     VARCHAR(300)     NOT NULL  COMMENT '����Ʈ����',
    givepoint                         MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '��������Ʈ',
    usepoint                          MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '�������Ʈ',
    totalpoint                        MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '������Ʈ',
    mno                               INT(10)    NULL  COMMENT 'mno',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='����Ʈ';



2. ����
insert into point(pointdate, point_content, givepoint, usepoint, totalpoint, mno)
values(now(), 'ȸ������', 10000, 0, 10000, 1);


select * from point;


3. ����
update point
set totalpoint='100000'
where mno='1'


4. ��ȸ
select pointno, pointdate, point_content, givepoint, usepoint, totalpoint, mno, payno
from point
where mno='' point_content=''