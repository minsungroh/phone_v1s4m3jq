/**********************************/
/* Table Name: 코드 code_q.sql */
/**********************************/
1. 테이블 생성
DROP TABLE p_code;

CREATE TABLE p_code(
    codeno                            MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '코드번호',
    sort                              VARCHAR(50)    NOT NULL COMMENT '분류'
) COMMENT='코드';



2. 등록
INSERT INTO p_code(sort)
VALUES ('Apple');

INSERT INTO p_code(sort)
VALUES ('Samsung');

INSERT INTO p_code(sort)
VALUES ('LG');


SELECT * FROM p_code;


      
3. 목록
1) 전체 목록
SELECT codeno, sort
FROM p_code
ORDER BY codeno ASC;


4. 수정
UPDATE p_code
SET sort='Iphone'
WHERE codeno=1;


5. 삭제
DELETE FROM code
WHERE codeno=1;



