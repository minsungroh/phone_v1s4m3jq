package com.phone.code;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.code.CodeDAO")
public class CodeDAO implements CodeMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public CodeDAO(){
    System.out.println("--> CodeDAO created.");
  }
  
  public CodeMapperInter mapper(){
    CodeMapperInter mapper = sqlSession.getMapper(CodeMapperInter.class);    
    
    return mapper;
  }


  @Override
  public int create(CodeVO codeVO) {
    return mapper().create(codeVO);
  }

  @Override
  public ArrayList<CodeVO> list() {
    return mapper().list();
  }

  @Override
  public int update(CodeVO codeVO) {
    return mapper().update(codeVO);
  }

  @Override
  public int delete(int codeno) {
    return mapper().delete(codeno);
  }
  
  
}