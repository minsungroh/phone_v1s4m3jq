package com.phone.p_category;

public class P_categoryVO {
/*	p_categoryno                  		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
	title                         		VARCHAR(50)		 NOT NULL COMMENT '����',
	orderno                       		SMALLINT(5)		DEFAULT 1 NOT NULL COMMENT '���ļ���',
	visible                       		CHAR(1)		DEFAULT 'Y' NOT NULL COMMENT '��������',
	ids                           		VARCHAR(100)	 DEFAULT 'admin'	 NOT NULL COMMENT '��������',
	cnt                           		MEDIUMINT(7)	DEFAULT 0	 NOT NULL COMMENT '��ϵ� �� ��',
	codeno                        		MEDIUMINT(7)		 NULL  COMMENT '�ڵ��ȣ',*/
	
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
