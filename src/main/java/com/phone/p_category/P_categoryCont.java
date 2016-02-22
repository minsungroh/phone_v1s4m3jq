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
      msgs.add("ī�װ��� ��ω���ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
    } else {
      msgs.add("ī�װ� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">ī�װ� ���</button>");

    // request.setAttribute("msgs", msgs);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * ��ü ����� ����մϴ�.
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
      msgs.add("ȸ�� ���� ������ �����Ͽ����ϴ�.");
      links.add("<button type'button' onclick=\"location.href='./list.do'\">���</button>");
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
      msgs.add("�Խ��� �ڵ� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * codeno ���� GET
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
   * codeno ���� POST
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
      msgs.add("codeno ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"popup_close()\">�ݱ�</button>");
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
 
  /**
   * ��� ���� ����
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
      msgs.add("�˼��մϴ�, �켱���� ������ �����߽��ϴ�.");
      msgs.add("�ٽ� �õ� ���ֽʽÿ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ڷΰ���</button>"); 
      links.add("<button type='button' onclick=\"location.href='./list.do'\">ȸ�� ���</button>");
      
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);    
    }
    
    return mav;
  } 
  
  /**
   * ��¸��(visible)��ȯ
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
    
    mav.setViewName("redirect:/p_category/list.do"); //Ȯ���� ���!!!
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}

