package com.phone.deliveryaddr;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.deliveryaddr.DeliveryAddrDAO")
public class DeliveryAddrDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
    
    public DeliveryAddrDAO(){
      System.out.println("--> DeliveryAddrDAO created.");
    }
    
    public DeliveryAddrMapperInter mapper(){
      DeliveryAddrMapperInter mapper = sqlSession.getMapper(DeliveryAddrMapperInter.class);    
      
      return mapper;
    }
    
    public int create(DeliveryAddrVO deliveryAddrVO){
      return mapper().create(deliveryAddrVO);
    }
    
    public ArrayList<DeliveryAddrVO> list(int mno){
      return mapper().list(mno);
    }
    
    public DeliveryAddrVO read(int mno){
      return mapper().read(mno);
    }
    
    public int update(DeliveryAddrVO deliveryAddrVO){
      return mapper().update(deliveryAddrVO);
    }
    
    public int delete(int dno){
      return mapper().delete(dno);
    }
}
