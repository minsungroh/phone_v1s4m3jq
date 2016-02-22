package com.phone.pds5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;

public class Pds5DAO {
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  public Pds5DAO(){ // ������, �⺻�� �Ҵ�
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
 
  /**
   * �����͸� �߰��մϴ�.
   * @param pds5DTO ����� ������ ��ü
   * @return �߰��� ���� 1 �Ǵ� 0�� ����
   */
  public int insert(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   =" INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip)";
      sql +=" VALUES(?, ?, ?, ?, ?, 0, now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5 as grpno), 0, 0, ?, ?, ?, ?, ?, ?)";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getRname());
      pstmt.setString(2, pds5DTO.getEmail());
      pstmt.setString(3, pds5DTO.getTitle());
      pstmt.setString(4, pds5DTO.getContent());
      pstmt.setString(5, pds5DTO.getPasswd());
      pstmt.setString(6, pds5DTO.getUrl());
      pstmt.setString(7, pds5DTO.getFile1());
      pstmt.setLong(8,  pds5DTO.getSize1());
      pstmt.setString(9, pds5DTO.getFile2());
      pstmt.setLong(10, pds5DTO.getSize2());
      pstmt.setString(11, pds5DTO.getIp());
      
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

  /**
   * ��ü ����� �����մϴ�. �˻� ��� ���� ����, ����¡ ��� ���� ����
   * @return Pds5DTO ���
   */
  public ArrayList list(){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    ArrayList list = null;            // ���ڵ� ��� ���� 
    
    try {
      sql  =" SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip ";
      sql +=" FROM pds5";
      sql +=" ORDER BY bbsno DESC";
      
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO ��ü �����
      while(rs.next() == true){
        // ���ڵ忡�� �÷��� ���� ������ �ڹ� Ŭ������ ������
        // �����մϴ�.
        Pds5DTO pds5DTO = new Pds5DTO();
        // System.out.println("�޸𸮿� �Ҵ�� ��ü ���� �ڵ�: " + dto.hashCode());
        
        pds5DTO.setBbsno(rs.getInt("bbsno"));
        pds5DTO.setRname(rs.getString("rname"));
        pds5DTO.setEmail(rs.getString("email"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setViewcnt(rs.getInt("viewcnt"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setUrl(rs.getString("url"));
        pds5DTO.setFile1(rs.getString("file1"));
        pds5DTO.setSize1(rs.getInt("size1"));
        pds5DTO.setFile2(rs.getString("file2"));
        pds5DTO.setSize2(rs.getInt("size2"));
        pds5DTO.setIp(rs.getString("ip"));

        list.add(pds5DTO); // �����(�޸�, ���� �迭)�� �߰�
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return list;
    
  }

  /**
   * �˻��� ���ڵ��� ������ �����մϴ�.
   * @param col �˻� �÷�
   * @param word �˻���
   * @return �˻��� ���ڵ� ����
   */
  public int totalRecord(String col, String word){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      if (col.equals("rname")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE rname LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("title")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE title LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");        
      }else if (col.equals("content")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE content LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");         
      }else if (col.equals("email")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE email LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");         
      }else{ // �˻����� �ʴ� ���
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " ORDER BY bbsno DESC"; 
        
        pstmt = con.prepareStatement(sql);
      }
      
      rs = pstmt.executeQuery(); // SELECT
      
      if(rs.next() == true){
        count = rs.getInt("cnt");
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return count;
  }

  /**
   * �˻� ����� �������� �и��� �� �亯���·� �����Ͽ� �����մϴ�.
   * @param nowPage ���� ������, 1���� ����
   * @param col �˻� �÷�
   * @param word �˻��� �ܾ�
   * @return �˻��� ���ڵ带 Bbs3DTO�� ��ȯ�� ���
   */
  public ArrayList list2(int nowPage, String col, String word){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    ArrayList list = null;            // ���ڵ� ��� ���� 
    
    // ----------------------------------------------------------
    // LIMIT�� ���
    // ����: (���� ������ - 1 ) * �������� ����� ���ڵ� ����
    // ----------------------------------------------------------
    // 1 page: (1 - 1) * 10 = 0    LIMIT 0, 10
    // 2 page: (2 - 1) * 10 = 10  LIMIT 10, 10
    // 3 page: (3 - 1) * 10 = 20  LIMIT 20, 10
    // 4 page: (4 - 1) * 10 = 30  LIMIT 30, 10
    // 5 page: (5 - 1) * 10 = 40  LIMIT 40, 10
    // ----------------------------------------------------------
    int offset = (nowPage - 1) * 10; // ù ���ڵ带 �������� ������ ���ڵ� ����
    
    try {
      if (col.equals("rname")){
        sql  = " SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, url, ip ";
        sql += " FROM pds5";
        sql += " WHERE rname LIKE ?";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("title")){
        sql  = " SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, url, ip ";
        sql += " FROM pds5";
        sql += " WHERE title LIKE ?";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");        
      }else if (col.equals("content")){
        sql  = " SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, url, ip ";
        sql += " FROM pds5";
        sql += " WHERE content LIKE ?";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");         
      }else if (col.equals("email")){
        sql  = " SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, url, ip ";
        sql += " FROM pds5";
        sql += " WHERE email LIKE ?";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");         
      }else{ // �˻����� �ʴ� ���
        sql  = " SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, url, ip ";
        sql += " FROM pds5";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
      }
      
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO ��ü �����
      while(rs.next() == true){
        // ���ڵ忡�� �÷��� ���� ������ �ڹ� Ŭ������ ������
        // �����մϴ�.
        Pds5DTO pds5DTO = new Pds5DTO();
        // System.out.println("�޸𸮿� �Ҵ�� ��ü ���� �ڵ�: " + dto.hashCode());
        
        pds5DTO.setBbsno(rs.getInt("bbsno"));
        pds5DTO.setRname(rs.getString("rname"));
        pds5DTO.setEmail(rs.getString("email"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setViewcnt(rs.getInt("viewcnt"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setUrl(rs.getString("url"));
        pds5DTO.setFile1(rs.getString("file1"));
        pds5DTO.setSize1(rs.getInt("size1"));
        pds5DTO.setFile2(rs.getString("file2"));
        pds5DTO.setSize2(rs.getInt("size2"));
        pds5DTO.setIp(rs.getString("ip"));
        
        list.add(pds5DTO); // �����(�޸�, ���� �迭)�� �߰�
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return list;
    
  }
  
  /**
   * ��ȸ���� �����մϴ�.
   * @param bbsno ��ȸ���� ������ų ���ڵ� ��ȣ
   * @return ������ ���ڵ� ���� 1 �Ǵ� 0�� ����
   */
  public int updateViewcnt(int bbsno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   =" UPDATE pds3";
      sql +=" SET viewcnt = viewcnt + 1";
      sql +=" WHERE bbsno = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, bbsno);
      
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);

    }
    
    return count;
  }

  /**
   * �н����尡 �� ��ȣ�� ��ġ�ϴ��� Ȯ���մϴ�.
   * @param bbsno �� ��ȣ
   * @param passwd �н�����
   * @return ��ġ�ϸ� 1, ��ġ���� ������ 0�� ����
   */
  public int passwdCheck(int bbsno, String passwd){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                    // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql  =" SELECT COUNT(passwd) as cnt";
      sql +=" FROM pds5";
      sql +=" WHERE bbsno = ? AND passwd = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, bbsno);
      pstmt.setString(2, passwd);
      
      rs = pstmt.executeQuery(); // SELECT
      
      if(rs.next() == true){
        count = rs.getInt("cnt");
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return count;
    
  }

  /**
   * ���ڵ带 �����մϴ�.
   * @param pds5DTO ������ ������ ��ü
   * @return ���� �����ϸ� 1, ���н� 0�� ����
   */
  public int update(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                 // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   = " UPDATE pds5";
      sql += " SET rname=?, email=?, title=?, content=?, url=?, file1=?, size1=?, file2=?, size2=?";
      sql += " WHERE bbsno=?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getRname());
      pstmt.setString(2, pds5DTO.getEmail());
      pstmt.setString(3, pds5DTO.getTitle());
      pstmt.setString(4, pds5DTO.getContent());
      pstmt.setString(5, pds5DTO.getUrl());
      pstmt.setString(6, pds5DTO.getFile1());
      pstmt.setLong(7,  pds5DTO.getSize1());
      pstmt.setString(8, pds5DTO.getFile2());
      pstmt.setLong(9, pds5DTO.getSize2());
      pstmt.setInt(10, pds5DTO.getBbsno());
      
      count = pstmt.executeUpdate();  // SQL ����
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  /**
   * ���ڵ带 �����մϴ�.
   * @param bbsno ������ ���ڵ� ��ȣ
   * @return ���� ������ 1, ���н� 0�� ����
   */
  public int delete(int bbsno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                 // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   = " DELETE FROM pds5";
      sql += " WHERE bbsno = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, bbsno);
      
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

  /**
   * ���ڵ� �Ѱ��� ��ȸ�մϴ�.
   * @return Pds5DTO ���ڵ� ��ü
   */
  public Pds5DTO read(int bbsno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                    // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    Pds5DTO pds5DTO = null;    // ���ڵ� ��� ���� 
    
    try {
      sql  =" SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, url, ip";
      sql +=" FROM pds5";
      sql +=" WHERE bbsno = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, bbsno);
      
      rs = pstmt.executeQuery(); // SELECT
      
      if(rs.next() == true){
        pds5DTO = new Pds5DTO();
        
        pds5DTO.setBbsno(rs.getInt("bbsno"));
        pds5DTO.setRname(rs.getString("rname"));
        pds5DTO.setEmail(rs.getString("email"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setViewcnt(rs.getInt("viewcnt"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setUrl(rs.getString("url"));
        pds5DTO.setFile1(rs.getString("file1"));
        pds5DTO.setSize1(rs.getInt("size1"));
        pds5DTO.setFile2(rs.getString("file2"));
        pds5DTO.setSize2(rs.getInt("size2"));
        pds5DTO.setIp(rs.getString("ip"));              
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return pds5DTO;
    
  }

  /**
   * �亯�� �߰��մϴ�.
   * @param pds5DTO ����� ������ ��ü
   * @return �߰��� ���� 1 �Ǵ� 0�� ����
   */
  public int reply(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      // ���� �亯�� ���̰� �ִ� �θ�� ������ ��ȸ��.
      Pds5DTO _pds5DTO = read(pds5DTO.getBbsno());
      int grpno = _pds5DTO.getGrpno();
      int indent = _pds5DTO.getIndent();
      int ansnum = _pds5DTO.getAnsnum();
      
      pds5DTO.setGrpno(grpno);
      pds5DTO.setIndent(indent);
      pds5DTO.setAnsnum(ansnum);
      
      sql   = " UPDATE pds5";
      sql += " SET ansnum = ansnum + 1";
      sql += " WHERE grpno = ? AND ansnum > ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, pds5DTO.getGrpno());  //  ���� �亯�� �ް��ִ� �θ�� ��ȣ
      pstmt.setInt(2,  pds5DTO.getAnsnum()); // �� �θ���� ansnum ��ȣ
      pstmt.executeUpdate(); // ������ ��ϵ� �亯�� ������ 1�� ����

      sql   =" INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip)";
      sql +=" VALUES(?, ?, ?, ?, ?, 0, now(), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getRname());
      pstmt.setString(2, pds5DTO.getEmail());
      pstmt.setString(3, pds5DTO.getTitle());
      pstmt.setString(4, pds5DTO.getContent());
      pstmt.setString(5, pds5DTO.getPasswd());
      pstmt.setInt(6, pds5DTO.getGrpno());       // �θ���� �׷��ȣ �״�� ���
      pstmt.setInt(7, pds5DTO.getIndent() + 1);   // �鿩���� �θ𺸴� 1 ����
      pstmt.setInt(8, pds5DTO.getAnsnum() + 1); // �亯���� �θ𺸴� 1 ����
      pstmt.setString(9, pds5DTO.getUrl());
      pstmt.setString(10, pds5DTO.getFile1());
      pstmt.setLong(11,  pds5DTO.getSize1());
      pstmt.setString(12, pds5DTO.getFile2());
      pstmt.setLong(13, pds5DTO.getSize2());
      pstmt.setString(14, pds5DTO.getIp());
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

}

