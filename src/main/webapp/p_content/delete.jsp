<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.phone.p_content.P_contentVO" %>

<%
int p_contentno = (Integer)request.getAttribute("p_contentno");
int p_categoryno = (Integer)request.getAttribute("p_categoryno");
%>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">

</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<div class='content_menu'>
  <A href='./list.do'>${title } 게시판</A>
</div> 

<DIV class = 'content'>
  <FORM name='frm' method='POST' action='./delete.do'
             onsubmit = 'return send();'>
    <input type='hidden' name='p_contentno' value='<%=p_contentno%>'>
    <input type="hidden" name="p_categoryno" value="<%=p_categoryno %>">
    
    <fieldset>
      <ul>
        <li>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.
        </li>
        <li class = 'right'>
          <button type = "submit">삭제 진행</button>
          <button type = "button" onclick = "location.href='./list2.do?p_categoryno=<%=p_categoryno %>'">취소</button>
         </li>
      </ul>
    </fieldset>
  </FORM>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
 