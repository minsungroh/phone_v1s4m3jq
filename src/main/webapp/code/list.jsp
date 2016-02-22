<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.code.CodeVO" %>

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
  $('#panel_frm').hide();
  $('#panel_frm_remove').hide();
  
});

function create(){
  $('#panel_frm').show();
  $('#frm').attr('action', './create.do');
  $('#sort').attr('value', '');
  $('#submit').html('등록');
  $('#sort').focus();
}

function create_cancel(){
  $('#panel_frm').hide();
}

function update(codeno, sort, content){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do');
  // $('#codeno').val(codeno); // Chrome Elements에 변경이 안됨
  $('#codeno').attr('value', codeno);
  // $('#sort').val(sort);          // Chrome Elements에 변경이 안됨
  $('#sort').attr('value', sort);
  $('#submit').html('저장');
  $('#sort').focus();
}

function remove(codeno){
  $('#panel_frm_remove').show();
  $('#codeno', frm_remove).attr('value', codeno);
  
  // alert 창 형태의 경우, GET
  /*   
  var sw = confirm('정말로 삭제하시겠습니까?');
  
  if (sw == true){
    location.href='./delete.do?codeno=' + codeno;
  }else{
    return;
  } */
}

function delete_cancel(){
  $('#panel_frm_remove').hide();
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<CodeVO> list = (ArrayList<CodeVO>)request.getAttribute("list");
%>
<DIV class='title'>코드 목록</DIV>

<DIV id='panel_frm' class='content' style='padding: 10px 0px 10px 0px;  width: 70%; text-align: center;'>
<FORM name='frm' id='frm' method='POST' action='./create.do'>
  <input type='hidden' name='codeno' id='codeno' value='0'> 
  
  <label for='sort'>분류</label>
  <input type='text' name='sort' id='sort' size='15' value='카테고리' required="required">

  <button type="submit" id='submit'>등록</button>
  <button type="button" onclick="create_cancel()">취소</button>
</FORM>
</DIV>

<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px;  width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='codeno' id='codeno'> 
  
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="delete_cancel()">취소</button>
</FORM>
</DIV>

<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 70%;'/>
    <col style='width: 20%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>코드 분류</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    CodeVO vo = list.get(index);
    int codeno = vo.getCodeno();

%> 
  <TR>
    <TD class='td'><%=codeno %></TD>
    <TD class='td'><%=vo.getSort() %></TD>
    <TD class='td'>
      <A href="javascript:update(<%=codeno%>, '<%=vo.getSort() %>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=codeno%>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="create();">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
  <button type='button' onclick="location.href='../blogcategory/list.do'">게시판 목록</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



