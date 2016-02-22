<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
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
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
pds5DAO.updateViewcnt(bbsno); // 조회수 증가
Pds5DTO pds5DTO = pds5DAO.read(bbsno); // 조회
%>

<DIV class='title' style='width: 60%;'><%=pds5DTO.getTitle() %></DIV> 

<FORM name='frm'>
  <TABLE class='table'>
    <TR>
      <TD style='text-align: center;'>
        <%
        if (pds5DTO.getSize1() > 0){
          String file1 = pds5DTO.getFile1();
          if ( Tool.isImage(file1) == true){
        %>
            <A href='<%=request.getContextPath() %>/download?dir=/pds3/storage&filename=<%=file1 %>'><IMG src='./storage/<%=file1 %>' style='width: 400px;'></A>
         <%
          }else{
          %>  
            <A href='<%=request.getContextPath() %>/download?dir=/pds3/storage&filename=<%=file1 %>'><%=file1 %></A>
          <%
          }
        }
        %>  
        <%
        if (pds5DTO.getSize2() > 0){
          String file2 = pds5DTO.getFile2();
          if ( Tool.isImage(file2) == true){
        %> 
            <A href='<%=request.getContextPath() %>/download?dir=/pds3/storage&filename=<%=file2 %>'><IMG src='./storage/<%=file2 %>' style='width: 400px;'></A>
         <%
          }else{
          %>  
            <A href='<%=request.getContextPath() %>/download?dir=/pds3/storage&filename=<%=file2 %>'><%=file2 %></A>
          <%
          }
        }
        %>  
        <BR><BR>
      </TD>
    </TR>
    <TR>
      <TD>
        작성자 <%=pds5DTO.getRname() %> | 
        입력 <%=pds5DTO.getRdate().substring(0, 16) %> |
        조회 <%=pds5DTO.getViewcnt() %> |
        이메일 <%=pds5DTO.getEmail() %> |
        IP <%=pds5DTO.getIp() %>      
        <%
        if (pds5DTO.getUrl().length() > 0){
        %>
          <A href='<%=pds5DTO.getUrl() %>' target="_blank"><IMG src='./images/url.png' title='참고 주소'></A>
        <%
        }
        %>              
        <BR><BR>
      </TD>
    </TR>
    <TR>
      <TD><%=pds5DTO.getContent() %></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='답변' onclick="location.href='./reply_form.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='수정' onclick="location.href='./update_form.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='삭제' onclick="location.href='./delete_form.jsp?bbsno=<%=bbsno %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='인쇄' onclick="javascript:print(<%=bbsno %>);">
    
    <%
    if (pds5DTO.getSize1() > 0){
    %>
      <input type='button' value='file1 다운로드' 
                onclick="location.href='<%=request.getContextPath() %>/download?dir=/pds5/storage&filename=<%=pds5DTO.getFile1() %>'">
    <%
    }
    %>
    <%
    if (pds5DTO.getSize2() > 0){
    %>
      <input type='button' value='file2 다운로드' 
                onclick="location.href='<%=request.getContextPath() %>/download?dir=/pds5/storage&filename=<%=pds5DTO.getFile2() %>'">
    <%
    }
    %>      
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






