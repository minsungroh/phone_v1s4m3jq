/**********************************/
/* Table Name: �ڵ� code_q.sql */
/**********************************/
1. ���̺� ����
DROP TABLE p_code;

CREATE TABLE p_code(
    codeno                            MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
    sort                              VARCHAR(50)    NOT NULL COMMENT '�з�'
) COMMENT='�ڵ�';



2. ���
INSERT INTO p_code(sort)
VALUES ('Apple');

INSERT INTO p_code(sort)
VALUES ('Samsung');

INSERT INTO p_code(sort)
VALUES ('LG');


SELECT * FROM p_code;


      
3. ���
1) ��ü ���
SELECT codeno, sort
FROM p_code
ORDER BY codeno ASC;


4. ����
UPDATE p_code
SET sort='Iphone'
WHERE codeno=1;


5. ����
DELETE FROM code
WHERE codeno=1;



