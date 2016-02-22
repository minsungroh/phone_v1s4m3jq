package com.phone.point;

public interface PointMapperInter {
  //<insert id="create" parameterType="PointVO">
  public int create(PointVO pointVO);
  
  //  <update id="payno_update" parameterType="PointVO">
  public int payno_update(PointVO pointVO);
  
  // <select id="pointno_read" resultType="PointVO" parameterType="PointVO">
  public PointVO pointno_read(PointVO pointVO);
  
  // <insert id="create_point" parameterType="PointVO">
  public int create_point(PointVO pointVO);
}
