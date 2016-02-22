<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************
String tempDir = application.getRealPath("/pds5/temp");
String upDir = application.getRealPath("/pds5/storage");
Upload upload = new Upload(request, -1, -1, tempDir);

// System.out.println("--> file1: " + upload.getFileItem("file1"));
// System.out.println("--> file2: " + upload.getFileItem("file2"));

String file1 = "";
long size1 = 0;
String file2 = "";
long size2 = 0;


// ****************************************************************
// 파일 업로드 관련 코드 종료
// ****************************************************************
%>

<DIV class='title'>수정 처리 결과</DIV>

<DIV class='body'>
<%
int bbsno = Integer.parseInt(upload.getParameter("bbsno"));
String rname = upload.encodeFileUpload12(upload.getParameter("rname"));
String email = upload.encodeFileUpload12(upload.getParameter("email"));
String title = upload.encodeFileUpload12(upload.getParameter("title"));
String content = upload.encodeFileUpload12(upload.getParameter("content"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));
String url = upload.encodeFileUpload12(upload.getParameter("url"));

// 기존 파일을 삭제하기위한 레코드 읽기
Pds5DTO _pds5DTO = pds5DAO.read(bbsno);

// ① 패스워드 검사
int count = pds5DAO.passwdCheck(bbsno, passwd);
 
if (count == 1){
  // ② 파일을 새로 올리면 기존 파일 삭제
  
  // ③ 새로운 파일 업로드
  // 첫번째 파일
  FileItem fileItem1 = upload.getFileItem("file1");
  if (fileItem1.getSize() > 0){
    // 파일을 새로 올리는 것임으로 기존 파일 삭제
    upload.deleteFile(upDir, _pds5DTO.getFile1());
    
    file1 = upload.saveFile(fileItem1, upDir);
    size1 = fileItem1.getSize();
  }else{
    file1 = _pds5DTO.getFile1(); // 파일을 전송하지 않을시 기존 정보 사용
    size1 = _pds5DTO.getSize1();
  }

  // 두번째 파일
  FileItem fileItem2 = upload.getFileItem("file2");
  if (fileItem2.getSize() > 0){
    // 파일을 새로 올리는 것임으로 기존 파일 삭제
    upload.deleteFile(upDir, _pds5DTO.getFile2());
    
    file2 = upload.saveFile(fileItem2, upDir);
    size2 = fileItem2.getSize();
  }else{
    file2 = _pds5DTO.getFile2(); // 파일을 전송하지 않을시 기존 정보 사용
    size2= _pds5DTO.getSize2();
  }

  // ④ 글 내용을 변경 
  Pds5DTO pds5DTO = new Pds5DTO();
  pds5DTO.setBbsno(bbsno);  // 주의
  pds5DTO.setRname(rname);
  pds5DTO.setEmail(email);
  pds5DTO.setTitle(title);
  pds5DTO.setContent(content);
  pds5DTO.setPasswd(passwd);
  pds5DTO.setUrl(url); 
  pds5DTO.setFile1(file1);
  pds5DTO.setSize1(size1);
  pds5DTO.setFile2(file2);
  pds5DTO.setSize2(size2);
  
  count = pds5DAO.update(pds5DTO);
  if (count == 1){
%>
  등록된 내용을 변경했습니다.<br><br>
  <input type='button' value='목록' onclick="location.href='./list.jsp'">

<%
  }else{ 
%>
  변경된 내용 저장에 실패했습니다.<br><br>
  <input type='button' value='다시 시도'  onclick="history.back()">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">

<%    
  }
}else{
%>
  패스워드가 일치하지 않습니다.<br><br>
  <input type='button' value='다시 시도'  onclick="history.back()">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">

<%  
}
%> 
</DIV>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>









