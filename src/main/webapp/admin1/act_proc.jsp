<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<%
int admin1no = Integer.parseInt(request.getParameter("admin1no"));
String act = request.getParameter("act");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
<%
admin1DAO.updateAct(admin1no, act);
%>
<script type="text/javascript">
  opener.location.reload();
  window.close();
</script>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 
