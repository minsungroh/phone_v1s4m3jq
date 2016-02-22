package com.phone.Trace_situation;

import java.util.ArrayList;

public interface Trace_situationMapperInter {
  //   <insert id="create" parameterType="Trace_situationVO">
  public int create(Trace_situationVO trace_situationVO);
  
  //<select id="list" resultType="Trace_situationVO">
  public ArrayList<Trace_situationVO> list();
  
  // <select id="read" resultType="Trace_situationVO" parameterType="Trace_situationVO">
  public ArrayList<Trace_situationVO> read(Trace_situationVO trace_situationVO);
  
  // <update id="update" parameterType="Trace_situationVO">
  public int update(Trace_situationVO trace_situationVO);
  
  // <delete id="delete" parameterType="Trace_situationVO">
  public int delete(Trace_situationVO trace_situationVO);
  
  // <select id="tsno_read" resultType="Trace_situationVO" parameterType="int">
  public Trace_situationVO tsno_read(int tsno);
}
