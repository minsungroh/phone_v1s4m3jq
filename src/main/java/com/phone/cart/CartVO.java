package com.phone.cart;

public class CartVO {
/*	cartno                        		SMALLINT		 NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
	mno                      		MEDIUMINT		 NOT NULL COMMENT '회원번호',
	producttitle                  		VARCHAR(200)		 NOT NULL COMMENT '상품이름',
	productno                     		SMALLINT		 NOT NULL COMMENT '상품번호',
	cnt 									SMALLINT        NOT NULL COMMENT '수량',
	total                         		INT		 NULL  COMMENT '합계'*/
	
	private int cartno;
	private int mno;
	private String producttitle;
	private int productno;
	private int cnt;
	private int total;
	
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getProducttitle() {
		return producttitle;
	}
	public void setProducttitle(String producttitle) {
		this.producttitle = producttitle;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
