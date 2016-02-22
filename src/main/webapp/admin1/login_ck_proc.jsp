<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<%
String url_address = Tool.checkNull(request.getParameter("url_address")); // 이동할 주소

String email = request.getParameter("email");
// Checkbox를 체크를안하고 넘어오면 null 값을 가지고 있게됨.
String email_save = Tool.checkNull(request.getParameter("email_save"));
String passwd = request.getParameter("passwd");
//Checkbox를 체크를안하고 넘어오면 null 값을 가지고 있게됨.
String passwd_save = Tool.checkNull(request.getParameter("passwd_save"));
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
            
            // Session 저장
            // ------------------------------------------------------------------
            session.setAttribute("email", email);
            session.setAttribute("passwd", passwd);
            session.setAttribute("act", act);
            // ------------------------------------------------------------------
         
            // email 저장 관련 쿠키 저장
            // ------------------------------------------------------------------
            if (email_save.equals("Y")){ // 이메일 저장 할 경우
              Cookie ck_email = new Cookie("ck_email", email); // 이메일 저장
              ck_email.setMaxAge(60); // 초
              response.addCookie(ck_email);
              
            }else{ // 이메일 저장하지 않을 경우
              Cookie ck_email = new Cookie("ck_email", ""); // 이메일 저장
              ck_email.setMaxAge(0); // 초
              response.addCookie(ck_email);
              
            }
            // 이메일 저장 여부를 결정하는 쿠기 기록, Y or "" 저장
            Cookie ck_email_save = new Cookie("ck_email_save", email_save);
            ck_email_save.setMaxAge(60); // 초
            response.addCookie(ck_email_save);
            // ------------------------------------------------------------------
         
            // passwd 저장 관련 쿠키 저장
            // ------------------------------------------------------------------
            if (passwd_save.equals("Y")){ // 이메일 저장 할 경우
              Cookie ck_passwd = new Cookie("ck_passwd", passwd); // 이메일 저장
              ck_passwd.setMaxAge(60); // 초
              response.addCookie(ck_passwd);
              
            }else{ // 이메일 저장하지 않을 경우
              Cookie ck_passwd = new Cookie("ck_passwd", ""); // 이메일 저장
              ck_passwd.setMaxAge(0); // 초
              response.addCookie(ck_passwd);
              
            }
            // 이메일 저장 여부를 결정하는 쿠기 기록, Y or "" 저장
            Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
            ck_passwd_save.setMaxAge(60); // 초
            response.addCookie(ck_passwd_save);
            // ------------------------------------------------------------------
         
            if (url_address.length() > 0){
              response.sendRedirect(url_address);  
            }else{
              response.sendRedirect(root +"/index.jsp");
            }
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
