package com.phone.p_category;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.p_category.P_categoryDAO")
public class P_categoryDAO implements P_categoryMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체
  
  public P_categoryDAO(){
    System.out.println("-->P_categoryDAO created.");
  }
  
  public P_categoryMapperInter mapper(){
    P_categoryMapperInter mapper = sqlSession.getMapper(P_categoryMapperInter.class);    
    
    return mapper;
  }
  /**
   * 핸드폰 카테고리를 등록합니다.
   * <insert id="create" parameterType="P_categoryVO">
   * @param P_categoryVO
   * @return
   */
  
@Override
public int create(P_categoryVO p_categoryVO) {
	return mapper().create(p_categoryVO);
}

@Override
public ArrayList<P_categoryVO> list() {
	return mapper().list();
}

@Override
public P_categoryVO read(int p_categoryno) {
	return mapper().read(p_categoryno);
}

@Override
public int update(P_categoryVO p_categoryVO) {
	return mapper().update(p_categoryVO);
}

@Override
public int delete(int p_categoryno) {
	return mapper().delete(p_categoryno);
}

@Override
public int update_codeno(P_categoryVO p_categoryVO) {
	return mapper().update_codeno(p_categoryVO);
}

@Override
public int update_orderno(P_categoryVO p_categoryVO) {
	return mapper().update_orderno(p_categoryVO);
}

@Override
public int update_visible(P_categoryVO p_categoryVO) {
	return update_visible(p_categoryVO);
}

  
}



