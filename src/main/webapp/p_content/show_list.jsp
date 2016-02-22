<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.p_content.P_contentVO" %>
<%@ page import="web.tool.Tool" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>


<body>
<% ArrayList<P_contentVO> list = (ArrayList<P_contentVO>)request.getAttribute("show_list"); %>
<jsp:include page="/menu/top.jsp" flush='false' />
 <DIV class='title'>${title }</DIV>

<DIV class = 'content' style='width: 63%; '>
<%-- <form name ='frm' method = 'post' action='./list.jsp'>
     <DIV class = 'menu_on_table_left'>
        <label for = "col"></label>
        <select name = "col">
           <option value ="none" <%=word.length()==0?"selected='selected'":"" %>>검색</option>
           <option value="rname" <%=col.equals("rname")?"selected='selected'":"" %>>글쓴이</option>
           <option value="title" <%=col.equals("title")?"selected='selected'":"" %>>제목</option>
           <option value="content"<%=col.equals("content")?"selected='selected'":"" %>>내용</option>
        </select>
        
        <label for ="word"></label>
        
        <%
        if(col.equals("none")){
          word="";             //안쓰면 Null format Exception 뜨니까 이걸 꼭 써야함(혹시를 위해서)
        }
        %>
        <input type="text" name ="word" value='<%=word%>'>
        <input type= "submit" value = "검색">
     </DIV>
   </form> --%>
   
     <DIV class='menu_on_table'>
</DIV>
<DIV style='width: 100%; clear: both; height: 5px; border-bottom: dotted #AAAAAA;'></DIV>
   <DIV style = 'border: none 2px #FF0000; width: 100%; margin: 0px auto; clear: both'>
  <%
    for(int index=0; index < list.size(); index++){
      P_contentVO vo = list.get(index);
      
      if(index !=0 && index% 4 ==0){
        %>
        
        <DIV style='width: 100%; clear: both; height: 5px; border-bottom: dotted #AAAAAA; '></DIV>
        <% 
    }%>
    <DIV style='margin: 2px; padding : 2px; width: 290px; height: 285px; float:left; border : none 1px #AAAAAA;'>
    <% 
      int p_contentno = vo.getP_contentno();
      String file = vo.getFile();
      String file1 = vo.getFile1();
      String title = vo.getTitle();
     
      if(title.length() >= 10){   //긴 문장을 10자 이내로 변경
        title = title.substring(0, 10) + "..." ;
      }

       String ext = Tool.fileExtend(file);
         
        if(ext.equals("jpg") || ext.equals("gif") || ext.equals("png")){
          %>
            <A href ='./read.do?p_contentno=<%=p_contentno %>&p_categoryno=<%=vo.getP_categoryno()%>'><IMG src = './storage/<%=file %>'  style = 'width:270px; height:230px; '></a>
            
            <br>
         
              <A href ='./read.do?p_contentno=<%=p_contentno %>&p_categoryno=<%=vo.getP_categoryno()%> '><%=title %></A>
            <br>
            <% 
            
        }else{
          out.println(file1);         
        }
      %>
      </div>
   <%
    }
   %>
   </DIV>
       </DIV>
   
<DIV class='bottom'>
</DIV>
</body>
</html>