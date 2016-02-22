package com.phone.trace;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.trace.TraceDAO")
public class TraceDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
    
    public TraceDAO(){
      System.out.println("--> PaymentDAO created.");
    }
    
    public TraceMapperInter mapper(){
      TraceMapperInter mapper = sqlSession.getMapper(TraceMapperInter.class);    
      
      return mapper;
    }
    
    public int create(TraceVO traceVO){
      return mapper().create(traceVO);
    }
    
    public ArrayList<TraceVO> list(TraceVO traceVO){
      return mapper().list(traceVO);
    }
    
    public TraceVO read(TraceVO traceVO){
      return mapper().read(traceVO);
    }
    
    public int update(TraceVO traceVO){
      return mapper().update(traceVO);
    }
    
    public int delete(int deleveryno){
      return mapper().delete(deleveryno);
    }
    
    public ArrayList<TraceVO> trace_situration_list(TraceVO traceVO){
      return mapper().trace_situration_list(traceVO);
    }
    
    public int ts_update(TraceVO traceVO){
      return mapper().ts_update(traceVO);
    }
    
    public int mypageno_update(TraceVO traceVO){
      return mapper().mypageno_update(traceVO);
    }
    
    public TraceVO trace_read(TraceVO traceVO){
      return mapper().trace_read(traceVO);
    }
    
    public TraceVO mypage_read(TraceVO traceVO){
      return mapper().mypage_read(traceVO);
    }
    
    public int update_mypage_my_state(TraceVO traceVO){
      return mapper().update_mypage_my_state(traceVO);
    }
}
