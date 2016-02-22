package com.phone.p_category;

import java.util.ArrayList;

public interface P_categoryMapperInter {
  
  public int create(P_categoryVO p_categoryVO);
  
  // <select id="list" resultType="P_categoryVO">
  public ArrayList<P_categoryVO> list();
  
  // <select id="read" resultType="P_categoryVO" parameterType="int">
  public P_categoryVO read(int p_categoryno);
  
  // <update id="update" parameterType="P_categoryVO">
  public int update(P_categoryVO p_categoryVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int p_categoryno); 
  
  // <update id="update_grp" parameterType="P_categoryVO">
  public int update_codeno(P_categoryVO p_categoryVO); 
  
  // <update id="update_orderno" parameterType="P_categoryVO">
  public int update_orderno(P_categoryVO p_categoryVO);
  
  // <update id="update_visible" parameterType="P_categoryVO">
  public int update_visible(P_categoryVO p_categoryVO);
  
}








