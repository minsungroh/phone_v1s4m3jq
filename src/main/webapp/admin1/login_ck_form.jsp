<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<%
String url_address = request.getParameter("url_address"); // 로그인 후 이동할 주소

Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String ck_email = "";
String ck_email_save = "";
String ck_passwd = "";
String ck_passwd_save = "";

for (int i=0; i < cookies.length; i++){
  cookie = cookies[i];
  
  if (cookie.getName().equals("ck_email")){
    ck_email = cookie.getValue();         // test1@mail.com
  }else if(cookie.getName().equals("ck_email_save")){
    ck_email_save = cookie.getValue();  // Y, N
  }else if (cookie.getName().equals("ck_passwd")){
    ck_passwd = cookie.getValue();         // test1@mail.com
  }else if(cookie.getName().equals("ck_passwd_save")){
    ck_passwd_save = cookie.getValue();  // Y, N
  }
}
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

<DIV class='title' style='width: 10%;'>로그인</DIV>

<DIV class='content' style='width: 40%;'>
<FORM name='frm' method='POST' action='./login_ck_proc.jsp'>
  <input type='hidden' name='url_address' value='<%=url_address %>'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='email'>이메일</label>
        <input type='email' name='email' id='email' value='<%=ck_email %>' style='width: 40%;' autocomplete="off">
        <label>
          <%
          if (ck_email_save.equals("Y")){
          %>
            <input type='checkbox' name='email_save' value='Y' checked="checked"> 저장
          <%
          }else{
          %>
            <input type='checkbox' name='email_save' value='Y'> 저장
          <%  
          }
          %>
        
        </label>
      </li>
      <li>
        <label class='label' for='passwd'>패스워드</label>
        <input type='password' name='passwd' id='passwd' value='<%=ck_passwd %>' style='width: 40%;' autocomplete="off">
        <label>
          <%
          if (ck_passwd_save.equals("Y")){
          %>
            <input type='checkbox' name='passwd_save' value='Y' checked="checked"> 저장
          <%
          }else{
          %>
            <input type='checkbox' name='passwd_save' value='Y'> 저장
          <%  
          }
          %>
        
        </label>
      </li>
      <li class='center'>
        <button type='submit'>로그인</button>
        <button type='button' onclick="history.back();">취소</button>
        
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
