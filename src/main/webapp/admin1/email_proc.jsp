<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./auth.jsp" %>
<%@ include file="./ssi.jsp" %>

<%
String email = request.getParameter("email");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
  function use(){
    // var test = 'email@mail.com';
    // opener.document.frm.email.value = test;
    // opener.document.frm.email.value = 'test';

    opener.document.frm.email.value = '<%=email%>';
    window.close();
  }
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->

<DIV class='content'>
<FORM name='frm' method='POST' action='./.jsp'>
  <fieldset class='fieldset'>
    <legend class='legend'>관리자 등록 - 중복 Email 검사 결과</legend>
    <ul>
      <li class='center'>
        <%
        int count = admin1DAO.count("email", email);
        out.println("EMAIL: " + email + "<BR><BR>");
        if (count == 0){
          out.println("중복되지 않습니다. <br>사용 가능합니다.");
        }else{
          out.println("이메일이 중복됩니다.");
        }
        %> 
      </li>
      <li class='center'>
      <%
      if (count == 0){
      %>
        <span class='link'><A href='javascript: use()'>사용</A></span> 
        <span class='link'><A href='./email_form.jsp'>다시 검사</A></span> 
        <span class='link'><A href='javascript: window.close()'>닫기</A></span>
      <%
      }else{
      %>
        <span class='link'><A href='./email_form.jsp'>다시 검사</A></span> 
        <span class='link'><A href='javascript: window.close()'>닫기</A></span>
      <%  
      }
      %>
      </li>
    </ul>
  </fieldset>
</FORM>
</DIV>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 
