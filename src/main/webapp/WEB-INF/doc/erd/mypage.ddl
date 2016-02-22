/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		grade                         		CHAR(1)		 DEFAULT 'F'		 NOT NULL COMMENT '회원 등급',
		money                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '구매금액',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
  CONSTRAINT id UNIQUE (id)
) COMMENT='회원';

/**********************************/
/* Table Name: p_content */
/**********************************/
CREATE TABLE p_content(
		p_contentno                   		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'p_contentno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		file                          		VARCHAR(100)		 NULL  COMMENT 'file',
		file1                         		VARCHAR(300)		 NULL  COMMENT 'file1',
		replycnt                      		INT(10)		 NULL  COMMENT 'replycnt',
		money                         		MEDIUMINT(7)		 NOT NULL COMMENT 'money',
		productcnt                    		MEDIUMINT(7)		 NULL  COMMENT 'productcnt',
		p_categoryno                  		MEDIUMINT(7)		 NULL  COMMENT 'p_categoryno',
		meterial                      		TEXT		 NOT NULL COMMENT 'meterial',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='p_content';

/**********************************/
/* Table Name: 주문/결제 */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		item                          		TEXT		 NOT NULL COMMENT '결재할 물품',
		orderno                       		VARCHAR(10000)		 NOT NULL COMMENT '상품번호',
		caseno                        		BIGINT		 NOT NULL COMMENT '장바구니번호',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '결제할 물품 사진',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '상품 개수',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '결제금액',
		discount_money                		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '할인금액',
		paycharge                     		CHAR(1)		 DEFAULT 'N'		 NOT NULL COMMENT '결제여부',
		resive_name                   		VARCHAR(30)		 NULL  COMMENT '받는사람',
		resive_post                   		VARCHAR(10)		 NULL  COMMENT '받는사람우편번호',
		resive_addr1                  		VARCHAR(80)		 NULL  COMMENT '받는주소1',
		resive_addr2                  		VARCHAR(50)		 NULL  COMMENT '받는주소2',
		resive_phone                  		VARCHAR(20)		 NULL  COMMENT '받는사람전화번호',
		paymeans                      		VARCHAR(10)		 NULL  COMMENT '결재방식',
		card_input                    		VARCHAR(20)		 NULL  COMMENT '카드결제',
		discount                      		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '카드할부',
		deposit_input                 		VARCHAR(20)		 NULL  COMMENT '무통장입금',
		phone_input                   		VARCHAR(10)		 NULL  COMMENT '핸드폰결제',
		payday                        		DATETIME		 NULL  COMMENT '결재날짜',
		delivery_memo                 		VARCHAR(500)		 NULL  COMMENT '배송메모',
		pwaybil                       		BIGINT(10)		 NULL  COMMENT '택배송장번호1',
		pwaybil2                      		MEDIUMINT(10)		 NULL  COMMENT '택배송장번호2',
		p_categoryno                  		MEDIUMINT		 NOT NULL COMMENT '카테고리번호',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		p_contentno                   		MEDIUMINT(7)		 NULL  COMMENT 'p_contentno',
  FOREIGN KEY (p_contentno) REFERENCES p_content (p_contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  CONSTRAINT  UNIQUE (caseno)
) COMMENT='주문/결제';

/**********************************/
/* Table Name: 포인트 */
/**********************************/
CREATE TABLE point(
		pointno                       		MEDIUMINT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		pointdate                     		DATETIME		 NOT NULL COMMENT '포인트발생일시',
		point_content                 		VARCHAR(300)		 NULL  COMMENT '포인트내역',
		givepoint                     		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '지급포인트',
		usepoint                      		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '사용포인트',
		totalpoint                    		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '총포인트',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		payno                         		INT(10)		 NULL  COMMENT '번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='포인트';

/**********************************/
/* Table Name: 주문내역 */
/**********************************/
CREATE TABLE mypage(
		mypageno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		orderstate                    		VARCHAR(100)		 NOT NULL COMMENT '주문상태',
		ordersubmit                   		CHAR		 DEFAULT 'N'		 NULL  COMMENT '구매확정',
		my_state                      		VARCHAR(30)		 NULL  COMMENT '배송상태',
		mwaybil                       		BIGINT		 NOT NULL COMMENT '송장번호',
		mwaybil2                      		BIGINT		 NOT NULL COMMENT '송장번호2',
		takeback_state                		VARCHAR(10)		 DEFAULT 'N'		 NOT NULL COMMENT '반품여부',
		takeback_reason               		VARCHAR(100)		 NULL  COMMENT '반품사유',
		resive_money                  		VARCHAR(10)		 NULL  COMMENT '반품방법',
		replace_state                 		VARCHAR(10)		 DEFAULT 'N'		 NOT NULL COMMENT '교환여부',
		replace_reason                		VARCHAR(100)		 NULL  COMMENT '교환사유',
		replace_money                 		VARCHAR(10)		 NULL  COMMENT '교환방법',
		payno                         		INT(10)		 NULL  COMMENT '번호',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		pointno                       		MEDIUMINT		 NULL  COMMENT '번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (pointno) REFERENCES point (pointno)
) COMMENT='주문내역';

/**********************************/
/* Table Name: 배송추적 */
/**********************************/
CREATE TABLE trace(
		traceno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
		waybil                        		BIGINT		 NOT NULL COMMENT '송장번호',
		waybil2                       		BIGINT		 NOT NULL COMMENT '송장번호2',
		trace_state                   		VARCHAR(100)		 DEFAULT "상품준비중"		 NOT NULL COMMENT '배송상태',
		payno                         		INT(10)		 NULL  COMMENT '번호',
		mypageno                      		MEDIUMINT(10)		 NULL  COMMENT '번호',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno),
  CONSTRAINT IDX_trace_1 UNIQUE (waybil)
) COMMENT='배송추적';

/**********************************/
/* Table Name: 쿠폰 */
/**********************************/
CREATE TABLE coupon(
		couponno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		coupon_serial                 		VARCHAR(100)		 NOT NULL COMMENT '쿠폰번호',
		coupon_label                  		VARCHAR(100)		 NOT NULL COMMENT '쿠폰내역',
		coupon_money                  		VARCHAR		 NULL  COMMENT '쿠폰금액',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='쿠폰';

/**********************************/
/* Table Name: 배송주소록 */
/**********************************/
CREATE TABLE deliveryaddr(
		dno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		dcategory                     		VARCHAR(30)		 NOT NULL COMMENT '카테고리',
		dname                         		VARCHAR(30)		 NOT NULL COMMENT '이름',
		dzipcode                      		VARCHAR(10)		 NULL  COMMENT '우편번호',
		daddr1                        		VARCHAR(80)		 NULL  COMMENT '주소1',
		daddr2                        		VARCHAR(50)		 NULL  COMMENT '주소2',
		dphone                        		VARCHAR(20)		 NULL  COMMENT '휴대전화',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='배송주소록';

/**********************************/
/* Table Name: 배송현황 */
/**********************************/
CREATE TABLE trace_situation(
		tsno                          		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		tsdate                        		DATETIME		 NOT NULL COMMENT '배송날짜',
		agent                         		VARCHAR(30)		 NOT NULL COMMENT '배송대리점',
		agent_phone                   		VARCHAR(30)		 NOT NULL COMMENT '배송대리점번호',
		manager                       		VARCHAR(30)		 NOT NULL COMMENT '배송담당자이름',
		manager_phone                 		VARCHAR(30)		 NOT NULL COMMENT '배송담당자번호',
		content                       		VARCHAR(500)		 NOT NULL COMMENT '상세내역',
		traceno                       		MEDIUMINT(10)		 NULL  COMMENT '배송번호',
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='배송현황';


CREATE INDEX p_categoryno ON p_content (p_categoryno);

