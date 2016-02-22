<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.phone.code.CodeVO" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
$(function(){
  
});
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->

<DIV style='margin: 20px auto;' >
<FORM name='frm' method='POST' action='./grp_update.do' >
<%
int p_categoryno = Integer.parseInt(request.getParameter("p_categoryno"));
int grp = Integer.parseInt(request.getParameter("grp"));
%>
  <input type='hidden' name='p_categoryno' value='<%=p_categoryno%>'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='id'>그룹</label>
       등록할 그룹 선택
      </li>
        <%
        ArrayList<CodeVO> code_list = (ArrayList<CodeVO>)request.getAttribute("code_list");
        for(int i = 0 ; i<code_list.size(); i++){
          CodeVO codeVO = code_list.get(i);
        %>
        <LI>
          <span class='label'>&nbsp;</span>
          <label>
          <%
          // 현재 선택된 그룹을 checked="checked" 출력
          if(grp == codeVO.getCodeno()){
          %>
            <input type='radio' name='codeno' value='<%=codeVO.getCodeno()%>' checked="checked"><%=codeVO.getSort() %>
          <%
          }else{
            %>
            <input type='radio' name='codeno' value='<%=codeVO.getCodeno()%>'><%=codeVO.getSort() %>
          <%
          }
          %>      
          </label>
        </LI>
        <% 
        }
        %>
      <li class='right'>
        <button type='submit'>그룹 변경</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 

