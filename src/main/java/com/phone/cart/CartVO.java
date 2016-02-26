package com.phone.cart;

public class CartVO {
	/*  cartno                            SMALLINT     NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
	    pcnt                  SMALLINT        NOT NULL COMMENT '수량',
	    tot                             INT    NULL  COMMENT '합계',
	    mno                               INT   NOT NULL   ,
	    p_contentno                         MEDIUMINT     NOT NULL,
	    FOREIGN KEY (mno) REFERENCES member (mno),
	    FOREIGN KEY (p_contentno) REFERENCES p_content (p_contentno)
	) COMMENT='장바구니';*/

	
	private int cartno;
	private int pcnt;
	private int tot;
	private int mno;
	private int p_contentno;
	private String title;
	private int money;
	private String file;
	private int p_categoryno;
	
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getP_contentno() {
		return p_contentno;
	}
	public void setP_contentno(int p_contentno) {
		this.p_contentno = p_contentno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getP_categoryno() {
		return p_categoryno;
	}
	public void setP_categoryno(int p_categoryno) {
		this.p_categoryno = p_categoryno;
	}
	
	
	
	
	
	
}
