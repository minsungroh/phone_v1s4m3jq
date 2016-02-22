<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>등록</DIV> 

<FORM name='frm' method='POST' action='./create_proc.jsp'
            enctype='multipart/form-data'>
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th' style='width: 15%;'>닉네임</TH>
      <TD style='width: 35%;'>
        <input type='text' name='rname' value=''  style='width: 98%;'>
      </TD>
      <TH class='th' style='width: 15%;'>Email</TH>
      <TD style='width: 35%;'>
        <input type='text' name='email' value='' style='width: 100%;'>
      </TD>
    </TR>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><input type='text' name='title' value='' style='width: 100%;'></TD>
    </TR>
    <TR>
      <TD colspan='4' style='text-align: right;'>
        <TEXTAREA name='content' rows='10' style='width: 100%;'></TEXTAREA>
      </TD>
    </TR>
    <TR>
      <TH class='th'>파일 1</TH>
      <TD><input type='file' name='file1' value='' style='width: 98%;'></TD>
      <TH class='th'>파일 2</TH>
      <TD><input type='file' name='file2' style='width: 100%;'></TD>
    </TR>
    <TR>
      <TH class='th'>URL</TH>
      <TD><input type='text' name='url' value='' style='width: 98%;'></TD>
      <TH class='th'>패스워드</TH>
      <TD><input type='password' name='passwd' style='width: 100%;' value=''></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






