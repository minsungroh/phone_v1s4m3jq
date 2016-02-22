/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		grade                         		CHAR(1)		 DEFAULT 'F'		 NOT NULL COMMENT 'ȸ�� ���',
		money                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '���űݾ�',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
  CONSTRAINT id UNIQUE (id)
) COMMENT='ȸ��';

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
/* Table Name: �ֹ�/���� */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		item                          		TEXT		 NOT NULL COMMENT '������ ��ǰ',
		orderno                       		VARCHAR(10000)		 NOT NULL COMMENT '��ǰ��ȣ',
		caseno                        		BIGINT		 NOT NULL COMMENT '��ٱ��Ϲ�ȣ',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '������ ��ǰ ����',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '��ǰ ����',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '�����ݾ�',
		discount_money                		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '���αݾ�',
		paycharge                     		CHAR(1)		 DEFAULT 'N'		 NOT NULL COMMENT '��������',
		resive_name                   		VARCHAR(30)		 NULL  COMMENT '�޴»��',
		resive_post                   		VARCHAR(10)		 NULL  COMMENT '�޴»�������ȣ',
		resive_addr1                  		VARCHAR(80)		 NULL  COMMENT '�޴��ּ�1',
		resive_addr2                  		VARCHAR(50)		 NULL  COMMENT '�޴��ּ�2',
		resive_phone                  		VARCHAR(20)		 NULL  COMMENT '�޴»����ȭ��ȣ',
		paymeans                      		VARCHAR(10)		 NULL  COMMENT '������',
		card_input                    		VARCHAR(20)		 NULL  COMMENT 'ī�����',
		discount                      		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT 'ī���Һ�',
		deposit_input                 		VARCHAR(20)		 NULL  COMMENT '�������Ա�',
		phone_input                   		VARCHAR(10)		 NULL  COMMENT '�ڵ�������',
		payday                        		DATETIME		 NULL  COMMENT '���糯¥',
		delivery_memo                 		VARCHAR(500)		 NULL  COMMENT '��۸޸�',
		pwaybil                       		BIGINT(10)		 NULL  COMMENT '�ù�����ȣ1',
		pwaybil2                      		MEDIUMINT(10)		 NULL  COMMENT '�ù�����ȣ2',
		p_categoryno                  		MEDIUMINT		 NOT NULL COMMENT 'ī�װ���ȣ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		p_contentno                   		MEDIUMINT(7)		 NULL  COMMENT 'p_contentno',
  FOREIGN KEY (p_contentno) REFERENCES p_content (p_contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  CONSTRAINT  UNIQUE (caseno)
) COMMENT='�ֹ�/����';

/**********************************/
/* Table Name: ����Ʈ */
/**********************************/
CREATE TABLE point(
		pointno                       		MEDIUMINT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		pointdate                     		DATETIME		 NOT NULL COMMENT '����Ʈ�߻��Ͻ�',
		point_content                 		VARCHAR(300)		 NULL  COMMENT '����Ʈ����',
		givepoint                     		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '��������Ʈ',
		usepoint                      		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '�������Ʈ',
		totalpoint                    		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '������Ʈ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='����Ʈ';

/**********************************/
/* Table Name: �ֹ����� */
/**********************************/
CREATE TABLE mypage(
		mypageno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		orderstate                    		VARCHAR(100)		 NOT NULL COMMENT '�ֹ�����',
		ordersubmit                   		CHAR		 DEFAULT 'N'		 NULL  COMMENT '����Ȯ��',
		my_state                      		VARCHAR(30)		 NULL  COMMENT '��ۻ���',
		mwaybil                       		BIGINT		 NOT NULL COMMENT '�����ȣ',
		mwaybil2                      		BIGINT		 NOT NULL COMMENT '�����ȣ2',
		takeback_state                		VARCHAR(10)		 DEFAULT 'N'		 NOT NULL COMMENT '��ǰ����',
		takeback_reason               		VARCHAR(100)		 NULL  COMMENT '��ǰ����',
		resive_money                  		VARCHAR(10)		 NULL  COMMENT '��ǰ���',
		replace_state                 		VARCHAR(10)		 DEFAULT 'N'		 NOT NULL COMMENT '��ȯ����',
		replace_reason                		VARCHAR(100)		 NULL  COMMENT '��ȯ����',
		replace_money                 		VARCHAR(10)		 NULL  COMMENT '��ȯ���',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		pointno                       		MEDIUMINT		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (pointno) REFERENCES point (pointno)
) COMMENT='�ֹ�����';

/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE trace(
		traceno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
		waybil                        		BIGINT		 NOT NULL COMMENT '�����ȣ',
		waybil2                       		BIGINT		 NOT NULL COMMENT '�����ȣ2',
		trace_state                   		VARCHAR(100)		 DEFAULT "��ǰ�غ���"		 NOT NULL COMMENT '��ۻ���',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
		mypageno                      		MEDIUMINT(10)		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno),
  CONSTRAINT IDX_trace_1 UNIQUE (waybil)
) COMMENT='�������';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE coupon(
		couponno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		coupon_serial                 		VARCHAR(100)		 NOT NULL COMMENT '������ȣ',
		coupon_label                  		VARCHAR(100)		 NOT NULL COMMENT '��������',
		coupon_money                  		VARCHAR		 NULL  COMMENT '�����ݾ�',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ����ּҷ� */
/**********************************/
CREATE TABLE deliveryaddr(
		dno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		dcategory                     		VARCHAR(30)		 NOT NULL COMMENT 'ī�װ�',
		dname                         		VARCHAR(30)		 NOT NULL COMMENT '�̸�',
		dzipcode                      		VARCHAR(10)		 NULL  COMMENT '�����ȣ',
		daddr1                        		VARCHAR(80)		 NULL  COMMENT '�ּ�1',
		daddr2                        		VARCHAR(50)		 NULL  COMMENT '�ּ�2',
		dphone                        		VARCHAR(20)		 NULL  COMMENT '�޴���ȭ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����ּҷ�';

/**********************************/
/* Table Name: �����Ȳ */
/**********************************/
CREATE TABLE trace_situation(
		tsno                          		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		tsdate                        		DATETIME		 NOT NULL COMMENT '��۳�¥',
		agent                         		VARCHAR(30)		 NOT NULL COMMENT '��۴븮��',
		agent_phone                   		VARCHAR(30)		 NOT NULL COMMENT '��۴븮����ȣ',
		manager                       		VARCHAR(30)		 NOT NULL COMMENT '��۴�����̸�',
		manager_phone                 		VARCHAR(30)		 NOT NULL COMMENT '��۴���ڹ�ȣ',
		content                       		VARCHAR(500)		 NOT NULL COMMENT '�󼼳���',
		traceno                       		MEDIUMINT(10)		 NULL  COMMENT '��۹�ȣ',
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='�����Ȳ';


CREATE INDEX p_categoryno ON p_content (p_categoryno);

