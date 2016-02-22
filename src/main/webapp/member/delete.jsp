<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.phone.member.MemberVO" %>

<%
int mno = (Integer)request.getAttribute("mno");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="./jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

<script type="text/javascript">
</script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>회원 삭제</DIV>

<DIV class='content' style='width: 500px; text-align: center;'>
<FORM name='frm' method='POST' action='./delete.do'
           onsubmit = 'return send();'>
  회원을 삭제하면 복구 할 수 없습니다.<br><br>
  정말로 삭제하시겠습니까?<br><br>         
  <input type='hidden' name='mno' value='<%=mno %>'>         
  <button type="submit">삭제</button>
  <button type="button" onclick="location.href='./list.do'">목록</button>

</FORM>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 

