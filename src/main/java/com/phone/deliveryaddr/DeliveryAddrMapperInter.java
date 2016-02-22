package com.phone.deliveryaddr;

import java.util.ArrayList;

public interface DeliveryAddrMapperInter {
  //<insert id="create" parameterType="DeliveryAddrVO">
  public int create(DeliveryAddrVO deliveryAddrVO);
  
  //<select id="list" resultType="DeliveryAddrVO">
  public ArrayList<DeliveryAddrVO> list(int mno);
  
  //<select id="read" resultType="DeliveryAddrVO" parameterType="int">
  public DeliveryAddrVO read(int mno);
  
  //<update id="update" parameterType="DeliveryAddrVO">
  public int update(DeliveryAddrVO deliveryAddrVO);
  
  // <delete id="delete" parameterType="DeliveryAddrVO">
  public int delete(int dno);
}
