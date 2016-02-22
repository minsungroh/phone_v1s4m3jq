package com.phone.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.member.memberDAO")
public class MemberDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체
  
  public MemberDAO(){
    System.out.println("--> MemberDAO created.");
  }
  
  public MemberMapperInter mapper(){
    MemberMapperInter mapper = sqlSession.getMapper(MemberMapperInter.class);    
    
    return mapper;
  }

  /**
   * 레코드를 등록합니다.
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(MemberVO memberVO) {
    return mapper().create(memberVO);
  }

  public int checkId(String id) {
    return mapper().checkId(id);
  }
  
  
  /**
   * 전체 목록을 리턴합니다.
   * @return 전체 목록
   */
  public ArrayList<MemberVO> list(){
    return mapper().list();
  }
  
  /**
   * 회원 정보 조회
   * @param mno
   * @return
   */
  public MemberVO read(int mno){
   return mapper().read(mno); 
  } 
  
  /**
   * 회원을 수정합니다.
   * @param memberVO
   * @return 수정된 레코드 갯수
   */
  public int update(MemberVO memberVO){
    return mapper().update(memberVO);
  }
  
  /**
   * 기존 등록된 패스워드를 검사합니다.
   * 실제 컬럼과 VO의 변수가 다른경우의 처리, Map이용
   * @param memberVO
   * @return
   */
  public int passwdCheck(MemberVO memberVO){
    int mno = memberVO.getMno();
    String passwd = memberVO.getOld_passwd(); // 기존 패스워드
    
    Map map = new HashMap();
    map.put("mno", mno);
    map.put("passwd", passwd);
    
    return mapper().passwdCheck(map);
  }
  
  /**
   * 패스워드를 변경합니다.
   * <update id="update_passwd" parameterType="MemberVO">
   * @param memberVO
   * @return 변경된 레코드 갯수
   */
  public int update_passwd(MemberVO memberVO){
    return mapper().update_passwd(memberVO);
  }
 
  /**
   * 회원을 삭제합니다.
   * @param mno
   * @return
   */
  public int delete(int mno){
    return mapper().delete(mno);
  }
  
  /**
   * 로그인 처리
   * @param memberVO 아이디, 패스워드
   * @return 0: 로그인 실패, 1: 성공
   */
  public int login(MemberVO memberVO){
    return mapper().login(memberVO);
        
  } 
  
  public MemberVO id_read(MemberVO memberVO){
    return mapper().id_read(memberVO);
  }
  
  public MemberVO read_id(MemberVO memberVO){
    return mapper().read_id(memberVO);
  }
}



