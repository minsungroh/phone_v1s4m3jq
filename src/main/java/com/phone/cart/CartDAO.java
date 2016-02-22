package com.phone.cart;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("com.phone.cart.CartDAO")
public class CartDAO implements CartMapperInter{
	@Autowired
	  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
	  
	  public CartDAO(){
	    System.out.println("--> CartDAO created.");
	  }
	  
	  public CartMapperInter mapper(){
	    CartMapperInter mapper = sqlSession.getMapper(CartMapperInter.class);    
	    
	    return mapper;
	  }

	@Override
	public int create(CartVO cartVO) {
		return mapper().create(cartVO);
	}

	@Override
	public ArrayList<CartVO> list() {
		return mapper().list();
	}

	@Override
	public int update(CartVO cartVO) {
		return mapper().update(cartVO);
	}

	@Override
	public int delete(int cartno) {
		return mapper().delete(cartno);
	}

	@Override
	public ArrayList<CartVO> list2(int mno) {
		return mapper().list2(mno);
	}
	
}
