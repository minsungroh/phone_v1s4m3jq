package com.phone.mypage;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.member.*;
import com.phone.payment.*;
import com.phone.trace.TraceDAO;
import com.phone.trace.TraceVO;

import web.tool.Paging;

@Controller
public class MypageCont {
  @Autowired
  @Qualifier("com.phone.mypage.MypageDAO")
  private MypageDAO mypageDAO;
  
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  @Autowired
  @Qualifier("com.phone.member.memberDAO")
  private MemberDAO memberDAO;
  
  @Autowired
  @Qualifier("com.phone.trace.TraceDAO")
  private TraceDAO traceDAO;
  
  public MypageCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/mypage/create.do", method = RequestMethod.GET)
  public ModelAndView create(MypageVO mypageVO, PaymentVO paymentVO) {
    // System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();
    

    if(mypageVO.getPaycharge().equals("Y")){
      mypageVO.setOrderstate("결제완료");
      mypageVO.setMy_state("결제완료");
      
    } else if(mypageVO.getPaycharge().equals("N")){
      mypageVO.setOrderstate("결제대기중");
      mypageVO.setMy_state("결제대기중");
    }
    mypageVO.setPayno(paymentDAO.mypage_read(paymentVO).getPayno());
    mypageDAO.create(mypageVO);
    
    int mypageno = mypageDAO.read_mypageno(mypageVO).getMypageno();
    mav.setViewName("redirect:../trace/create_mypageno.do?mypageno=" + mypageno + "&mno=" + mypageVO.getMno());
    return mav;
  }
  
  @RequestMapping(value = "/mypage/read.do", method = RequestMethod.GET)
  public ModelAndView read(MypageVO mypageVO, TraceVO traceVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/list");
    mav.addObject("grade", memberDAO.read(mypageVO.getMno()).getGrade());
    mav.addObject("pay_wait", mypageDAO.count_paywait(mypageVO.getMno()));
    mav.addObject("pay_ok", mypageDAO.count_payok(mypageVO.getMno()));
    mav.addObject("product_ready", mypageDAO.count_pready(mypageVO.getMno()));
    mav.addObject("delivery", mypageDAO.count_delivery(mypageVO.getMno()));
    mav.addObject("ok_wait", mypageDAO.count_okwait(mypageVO.getMno()));
    mav.addObject("complate", mypageDAO.count_ok(mypageVO.getMno()));
    
    int recodeperpage = 3;
    mypageVO.setCol("");
    mypageVO.setWord("");
   
    mypageVO.setRecordPerPage(recodeperpage);
    mypageVO.setTotalRecord(mypageDAO.count_payno());
    mypageVO.setOffset((mypageVO.getNowPage() - 1) * mypageVO.getRecordPerPage()) ;
    String paging = new Paging().paging3(mypageVO.getTotalRecord(), mypageVO.getNowPage(), mypageVO.getRecordPerPage(), mypageVO.getCol(), mypageVO.getWord(), mypageVO.getMno());
    mav.addObject("paging", mypageVO.getPaging());
    mypageVO.setPaging(paging);
    
    if(mypageVO.getPaging().equals(paging)){
      ArrayList<MypageVO> list = mypageDAO.list(mypageVO);
      Iterator<MypageVO> iter = list.iterator();
      while(iter.hasNext() == true){
        MypageVO vo = iter.next();
        vo.setPayday(vo.getPayday().substring(0, 11));
      }
      mav.addObject("list", list);
    }
    
    mav.addObject("paging", mypageVO.getPaging());
    return mav;
  }
  
  @RequestMapping(value = "/mypage/detail_read.do", method = RequestMethod.GET)
  public ModelAndView detail_list(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/detail_list");
    

    mav.addObject("detail_date", mypageDAO.detail_read(mypageVO).getPayday().substring(0, 11));
    mav.addObject("detail_list", mypageDAO.detail_read(mypageVO));
    
    MypageVO vo = mypageDAO.detail_read(mypageVO);
    String pay = "";
    String input = "";
    if(vo.getPaymeans().equals("card")){
      pay = "신용카드";
      if(vo.getCard_input().equals("bc")){
        input = "비씨카드";
      } else if(vo.getCard_input().equals("kbc")){
        input = "국민카드";
      } else if(vo.getCard_input().equals("uric")){
        input = "우리카드";
      } else if(vo.getCard_input().equals("hyundaec")){
        input = "현대카드";
      } else if(vo.getCard_input().equals("samsungc")){
        input = "삼성카드";
      }
    } else if(vo.getPaymeans().equals("deposit")){
      pay = "무통장입금";
      if(vo.getDeposit_input().equals("kbb")){
        input = "국민은행";
      } else if(vo.getDeposit_input().equals("urib")){
        input = "우리은행";
      } else if(vo.getDeposit_input().equals("sinhanb")){
        input = "신한은행";
      } else if(vo.getDeposit_input().equals("hanab")){
        input = "하나은행";
      } else if(vo.getDeposit_input().equals("postb")){
        input = "우체국";
      }
    } else if(vo.getPaymeans().equals("phone")){
      pay = "휴대폰결제";
      if(vo.getPhone_input().equals("skt")){
        input = "SKT";
      } else if (vo.getPhone_input().equals("lgu")){
        input = "LG U+";
      } else if (vo.getPhone_input().equals("kt")){
        input = "KT";
      } else if (vo.getPhone_input().equals("kct")){
        input = "알뜰폰-KCT";
      } else if (vo.getPhone_input().equals("hm")){
        input = "헬로모바일";
      }
    }
    
    vo.setPay_detail(pay);
    vo.setInput_detail(input);
    mav.addObject("pay_detail", vo.getPay_detail());
    mav.addObject("input_detail", vo.getInput_detail());
    
    return mav;
  }
  
  @RequestMapping(value = "/mypage/take_back.do", method = RequestMethod.GET)
  public ModelAndView take_back(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/take_back");
    
    mav.addObject("take_back", mypageDAO.detail_read(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/update.do", method = RequestMethod.GET)
  public ModelAndView update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    if(mypageDAO.update_read(mypageVO).getOrdersubmit().equals("N")){
      mypageVO.setOrdersubmit("Y");
      mypageVO.setMy_state("구매완료");
    }
    
    mypageDAO.update_os(mypageVO);
    
    mypageVO.setCol("");
    mypageVO.setWord("");
    int nowpage = 1;
    mypageVO.setNowPage(nowpage);

    mypageVO.setRecordPerPage(3);
    mypageVO.setTotalRecord(mypageDAO.count_payno());
    mypageVO.setOffset((mypageVO.getNowPage() - 1) * mypageVO.getRecordPerPage()) ;
    String paging = new Paging().paging3(mypageVO.getTotalRecord(), mypageVO.getNowPage(), mypageVO.getRecordPerPage(), mypageVO.getCol(), mypageVO.getWord(), mypageVO.getMno());
    mav.addObject("paging", mypageVO.getPaging());
    mypageVO.setPaging(paging);
    
    mav.setViewName("redirect:./read.do?mno=" + mypageVO.getMno() + "&col=" + mypageVO.getCol() + "&word=" + mypageVO.getWord() + "&nowPage=" + mypageVO.getNowPage());
    
    return mav;
  }
  
  @RequestMapping(value = "/mypage/traceback_update.do", method = RequestMethod.POST)
  public ModelAndView traceback_update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(mypageVO.getTakeback_state().equals("N")){
      mypageVO.setTakeback_state("Y");
    }
    
    String traceback = mypageVO.getTakeback_reason();
    if(traceback.equals("p1")){
      mypageVO.setTakeback_reason("상품에 이상 없으나, 구매 의사 없어짐");
    } else if(traceback.equals("p2")){
      mypageVO.setTakeback_reason("색상을 잘못 선택함");
    } else if(traceback.equals("p3")){
      mypageVO.setTakeback_reason("상품이 상품상세정보와 틀림");
    } else if(traceback.equals("p4")){
      mypageVO.setTakeback_reason("배송된 상품의 파손, 불량 발생");
    } else if(traceback.equals("p5")){
      mypageVO.setTakeback_reason("상품이 배송되지 않고 있음");
    } else if(traceback.equals("p6")){
      mypageVO.setTakeback_reason("다른 상품이 잘못 배송됨");
    } else if(traceback.equals("p7")){
      mypageVO.setTakeback_reason(mypageVO.getReason_content());
    }
    
    mypageVO.setMy_state("반품신청");
    if(mypageDAO.takeback_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>반품처리가 완료되었습니다.</span>");
      msgs.add("문의 사항 있으시면 고객 센터로 문의 바랍니다.");
      msgs.add("이용해 주셔서 감사합니다.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>닫기</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>반품처리가 실패하였습니다.</span>");
      msgs.add("다시 시도 부탁드립니다.");
      links.add("<button type='button' onclick='history.back();'>재시도</button>");
      links.add("<button type='button' onclick='window.close();'>닫기</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  @RequestMapping(value = "/mypage/replace_back.do", method = RequestMethod.GET)
  public ModelAndView replace_back(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/replace_back");
    
    mav.addObject("replace_back", mypageDAO.detail_read(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/take_back_cancel.do", method = RequestMethod.GET)
  public ModelAndView take_back_cancel(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/take_back_cancel");
    
    mav.addObject("take_back", mypageDAO.detail_read(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/traceback_cancle_update.do", method = RequestMethod.POST)
  public ModelAndView traceback_cancle_update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(mypageVO.getTakeback_state().equals("Y")){
      mypageVO.setTakeback_state("N");
    }
    
    mypageVO.setTakeback_reason("");
    
    MypageVO vo = mypageDAO.take_back_cancel(mypageVO);
    if(vo.getOrderstate().equals("결제대기중")){
      mypageVO.setMy_state("결제대기중");
    } else if((vo.getTrace_state().equals("상품준비중") || vo.getTrace_state().equals("배송중")) && vo.getOrderstate().equals("결제완료")){
      mypageVO.setMy_state(vo.getTrace_state());
    } else if(vo.getOrderstate().equals("결제완료") && vo.getTrace_state().equals("배송완료")){
      mypageVO.setMy_state("구매 결정 대기");
    }
    
   if(mypageDAO.takeback_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>반품처리취소가 완료되었습니다.</span>");
      msgs.add("문의 사항 있으시면 고객 센터로 문의 바랍니다.");
      msgs.add("이용해 주셔서 감사합니다.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>닫기</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>반품처리취소가 실패하였습니다.</span>");
      msgs.add("다시 시도 부탁드립니다.");
      links.add("<button type='button' onclick='history.back();'>재시도</button>");
      links.add("<button type='button' onclick='window.close();'>닫기</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  @RequestMapping(value = "/mypage/replace_update.do", method = RequestMethod.POST)
  public ModelAndView replace_update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(mypageVO.getReplace_state().equals("N")){
      mypageVO.setReplace_state("Y");
    }
    
    String replace = mypageVO.getReplace_reason();
    if(replace.equals("p1")){
      mypageVO.setReplace_reason("배송된 상품의 파손/불량 불량");
    } else if(replace.equals("p2")){
      mypageVO.setReplace_reason("다른 상품이 잘못 배송됨");
    } else if(replace.equals("p3")){
      mypageVO.setReplace_reason(mypageVO.getReason_content());
    }
    
    mypageVO.setMy_state("교환신청");
    if(mypageDAO.replace_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>교환처리가 완료되었습니다.</span>");
      msgs.add("문의 사항 있으시면 고객 센터로 문의 바랍니다.");
      msgs.add("이용해 주셔서 감사합니다.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>닫기</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>교환처리가 실패하였습니다.</span>");
      msgs.add("다시 시도 부탁드립니다.");
      links.add("<button type='button' onclick='history.back();'>재시도</button>");
      links.add("<button type='button' onclick='window.close();'>닫기</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  @RequestMapping(value = "/mypage/replace_back_cancel.do", method = RequestMethod.GET)
  public ModelAndView replace_back_cancel(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/replace_back_cancel");
    
    mav.addObject("replace_back", mypageDAO.detail_read(mypageVO));

    return mav;
  }
  
  @RequestMapping(value = "/mypage/replace_cancel_update.do", method = RequestMethod.POST)
  public ModelAndView replace_cancel_update(MypageVO mypageVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mypage/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(mypageVO.getReplace_state().equals("Y")){
      mypageVO.setReplace_state("N");
    }
    
    mypageVO.setReplace_reason("");
    
    MypageVO vo = mypageDAO.take_back_cancel(mypageVO);
    if(vo.getOrderstate().equals("결제대기중")){
      mypageVO.setMy_state("결제대기중");
    } else if((vo.getTrace_state().equals("상품준비중") || vo.getTrace_state().equals("배송중")) && vo.getOrderstate().equals("결제완료")){
      mypageVO.setMy_state(vo.getTrace_state());
    } else if(vo.getOrderstate().equals("결제완료") && vo.getTrace_state().equals("배송완료")){
      mypageVO.setMy_state("구매 결정 대기");
    }
    
   if(mypageDAO.replace_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>교환처리취소가 완료되었습니다.</span>");
      msgs.add("문의 사항 있으시면 고객 센터로 문의 바랍니다.");
      msgs.add("이용해 주셔서 감사합니다.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>닫기</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>교환처리취소가 실패하였습니다.</span>");
      msgs.add("다시 시도 부탁드립니다.");
      links.add("<button type='button' onclick='history.back();'>재시도</button>");
      links.add("<button type='button' onclick='window.close();'>닫기</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}
