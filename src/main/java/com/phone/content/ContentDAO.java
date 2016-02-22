package com.phone.content;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.phone.content.ContentDAO")
public class ContentDAO {
    @Autowired
    private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
    
    public ContentDAO(){
      System.out.println("--> ContentDAO created.");
    }
    
    public ContentMapperInter mapper(){
      ContentMapperInter mapper = sqlSession.getMapper(ContentMapperInter.class);    
      
      return mapper;
    }
    
    public ContentVO read(int contentno){
      return mapper().read(contentno);
    }
}
