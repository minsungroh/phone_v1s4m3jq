<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>

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

<DIV class='title'>삭제</DIV> 

<FORM name='frm' method='POST' action='./delete_proc.jsp'>
  <input type='hidden' name='bbsno' value='<%=bbsno %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
  
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><%=pds5DTO.getTitle() %></TD>
    </TR>
    <TR>
      <TH class='th'>파일 1</TH>
      <TD>
        <%
        if (pds5DTO.getSize1() > 0){
          String file1 = pds5DTO.getFile1();
          if ( Tool.isImage(file1) == true){
        %>  
          <IMG src='./storage/<%=file1 %>' style='width: 100px;'>
         <% 
            out.println(file1);
          }else{
            out.println(file1);  // 일반 파일의 파일명 출력
          }
        }
        %>  
      </TD>
      <TH class='th'>파일 2</TH>
      <TD>
        <%
        if (pds5DTO.getSize2() > 0){
          String file2 = pds5DTO.getFile2();
          if ( Tool.isImage(file2) == true){
        %>
          <IMG src='./storage/<%=file2 %>' style='width: 100px;'>
         <%
            out.println(file2);
          }else{
            out.println(file2);  // 일반 파일의 파일명 출력
          }
        }
        %>  
      </TD>
    </TR>
    <TR>
      <TH class='th'>패스워드</TH>
      <TD colspan="3"><input type='password' name='passwd' style='width: 100%;' value='<%=pds5DTO.getPasswd() %>'></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='삭제 진행'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






