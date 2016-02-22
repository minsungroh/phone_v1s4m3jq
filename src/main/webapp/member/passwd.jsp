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
function send(){
  // 패스워드 동일한지 검사
  if ($('#passwd').val() == $('#passwd2').val()){ 
    return true;
  }else{
    $('#panel_passwd').css('color', '#FF0000');
    $('#panel_passwd').html('패스워드가 일치하지 않습니다.');
    return false;      
  }
}
</script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>페스워드 변경</DIV>

<DIV class='content' style='width: 500px;'>
<FORM name='frm' method='POST' action='./passwd.do'
           onsubmit = 'return send();'>
  <input type='hidden' name='mno' value='<%=mno %>'>         
  <fieldset>
    <ul>
      <li>
        <label class='label' for='old_passwd' style='width: 200px;'>현재 패스워드</label>
        <input type='password' name='old_passwd' id='old_passwd' value='1234' required="required">
      </li>
      <li>
        <label class='label' for='passwd' style='width: 200px;'>새로운 패스워드</label>
        <input type='password' name='passwd' id='passwd' value='1234' required="required">
        <span id='panel_passwd'></span>
      </li>
      <li>
        <label class='label' for='passwd2' style='width: 200px;'>새로운 패스워드 확인</label>
        <input type='password' name='passwd2' id='passwd2' value='1234' required="required">
      </li>    
      <li class='right'>
        <button type="submit">저장</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
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

