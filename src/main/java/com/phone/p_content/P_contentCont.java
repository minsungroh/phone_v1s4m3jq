package com.phone.p_content;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.MemberDAO;
import com.phone.member.MemberVO;
import com.phone.p_category.P_categoryDAO;
import com.phone.p_category.P_categoryVO;

import web.tool.Tool;
import web.tool.Upload;

@Controller
public class P_contentCont {
  @Autowired
  @Qualifier("com.phone.p_content.P_contentDAO")
  private P_contentDAO p_contentDAO;

  @Autowired
  @Qualifier("com.phone.p_category.P_categoryDAO")
  private P_categoryDAO p_categoryDAO;
  
 @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  public P_contentCont(){
    System.out.println("--> P_contentCont created.");
  }
  
  @RequestMapping(value="/p_content/create.do", method=RequestMethod.GET)
  public ModelAndView create(P_contentVO p_contentVO){
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/create");   // 
    mav.addObject("P_contentVO", p_contentVO);
    
    return mav;
  }

  @RequestMapping(value="/p_content/create.do", method=RequestMethod.POST)
  public ModelAndView create(P_contentVO p_contentVO, HttpServletRequest request){
    // System.out.println("--> create() POST called.");
	 System.out.println(p_contentVO.getTitle());
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // --------------------------------------------------
    // Thumb ���� ���� ����
    // --------------------------------------------------
    String file = "";
    String absPath = Tool.getRealPath(request, "/p_content/storage");
    MultipartFile fileMF = p_contentVO.getFileMF();
    if (fileMF != null){
      if (fileMF.getSize() > 0){
        file = Upload.saveFileSpring(fileMF, absPath);
 
       
      }
    }
   
    String upDir =absPath;
    String src = file;
    String file2 = Tool.preview(upDir, src, 400, 400);
    System.out.println(file2 + " ������.");
    p_contentVO.setFile(file2);  //thumb���� ����
    
    Tool.deleteFile(file);  //���� ���ϻ���
    // --------------------------------------------------

    // --------------------------------------------------
    // ���� ���� ����
    // --------------------------------------------------
    String file1 = "";
    MultipartFile file1MF = p_contentVO.getFile1MF();
    if (file1MF != null){
      if (file1MF.getSize() > 0){
        file1 = Upload.saveFileSpring(file1MF, absPath);
        p_contentVO.setFile1(file1); // ���۵� ���ϸ� ����
      }
    }
    
   
   
   
    // --------------------------------------------------
    
    if (p_contentDAO.create(p_contentVO) == 1){ 
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
    }else{
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
    
    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links.add("<button type='button' onclick=\"location.href='./list2.do?p_categoryno="+p_contentVO.getP_categoryno()+"'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  @RequestMapping(value = "/p_content/list.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/list");
    mav.addObject("list", p_contentDAO.list());
  
    
    return mav;
  }
  
  /**
   * ���� ��ȸ�մϴ�
   * @param 
   * @return
   */
  @RequestMapping(value = "/p_content/read.do", method = RequestMethod.GET)
  public ModelAndView read(int p_contentno, int p_categoryno, HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/read");
    mav.addObject("p_contentVO", p_contentDAO.read(p_contentno));
    
    if(Tool.isMember(request) == true){
      int mno = (Integer)session.getAttribute("mno");
      mav.addObject("mno", mno);
    }

    P_categoryVO vo = p_categoryDAO.read(p_categoryno);
    mav.addObject("title", vo.getTitle());
    //mav.addObject("title", p_categoryDAO.read(p_categoryno).getTitle());
    return mav;
  }
  
  /**
   * ������
   * @param 
   * @return
   */
  @RequestMapping(value="/p_content/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int p_contentno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/update");
    
    P_contentVO p_contentVO = p_contentDAO.read(p_contentno);
    mav.addObject("p_contentVO", p_contentVO); 
    
    P_categoryVO vo = p_categoryDAO.read(p_contentVO.getP_categoryno());
    mav.addObject("title", vo.getTitle());
    
    return mav;

  }
   
  /**
   * ���� ó��
   * @param 
   * @return
   */
  @RequestMapping(value="/p_content/update.do", method=RequestMethod.POST) 
  public ModelAndView update(P_contentVO p_contentVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // --------------------------------------------------
    // Thumb ���� ���� ����
    // --------------------------------------------------
    String file = "";
    String absPath = Tool.getRealPath(request, "/p_content/storage");
    MultipartFile fileMF = p_contentVO.getFileMF();
    

    if (fileMF != null){
      if (fileMF.getSize() > 0){
        Tool.deleteFile(absPath + p_contentVO.getOldfile());
        file = Upload.saveFileSpring(fileMF, absPath);
        p_contentVO.setFile(file); // ���۵� ���ϸ� ����
      }
    }
    // --------------------------------------------------

    // --------------------------------------------------
    // ���� ���� ����
    // --------------------------------------------------
    String file1 = "";
    absPath = Tool.getRealPath(request, "/p_content/storage");
    MultipartFile file1MF = p_contentVO.getFile1MF();
    if (file1MF != null){
      if (file1MF.getSize() > 0){
        Tool.deleteFile(absPath + p_contentVO.getOldfile1());
        file1 = Upload.saveFileSpring(file1MF, absPath);
        p_contentVO.setFile1(file1); // ���۵� ���ϸ� ����
      }
    }
    // --------------------------------------------------
    
    if(p_contentDAO.update(p_contentVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/p_content/read.do?p_contentno=" + p_contentVO.getP_contentno() + "&p_categoryno=" + p_contentVO.getP_categoryno()); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?p_categoryno="+p_contentVO.getP_categoryno()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }
  
  /**
   * ������
   * @param 
   * @return
   */
  @RequestMapping(value = "/p_content/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int p_contentno, int p_categoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/delete"); //
    mav.addObject("p_contentno", p_contentno);
    mav.addObject("p_categoryno", p_categoryno);
    
    P_categoryVO vo = p_categoryDAO.read(p_categoryno);
    mav.addObject("title", vo.getTitle());
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param 
   * @return
   */
  @RequestMapping(value = "/p_content/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(P_contentVO p_contentVO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // --------------------------------------------------
    // Thumb ���� ����
    // --------------------------------------------------
    P_contentVO vo = p_contentDAO.read(p_contentVO.getP_contentno());
    String absPath = Tool.getRealPath(request, "/p_content/storage");
    Tool.deleteFile(absPath + vo.getOldfile());
    // --------------------------------------------------

    // --------------------------------------------------
    // ���� ���� ����
    // --------------------------------------------------
    Tool.deleteFile(absPath + vo.getOldfile1());
    // --------------------------------------------------
    
    if (p_contentDAO.delete(p_contentVO.getP_contentno()) == 1) {
      mav.setViewName("redirect:/p_content/list2.do?p_categoryno=" + p_contentVO.getP_categoryno());//Ȯ���� ���
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list2.do?p_categoryno="+p_contentVO.getP_categoryno()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }

  /**
   * �Խ��Ǻ� ���
   * @param 
   * @return
   */
  @RequestMapping(value = "/p_content/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(P_contentVO p_contentVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/list2");
    mav.addObject("list", p_contentDAO.list2(p_contentVO));
  /*  mav.addObject("p_contentVO", p_contentVO);*/

    P_categoryVO vo = p_categoryDAO.read(p_contentVO.getP_categoryno());
    mav.addObject("title", vo.getTitle());
    /*mav.addObject("read", vo.getP_categoryno());*/

    return mav;
  }
  
  @RequestMapping(value = "/p_content/show_list.do", method = RequestMethod.GET)
  public ModelAndView show_list(P_contentVO p_contentVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/p_content/show_list");
    mav.addObject("show_list", p_contentDAO.show_list(p_contentVO));
  /*  mav.addObject("p_contentVO", p_contentVO);*/

    P_categoryVO vo = p_categoryDAO.read(p_contentVO.getP_categoryno());
    mav.addObject("title", vo.getTitle());
    /*mav.addObject("read", vo.getP_categoryno());*/
    
    return mav;
  }
  
}

