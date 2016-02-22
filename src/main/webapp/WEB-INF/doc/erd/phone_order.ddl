/**********************************/
/* Table Name: 커스텀주문 */
/**********************************/
CREATE TABLE phoneorder(
		orderno                       		MEDIUMINT		 NOT NULL AUTO_INCREMENT COMMENT '주문번호',
		mno                      		MEDIUMINT		 NOT NULL COMMENT '회원번호',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '내용',
		cnt                           		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '조회수',
		rdate                         		DATETIME		 NULL  COMMENT '날짜'
) COMMENT='커스텀주문';

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
		orderno                       		MEDIUMINT		 NULL  COMMENT '주문번호'
) COMMENT='member';


ALTER TABLE phoneorder ADD CONSTRAINT IDX_phoneorder_PK PRIMARY KEY (orderno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);
ALTER TABLE member ADD CONSTRAINT IDX_member_FK0 FOREIGN KEY (orderno) REFERENCES phoneorder (orderno);
ALTER TABLE member ADD CONSTRAINT id UNIQUE (id);

