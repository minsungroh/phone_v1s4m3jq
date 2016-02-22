<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./auth.jsp" %>
<%@ include file="./ssi.jsp" %>

<%
int admin1no = Integer.parseInt(request.getParameter("admin1no"));
String email = request.getParameter("email");
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
if (admin1DAO.update(admin1no, email) == 1){
%>
  <script type="text/javascript">
    opener.location.reload();
  </script>
  회원 정보를 변경했습니다.
<%  
}else{
%>
  회원 정보를 변경하지 못했습니다.<br><br>
  다시 시도해주세요.<br><br>
<%
}
%>
</DIV>

<DIV class='bottom'>
  <button type='button' onclick="window.close();">닫기</button>
</DIV>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 





