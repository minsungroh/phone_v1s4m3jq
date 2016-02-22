<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<%
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>로그인</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='content'>
<FORM name='frm' method='POST' action='./.jsp'>
  <fieldset class='fieldset'>
    <ul>
      <li class='center'>
        <%
        int count = admin1DAO.login(email, passwd);
        // System.out.println("--> count: " + count);
        
        if (count == 1){
          String act = admin1DAO.readEmail(email).getAct();
          if ("MY".indexOf(act) >= 0){ // 로그인 권한 있음. M: Master, Y:일반 회원
            session.setAttribute("email", email);
            session.setAttribute("passwd", passwd);
            session.setAttribute("act", act);
            
            response.sendRedirect(root +"/index.jsp");
          }else{
          %>
            현재 계정이 사용 불가합니다.<br><br>
            관리자에게 문의해주세요.<br><br>
          <%  
          }
        }else{
        %>
          로그인 아이디와 패스워드가 일치하지 않습니다.<br>
          확인후 다시 로그인해주세요.<br>
        <%
        }
        %> 
      </li>
      <li class='center'>
      <%
      if (count == 0){
      %>
        <span class='link'><A href='javascript: history.back()''>다시 검사</A></span> 
        <span class='link'><A href='../index.jsp'>취소</A></span>
      <%
      }
      %>
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
