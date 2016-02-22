<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.p_category.P_categoryVO" %>

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
  $('#update_div').hide();
  $('#remove_div').hide();
});

function update(p_categoryno, codeno, title, orderno, visible, ids, cnt){
  $('#update_div').show();
  $('#p_categoryno', update_frm).attr('value', p_categoryno);
  $('#codeno', update_frm).attr('value', codeno);
  $('#title', update_frm).attr('value', title);
  $('#orderno', update_frm).attr('value', orderno);
  $('#visible', update_frm).attr('value', visible);
  $('#ids', update_frm).attr('value', ids);
  $('#cnt', update_frm).attr('value', cnt);
  $('#p_categoryno', update_frm).focus();
}

function update_cancel(){
  $('#update_div').hide();
}

function remove(p_categoryno){
  $('#remove_div').show();
  $('#p_categoryno', remove_frm).attr('value', p_categoryno); 
}
 
function delete_cancel(){
  $('#remove_div').hide();
}

// 그룹 변경
function codeno_update(p_categoryno, codeno){
  var win = window.open("./codeno_update.do?p_categoryno="+ p_categoryno+"&codeno="+codeno, "codeno_UPDATE", "width=450,height=400,scrollbars=no,left=525,top=250");

  var x = (screen.width - 450) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

// 출력 순서 감소, 순위 상승
function up_orderno(p_categoryno, orderno) {      
  if (orderno <= 1){
    return;
  }else{
    orderno = orderno - 1;
    location.href='./update_orderno.do?p_categoryno=' + p_categoryno + '&orderno=' + orderno;
  } 
}

// 출력 순서 증가, 순위 하강
function down_orderno(p_categoryno, orderno){  
  if(orderno >= 50) {
    alert('최대 50순위까지만 가능합니다.');
    return;    
  } else {
    orderno = orderno + 1;
    location.href='./update_orderno.do?p_categoryno=' + p_categoryno + '&orderno=' + orderno;    
  }
}

//출력모드 변환
function update_visible(p_categoryno,visible){
  $('#frm').attr('action', './update_visible.do');
  $('#p_categoryno',frm).attr('value', p_categoryno);
  $('#visible').attr('value', visible);
  $('#frm').submit();
}

/* function update(codeno, sort, content){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do');
  // $('#codeno').val(codeno); // Chrome Elements에 변경이 안됨
  $('#codeno').attr('value', codeno);
  // $('#sort').val(sort);          // Chrome Elements에 변경이 안됨
  $('#sort').attr('value', sort);
  // $('#content').val(content); // Chrome Elements에 변경이 안됨
  $('#content').attr('value', content);
  $('#submit').html('저장');
  $('#sort').focus();
} */

</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<!--출력모드 폼 겹칠시 이름 변경  -->
<FORM name='frm' id='frm' method='POST' action=''>
  <input type='hidden' name='p_categoryno' id='p_categoryno'  value=''>
  <input type='hidden' name='visible' id='visible' value=''> 
</FORM>

<%
ArrayList<P_categoryVO> list = (ArrayList<P_categoryVO>)request.getAttribute("list");
%>

<DIV class='title'>게시판 목록</DIV>

<DIV id='update_div' class='content' style='padding: 10px 0px 10px 0px; background-color: #EEEEEE; width: 70%;'>
  <FORM name='update_frm' id='update_frm' method='POST' action='./update.do'>
    <input type='hidden' name='p_categoryno' id='p_categoryno' value='0'>
    <fieldset>
      <ul>
        <li>
          <label class='label' for='codeno'>그룹</label>
          <input type='text' name='codeno' id='codeno'>
        </li>
        <li>
          <label class='label'  for='title'>제목</label>
          <input type='text' name='title' id='title' placeholder="">
        </li>
        <li>
          <label class='label'  for='orderno'>순서</label>
          <input type='text' name='orderno' id='orderno'>
        </li>
        <li>
          <label class='label' for='visible'>모드</label>
          <input type='text' name='visible' id='visible' placeholder="Y or N">
        </li>
        <li>
          <label class='label' for='ids'>접근계정</label>
          <input type='text' name='ids' id='ids' size='50' placeholder="admin/user1/guest/...">
        </li>
        <li>
          <label class='label' for='cnt'>글 수</label>
          <input type='number' name='cnt' id='cnt' min='0' step='1' required="required" >
        </li>
        <li class='right'>
         <button type="submit" id='submit'>수정</button>
         <button type="button" onclick="update_cancel()">취소</button>
        </li>
      </ul>
    </fieldset>
  </FORM>
</DIV>

<DIV id='remove_div' class='content' style= 'padding: 10px 0px 10px 0px; background-color: #ffff00; width: 70%; text-align: center;'>
  <FORM name='remove_frm' id='remove_frm' method='POST' action='./delete.do'>
    <input type='hidden' name='p_categoryno' id='p_categoryno'>
    삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    <button type="submit" id='submit'>삭제</button>     
    <button type="button" onclick="delete_cancel()">취소</button>     
  </FORM>
</DIV>

<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>그룹</TH>
    <TH class='th'>제목</TH>
    <TH class='th'>순서</TH>
    <TH class='th'>모드</TH>
    <TH class='th'>접근계정</TH>
    <TH class='th'>글 수</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    P_categoryVO vo = list.get(index);
    int p_categoryno = vo.getP_categoryno();

%> 
  <TR>
    <TD class='td'><%=p_categoryno %></TD>
    <TD class='td'>
      <A href="#" onclick="codeno_update(<%=vo.getP_categoryno()%>, <%=vo.getCodeno()%>)"><%=vo.getCodeno()%></A>
    </TD>
    <TD class='td'>
      <A href='../p_content/list2.do?p_categoryno=<%=vo.getP_categoryno() %>'><%=vo.getTitle() %></A>
    </TD>
    <TD class='td'>
      <%=vo.getOrderno() %>
      <a href="javascript: up_orderno(<%=p_categoryno %>, <%=vo.getOrderno() %>)"><img src='./images/plus.jpg' title="우선순위 증가" width='15px'></a>
      <a href="javascript: down_orderno(<%=p_categoryno %>, <%=vo.getOrderno() %>)"><img src='./images/minus.jpg' title="우선순위 감소" width='16px'></a>
    </TD>
    <TD class='td'>
      <A href="javascript:update_visible(<%=p_categoryno%>, '<%=vo.getVisible()%>');"><%=vo.getVisible() %></A>
    </TD>
    <TD class='td'><%=vo.getIds() %></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'>
      <A href="javascript:update(<%=p_categoryno%>, '<%=vo.getCodeno()%>', '<%=vo.getTitle()%>', '<%=vo.getOrderno() %>', '<%=vo.getVisible() %>', '<%=vo.getIds()%>', '<%=vo.getCnt()%>')"><IMG src='./images/update.png' title='삭제'></A>
      <A href="javascript:remove(<%=p_categoryno%>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
  <button type='button' onclick="location.href='../code/list.do'">코드 목록</button>
  <button type='button' onclick="location.href='../p_content/list.do'">전체 게시판글</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

