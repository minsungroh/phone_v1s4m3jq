<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./auth.jsp" %>
<%@ include file="./ssi.jsp" %>

<%
int admin1no = Integer.parseInt(request.getParameter("admin1no"));
%>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
  window.onload = function(){
    evt('close', 'click', close_proc);
  }
  
  function close_proc(){
    window.close();
  }
  
  function send(f){
    if (f.new_passwd.value == f.new_passwd2.value){
      return true;
      
    }else{
      alert('새로운 패스워드가 일치하지 않습니다.');
      f.new_passwd.value='';
      f.new_passwd2.value='';
      f.new_passwd.focus();
      return false;
    }
  }
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->

<DIV class='content'>
<FORM name='frm' method='POST' action='./passwd_proc.jsp'
            onsubmit="return send(this)">
  <input type='hidden' name='admin1no' value='<%=admin1no %>'>    
        
  <fieldset class='fieldset'>
    <legend class='legend'>관리자 > 패스워드 변경</legend>
    <ul>
      <li>
        <label class='label' for='passwd' style='width: 180px;'>기존 패스워드</label>
        <input type='password' name='passwd' id='passwd' required="required">
      </li>
      <li>
        <label class='label' for='new_passwd' style='width: 180px;'>새로운 패스워드</label>
        <input type='password' name='new_passwd' id='new_passwd' required="required">
      </li>
      <li>
        <label class='label' for='new_passwd2' style='width: 180px;'>새로운 패스워드 확인</label>
        <input type='password' name='new_passwd2' id='new_passwd2' required="required">
      </li>
      <li class='center'>
        <button type="submit">패스워드 변경</button>
        <button type='button' id='close'>닫기</button> 
      </li>
    </ul>
  </fieldset>
</FORM>
</DIV>

</body>
<!-- -------------------------------------------- -->
</html> 
