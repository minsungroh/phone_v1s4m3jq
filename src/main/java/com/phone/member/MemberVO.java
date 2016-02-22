package com.phone.member;

public class MemberVO {
  /*
   * mno INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'mno', id
   * VARCHAR(20) NOT NULL UNIQUE COMMENT 'id', passwd VARCHAR(20) NOT NULL
   * COMMENT 'passwd', mname VARCHAR(20) NOT NULL COMMENT 'mname', grade CHAR(1)
   * DEFAULT 'F' NOT NULL COMMENT '회원 등급', -- 'A' : VIP(total 50건, 100만원 이상
   * 구매고객), B : 우수회원(total 30건, 50만원 이상 구매고객), C: 보통회원(total : 10건, 10만원 이상 구매
   * 고객), F: 신규회원 tel VARCHAR(14) NOT NULL COMMENT 'tel', zipcode VARCHAR(5)
   * NULL COMMENT 'zipcode', address1 VARCHAR(80) NULL COMMENT 'address1',
   * address2 VARCHAR(50) NULL COMMENT 'address2', mdate DATETIME NOT NULL
   * COMMENT 'mdate'
   */

  private int mno;
  private String id;
  private String passwd;
  private String mname;
  private String nname;
  private String grade;
  private String tel;
  private String zipcode;
  private String address1;
  private String address2;
  private String mdate;
  
  private String old_passwd;
  private String id_save;
  private String passwd_save;
  private String url_address;
public int getMno() {
	return mno;
}
public void setMno(int mno) {
	this.mno = mno;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public String getMname() {
	return mname;
}
public void setMname(String mname) {
	this.mname = mname;
}
public String getNname() {
	return nname;
}
public void setNname(String nname) {
	this.nname = nname;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getZipcode() {
	return zipcode;
}
public void setZipcode(String zipcode) {
	this.zipcode = zipcode;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public String getMdate() {
	return mdate;
}
public void setMdate(String mdate) {
	this.mdate = mdate;
}
public String getOld_passwd() {
	return old_passwd;
}
public void setOld_passwd(String old_passwd) {
	this.old_passwd = old_passwd;
}
public String getId_save() {
	return id_save;
}
public void setId_save(String id_save) {
	this.id_save = id_save;
}
public String getPasswd_save() {
	return passwd_save;
}
public void setPasswd_save(String passwd_save) {
	this.passwd_save = passwd_save;
}
public String getUrl_address() {
	return url_address;
}
public void setUrl_address(String url_address) {
	this.url_address = url_address;
}

  
}
