package com.phone.p_category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.code.CodeDAO;
import com.phone.code.CodeVO;


@Controller
public class P_categoryCont {
  @Autowired
  @Qualifier("com.phone.p_category.P_categoryDAO")
  private P_categoryDAO p_categoryDAO;

  @Autowired
  @Qualifier("com.phone.code.CodeDAO")
  private CodeDAO codeDAO;
  
  public P_categoryCont(){
    System.out.println("--> P_categoryCont created.");
  }
  
  @RequestMapping(value = "/p_category/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_category/create"); 
    
    ArrayList<CodeVO> code_list = codeDAO.list();
    mav.addObject("code_list", code_list);
    
    return mav;
  }

  @RequestMapping(value = "/p_category/create.do", method = RequestMethod.POST)
  public ModelAndView create(P_categoryVO p_categoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_category/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (p_categoryDAO.create(p_categoryVO) == 1) {
      msgs.add("카테고리가 등록됬습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
    } else {
      msgs.add("카테고리 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">카테고리 목록</button>");

    // request.setAttribute("msgs", msgs);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * 전체 목록을 출력합니다.
   * @return
   */
  @RequestMapping(value = "/p_category/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_category/list");
    mav.addObject("list", p_categoryDAO.list());
    
    return mav;
  }
  
  @RequestMapping(value="/p_category/update.do", method=RequestMethod.POST)
  public ModelAndView update(P_categoryVO p_categoryVO){
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
  
    if (p_categoryDAO.update(p_categoryVO) == 1){
      mav.setViewName("redirect:/p_category/list.do"); 
    }else{
      mav.setViewName("redirect:/p_category/list.do"); 
      msgs.add("회원 정보 수정에 실패하였습니다.");
      links.add("<button type'button' onclick=\"location.href='./list.do'\">목록</button>");
    }
  
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
  
    return mav;
  }
  
  @RequestMapping(value = "/p_category/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int p_categoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_category/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (p_categoryDAO.delete(p_categoryno) == 1) {
      mav.setViewName("redirect:/p_category/list.do");
    } else {
      msgs.add("게시판 코드 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * codeno 수정 GET
   * @return
   */
  @RequestMapping(value="/p_category/codeno_update.do", method=RequestMethod.GET)
  public ModelAndView codeno_update(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_category/codeno_update"); 
    
    ArrayList<CodeVO> code_list = codeDAO.list();
    mav.addObject("code_list", code_list);
    
    return mav;
  }

  /**
   * codeno 수정 POST
   * @param 
   * @return
   */
  @RequestMapping(value="/p_category/codeno_update.do", method=RequestMethod.POST)
  public ModelAndView codeno_update(P_categoryVO p_categoryVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_category/popup_message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    int cnt = p_categoryDAO.update_codeno(p_categoryVO);
    
    if(cnt != 1 ){
      msgs.add("codeno 수정에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"popup_close()\">닫기</button>");
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
 
  /**
   * 출력 순서 변경
   * @param blogcategoryVO
   * @return
   */
  @RequestMapping(value="/p_category/update_orderno.do", method=RequestMethod.GET)
  public ModelAndView update_orderno(P_categoryVO p_categoryVO){  
    ModelAndView mav = new ModelAndView();                  

    if (p_categoryDAO.update_orderno(p_categoryVO) == 1) {
      mav.setViewName("redirect:/p_category/list.do");
    } else {
      ArrayList<String> msgs = new ArrayList<String>();
      ArrayList<String> links = new ArrayList<String>();

      mav.setViewName("/p_category/message");
      msgs.add("죄송합니다, 우선순위 조정에 실패했습니다.");
      msgs.add("다시 시도 해주십시오.");
      links.add("<button type='button' onclick=\"history.back()\">뒤로가기</button>"); 
      links.add("<button type='button' onclick=\"location.href='./list.do'\">회원 목록</button>");
      
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);    
    }
    
    return mav;
  } 
  
  /**
   * 출력모드(visible)변환
   * @param blogcategoryVO
   * @return
   */
  @RequestMapping(value="/p_category/update_visible.do", method=RequestMethod.POST)
  public ModelAndView update_visible(P_categoryVO p_categoryVO){
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (p_categoryVO.getVisible().equals("Y")){
    	p_categoryVO.setVisible("N");
    }else{
    	p_categoryVO.setVisible("Y");
    }
    
    p_categoryDAO.update_visible(p_categoryVO);
    
    mav.setViewName("redirect:/p_category/list.do"); //확장자 명시!!!
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}

