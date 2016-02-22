package com.phone.p_content;

import org.springframework.web.multipart.MultipartFile;

public class P_contentVO {
/*  p_contentno                         MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ǰ��ȣ',
  title                             VARCHAR(200)     NOT NULL COMMENT '��ǰ�̸�',
  content                           MEDIUMTEXT     NOT NULL COMMENT '����',
  file                              VARCHAR(100)     NULL  COMMENT 'Thumb����',
  file1                             VARCHAR(300)     NULL  COMMENT '÷������',
  replycnt                              INT(5)     DEFAULT 0  NULL  COMMENT '��ۼ�',
  money                             MEDIUMINT(10)    NOT NULL COMMENT '��ǰ��',
  productcnt                        MEDIUMINT(10)    DEFAULT 0     NULL  COMMENT '��ǰ����',
    p_categoryno                      MEDIUMINT(7)     NULL  COMMENT 'ī�װ���ȣ',*/
    
  private int p_contentno;
  private String title;
  private String content;
  private String file;
  private String file1;
  private int replycnt;
  private int money;
  private int pcnt;
  private String meterial;
  private int p_categoryno;
  
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
public String getContent() {
  return content;
}
public void setContent(String content) {
  this.content = content;
}
public String getFile() {
  return file;
}
public void setFile(String file) {
  this.file = file;
}
public String getFile1() {
  return file1;
}
public void setFile1(String file1) {
  this.file1 = file1;
}
public int getReplycnt() {
  return replycnt;
}
public void setReplycnt(int replycnt) {
  this.replycnt = replycnt;
}
public int getMoney() {
  return money;
}
public void setMoney(int money) {
  this.money = money;
}

public int getPcnt() {
  return pcnt;
}
public void setPcnt(int pcnt) {
  this.pcnt = pcnt;
}
public String getMeterial() {
  return meterial;
}
public void setMeterial(String meterial) {
  this.meterial = meterial;
}
public int getP_categoryno() {
  return p_categoryno;
}
public void setP_categoryno(int p_categoryno) {
  this.p_categoryno = p_categoryno;
}
/* Framework���� �ڵ� ���ԵǴ� Thumb ���� ��ü */
  private MultipartFile fileMF;
  /* Framework���� �ڵ� ���ԵǴ� ���� ��ü */  
  private MultipartFile file1MF;
  
  private String oldfile;
  private String oldfile1;
  
  public MultipartFile getFileMF() {
    return fileMF;
  }
  public void setFileMF(MultipartFile fileMF) {
    this.fileMF = fileMF;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
 
  public String getOldfile() {
    return oldfile;
  }
  public void setOldfile(String oldfile) {
    this.oldfile = oldfile;
  }
  public String getOldfile1() {
    return oldfile1;
  }
  public void setOldfile1(String oldfile1) {
    this.oldfile1 = oldfile1;
  }
  
  
}
