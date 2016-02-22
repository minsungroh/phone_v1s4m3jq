package com.phone.p_content;

import java.util.ArrayList;

public interface P_contentMapperInter {
  // <insert id="create" parameterType="P_contentVO">
  public int create(P_contentVO p_contentVO);
  
  // <select id="list" resultType="P_contentVO">
  public ArrayList<P_contentVO> list(); 
  
  // <select id="read" resultType="P_contentVO" parameterType="int">
  public P_contentVO read(int p_contentno);
  
  // <update id="update" parameterType="P_contentVO">
  public int update(P_contentVO p_contentVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int p_contentno);
  
  // <select id="list2" resultType="<select id="list2" resultType="P_contentVO" parameterType="P_contentVO">" parameterType="P_contentVO">
  public ArrayList<P_contentVO> list2(P_contentVO p_contentVO); 
  
  public ArrayList<P_contentVO> show_list(P_contentVO p_contentVO);
  
}


