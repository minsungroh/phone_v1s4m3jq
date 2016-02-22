/**********************************/
/* Table Name: Ŀ�����ֹ� */
/**********************************/
CREATE TABLE phoneorder(
		orderno                       		MEDIUMINT		 NOT NULL AUTO_INCREMENT COMMENT '�ֹ���ȣ',
		mno                      		MEDIUMINT		 NOT NULL COMMENT 'ȸ����ȣ',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '����',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '����',
		cnt                           		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '��ȸ��',
		rdate                         		DATETIME		 NULL  COMMENT '��¥'
) COMMENT='Ŀ�����ֹ�';

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
		orderno                       		MEDIUMINT		 NULL  COMMENT '�ֹ���ȣ'
) COMMENT='member';


ALTER TABLE phoneorder ADD CONSTRAINT IDX_phoneorder_PK PRIMARY KEY (orderno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);
ALTER TABLE member ADD CONSTRAINT IDX_member_FK0 FOREIGN KEY (orderno) REFERENCES phoneorder (orderno);
ALTER TABLE member ADD CONSTRAINT id UNIQUE (id);

