package com.phone.payment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.*;
import com.phone.p_content.P_contentDAO;
import com.phone.p_content.P_contentVO;

import web.tool.Tool;

@Controller
public class PaymentCont {
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Autowired
  @Qualifier("com.phone.p_content.P_contentDAO")
  private P_contentDAO p_contentDAO;
  
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  
  public PaymentCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/payment/create.do", method = RequestMethod.GET)
  public ModelAndView create(PaymentVO paymentVO, P_contentVO p_contentVO) {
    // System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();

    P_contentVO vo = p_contentDAO.read(paymentVO.getP_contentno());
    if(vo.getP_contentno() == paymentVO.getP_contentno()){
      int caseno = (int)(Math.random() * 1000000000 + 1); 
      paymentVO.setCaseno(caseno);
    }
    
    paymentVO.setItem(vo.getTitle() + " / " + vo.getContent());
    paymentVO.setPayfile1(vo.getFile());
    paymentVO.setPaymoney(vo.getMoney());
    paymentVO.setOrderno("P00" + vo.getP_contentno());
    paymentVO.setP_categoryno(vo.getP_categoryno());

    paymentDAO.create(paymentVO);
    
    mav.setViewName("redirect:./read.do?p_contentno=" + paymentVO.getP_contentno() + "&caseno=" + paymentVO.getCaseno() + "&mno=" + paymentVO.getMno());
    return mav;
  }
  
  @RequestMapping(value = "/payment/read.do", method = RequestMethod.GET)
  public ModelAndView read(PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    try{
      mav.setViewName("/payment/read");
      mav.addObject("PaymentVO", paymentDAO.read(paymentVO));
      mav.addObject("item", Tool.textLength(50, paymentDAO.read(paymentVO).getItem()));
      mav.addObject("MemberVO", memberDAO.read(paymentDAO.read(paymentVO).getMno()));
      mav.addObject("contentVO", p_contentDAO.read(paymentVO.getP_contentno()));
    } catch(NullPointerException e){
      mav.setViewName("/payment/message");
      msgs.add("<span style='font-size:20px; color:red; font-weight:bold;'>��ǰ���������� �ʿ��Ͻ� ��ǰ�� ���� �� �ּ���</span>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">����</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  @RequestMapping(value = "/payment/update.do", method = RequestMethod.POST)
  public ModelAndView update(PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    mav.setViewName("/payment/message");

         msgs.add("�ش� ��ǰ�� ������ �ּż� �����մϴ�");
        if(!paymentVO.getDeposit_input().equals("none")){
          msgs.add("�����Ͻ� �ݾ��� �Ʒ� �����ȣ�� �����ϳ��� �Աݺ�Ź�帳�ϴ�.");
          msgs.add("�ش� �Ⱓ���� �Ա����� ���� ��� �ش� ��ǰ�� ���Ŵ� �ڵ� ��ҵ˴ϴ�.");
          if(paymentVO.getDeposit_input().equals("kbb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�������� : 123456-12-123456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("urib")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�츮���� : 1234-12-12-12456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("sinhanb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�������� : 123456-12-123456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("hanab")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>�ϳ����� : 1234-12-12-12456 (������ : ����Ʈ���̽�)</span>");
          } else if(paymentVO.getDeposit_input().equals("postb")){
            msgs.add("<span style='color:#ff0000; font-weight:bold;'>��ü�� : 123456-12-123456 (������ : ����Ʈ���̽�)</span>");
          }
        } else if(!paymentVO.getPhone_input().equals("none")){
          msgs.add("��ϵ� �ڵ��� ��ȣ�� ������ �Ϸ�Ǿ����ϴ�.");
        }
        
  int way1 = (int)(Math.random() * 10000000);
  int way2 = (int)(Math.random() * 10000000);
  paymentVO.setPwaybil(way1);
  paymentVO.setPwaybil2(way2);
        
  if(paymentVO.getPaymeans().equals("card") || paymentVO.getPaymeans().equals("phone")){    
    paymentVO.setPaycharge("Y");
    if(!paymentVO.getCard_input().equals("none") || !paymentVO.getDeposit_input().equals("none") || !paymentVO.getPhone_input().equals("none")){
     if (paymentDAO.update(paymentVO) == 1) {
       msgs.add("������ �����߽��ϴ�.");
       links.add("<button type='button' onclick=\"location.href='../trace/create.do?pwaybil=" + paymentVO.getPwaybil() + "&pwaybil2=" + paymentVO.getPwaybil2() + "&mno=" + paymentVO.getMno() + "&paycharge=" + paymentVO.getPaycharge() + "&caseno=" + paymentVO.getCaseno() + "&payno=" + paymentVO.getPayno() +  "'\">����������</button>");
    } else {
      msgs.add("<span style='color:#ff0000; font-weight:blod;'>���������� ������ �Ǿ� ������ �����߽��ϴ�.</span>");
      msgs.add("�ٽ� �ѹ� �õ��� �ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    } 
  } else {
    msgs.add("������ �����߽��ϴ�.");
    msgs.add("�ٽ� �ѹ� �õ��� �ּ���.");
    links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }
  } else if(paymentVO.getPaymeans().equals("deposit")){
    paymentVO.setPaycharge("N");
    paymentDAO.update(paymentVO);
  }
    
    links.add("<button type='button' onclick=\"location.href='../index.do'\">����</button>");
       
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/payment/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int payno) {
    ModelAndView mav = new ModelAndView();
   

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (paymentDAO.delete(payno) == 1) {
      mav.setViewName("redirect:/index.do");
    } else {
      mav.setViewName("/payment/message");
      msgs.add("��ǰ ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"window.close()\">�ݱ�</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
}
