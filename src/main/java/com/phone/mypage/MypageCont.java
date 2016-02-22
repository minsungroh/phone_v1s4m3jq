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
      mypageVO.setOrderstate("�����Ϸ�");
      mypageVO.setMy_state("�����Ϸ�");
      
    } else if(mypageVO.getPaycharge().equals("N")){
      mypageVO.setOrderstate("���������");
      mypageVO.setMy_state("���������");
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
      pay = "�ſ�ī��";
      if(vo.getCard_input().equals("bc")){
        input = "��ī��";
      } else if(vo.getCard_input().equals("kbc")){
        input = "����ī��";
      } else if(vo.getCard_input().equals("uric")){
        input = "�츮ī��";
      } else if(vo.getCard_input().equals("hyundaec")){
        input = "����ī��";
      } else if(vo.getCard_input().equals("samsungc")){
        input = "�Ｚī��";
      }
    } else if(vo.getPaymeans().equals("deposit")){
      pay = "�������Ա�";
      if(vo.getDeposit_input().equals("kbb")){
        input = "��������";
      } else if(vo.getDeposit_input().equals("urib")){
        input = "�츮����";
      } else if(vo.getDeposit_input().equals("sinhanb")){
        input = "��������";
      } else if(vo.getDeposit_input().equals("hanab")){
        input = "�ϳ�����";
      } else if(vo.getDeposit_input().equals("postb")){
        input = "��ü��";
      }
    } else if(vo.getPaymeans().equals("phone")){
      pay = "�޴�������";
      if(vo.getPhone_input().equals("skt")){
        input = "SKT";
      } else if (vo.getPhone_input().equals("lgu")){
        input = "LG U+";
      } else if (vo.getPhone_input().equals("kt")){
        input = "KT";
      } else if (vo.getPhone_input().equals("kct")){
        input = "�˶���-KCT";
      } else if (vo.getPhone_input().equals("hm")){
        input = "��θ����";
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
      mypageVO.setMy_state("���ſϷ�");
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
      mypageVO.setTakeback_reason("��ǰ�� �̻� ������, ���� �ǻ� ������");
    } else if(traceback.equals("p2")){
      mypageVO.setTakeback_reason("������ �߸� ������");
    } else if(traceback.equals("p3")){
      mypageVO.setTakeback_reason("��ǰ�� ��ǰ�������� Ʋ��");
    } else if(traceback.equals("p4")){
      mypageVO.setTakeback_reason("��۵� ��ǰ�� �ļ�, �ҷ� �߻�");
    } else if(traceback.equals("p5")){
      mypageVO.setTakeback_reason("��ǰ�� ��۵��� �ʰ� ����");
    } else if(traceback.equals("p6")){
      mypageVO.setTakeback_reason("�ٸ� ��ǰ�� �߸� ��۵�");
    } else if(traceback.equals("p7")){
      mypageVO.setTakeback_reason(mypageVO.getReason_content());
    }
    
    mypageVO.setMy_state("��ǰ��û");
    if(mypageDAO.takeback_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>��ǰó���� �Ϸ�Ǿ����ϴ�.</span>");
      msgs.add("���� ���� �����ø� �� ���ͷ� ���� �ٶ��ϴ�.");
      msgs.add("�̿��� �ּż� �����մϴ�.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>�ݱ�</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>��ǰó���� �����Ͽ����ϴ�.</span>");
      msgs.add("�ٽ� �õ� ��Ź�帳�ϴ�.");
      links.add("<button type='button' onclick='history.back();'>��õ�</button>");
      links.add("<button type='button' onclick='window.close();'>�ݱ�</button>");
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
    if(vo.getOrderstate().equals("���������")){
      mypageVO.setMy_state("���������");
    } else if((vo.getTrace_state().equals("��ǰ�غ���") || vo.getTrace_state().equals("�����")) && vo.getOrderstate().equals("�����Ϸ�")){
      mypageVO.setMy_state(vo.getTrace_state());
    } else if(vo.getOrderstate().equals("�����Ϸ�") && vo.getTrace_state().equals("��ۿϷ�")){
      mypageVO.setMy_state("���� ���� ���");
    }
    
   if(mypageDAO.takeback_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>��ǰó����Ұ� �Ϸ�Ǿ����ϴ�.</span>");
      msgs.add("���� ���� �����ø� �� ���ͷ� ���� �ٶ��ϴ�.");
      msgs.add("�̿��� �ּż� �����մϴ�.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>�ݱ�</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>��ǰó����Ұ� �����Ͽ����ϴ�.</span>");
      msgs.add("�ٽ� �õ� ��Ź�帳�ϴ�.");
      links.add("<button type='button' onclick='history.back();'>��õ�</button>");
      links.add("<button type='button' onclick='window.close();'>�ݱ�</button>");
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
      mypageVO.setReplace_reason("��۵� ��ǰ�� �ļ�/�ҷ� �ҷ�");
    } else if(replace.equals("p2")){
      mypageVO.setReplace_reason("�ٸ� ��ǰ�� �߸� ��۵�");
    } else if(replace.equals("p3")){
      mypageVO.setReplace_reason(mypageVO.getReason_content());
    }
    
    mypageVO.setMy_state("��ȯ��û");
    if(mypageDAO.replace_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>��ȯó���� �Ϸ�Ǿ����ϴ�.</span>");
      msgs.add("���� ���� �����ø� �� ���ͷ� ���� �ٶ��ϴ�.");
      msgs.add("�̿��� �ּż� �����մϴ�.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>�ݱ�</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>��ȯó���� �����Ͽ����ϴ�.</span>");
      msgs.add("�ٽ� �õ� ��Ź�帳�ϴ�.");
      links.add("<button type='button' onclick='history.back();'>��õ�</button>");
      links.add("<button type='button' onclick='window.close();'>�ݱ�</button>");
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
    if(vo.getOrderstate().equals("���������")){
      mypageVO.setMy_state("���������");
    } else if((vo.getTrace_state().equals("��ǰ�غ���") || vo.getTrace_state().equals("�����")) && vo.getOrderstate().equals("�����Ϸ�")){
      mypageVO.setMy_state(vo.getTrace_state());
    } else if(vo.getOrderstate().equals("�����Ϸ�") && vo.getTrace_state().equals("��ۿϷ�")){
      mypageVO.setMy_state("���� ���� ���");
    }
    
   if(mypageDAO.replace_update(mypageVO) == 1){
      msgs.add("<span style='color:#0000FF; font-weight:blod'>��ȯó����Ұ� �Ϸ�Ǿ����ϴ�.</span>");
      msgs.add("���� ���� �����ø� �� ���ͷ� ���� �ٶ��ϴ�.");
      msgs.add("�̿��� �ּż� �����մϴ�.");
      links.add("<button type='button' onclick='opener.location.reload(); window.close();'>�ݱ�</button>");
    } else {
      msgs.add("<span style='color:#FF0000; font-weight:blod'>��ȯó����Ұ� �����Ͽ����ϴ�.</span>");
      msgs.add("�ٽ� �õ� ��Ź�帳�ϴ�.");
      links.add("<button type='button' onclick='history.back();'>��õ�</button>");
      links.add("<button type='button' onclick='window.close();'>�ݱ�</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}
