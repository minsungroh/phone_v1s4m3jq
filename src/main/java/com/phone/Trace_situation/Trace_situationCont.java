package com.phone.Trace_situation;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.trace.TraceDAO;

@Controller
public class Trace_situationCont {
  @Autowired
  @Qualifier("com.phone.Trace_situation.Trace_situationDAO")
  private Trace_situationDAO trace_situationDAO;
  
  @Autowired
  @Qualifier("com.phone.trace.TraceDAO")
  private TraceDAO traceDAO;
  
  public Trace_situationCont(){
    System.out.println("--> MypageCont created.");
  }
  
  @RequestMapping(value = "/trace_situation/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
  
    return mav;
  }
  
  @RequestMapping(value = "/trace_situation/create.do", method = RequestMethod.POST)
  public ModelAndView create(Trace_situationVO trace_situationVO) {
    System.out.println("--> create() POST called");
    ModelAndView mav = new ModelAndView();
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

   if (trace_situationDAO.create(trace_situationVO) == 1) {
      ArrayList<Trace_situationVO> read = trace_situationDAO.read(trace_situationVO);
      Iterator<Trace_situationVO> iter = read.iterator();
      while(iter.hasNext() == true){
      Trace_situationVO vo = iter.next();
      mav.setViewName("redirect:../trace/read.do?payno=" + vo.getPayno() + "&mypageno=" + vo.getMypageno());
        }
      } else {
      mav.setViewName("/trace_situation/message");
      msgs.add("배송 정보 등록에 실패했습니다.");
      msgs.add("다시 한번 시도해 주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"window.close()\">닫기</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
}
