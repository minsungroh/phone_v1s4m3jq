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
   * ��ǰ�� ��ȸ�մϴ�.
   * 
   * @param mno
   * @return
   */
  @RequestMapping(value = "/content/read.do", method = RequestMethod.GET)
  public ModelAndView read(int contentno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/content/read");
    mav.addObject("ContentVO", contentDAO.read(contentno)); // �̸��� ��ü���� ���� ���� ���� ����.

    return mav;
  }
}
