package com.phone.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartCont {
	  @Autowired
	  @Qualifier("com.phone.cart.CartDAO")
	  private CartDAO cartDAO;
	  
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
	  public ModelAndView create(CartVO cartVO) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/message");
	 
	    ArrayList<String> msgs = new ArrayList<String>();
	    ArrayList<String> links = new ArrayList<String>();
	 
	    if (cartDAO.create(cartVO) == 1) {
	      mav.setViewName("redirect:/cart/list.do"); // 확장자 명시!!!
	      // msgs.add("코드를 등록했습니다.");
	      // links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
	    } else {
	      msgs.add("장바구니 등록에 실패했습니다.");
	      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
	      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
	 
	      mav.addObject("msgs", msgs);
	      mav.addObject("links", links);
	    }
	 
	    return mav;
	  }

	  /**
	   * 전체 목록을 출력합니다.
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
		      mav.setViewName("redirect:/cart/list.do"); // 확장자 명시!!!
		      // msgs.add("코드를 등록했습니다.");
		      // links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
		    } else {
		      msgs.add("코드 변경에 실패했습니다.");
		      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
		      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
		 
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
	      mav.setViewName("redirect:/cart/list.do"); // 확장자 명시!!!
	      // msgs.add("코드를 등록했습니다.");
	      // links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
	    } else {
	      msgs.add("장바구니 삭제에 실패했습니다.");
	      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
	      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
	 
	      mav.addObject("msgs", msgs);
	      mav.addObject("links", links);
	    }
	 
	    return mav;
	  }
	 
	 @RequestMapping(value = "/cart/list2.do", method = RequestMethod.GET)
	  public ModelAndView list2(CartVO cartVO){
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/cart/list2");
	    mav.addObject("list", cartDAO.list2(cartVO.getMno()));
	    mav.addObject("CartVO", cartVO);
	   //mav.addObject("title", blogcategoryDAO.read(blogVO.getBlogcategoryno()).getTitle());
	   //System.out.println("title 값" + blogcategoryDAO.read(blogVO.getBlogcategoryno()).getTitle());
	    return mav;
	  }


}
