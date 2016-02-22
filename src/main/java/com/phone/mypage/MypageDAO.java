package com.phone.mypage;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.mypage.MypageDAO")
public class MypageDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 연결 객체
    
    public MypageDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public MypageMapperInter mapper(){
      MypageMapperInter mapper = sqlSession.getMapper(MypageMapperInter.class);    
      
      return mapper;
    }
    
    // 마이페이지 조회(구매 등급)
    public MypageVO read(MypageVO mypageVO){
      return mapper().read(mypageVO);
    }
    
    // 마이페이지 조회수(입금대기)
    public int count_paywait(int mno){
      return mapper().count_paywait(mno);
    }
    
   // 마이페이지 조회수(결재완료)
    public int count_payok(int mno){
      return mapper().count_payok(mno);
    }
    
   // 마이페이지 조회수(상품준비중)
    public int count_pready(int mno){
      return mapper().count_pready(mno);
    }
    
   // 마이페이지 조회수(배송중)
    public int count_delivery(int mno){
      return mapper().count_delivery(mno);
    }
    
    // 마이페이지 조회수(구매결정대기)
    public int count_okwait(int mno){
      return mapper().count_okwait(mno);
    }
    
    // 구매내역
    public ArrayList<MypageVO> list(MypageVO mypageVO){
      return mapper().list(mypageVO);
    }
    
    // 주문 상세 조회
    public MypageVO detail_read(MypageVO mypageVO){
      return mapper().detail_read(mypageVO);
    }
    
    // 주문확정 수정
    public int update_os(MypageVO mypageVO){
      return mapper().update_os(mypageVO);
    }
    
    // update read
    public MypageVO update_read(MypageVO mypageVO){
      return mapper().update_read(mypageVO);
    }
    
    // 등록
    public int create(MypageVO mypageVO){
      return mapper().create(mypageVO);
    }
       
    public MypageVO read_mypageno(MypageVO mypageVO){
      return mapper().read_mypageno(mypageVO);
    }
    
    // traceback 변경
    public int takeback_update(MypageVO mypageVO){
      return mapper().takeback_update(mypageVO);
    }
    
    // traceback_cancel 조회
    public MypageVO take_back_cancel(MypageVO mypageVO){
      return mapper().take_back_cancel(mypageVO);
    }
    
    // replace 변경
    public int replace_update(MypageVO mypageVO){
      return mapper().replace_update(mypageVO);
    }
    
    public int count_payno(){
      return mapper().count_payno();
    }
    
    public int count_ok(int mno){
      return mapper().count_ok(mno);
    }
}
