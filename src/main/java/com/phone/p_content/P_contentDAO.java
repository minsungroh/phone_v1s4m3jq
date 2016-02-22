package com.phone.p_content;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.p_content.P_contentDAO")
public class P_contentDAO implements P_contentMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public P_contentDAO(){
    System.out.println("--> P_contentDAO created.");
  }
  
  public P_contentMapperInter mapper(){
    P_contentMapperInter mapper = sqlSession.getMapper(P_contentMapperInter.class);    
    
    return mapper;
  }

@Override
public int create(P_contentVO p_contentVO) {
	return mapper().create(p_contentVO);
}

@Override
public ArrayList<P_contentVO> list() {
	return mapper().list();
}

@Override
public P_contentVO read(int p_contentno) {
	return mapper().read(p_contentno);
}

@Override
public int update(P_contentVO p_contentVO) {
	return mapper().update(p_contentVO);
}

@Override
public int delete(int p_contentno) {
	return mapper().delete(p_contentno);
}

@Override
public ArrayList<P_contentVO> list2(P_contentVO p_contentVO) {
	return mapper().list2(p_contentVO);
}

@Override
public ArrayList<P_contentVO> show_list(P_contentVO p_contentVO) {
	return mapper().show_list(p_contentVO);
}

  
  
}

