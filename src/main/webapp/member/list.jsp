<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.member.MemberVO" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">

</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
%>
<DIV class='title'>회원 목록</DIV>

<TABLE class='table'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    MemberVO vo = list.get(index);
    int mno = vo.getMno();

%> 
  <TR>
    <TD class='td'><%=mno %></TD>
    <TD class='td'><A href="./read.do?mno=<%=mno %>"><%=vo.getId() %></A></TD>
    <TD class='td'><A href="./read.do?mno=<%=mno %>"><%=vo.getMname() %></A></TD>
    <TD class='td'><A href="./read.do?mno=<%=mno %>"><%=vo.getNname() %></A></TD>
    <TD class='td'><%=vo.getTel() %></TD>
    <TD class='td'>
      <%
      String address1 = vo.getAddress1();
      if (address1.length() > 15){
        out.println(address1.substring(0, 15) + "...");
      }
      %>
    </TD>
    <TD class='td'><%=vo.getMdate().substring(0, 10) %></TD>
    <TD class='td'>
      <A href="./passwd.do?mno=<%=mno %>"><IMG src='./images/passwd.png' title='패스워드 변경'></A>
      <A href="./update.do?mno=<%=mno %>"><IMG src='./images/update.png' title='수정'></A>
      <A href="./delete.do?mno=<%=mno %>"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



