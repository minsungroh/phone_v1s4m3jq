<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./auth.jsp" %>
<%@ include file="./ssi.jsp" %>

<%
int admin1no = Integer.parseInt(request.getParameter("admin1no"));
String passwd = request.getParameter("passwd");
String new_passwd = request.getParameter("new_passwd");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->

<DIV class='content'>
<%
// 기존 패스워드 일치 여부 검사
if (admin1DAO.countPasswd(admin1no, passwd) == 1){
  if (admin1DAO.updatePasswd(admin1no, new_passwd) == 1){
  %>
    패스워드를 변경하였습니다.
  <%  
  };
}else{
%>
  기존 패스워드가 일치하지 않습니다.<br><br>
  다시 시도해주세요.<br><br>
<%
}
%>
</DIV>

<DIV class='bottom'>
  <button type='button' onclick="location.href='./passwd_form.jsp?admin1no=<%=admin1no %>'">패스워드 변경</button>
  <button type='button' onclick="window.close()">닫기</button>
</DIV>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 





