package com.phone.trace;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.mypage.MypageDAO;
import com.phone.mypage.MypageVO;
import com.phone.payment.*;


@Controller
public class TraceCont {
  @Autowired
  @Qualifier("com.phone.trace.TraceDAO")
  private TraceDAO traceDAO;
  
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Autowired
  @Qualifier("com.phone.mypage.MypageDAO")
  private MypageDAO mypageDAO;
  
  public TraceCont(){
    System.out.println("--> TraceCont created.");
  }
  
  @RequestMapping(value = "/trace/create.do", method = RequestMethod.GET)
  public ModelAndView create(TraceVO traceVO, PaymentVO paymentVO) {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();

     
     traceVO.setWaybil(paymentVO.getPwaybil());
     traceVO.setWaybil2(paymentVO.getPwaybil2());
     traceVO.setPayno(paymentVO.getPayno());
     traceDAO.create(traceVO);
     
     mav.setViewName("redirect:../mypage/create.do?mno=" + paymentVO.getMno() + "&paycharge=" + paymentVO.getPaycharge() + "&caseno=" + paymentVO.getCaseno());
    return mav;
  }
  
  @RequestMapping(value = "/trace/create_mypageno.do", method = RequestMethod.GET)
  public ModelAndView create_mypageno(TraceVO traceVO, MypageVO mypageVO) {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    
     traceVO.setMypageno(mypageVO.getMypageno());
     traceVO.setTraceno(mypageVO.getMypageno());
     traceDAO.mypageno_update(traceVO);
     
     String col = "";
     String word = "";
     int nowPage = 1;
     mav.setViewName("redirect:../mypage/read.do?mno=" + mypageVO.getMno() + "&col=" + col + "&word=" + word + "&nowPage=" + nowPage);
    return mav;
  }
  
  @RequestMapping(value = "/trace/read.do", method = RequestMethod.GET)
  public ModelAndView read(TraceVO traceVO, PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trace/read");
    
    traceVO.setWaybil(traceDAO.trace_read(traceVO).getWaybil());
    traceVO.setWaybil2(traceDAO.trace_read(traceVO).getWaybil2());
    mav.addObject("read", traceDAO.read(traceVO));
    mav.addObject("list", traceDAO.list(traceVO));
    
    ArrayList<TraceVO> list = traceDAO.trace_situration_list(traceVO);
    Iterator<TraceVO> iter = list.iterator();
    while(iter.hasNext() == true){
      TraceVO vo = iter.next();
      vo.setTdate(vo.getTsdate().substring(0, 11));
      int time = Integer.parseInt(vo.getTsdate().substring(11, 13));
      String p = "";
      String a = "";
      if(time < 10){
        p = "0";
      }
      
      if(time < 12){
        a = "AM ";
      } else {
        a = "PM ";
      }
      vo.setTstime(a + p + vo.getTsdate().substring(11, 16));
    }
    
    mav.addObject("trace", list);
    return mav;
  }
  
  @RequestMapping(value="/trace/update.do", method=RequestMethod.POST) 
  public ModelAndView update(TraceVO traceVO){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    TraceVO vo = traceDAO.mypage_read(traceVO);
    
    if(traceDAO.ts_update(traceVO) == 1){
      if(vo.getOrderstate().equals("결제대기중")){
        traceVO.setMy_state("결제대기중");
      } else if((vo.getTrace_state().equals("상품준비중") || vo.getTrace_state().equals("배송중")) && vo.getOrderstate().equals("결제완료")){
        traceVO.setMy_state(traceVO.getTrace_state());
      } else if(vo.getOrderstate().equals("결제 완료") && vo.getTrace_state().equals("배송완료")){
        traceVO.setMy_state("구매 결정 대기");
      }
      traceDAO.update_mypage_my_state(traceVO);
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:./read.do?payno=" + traceVO.getPayno() + "&mypageno=" + traceVO.getMypageno());
    }else{
      mav.setViewName("/trace/message");  
      msgs.add("배송상태 변경에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./read.do?waybil=" + traceVO.getWaybil() + "&waybil2=" + traceVO.getWaybil2() + "'\">취소</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }

}
