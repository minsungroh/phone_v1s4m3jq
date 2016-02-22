package com.phone.p_category;

public class P_categoryVO {
/*	p_categoryno                  		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
	title                         		VARCHAR(50)		 NOT NULL COMMENT '제목',
	orderno                       		SMALLINT(5)		DEFAULT 1 NOT NULL COMMENT '정렬순서',
	visible                       		CHAR(1)		DEFAULT 'Y' NOT NULL COMMENT '공개여부',
	ids                           		VARCHAR(100)	 DEFAULT 'admin'	 NOT NULL COMMENT '관리계정',
	cnt                           		MEDIUMINT(7)	DEFAULT 0	 NOT NULL COMMENT '등록된 글 수',
	codeno                        		MEDIUMINT(7)		 NULL  COMMENT '코드번호',*/
	
	private int p_categoryno;
	private String title;
	private int orderno;
	private String visible;
	private String ids;
	private int cnt;
	private int codeno;
	

	public int getP_categoryno() {
		return p_categoryno;
	}
	public void setP_categoryno(int p_categoryno) {
		this.p_categoryno = p_categoryno;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getCodeno() {
		return codeno;
	}
	public void setCodeno(int codeno) {
		this.codeno = codeno;
	}
	
	
	
}
