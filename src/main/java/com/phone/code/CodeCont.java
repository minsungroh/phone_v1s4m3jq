package com.phone.code;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CodeCont {
  @Autowired
  @Qualifier("com.phone.code.CodeDAO")
  private CodeDAO codeDAO;
  
  public CodeCont(){
    System.out.println("--> CodeCont created.");
  }
  
  @RequestMapping(value = "/code/create.do", method = RequestMethod.POST)
  public ModelAndView create(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (codeDAO.create(codeVO) == 1) {
      mav.setViewName("redirect:/code/list.do"); // 확장자 명시!!!
      // msgs.add("코드를 등록했습니다.");
      // links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
    } else {
      msgs.add("코드 등록에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  

  @RequestMapping(value = "/code/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/list");
    mav.addObject("list", codeDAO.list());

    return mav;
  }
  
  @RequestMapping(value = "/code/update.do", method = RequestMethod.POST)
  public ModelAndView update(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (codeDAO.update(codeVO) == 1) {
      mav.setViewName("redirect:/code/list.do"); // 확장자 명시!!!
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

  @RequestMapping(value = "/code/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int codeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (codeDAO.delete(codeno) == 1) {
      mav.setViewName("redirect:/code/list.do"); // 확장자 명시!!!
      // msgs.add("코드를 등록했습니다.");
      // links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
    } else {
      msgs.add("코드 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
 
    return mav;
  }

}
