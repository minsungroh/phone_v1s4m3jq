package com.phone.Trace_situation;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.Trace_situation.Trace_situationDAO")
public class Trace_situationDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
    
    public Trace_situationDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public Trace_situationMapperInter mapper(){
      Trace_situationMapperInter mapper = sqlSession.getMapper(Trace_situationMapperInter.class);    
      
      return mapper;
    }
    
    public int create(Trace_situationVO trace_situationVO){
      return mapper().create(trace_situationVO);
    }
    
    public ArrayList<Trace_situationVO> list(){
      return mapper().list();
    }
    
    public ArrayList<Trace_situationVO> read(Trace_situationVO trace_situationVO){
      return mapper().read(trace_situationVO);
    }
    
    public int update(Trace_situationVO trace_situationVO){
      return mapper().update(trace_situationVO);
    }
    
    public int delete(Trace_situationVO trace_situationVO){
      return mapper().delete(trace_situationVO);
    }
    
    public Trace_situationVO tsno_read(int tsno){
      return mapper().tsno_read(tsno);
    }
}
