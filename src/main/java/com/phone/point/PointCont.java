package com.phone.point;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phone.payment.PaymentDAO;
import com.phone.payment.PaymentVO;

@Controller
public class PointCont {
  @Autowired
  @Qualifier("com.phone.point.PointDAO")
  private PointDAO pointDAO;
  
  @Autowired
  @Qualifier("com.phone.payment.PaymentDAO")
  private PaymentDAO paymentDAO;
  
  public PointCont(){
    System.out.println("--> PointCont created.");
  }
  
  @RequestMapping(value = "/point/create_point.do", method = RequestMethod.GET)
  public ModelAndView create(PaymentVO paymentVO, PointVO pointVO) {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    System.out.println(paymentVO.getDiscount_money());
    System.out.println(paymentVO.getUsepoint());
    System.out.println(paymentVO.getTotalpoint());
    
    paymentVO.setPayno(pointVO.getPayno());
    PaymentVO vo = paymentDAO.read_point(paymentVO);
    System.out.println(vo.getItem());
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
     return mav;
  }
}
