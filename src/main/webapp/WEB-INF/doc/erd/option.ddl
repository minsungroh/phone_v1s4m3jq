/**********************************/
/* Table Name: 분류 */
/**********************************/
CREATE TABLE p_code(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '코드번호',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '분류'
) COMMENT='분류';

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE p_category(
		p_categoryno                  		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
		title                         		VARCHAR(50)		 NOT NULL COMMENT '카테고리 종류',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT '정렬순서',
		visible                       		CHAR(1)		 NOT NULL COMMENT '공개여부',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT '관리계정',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '등록된 글 수',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES p_code (codeno)
) COMMENT='카테고리';

/**********************************/
/* Table Name: 물품내용 */
/**********************************/
CREATE TABLE p_content(
		p_contentno                   		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '물품번호',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '상품이름',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '내용',
		file                          		VARCHAR(100)		 NULL  COMMENT 'Thumb파일',
		file1                         		VARCHAR(300)		 NULL  COMMENT '첨부파일',
		replycnt                      		INT(5)		 NULL  COMMENT '댓글수',
		p_categoryno                  		MEDIUMINT(7)		 NULL  COMMENT '카테고리번호',
		money                         		MEDIUMINT(10)		 NOT NULL COMMENT '상품값',
		productcnt                    		MEDIUMINT(10)		 DEFAULT 0		 NULL  COMMENT '상품개수',
		meterial                      		TEXT		 NOT NULL COMMENT '소재',
  FOREIGN KEY (p_categoryno) REFERENCES p_category (p_categoryno)
) COMMENT='물품내용';


CREATE INDEX codeno ON p_category (codeno);

CREATE INDEX blogcategoryno ON p_content (blogcategoryno);

