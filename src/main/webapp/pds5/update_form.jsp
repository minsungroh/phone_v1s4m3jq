<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));

Pds5DTO pds5DTO = pds5DAO.read(bbsno); // 조회
%>

<DIV class='title'>질문 수정</DIV> 

<FORM name='frm' method='POST' action='./update_proc.jsp'
            enctype='multipart/form-data'>
  <input type='hidden' name='bbsno' value='<%=bbsno %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
  
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th' style='width: 15%;'>성명</TH>
      <TD style='width: 35%;'>
        <input type='text' name='rname' value='<%=pds5DTO.getRname() %>'  style='width: 98%;'>
      </TD>
      <TH class='th' style='width: 15%;'>Email</TH>
      <TD style='width: 35%;'>
        <input type='text' name='email' value='<%=pds5DTO.getEmail() %>' style='width: 100%;'>
      </TD>
    </TR>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><input type='text' name='title' value='<%=pds5DTO.getTitle() %>' style='width: 100%;'></TD>
    </TR>
    <TR>
      <TD colspan='4' style='text-align: right;'>
        <TEXTAREA name='content' rows='10' style='width: 100%;'><%=pds5DTO.getContent() %></TEXTAREA>
      </TD>
    </TR>
    <TR>
      <TH class='th'>파일 1</TH>
      <TD>
        <%
        if (pds5DTO.getSize1() > 0){
        %>
          <IMG src='./storage/<%=pds5DTO.getFile1() %>' style='width: 100px;'>
          <%=pds5DTO.getFile1() %>
        <%
        }%>  
        <br>
        <input type='file' name='file1' value='' style='width: 98%;'>
      </TD>
      <TH class='th'>파일 2</TH>
      <TD>
        <%
        if (pds5DTO.getSize2() > 0){
        %>
          <IMG src='./storage/<%=pds5DTO.getFile2() %>' style='width: 100px;'>
          <%=pds5DTO.getFile2() %>
        <%
        }%>  
        <br>
        <input type='file' name='file2' value='' style='width: 100%;'>
      </TD>
    </TR>
    <TR>
      <TH class='th'>URL</TH>
      <TD><input type='text' name='url' value='<%=pds5DTO.getUrl() %>' style='width: 98%;'></TD>
      <TH class='th'>패스워드</TH>
      <TD><input type='password' name='passwd' style='width: 100%;' value='<%=pds5DTO.getPasswd() %>'></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






