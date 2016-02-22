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
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
  
  public MemberDAO(){
    System.out.println("--> MemberDAO created.");
  }
  
  public MemberMapperInter mapper(){
    MemberMapperInter mapper = sqlSession.getMapper(MemberMapperInter.class);    
    
    return mapper;
  }

  /**
   * ���ڵ带 ����մϴ�.
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(MemberVO memberVO) {
    return mapper().create(memberVO);
  }

  public int checkId(String id) {
    return mapper().checkId(id);
  }
  
  
  /**
   * ��ü ����� �����մϴ�.
   * @return ��ü ���
   */
  public ArrayList<MemberVO> list(){
    return mapper().list();
  }
  
  /**
   * ȸ�� ���� ��ȸ
   * @param mno
   * @return
   */
  public MemberVO read(int mno){
   return mapper().read(mno); 
  } 
  
  /**
   * ȸ���� �����մϴ�.
   * @param memberVO
   * @return ������ ���ڵ� ����
   */
  public int update(MemberVO memberVO){
    return mapper().update(memberVO);
  }
  
  /**
   * ���� ��ϵ� �н����带 �˻��մϴ�.
   * ���� �÷��� VO�� ������ �ٸ������ ó��, Map�̿�
   * @param memberVO
   * @return
   */
  public int passwdCheck(MemberVO memberVO){
    int mno = memberVO.getMno();
    String passwd = memberVO.getOld_passwd(); // ���� �н�����
    
    Map map = new HashMap();
    map.put("mno", mno);
    map.put("passwd", passwd);
    
    return mapper().passwdCheck(map);
  }
  
  /**
   * �н����带 �����մϴ�.
   * <update id="update_passwd" parameterType="MemberVO">
   * @param memberVO
   * @return ����� ���ڵ� ����
   */
  public int update_passwd(MemberVO memberVO){
    return mapper().update_passwd(memberVO);
  }
 
  /**
   * ȸ���� �����մϴ�.
   * @param mno
   * @return
   */
  public int delete(int mno){
    return mapper().delete(mno);
  }
  
  /**
   * �α��� ó��
   * @param memberVO ���̵�, �н�����
   * @return 0: �α��� ����, 1: ����
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



