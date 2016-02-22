/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE admin1(
		admin1no                      		INT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		email                         		VARCHAR(50)		 NOT NULL COMMENT '�̸���',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '�н�����',
		auth                          		VARCHAR(20)		 NOT NULL COMMENT '���������ڵ�',
		act                           		CHAR(1)		 NOT NULL COMMENT '����',
		confirm                       		CHAR(1)		 NOT NULL COMMENT '�̸��ϸ�ũŬ������',
		mdate                         		DATETIME		 NOT NULL COMMENT '��¥',
		mno                           		INT		 NULL  COMMENT '��ȣ',
		art3no                        		MEDIUMINT		 NULL  COMMENT '��ȣ',
  CONSTRAINT email UNIQUE (email)
) COMMENT='������';

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		mno                           		INT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '���̵�',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '�н�����',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT '�̸�',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT '����ó',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT '�����ȣ',
		address1                      		VARCHAR(80)		 NULL  COMMENT '�ּ�',
		address2                      		VARCHAR(50)		 NULL  COMMENT '�ּ�2',
		mdate                         		DATETIME		 NOT NULL COMMENT '��¥',
		admin1no                      		INT		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (admin1no) REFERENCES admin1 (admin1no),
  CONSTRAINT id UNIQUE (id)
) COMMENT='ȸ��';

/**********************************/
/* Table Name: �����Խ��� */ 
/**********************************/
CREATE TABLE art3(
		art3no                        		MEDIUMINT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		rname                         		VARCHAR(20)		 NOT NULL COMMENT '����',
		email                         		VARCHAR(100)		 NULL  COMMENT '�̸���',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '����',
		content                       		VARCHAR(4000)		 NOT NULL COMMENT '����',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '�н�����',
		cnt                           		SMALLINT(5)		 NULL  COMMENT 'cnt',
		rdate                         		DATETIME		 NOT NULL COMMENT '��¥',
		url                           		VARCHAR(100)		 NULL  COMMENT 'url'
) COMMENT='�����Խ���';

