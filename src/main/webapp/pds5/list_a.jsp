<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<%
// ---------------------------------------------
// 페이징 관련 코드 시작
// ---------------------------------------------
int totalRecord = pds5DAO.totalRecord(col, word);
// 10: 한 페이지당 출력할 레코드 갯수
String paging = new Paging().paging4(totalRecord, nowPage, 10, col, word);
// ---------------------------------------------
// 페이징 관련 코드 종료
// ---------------------------------------------
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<script type="text/javascript">
  function print(bbsno){
    var str = './print.jsp?bbsno=' + bbsno;
    window.open(str, "print", ('scrollbars=yes, resizeable=no, width=800, height=700'));
  }
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>질문/답변</DIV> 

<!-- 
margin: 1px auto: 위아래 마진은 1px, 좌우 마진은 자동 가운데 설정
 -->
<DIV style='width: 90%; margin: 1px auto; text-align: right;'>
   <FORM name='frm' method='POST' action='./list.jsp'>
     글 수: <%=pds5DAO.totalRecord(col, word) %> 건 &nbsp;
     <SELECT name='col'> 
       <OPTION value='rname' <%=(col.equals("rname"))?"selected=selected":"" %>>이름</OPTION>
       <OPTION value='title' <%=(col.equals("title"))?"selected=selected":"" %>>제목</OPTION>
       <OPTION value='content' <%=(col.equals("content"))?"selected=selected":"" %>>내용</OPTION>
       <OPTION value='email' <%=(col.equals("email"))?"selected=selected":"" %>>이메일</OPTION>
     </SELECT>
     <INPUT type='text' name='word' value='<%=word %>' size='10'>
     <INPUT type='submit' value='검색'>
     <INPUT type='button' value='전체 목록' onclick="location.href='./list.jsp'">
     <INPUT type='button' value='등록' onclick="location.href='./create_form.jsp'">
   </FORM>
</DIV>

<TABLE class='table' style='width: 90%;'>
  <TR>
    <TH class='th' style='width: 5%;'>번호</TH>
    <TH class='th' style='width: 30%;'>제목</TH>
    <TH class='th' style='width: 10%;'>file1</TH>
    <TH class='th' style='width: 10%;'>file2</TH>  
    <TH class='th' style='width: 10%;'>닉네임</TH>
    <TH class='th' style='width: 5%;'>조회</TH>
    <TH class='th' style='width: 15%;'>등록일</TH>
    <TH class='th' style='width: 15%;'>기타</TH>
  </TR>
<%
// ---------------------------------
ArrayList list = pds5DAO.list();  // 검색 지원
// --------------------------------- 

for(int index = 0; index < list.size(); index++){
  // NewsDTO 추출하는데 광범위한 공통 타입인 Object 타입으로 추출
  Object obj = list.get(index); 
  
  // 광범위한 Object 타입을 구체적인 클래스 타입으로 변환해야 사용 가능
  Pds5DTO pds3DTO = (Pds5DTO)obj;
  int bbsno = pds3DTO.getBbsno();  // 레코드 번호 추출
%>  
  <TR>
    <TD class='td'><%=bbsno %></TD>
    <TD class='td' style='text-align: left;'>
      <%
      int indent = pds3DTO.getIndent();
      for(int i=0; i < indent; i++){
        out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
      }

      if (indent > 0){
      %>
        <img src='./images/reply2.png'>
      <%  
      }
      
      String str = pds3DTO.getTitle();
      
      if (str.length() >= 25){
        str = str.substring(0, 20) + "...";
      }
      
      str = Tool.convertChar(str); // 태그를 단순 문자로 변환
      %>      
      <A href='./read.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'><%=str %></A>
      <%
      if (Tool.isNew(pds3DTO.getRdate(), 1)){
      %>
        <IMG src='./images/new.gif'>
      <%
      } 
      %>  
    </TD>
    <TD class='td' style='padding-top: 5px;'>
      <%
      String file1 = pds3DTO.getFile1();
      if ( Tool.isImage(file1) == true){
      %>
        <IMG src='./storage/<%=file1 %>' style='width: 100px; height: 80px;'>
      <%
      }else{ 
        out.println(file1);
      }
      %>
    </TD>
    <TD class='td' style='padding-top: 5px;'>
      <%
      String file2 = pds3DTO.getFile2();
      if ( Tool.isImage(file2) == true){
      %>
        <IMG src='./storage/<%=file2 %>' style='width: 100px; height: 80px;'>
      <%
      }else{
        out.println(file2);
      }
      %>
    </TD>
    
    <TD class='td'><%=pds3DTO.getRname() %></TD>
    <TD class='td'><%=pds3DTO.getViewcnt() %></TD>
    <TD class='td'><%=pds3DTO.getRdate().substring(0, 10) %></TD>
    <TD class='td'>
      <%
      if (pds3DTO.getUrl().length() > 0){
      %>
        <A href='<%=pds3DTO.getUrl() %>' target="_blank"><IMG src='./images/url.png' title='참고 주소'></A>
      <%
      }
      %>
      <A href='./reply_form.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>''><IMG src='./images/reply.png' title='답변'></A>
      <A href='./update_form.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>''><IMG src='./images/update.png' title='수정'></A>
      <A href='./delete_form.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'><IMG src='./images/delete.png' title='삭제'></A>
      <A href='javascript:print(<%=bbsno %>);'><IMG src='./images/print.png' title='인쇄'></A>
      
      <%
      if (pds3DTO.getSize1() > 0){
      %>
        <A href='<%=request.getContextPath() %>/download?dir=/pds3/storage&filename=<%=pds3DTO.getFile1() %>'><IMG src='./images/download.png' title='첫번째 파일 다운로드'></A>
      <%
      }
      %>
      <%
      if (pds3DTO.getSize2() > 0){
      %>
        <A href='<%=request.getContextPath() %>/download?dir=/pds3/storage&filename=<%=pds3DTO.getFile2() %>'><IMG src='./images/download.png' title='두번째 파일 다운로드'></A>
      <%
      }
      %>          
    </TD>
  </TR>

<%
}
%>
</TABLE>

<DIV class='bottom'>
  <%=paging %>
</DIV>

<DIV style='text-align: center;'>
  <input type='button' value='등록' onclick="location.href='./create_form.jsp'">
</DIV>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>





