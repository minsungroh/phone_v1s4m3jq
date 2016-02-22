package com.phone.mypage;

import java.util.ArrayList;

public interface MypageMapperInter {
  //<select id="read" resultType="MypageVO" parameterType="int">
  public MypageVO read(MypageVO mypageVO);
  
  // <select id="count_paywait" resultType="int" parameterType="int">
  public int count_paywait(int mno);
  
  // <select id="count_payok" resultType="int" parameterType="int">
  public int count_payok(int mno);
  
  // <select id="count_pready" resultType="int" parameterType="int">
  public int count_pready(int mno);
  
  // <select id="count_delivery" resultType="int" parameterType="int">
  public int count_delivery(int mno);
  
  // <select id="count_okwait" resultType="int" parameterType="int">
  public int count_okwait(int mno);
  
  // <select id="list" resultType="MypageVO" parameterType="MypageVO">
  public ArrayList<MypageVO> list(MypageVO mypageVO);
  
  // <select id="detail_read" resultType="MypageVO" parameterType="MypageVO">
  public MypageVO detail_read(MypageVO mypageVO);
  
  // <update id="update_os" parameterType="MypageVO">
  public int update_os(MypageVO mypageVO);
  
  // <select id="update_read" resultType="MypageVO" parameterType="int">
  public MypageVO update_read(MypageVO mypageVO);
  
  // <insert id="create" parameterType="MypageVO">
  public int create(MypageVO mypageVO);
  
  // <select id="read_mypageno" resultType="MypageVO" parameterType="MypageVO">
  public MypageVO read_mypageno(MypageVO mypageVO);
  
  // <update id="takeback_update" parameterType="MypageVO">
  public int takeback_update(MypageVO mypageVO);
  
  // <select id="take_back_cancel" resultType="MypageVO" parameterType="MypageVO">
  public MypageVO take_back_cancel(MypageVO mypageVO);
  
  //    <update id="replace_update" parameterType="MypageVO">
  public int replace_update(MypageVO mypageVO);
  
  // <select id="count_payno" resultType="int">
  public int count_payno();
  
  // <select id="count_ok" resultType="int" parameterType="int">
  public int count_ok(int mno);
}
