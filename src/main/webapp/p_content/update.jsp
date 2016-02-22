<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="com.phone.p_content.P_contentVO" %>
<%@ page import="web.tool.Tool" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
  CKEDITOR.replace('content');
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%  
P_contentVO p_contentVO = (P_contentVO)request.getAttribute("p_contentVO");
// System.out.println("-->blogVO.getBlogno:" + blogVO.getBlogno());     
%>
<div class='content_menu'>
  <A href='./list2.do?p_category=<%=p_contentVO.getP_categoryno()%>'>${title } 게시판</A>
</div> 
<DIV class='content' style='width: 80%;'>
  <FORM name='frm' method='POST' action='./update.do'
             enctype="multipart/form-data">
    <input type='hidden' name='p_contentno' id='p_contentno' value='<%=p_contentVO.getP_contentno() %>'>
    <input type="hidden" name="p_categoryno" value="<%=p_contentVO.getP_categoryno() %>">
  
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' size='80' id='title' value='<%=p_contentVO.getTitle() %>' required="required">
      </li>
      <li>
        <textarea name='content' id='content'  rows='10' style='width: 100%;'><%=p_contentVO.getContent() %></textarea>
      </li>
      <li>
        <label for='file'>Thumb 파일</label>
        <%
        if (Tool.checkNull(p_contentVO.getFile()).length() > 0){
          out.println("등록된 파일명: " + p_contentVO.getFile());
        }
        %>
        <input type="file" name='fileMF' id='fileMF' value='<%=Tool.checkNull(p_contentVO.getFile()) %>'>
      </li>
      <li>
        <label for='file1'>업로드 파일</label>
        <%
        if (Tool.checkNull(p_contentVO.getFile1()).length() > 0){
          out.println("등록된 파일명: " + p_contentVO.getFile1());
        }
        %>
        <input type="file" name='file1MF' id='file1MF' value='<%=Tool.checkNull(p_contentVO.getFile1()) %>'>
      </li>
       <li>
        <label class='label' for='money'>가격</label>
        <input type="text" name='money' id='money' >
      </li>
       <li>
        <label class='label' for='meterial'>소재</label>
        <input type="text" name='meterial' id='meterial' >
      </li>
      <li class='right'>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list2.do?p_categoryno=<%=p_contentVO.getP_categoryno() %>'">목록</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
