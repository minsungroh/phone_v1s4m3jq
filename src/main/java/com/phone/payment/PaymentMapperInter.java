package com.phone.payment;

import java.util.ArrayList;

public interface PaymentMapperInter {
  //   <insert id="create" parameterType="PaymentVO">
  public int create(PaymentVO paymentVO);
  
  // <select id="read" resultType="PaymentVO" parameterType="int">
  public PaymentVO read(PaymentVO paymentVO);
  
  // <select id="list" resultType="PaymentVO">
  public ArrayList<PaymentVO> list(int payno);
  
  // <update id="update" parameterType="PaymentVO">
  public int update(PaymentVO paymentVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int payno);
  
  // <select id="create_read" resultType="PaymentVO" parameterType="PaymentVO">
  public PaymentVO create_read(PaymentVO paymentVO);
  
  // <select id="mypage_read" resultType="PaymentVO" parameterType="int">
  public PaymentVO mypage_read(PaymentVO paymentVO);
  
  // <select id="payno_read" resultType="PaymentVO" parameterType="PaymentVO">
  public PaymentVO payno_read(PaymentVO paymentVO);
  
 // <update id="dismoney_update" parameterType="PaymentVO">
  public int dismoney_update(PaymentVO paymentVO);
  
  // <select id="read_point" resultType="PaymentVO" parameterType="PaymentVO">
  public PaymentVO read_point(PaymentVO paymentVO);
}
