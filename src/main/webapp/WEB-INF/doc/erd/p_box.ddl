/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
CREATE TABLE phonebox(
		cartno                        		SMALLINT		 NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '��ٱ��Ϲ�ȣ',
		mno                      		MEDIUMINT		 NOT NULL COMMENT 'ȸ����ȣ',
		producttitle                  		VARCHAR(200)		 NOT NULL COMMENT '��ǰ�̸�',
		productno                     		SMALLINT		 NOT NULL COMMENT '��ǰ��ȣ',
		parcel                        		VARCHAR(10)		 NULL  COMMENT '���',
		total                         		INT		 NULL  COMMENT '�հ�'
) COMMENT='��ٱ���';

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
		cartno                        		SMALLINT		 NULL  COMMENT '��ٱ��Ϲ�ȣ'
) COMMENT='member';


ALTER TABLE phonebox ADD CONSTRAINT IDX_phonebox_PK PRIMARY KEY (cartno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);
ALTER TABLE member ADD CONSTRAINT IDX_member_FK0 FOREIGN KEY (cartno) REFERENCES phonebox (cartno);
ALTER TABLE member ADD CONSTRAINT id UNIQUE (id);

