package com.phone.trace;

import java.util.ArrayList;

public interface TraceMapperInter {
  // <insert id="create" parameterType="TraceVO">
  public int create(TraceVO traceVO);
  
  // <select id="list" resultType="TraceVO" parameterType="int">
  public ArrayList<TraceVO> list(TraceVO traceVO);
  
  // <select id="read" resultType="TraceVO" parameterType="TraceVO">
  public TraceVO read(TraceVO traceVO);
  
  // <update id="update" parameterType="TraceVO">
  public int update(TraceVO traceVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int deleveryno);
  
  // <select id="trace_situration_list" resultType="TraceVO" parameterType="TraceVO">
  public ArrayList<TraceVO> trace_situration_list(TraceVO traceVO);
  
  // <update id="ts_update" parameterType="TraceVO">
  public int ts_update(TraceVO traceVO);
  
  // <update id="mypageno_update" parameterType="TraceVO">
  public int mypageno_update(TraceVO traceVO);
  
  // <select id="trace_read" resultType="TraceVO" parameterType="TraceVO">
  public TraceVO trace_read(TraceVO traceVO);
  
  //   <select id="mypage_read" resultType="TraceVO" parameterType="TraceVO">
  public TraceVO mypage_read(TraceVO traceVO);
  
  // <update id="update_mypage_my_state" parameterType="TraceVO">
  public int update_mypage_my_state(TraceVO traceVO);
}
