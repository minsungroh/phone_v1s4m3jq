package com.phone.admin1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;

public class Admin1DAO {
  DBOpen dbopen = null;  // 필드
  DBClose dbclose = null;
  
  public Admin1DAO(){ // 생성자, 기본값 할당, return type 생략, 클래스 이름과 동일
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  /**
   * 동일한 email 컬럼의 값을 검색하여 갯수를 구합니다.
   * @param col 검색 컬럼
   * @param word 검색어
   * @return 검색된 갯수
   */
  public int count(String col, String word){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;       // SELECT 결과를 저장
    StringBuffer sql = null; // SQL 문
    int count = 0;              // 레코드 갯수

    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE " + col + " = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, word);
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // 첫번째 레코드로 이동, 0 or 
      count = rs.getInt("cnt");     

    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return count;
  }
  
  /**
   * 관리자 등록
   * @param vo 관리자 내용
   * @return 1: 등록 성공, 0: 등록 실패
   */
  public int insert(Admin1VO vo){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)");
      sql.append(" VALUES(?, ?, ?, ?, ?, now())");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getEmail());
      pstmt.setString(2, vo.getPasswd());
      pstmt.setString(3, vo.getAuth());
      pstmt.setString(4, vo.getAct());
      pstmt.setString(5, vo.getConfirm());
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }

  /**
   * 사용자가 회원 가입 이메일 링크를 눌렀을 경우의 처리
   * @param email 이메일
   * @param auth 인증 코드
   * @return 처리된 레코드 갯수
   */
  public int confirm(String email, String auth){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET confirm = 'Y'");
      sql.append(" WHERE email=? AND auth=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, auth);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }

  /**
   * 단순 목록을 구합니다.
   * @return 목록
   */
  public ArrayList<Admin1VO> list(){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;       // SELECT 결과를 저장
    StringBuffer sql = null; // SQL 문
    ArrayList<Admin1VO> list = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin1no, email, auth, act, confirm, mdate ");
      sql.append(" FROM admin1 ");
      sql.append(" ORDER BY email ASC");
        
      pstmt = con.prepareStatement(sql.toString());
      rs= pstmt.executeQuery();  // SELECT
      
      list = new ArrayList<Admin1VO>();
      while(rs.next() == true){
        Admin1VO vo = new Admin1VO();
        vo.setAdmin1no(rs.getInt("admin1no"));
        vo.setEmail(rs.getString("email"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
        
        list.add(vo);
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return list;
  }
  
  /**
   * 권한을 변경합니다.
   * @param admin1no 변경할 회원 번호
   * @param act 권한
   * @return 변경된 레코드 수
   */
  public int updateAct(int admin1no, String act){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET  act=?");
      sql.append(" WHERE admin1no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, act);
      pstmt.setInt(2, admin1no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }

  /**
   * 조회
   * @return 1건의 레코드
   */
  public Admin1VO read(int admin1no){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;       // SELECT 결과를 저장
    StringBuffer sql = null; // SQL 문
    Admin1VO vo = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin1no, email, passwd, auth, act, confirm, mdate ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE admin1no = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);
      rs= pstmt.executeQuery();  // SELECT
      
      vo = new Admin1VO();
      if(rs.next() == true){
        vo.setAdmin1no(rs.getInt("admin1no"));
        vo.setEmail(rs.getString("email"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return vo;
  }

  public Admin1VO readEmail(String email){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;       // SELECT 결과를 저장
    StringBuffer sql = null; // SQL 문
    Admin1VO vo = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin1no, email, passwd, auth, act, confirm, mdate ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE email = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      rs= pstmt.executeQuery();  // SELECT
      
      vo = new Admin1VO();
      if(rs.next() == true){
        vo.setAdmin1no(rs.getInt("admin1no"));
        vo.setEmail(rs.getString("email"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return vo;
  }
  
  /**
   * 패스워드가 일치하는지 확인합니다.
   * @param admin1no 회원 번호
   * @param passwd 패스워드
   * @return 1: 일치, 0: 불일치
   */
  public int countPasswd(int admin1no, String passwd){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;       // SELECT 결과를 저장
    StringBuffer sql = null; // SQL 문
    int count = 0;              // 레코드 갯수

    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE admin1no=? AND passwd=?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);
      pstmt.setString(2, passwd);
      
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // 첫번째 레코드로 이동, 0 or 
      count = rs.getInt("cnt");     

    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return count;
  }
  
  /**
   * 패스워드를 변경합니다.
   * @param admin1no 변경할 회원 번호
   * @param passwd 번경할 패스워드
   * @return 1: 변경 성공, 2: 변경 실패
   */
  public int updatePasswd(int admin1no, String passwd){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET passwd=?");
      sql.append(" WHERE admin1no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, passwd);
      pstmt.setInt(2, admin1no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }

  /**
   * 회원 정보를 수정합니다.
   * @param admin1no 회원 번호
   * @param email 변경할 이메일
   * @return 변경된 레코드 갯수
   */
  public int update(int admin1no, String email){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET email=?");
      sql.append(" WHERE admin1no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setInt(2, admin1no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }

  /**
   * 회원을 삭제합니다.
   * @param admin1no 삭제할 회원 번호
   * @return 삭데된 레코드 갯수
   */
  public int delete(int admin1no){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" DELETE FROM admin1");
      sql.append(" WHERE admin1no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }
  
  /**
   * 로그인 처리
   * @param email 이메일
   * @param passwd 패스워드
   * @return 0: 일치하는 정보 없음, 1: 로그인 가능
   */
  public int login(String email, String passwd){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;       // SELECT 결과를 저장
    StringBuffer sql = null; // SQL 문
    int count = 0;              // 레코드 갯수

    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE email=? AND passwd=?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, passwd);
      
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // 첫번째 레코드로 이동, 0 or 
      count = rs.getInt("cnt");     

    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return count;
  }
  

}


