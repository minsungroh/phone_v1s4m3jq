<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
request.setCharacterEncoding("UTF-8"); 
 
// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************
// 파일 전송시 사용할 임시 저장소
String tempDir = application.getRealPath("/pds5/temp");
 
// 최종 파일 저장소
String upDir = application.getRealPath("/pds5/storage");
 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);

String file1 = "";
long size1 = 0;
String file2 = "";
long size2 = 0;
 
// 파일 객체 추출 <input type='file' name='file1' size='60'>
FileItem item1 = upload.getFileItem("file1");
 
if (item1 != null){
  size1 = item1.getSize();  // 파일 크기 추출
  
  if (size1 > 0){   // 전송 파일이 있다면
    file1 = upload.saveFile(item1, upDir); 
  }
}

//파일 객체 추출 <input type='file' name='file2' size='60'>
FileItem item2 = upload.getFileItem("file2");
if (item2 != null){
size2 = item2.getSize();  // 파일 크기 추출

if (size2 > 0){   // 전송 파일이 있다면
 file2 = upload.saveFile(item2, upDir); 
}
}

// ****************************************************************
// 파일 업로드 관련 코드 종료
// ****************************************************************
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>답변 결과</DIV>

<DIV class='body'>
<%
// 답변을 쓰는 부모글 번호
int bbsno = Integer.parseInt(upload.getParameter("bbsno"));
//한글 변환을 해주어야합니다.
String rname = upload.encodeFileUpload12(upload.getParameter("rname"));
String email = upload.encodeFileUpload12(upload.getParameter("email"));
String title = upload.encodeFileUpload12(upload.getParameter("title"));
String content = upload.encodeFileUpload12(upload.getParameter("content"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));
String url = upload.encodeFileUpload12(upload.getParameter("url"));

String ip = request.getRemoteAddr();

Pds5DTO pds5DTO = new Pds5DTO();
pds5DTO.setBbsno(bbsno);
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
pds5DTO.setIp(ip);

int count = pds5DAO.reply(pds5DTO);
 
if (count == 1){
%>
  입력 데이터를 등록 했습니다.<br><br>
  <input type='button' value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">

<%  
}else{
%>
  입력 데이터 등록에 실패했습니다.<br><br>
  <input type='button' value='다시 시도'  onclick="history.back()">
  <input type='button' value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">

<%  
}
%> 
</DIV>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>

