package com.phone.code;

import java.util.ArrayList;

public interface CodeMapperInter {
 
  public int create(CodeVO codeVO);
  

  public ArrayList<CodeVO> list();
  
  // <update id="update" parameterType="CodeVO">
  public int update(CodeVO codeVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int codeno);

}







