package com.phone.deliveryaddr;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.*;

@Controller
public class DeliveryAddrCont {
  @Autowired
  @Qualifier("com.phone.deliveryaddr.DeliveryAddrDAO")
  private DeliveryAddrDAO deliveryAddrDAO;
  
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  public DeliveryAddrCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/deliveryaddr/create.do", method = RequestMethod.GET)
  public ModelAndView create(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/deliveryaddr/list");
    
    return mav;
  }
  
  @RequestMapping(value = "/deliveryaddr/create.do", method = RequestMethod.POST)
  public ModelAndView create(DeliveryAddrVO deliveryAddrVO, int mno) {
    System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (deliveryAddrDAO.create(deliveryAddrVO) == 1) {
      mav.setViewName("redirect:/deliveryaddr/list.do?mno=" + mno);
    } else {
      mav.setViewName("/deliveryaddr/message");
      msgs.add("주소록 등록에 실패했습니다.");
      msgs.add("다시 한번 시도해 주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"window.close()\">닫기</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/deliveryaddr/list.do", method = RequestMethod.GET)
  public ModelAndView list(int mno, DeliveryAddrVO deliveryAddrVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/deliveryaddr/list");
    mav.addObject("list", deliveryAddrDAO.list(mno));
    mav.addObject("mno", mno);

    return mav;
  }
  
  @RequestMapping(value = "/deliveryaddr/update.do", method = RequestMethod.POST)
  public ModelAndView update(DeliveryAddrVO deliveryAddrVO, int mno) {
    ModelAndView mav = new ModelAndView();

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (deliveryAddrDAO.update(deliveryAddrVO) == 1) {
      mav.setViewName("redirect:/deliveryaddr/list.do?mno=" + mno);
    } else {
      mav.setViewName("/deliveryaddr/message");
      msgs.add("회원 수정에 실패했습니다.");
      msgs.add("다시 한번 시도해 주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"window.close()\">닫기</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/deliveryaddr/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int dno, int mno) {
    ModelAndView mav = new ModelAndView();
   

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (deliveryAddrDAO.delete(dno) == 1) {
      mav.setViewName("redirect:/deliveryaddr/list.do?mno=" + mno);
    } else {
      msgs.add("회원 삭제에 실패했습니다.");
      mav.setViewName("/blog/message");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"window.close()\">닫기</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
}
