package com.phone.point;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.point.PointDAO")
public class PointDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
    
    public PointDAO(){
      System.out.println("--> PointDAO created.");
    }
    
    public PointMapperInter mapper(){
      PointMapperInter mapper = sqlSession.getMapper(PointMapperInter.class);    
      
      return mapper;
    }
    
    public int create(PointVO pointVO){
      return mapper().create(pointVO);
    }
    
    public int payno_update(PointVO pointVO){
      return mapper().payno_update(pointVO);
    }
    
    public PointVO pointno_read(PointVO pointVO){
      return mapper().pointno_read(pointVO);
    }
    
    public int create_point(PointVO pointVO){
      return mapper().create_point(pointVO);
    }
}
