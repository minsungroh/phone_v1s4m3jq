package com.phone.cart;

import java.util.ArrayList;

public interface CartMapperInter {
	//<insert id="create" parameterType="CartVO">
	public int create(CartVO cartVO);
	
	//<select id="list" resultType="CartVO">
	public ArrayList<CartVO> list();
	
	//<select id="list2" resultType="CartVO" parameterType="int">
	public ArrayList<CartVO> list2(int mno);
	
	public int update(CartVO cartVO);
	
	//<delete id="delete" parameterType="int">
	public int delete(int cartno);
}
