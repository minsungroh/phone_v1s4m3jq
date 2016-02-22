package com.phone.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexCont {
  public IndexCont(){
    System.out.println("--> IndexCont created.");
  }
  
  @RequestMapping(value = "/index.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    System.out.println("--> 사용자 접속: " + request.getRemoteAddr());
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/index"); // /webapp/index.jsp
    
    return mav;
  }
}
