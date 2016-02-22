<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

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
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>블로그 관리자 인증</DIV>

<DIV class='content'>
<%
String email = request.getParameter("email");
String auth = request.getParameter("auth");

if (admin1DAO.confirm(email, auth) == 1){
%>
  관리자가 로그인 인증시 최종 등록됩니다.<br><br>
  관리자로 등록시 등록 처리 관련 메일이 발송됩니다.<br><br>
  감사합니다.<br><br>
<%
}else{
%>
  관리자 인증시 오류가 발생했습니다.<br><br>
  계속 문제가 발생하면 관리자에게 문의해주세요.<br><br>
  (☎ 0000-0000-0000)<br><br>
<%  
}
%>  
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
