1. 테이블 생성
drop table coupon;

CREATE TABLE coupon(
    couponno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    coupon_serial                     VARCHAR(100)     NOT NULL COMMENT '쿠폰번호',
    coupon_label                      VARCHAR(100)     NOT NULL COMMENT '쿠폰내역',
    coupon_money                      VARCHAR    NULL  COMMENT '쿠폰금액',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='쿠폰';
