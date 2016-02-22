package com.phone.member;

import java.util.ArrayList;
import java.util.Map;

import com.phone.member.MemberVO;


public interface MemberMapperInter {
	  /**
	   * 레코드를 등록합니다.
	   * <insert id="create" parameterType="MemberVO">
	   * @param vo 등록할 데이터 객체
	   * @return 등록된 레코드 수
	   */
	  public int create(MemberVO memberVO);
	  
	  /**
	   * 중복 아이디를 검사합니다.
	   * <select id='checkId' resultType='int' parameterType='String'>
	   * @param id 아이디
	   * @return 0: 중복 아님, 1: 중복
	   */
	  public int checkId(String id);
	  
	  /**
	   * 회원 전체 목록
	   * <select id="list" resultType="MemberVO">
	   * @return 회원 목록
	   */
	  public ArrayList<MemberVO> list();
	  
	  /**
	   * 회원 정보 조회
	   * <select id="read" resultType="MemberVO" parameterType="int">
	   * @param mno
	   * @return
	   */
	  public MemberVO read(int mno); 
	  
	  
	  /**
	   * 회원을 수정합니다.
	   * <update id="update" parameterType="MemberVO"> 
	   * @param memberVO
	   * @return 수정된 레코드 갯수
	   */
	  public int update(MemberVO memberVO);
	  
	  // <select id="passwdCheck" resultType="int" parameterType="Map">
	  public int passwdCheck(Map map);
	  
	  //   <update id="update_passwd" parameterType="MemberVO">
	  public int update_passwd(MemberVO memberVO);
	  
	  //   <delete id="delete" parameterType="int">
	  public int delete(int mno); 
	  
	  // <select id="login" resultType="int" parameterType="MemberVO">
	  public int login(MemberVO memberVO);
	   
	  // <select id="id_read" resultType="MemberVO" parameterType="MemberVO">
	  public MemberVO id_read(MemberVO memberVO);
	  
	  // <select id="read_id" resultType="MemberVO" parameterType="MemberVO">
	  public MemberVO read_id(MemberVO memberVO);
	}
