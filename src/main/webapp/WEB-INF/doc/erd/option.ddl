/**********************************/
/* Table Name: �з� */
/**********************************/
CREATE TABLE p_code(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '�з�'
) COMMENT='�з�';

/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE p_category(
		p_categoryno                  		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
		title                         		VARCHAR(50)		 NOT NULL COMMENT 'ī�װ� ����',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT '���ļ���',
		visible                       		CHAR(1)		 NOT NULL COMMENT '��������',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT '��������',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '��ϵ� �� ��',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES p_code (codeno)
) COMMENT='ī�װ�';

/**********************************/
/* Table Name: ��ǰ���� */
/**********************************/
CREATE TABLE p_content(
		p_contentno                   		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ǰ��ȣ',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '��ǰ�̸�',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '����',
		file                          		VARCHAR(100)		 NULL  COMMENT 'Thumb����',
		file1                         		VARCHAR(300)		 NULL  COMMENT '÷������',
		replycnt                      		INT(5)		 NULL  COMMENT '��ۼ�',
		p_categoryno                  		MEDIUMINT(7)		 NULL  COMMENT 'ī�װ���ȣ',
		money                         		MEDIUMINT(10)		 NOT NULL COMMENT '��ǰ��',
		productcnt                    		MEDIUMINT(10)		 DEFAULT 0		 NULL  COMMENT '��ǰ����',
		meterial                      		TEXT		 NOT NULL COMMENT '����',
  FOREIGN KEY (p_categoryno) REFERENCES p_category (p_categoryno)
) COMMENT='��ǰ����';


CREATE INDEX codeno ON p_category (codeno);

CREATE INDEX blogcategoryno ON p_content (blogcategoryno);

