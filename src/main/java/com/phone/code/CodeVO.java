package com.phone.code;

public class CodeVO {
/*
    codeno   MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
    sort       VARCHAR(50)    NOT NULL COMMENT '�з�',
 */

  private int codeno;
  private String sort;
  
public int getCodeno() {
	return codeno;
}
public void setCodeno(int codeno) {
	this.codeno = codeno;
}
public String getSort() {
	return sort;
}
public void setSort(String sort) {
	this.sort = sort;
}
  

  
}
