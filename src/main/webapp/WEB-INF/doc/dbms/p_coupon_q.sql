1. ���̺� ����
drop table coupon;

CREATE TABLE coupon(
    couponno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    coupon_serial                     VARCHAR(100)     NOT NULL COMMENT '������ȣ',
    coupon_label                      VARCHAR(100)     NOT NULL COMMENT '��������',
    coupon_money                      VARCHAR    NULL  COMMENT '�����ݾ�',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';
