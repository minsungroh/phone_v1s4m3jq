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

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->

<DIV class='content'>
<FORM name='frm' method='POST' action='./act_proc.jsp'>
  <input type='hidden' name='admin1no' value='<%=admin1no %>'>
  <fieldset class='fieldset'>
    <legend class='legend'>관리자 등록 - 권한의 변경</legend>
    <ul>
      <li>
        <label>
          <input type='radio' name='act' id='act1' value='M' <%=(act.equals("M"))?"checked='checked'":"" %>>
          M: 마스터
        </label>
      </li>
      <li>
        <label>
          <input type='radio' name='act' id='act2' value='Y'  <%=(act.equals("Y"))?"checked='checked'":"" %>>
          Y: 로그인 가능
        </label>
      </li>      
      <li>
        <label>
          <input type='radio' name='act' id='act3' value='N'  <%=(act.equals("N"))?"checked='checked'":"" %>>
          N: 로그인 불가
        </label>
      </li>
      <li>
        <label>
          <input type='radio' name='act' id='act4' value='H'  <%=(act.equals("H"))?"checked='checked'":"" %>>
          H: 보류(신규 가입)
        </label>      
      </li>            
      <li class='center'>
        <button type="submit">권한 변경 적용</button>
        <button type='button' onclick="window.close();">닫기</button> 
      </li>
    </ul>
  </fieldset>
</FORM>
</DIV>

</body>
<!-- -------------------------------------------- -->
</html> 
