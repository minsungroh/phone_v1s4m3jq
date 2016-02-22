package com.phone.mypage;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.mypage.MypageDAO")
public class MypageDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
    
    public MypageDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public MypageMapperInter mapper(){
      MypageMapperInter mapper = sqlSession.getMapper(MypageMapperInter.class);    
      
      return mapper;
    }
    
    // ���������� ��ȸ(���� ���)
    public MypageVO read(MypageVO mypageVO){
      return mapper().read(mypageVO);
    }
    
    // ���������� ��ȸ��(�Աݴ��)
    public int count_paywait(int mno){
      return mapper().count_paywait(mno);
    }
    
   // ���������� ��ȸ��(����Ϸ�)
    public int count_payok(int mno){
      return mapper().count_payok(mno);
    }
    
   // ���������� ��ȸ��(��ǰ�غ���)
    public int count_pready(int mno){
      return mapper().count_pready(mno);
    }
    
   // ���������� ��ȸ��(�����)
    public int count_delivery(int mno){
      return mapper().count_delivery(mno);
    }
    
    // ���������� ��ȸ��(���Ű������)
    public int count_okwait(int mno){
      return mapper().count_okwait(mno);
    }
    
    // ���ų���
    public ArrayList<MypageVO> list(MypageVO mypageVO){
      return mapper().list(mypageVO);
    }
    
    // �ֹ� �� ��ȸ
    public MypageVO detail_read(MypageVO mypageVO){
      return mapper().detail_read(mypageVO);
    }
    
    // �ֹ�Ȯ�� ����
    public int update_os(MypageVO mypageVO){
      return mapper().update_os(mypageVO);
    }
    
    // update read
    public MypageVO update_read(MypageVO mypageVO){
      return mapper().update_read(mypageVO);
    }
    
    // ���
    public int create(MypageVO mypageVO){
      return mapper().create(mypageVO);
    }
       
    public MypageVO read_mypageno(MypageVO mypageVO){
      return mapper().read_mypageno(mypageVO);
    }
    
    // traceback ����
    public int takeback_update(MypageVO mypageVO){
      return mapper().takeback_update(mypageVO);
    }
    
    // traceback_cancel ��ȸ
    public MypageVO take_back_cancel(MypageVO mypageVO){
      return mapper().take_back_cancel(mypageVO);
    }
    
    // replace ����
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
