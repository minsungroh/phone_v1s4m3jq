/**********************************/
/* Table Name: 장바구니 */
/**********************************/
CREATE TABLE phonebox(
		cartno                        		SMALLINT		 NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
		mno                      		MEDIUMINT		 NOT NULL COMMENT '회원번호',
		producttitle                  		VARCHAR(200)		 NOT NULL COMMENT '상품이름',
		productno                     		SMALLINT		 NOT NULL COMMENT '상품번호',
		parcel                        		VARCHAR(10)		 NULL  COMMENT '배송',
		total                         		INT		 NULL  COMMENT '합계'
) COMMENT='장바구니';

/**********************************/
/* Table Name: member */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
		cartno                        		SMALLINT		 NULL  COMMENT '장바구니번호'
) COMMENT='member';


ALTER TABLE phonebox ADD CONSTRAINT IDX_phonebox_PK PRIMARY KEY (cartno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);
ALTER TABLE member ADD CONSTRAINT IDX_member_FK0 FOREIGN KEY (cartno) REFERENCES phonebox (cartno);
ALTER TABLE member ADD CONSTRAINT id UNIQUE (id);

