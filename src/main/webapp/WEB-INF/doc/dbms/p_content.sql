/**********************************/
/* Table Name: 코드 code_q.sql */
/**********************************/
1. 테이블 생성
DROP TABLE p_content;

CREATE TABLE p_content(
    p_contentno                         MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '물품번호',
    title                             VARCHAR(200)     NOT NULL COMMENT '상품이름',
    content                           MEDIUMTEXT     NOT NULL COMMENT '내용',
    file                              VARCHAR(100)     NULL  COMMENT 'Thumb파일',
    file1                             VARCHAR(300)     NULL  COMMENT '첨부파일',
    replycnt                              INT(5)     DEFAULT 0  NULL  COMMENT '댓글수',
    money                             MEDIUMINT(10)    NOT NULL COMMENT '상품값',
      p_categoryno                      MEDIUMINT(7)     NULL  COMMENT '카테고리번호',
      meterial                          TEXT     NOT NULL COMMENT '소재',
  FOREIGN KEY (p_categoryno) REFERENCES p_category (p_categoryno)
) COMMENT='물품내용';



2. 등록
INSERT INTO p_content(title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno)
VALUES ('Iphone6+ 젤리케이스', '젤리케이스내용', 'mainpicture.jpg', 'subpicture.jpg/subpicture2.jpg', 0, '20000', 1, 'Poly', 1);

INSERT INTO p_content(title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno)
VALUES ('Iphone6+ 가죽케이스', '가죽케이스내용', 'mainpicture.jpg', 'subpicture.jpg/subpicture2.jpg', 0, '25000', 1, 'Poly',  1);

INSERT INTO p_content(title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno)
VALUES ('Iphone6+ 패션케이스', '패션케이스내용', 'mainpicture.jpg', 'subpicture.jpg/subpicture2.jpg', 0, '30000', 1, 'Poly',  1);


SELECT * FROM p_content;


      
3. 목록
1) 전체 목록
SELECT p_contentno, title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno
FROM p_content
ORDER BY p_contentno ASC;

SELECT p_contentno, title, content, file, file1, replycnt, money, productcnt, meterial, p_categoryno
FROM p_content
where p_contentno='3';


4. 수정
UPDATE p_content
SET title='', content='', file='', file1='', money='',  meterial = '', productcnt=''
WHERE p_contentno=1;


5. 삭제
DELETE FROM p_content
WHERE p_contentno=1;



