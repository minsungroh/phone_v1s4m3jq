<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

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
<FORM name='frm' method='POST' action='./login_proc.jsp'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='email'>이메일</label>
        <input type='email' name='email' id='email' value='test1@mail.com' style='width: 50%;'>
      </li>
      <li>
        <label class='label' for='passwd'>패스워드</label>
        <input type='password' name='passwd' id='passwd' value='1234' style='width: 50%;'>
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
