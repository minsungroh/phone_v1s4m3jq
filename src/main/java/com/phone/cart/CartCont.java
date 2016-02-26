package com.phone.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.phone.p_content.P_contentDAO;
import com.phone.p_content.P_contentVO;

import web.tool.Tool;







@Controller
public class CartCont {
	  @Autowired
	  @Qualifier("com.phone.cart.CartDAO")
	  private CartDAO cartDAO;
	  
	  @Autowired
	  @Qualifier("com.phone.p_content.P_contentDAO")
	  private P_contentDAO p_contentDAO;
	  
	  public CartCont(){
	    System.out.println("--> CartCont created.");
	  }
	
	  @RequestMapping(value = "/cart/create.do", method = RequestMethod.GET)
	  public ModelAndView create() {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/create"); // /webapp/code/create.jsp
	 
	    return mav;
	  }
	 
	  @RequestMapping(value = "/cart/create.do", method = RequestMethod.POST)
	  public ModelAndView create(CartVO cartVO, HttpSession session, HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/message");
	    int mno = 0;
	    
	    if(Tool.isMember(request) == true){
	        mno = (Integer)session.getAttribute("mno");
	        System.out.println("-->mno: " + mno);
	        cartVO.setMno(mno);
	        mav.addObject("mno", mno);
	    }
	 
	    ArrayList<String> msgs = new ArrayList<String>();
	    ArrayList<String> links = new ArrayList<String>();
	 
	    
	   
	    System.out.println("--> contentno: "+ cartVO.getP_contentno());
	    System.out.println("--> ����: "+ cartVO.getPcnt());
	    if (cartDAO.create(cartVO) == 1) {
	      mav.setViewName("redirect:/cart/list2.do?mno="+mno); // Ȯ���� ���!!!
	      // msgs.add("�ڵ带 ����߽��ϴ�.");
	      // links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
	    } else {
	      msgs.add("��ٱ��� ��Ͽ� �����߽��ϴ�.");
	      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
	      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
	 
	      mav.addObject("msgs", msgs);
	      mav.addObject("links", links);
	    }
	 
	    return mav;
	  }

	  /**
	   * ��ü ����� ����մϴ�.
	   * 
	   * @return
	   */
	  @RequestMapping(value = "/cart/list.do", method = RequestMethod.GET)
	  public ModelAndView list() {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/list");
	    mav.addObject("list", cartDAO.list());
	 
	    return mav;
	  }

	 
	 @RequestMapping(value ="/cart/update.do", method= RequestMethod.POST)
	 public ModelAndView update(CartVO cartVO){
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("/cart/message");
		 
		 
		 
		 
		 ArrayList<String> msgs = new ArrayList<String>();
		    ArrayList<String> links = new ArrayList<String>();
		 
		    if (cartDAO.update(cartVO) == 1) {
		      mav.setViewName("redirect:/cart/list.do"); // Ȯ���� ���!!!
		      // msgs.add("�ڵ带 ����߽��ϴ�.");
		      // links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
		    } else {
		      msgs.add("�ڵ� ���濡 �����߽��ϴ�.");
		      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
		      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
		 
		      mav.addObject("msgs", msgs);
		      mav.addObject("links", links);
		    }

		 
		 return mav;
	 }
	 
	 @RequestMapping(value = "/cart/delete.do", method = RequestMethod.POST)
	  public ModelAndView delete(int cartno) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/message");
	 
	    ArrayList<String> msgs = new ArrayList<String>();
	    ArrayList<String> links = new ArrayList<String>();
	 
	    if (cartDAO.delete(cartno) == 1) {
	      mav.setViewName("redirect:/cart/list.do"); // Ȯ���� ���!!!
	      // msgs.add("�ڵ带 ����߽��ϴ�.");
	      // links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
	    } else {
	      msgs.add("��ٱ��� ������ �����߽��ϴ�.");
	      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
	      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
	 
	      mav.addObject("msgs", msgs);
	      mav.addObject("links", links);
	    }
	 
	    return mav;
	  }
	 
	 @RequestMapping(value = "/cart/list2.do", method = RequestMethod.GET)
	  public ModelAndView list2(CartVO cartVO , HttpSession session, HttpServletRequest request){
	    ModelAndView mav = new ModelAndView();
	    int mno = 0;
	    if(Tool.isMember(request) == true){
	        mno = (Integer)session.getAttribute("mno");
	        System.out.println("-->mno: " + mno);
	        cartVO.setMno(mno);
	        mav.addObject("mno", mno);
	        mav.setViewName("/cart/list2");
	    }else{
	    	mav.setViewName("redirect:/member/login.do");
	    }
	    
	    
	    
	    mav.addObject("list", cartDAO.list2(cartVO.getMno()));
	    mav.addObject("CartVO", cartVO);
	   //mav.addObject("title", blogcategoryDAO.read(blogVO.getBlogcategoryno()).getTitle());
	   //System.out.println("title ��" + blogcategoryDAO.read(blogVO.getBlogcategoryno()).getTitle());
	    return mav;
	  }

	 @RequestMapping(value = "/cart/delete2.do", method = RequestMethod.POST)
	  public ModelAndView delete2(int cartno ) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/message");
	    
	    
	 
	    ArrayList<String> msgs = new ArrayList<String>();
	    ArrayList<String> links = new ArrayList<String>();
	 
	    if (cartDAO.delete(cartno) == 1) {
	      mav.setViewName("redirect:/cart/list2.do"); // Ȯ���� ���!!!
	      // msgs.add("�ڵ带 ����߽��ϴ�.");
	      // links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
	    } else {
	      msgs.add("��ٱ��� ������ �����߽��ϴ�.");
	      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
	      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
	 
	      mav.addObject("msgs", msgs);
	      mav.addObject("links", links);
	    }
	 
	    return mav;
	  }

	 
	 @RequestMapping(value ="/cart/update2.do", method= RequestMethod.POST)
	 public ModelAndView update2(CartVO cartVO){
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("/cart/message");
		 
		 
		 
		 
		 ArrayList<String> msgs = new ArrayList<String>();
		    ArrayList<String> links = new ArrayList<String>();
		 
		    if (cartDAO.update(cartVO) == 1) {
		      mav.setViewName("redirect:/cart/list2.do"); // Ȯ���� ���!!!
		      // msgs.add("�ڵ带 ����߽��ϴ�.");
		      // links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
		    } else {
		      msgs.add("�ڵ� ���濡 �����߽��ϴ�.");
		      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
		      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
		 
		      mav.addObject("msgs", msgs);
		      mav.addObject("links", links);
		    }

		 
		 return mav;
	 }
}
