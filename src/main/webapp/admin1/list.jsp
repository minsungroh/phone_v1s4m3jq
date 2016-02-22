<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
function act_proc(admin1no, act){
  var url = './act_form.jsp?admin1no=' + admin1no + '&act=' + act;
  var win = window.open(url, '권한 변경', 'width=500px, height=400px, scrollbars=no');
  
  var x = (screen.width - 500) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

function passwd_form(admin1no){
  var url = './passwd_form.jsp?admin1no=' + admin1no;
  var win = window.open(url, '패스워드 변경', 'width=530px, height=400px, scrollbars=no');
  
  var x = (screen.width - 530) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

function update_form(admin1no){
  var url = './update_form.jsp?admin1no=' + admin1no;
  var win = window.open(url, '회원 정보 변경', 'width=530px, height=400px, scrollbars=no');
  
  var x = (screen.width - 530) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

function delete_form(admin1no){
  var sw = window.confirm("정말로 관리자 회원을 삭제할까요?");
  if (sw == false){
    window.alert('회원 삭제를 취소합니다.');
  }else{
    var url = './delete_proc.jsp?admin1no=' + admin1no;
    var win = window.open(url, '회원 정보 변경', 'width=530px, height=400px, scrollbars=no');
    
    var x = (screen.width - 530) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 화면 이동
  }

}

</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<Admin1VO> list = admin1DAO.list();
%>
<DIV class='title'>관리자 목록</DIV>

<TABLE class='table'>
  <TR>
    <TH class='th' style='width: 10%;'>번호</TH>
    <TH class='th' style='width: 30%;'>이메일</TH>
    <TH class='th' style='width: 10%;'>인증키</TH>
    <TH class='th' style='width: 10%;'>권한</TH>
    <TH class='th' style='width: 15%;'>이메일확인</TH>
    <TH class='th' style='width: 15%;'>등록일</TH>
    <TH class='th' style='width: 10%;'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    Admin1VO vo = list.get(index);
    int admin1no = vo.getAdmin1no();

%> 
  <TR>
    <TD class='td'><%=admin1no %></TD>
    <TD class='td_left'><%=vo.getEmail() %></A></TD>
    <TD class='td'><%=vo.getAuth() %></TD>
    <TD class='td'>
      <A href="javascript: act_proc(<%=admin1no %>, '<%=vo.getAct() %>')"><%=vo.getAct() %></A>
    </TD>
    <TD class='td'><%=vo.getConfirm() %></TD>
    <TD class='td'><%=vo.getMdate().substring(0, 10) %></TD>
    <TD class='td'>
      <A href="javascript:passwd_form(<%=admin1no %>)"><IMG src='./images/passwd.png' title='패스워드 변경'></A>
      <A href="javascript:update_form(<%=admin1no %>)"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:delete_form(<%=admin1no %>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="location.href='./create_form.jsp'">등록</button>
  <button type='button' onclick="location.href='../member/list.do'">회원목록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



