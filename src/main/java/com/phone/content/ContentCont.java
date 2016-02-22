package com.phone.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ContentCont {
  @Autowired
  @Qualifier("com.phone.content.ContentDAO")
  private ContentDAO contentDAO;
  
  public ContentCont(){
    System.out.println("--> ContentCont created.");
  }
  
  /**
   * 상품을 조회합니다.
   * 
   * @param mno
   * @return
   */
  @RequestMapping(value = "/content/read.do", method = RequestMethod.GET)
  public ModelAndView read(int contentno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/content/read");
    mav.addObject("ContentVO", contentDAO.read(contentno)); // 이름은 객체명을 쓰는 것이 가장 좋다.

    return mav;
  }
}
