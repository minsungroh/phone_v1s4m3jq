package com.phone.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phone.point.PointDAO;
import com.phone.point.PointVO;

import web.tool.Tool;

@Controller
public class MemberCont {
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;

  @Autowired
  @Qualifier("com.phone.point.PointDAO")
  private PointDAO pointDAO;
  
  public MemberCont() {
    System.out.println("--> MemberCont created.");
  }

  @RequestMapping(value = "/member/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/member/create.do", method = RequestMethod.POST)
  public ModelAndView create(MemberVO memberVO, PointVO pointVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (memberDAO.create(memberVO) == 1) {
      msgs.add("ȸ�������� ó������ϴ�.");
      msgs.add("�������ּż� �����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���Կ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }
    
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  /**
   * �ߺ� ���̵� �˻��մϴ�.
   * 
   * @param id
   * @param locale
   * @param model
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/member/checkId.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String checkId(String id, Locale locale, Model model) {

    JSONObject obj = new JSONObject();

    int cnt = memberDAO.checkId(id);
    obj.put("cnt", cnt);

    return obj.toJSONString();
  }

  /**
   * ��ü ����� ����մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/member/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/list");
    mav.addObject("list", memberDAO.list());

    return mav;
  }

  @RequestMapping(value = "/member/read.do", method = RequestMethod.GET)
  public ModelAndView read(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/read");
    mav.addObject("memberVO", memberDAO.read(mno));

    return mav;
  }

  @RequestMapping(value = "/member/update.do", method = RequestMethod.POST)
  public ModelAndView update(MemberVO memberVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (memberDAO.update(memberVO) == 1) {
      msgs.add("ȸ�������� �����Ǿ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./read.do?mno="+memberVO.getMno()+"'\">����� ȸ������ Ȯ��</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/member/passwd.do", method = RequestMethod.GET)
  public ModelAndView passwd(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/passwd"); // /webapp/member/passwd.jsp

    mav.addObject("mno", mno);
    return mav;
  }
  
  @RequestMapping(value = "/member/passwd.do", method = RequestMethod.POST)
  public ModelAndView passwd(MemberVO memberVO) {
    System.out.println("���� �н�����: " + memberVO.getOld_passwd());
    System.out.println("���ο� �н�����: " + memberVO.getPasswd());
     
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (memberDAO.passwdCheck(memberVO) == 1){ 
    if (memberDAO.update_passwd(memberVO) == 1) {
        msgs.add("�н����带 �����߽��ϴ�.");
        links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      } else { 
        msgs.add("�н����� ���濡 �����߽��ϴ�.");
        msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
        links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
        links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      }
    }else{
      msgs.add("���� �н����尡 ��ġ�����ʽ��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");

    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/delete"); // /webapp/member/delete.jsp
    mav.addObject("mno", mno);
    
    return mav;
  }

  @RequestMapping(value = "/member/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(MemberVO memberVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (memberDAO.delete(memberVO.getMno()) == 1) {
      msgs.add("ȸ���� �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/login_ck_form"); // /webapp/member/login_ck_form.jsp
    
    return mav;
  }

  @RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
  public ModelAndView login(MemberVO memberVO, 
                                       HttpSession session, 
                                       HttpServletRequest request,
                                       HttpServletResponse response) {
    ModelAndView mav = new ModelAndView();

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    int mno = memberDAO.read_id(memberVO).getMno();
    if (memberDAO.login(memberVO) == 1) {
      session.setAttribute("id", memberVO.getId());
      session.setAttribute("passwd", memberVO.getPasswd());
      session.setAttribute("mno", mno);
 
      String id_save = Tool.checkNull(memberVO.getId_save());
      if (id_save.equals("Y")){ // id ���� �� ���
        Cookie ck_id = new Cookie("ck_id", memberVO.getId()); // id ����
        ck_id.setMaxAge(600); // ��
        response.addCookie(ck_id);
      }else{ // id�� �������� ���� ���
        Cookie ck_id = new Cookie("ck_id", ""); 
        ck_id.setMaxAge(0); // ��
        response.addCookie(ck_id);
      }
      // id ���� ���θ� �����ϴ� ��� ���, Y or "" ����
      Cookie ck_id_save = new Cookie("ck_id_save", memberVO.getId_save());
      ck_id_save.setMaxAge(600); // ��
      response.addCookie(ck_id_save);
      // ------------------------------------------------------------------
   
      // ------------------------------------------------------------------
      // passwd ���� ���� ��Ű ����
      // ------------------------------------------------------------------
      String passwd_save = Tool.checkNull(memberVO.getPasswd_save());
      if (passwd_save.equals("Y")){ 
        Cookie ck_passwd = new Cookie("ck_passwd", memberVO.getPasswd()); 
        ck_passwd.setMaxAge(600); // ��
        response.addCookie(ck_passwd);
        
      }else{ // passwd�� �������� ���� ���
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(600); // ��
        response.addCookie(ck_passwd);
        
      }
      // passwd ���� ���θ� �����ϴ� ��� ���, Y or "" ����
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", memberVO.getPasswd_save());
      ck_passwd_save.setMaxAge(60); // ��
      response.addCookie(ck_passwd_save);
      // ------------------------------------------------------------------

      String url_address = Tool.checkNull(memberVO.getUrl_address());
      if (url_address.length() > 0){
        mav.setViewName("redirect:" + memberVO.getUrl_address());
      }else{
        System.out.println("--> index.jsp �������� �̵��մϴ�.");
        mav.setViewName("redirect:/index.jsp"); // Ȯ���� ���
      }
      
    } else {
      mav.setViewName("/member/message");
      msgs.add("�α��ο� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
  public ModelAndView logout(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/message"); // /webapp/member/message.jsp
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    msgs.add("�̿����ּż� �����մϴ�.");
    msgs.add("from �մ���...");
    links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
    
    session.invalidate(); // session ���� ����
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }  
}
