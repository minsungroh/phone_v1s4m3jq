<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Enumeration" %>

<%@ page import="java.util.*, java.io.*, javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
  
<%@ page import="web.tool.*" %>

<%@ page import="com.phone.admin1.*" %>

<% request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지 %> 

<%
Admin1DAO admin1DAO = new Admin1DAO();
%>

<%
//프로젝트 경로 자동 추출, Context root 명 자동 추출
///ws_web/pds_v3jq -> /pds_v3jq
// http://localhost:9090/pds_v3jq/pdsv3/list2.jsp
String root = request.getContextPath(); 

// 검색 컬럼 및 검색어 추출
String col = request.getParameter("col");
if (col == null){
  col = "";
}else{
  col = col.trim();
}

String word = request.getParameter("word");
if (word == null){
  word = "";
}else{
  word = word.trim();
}

int nowPage = 1;  // 현재 페이지

if (request.getParameter("nowPage") != null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

// out.println("--> col: " + col + " / ");
// out.println("--> word: " + word + " / ");
// out.println("--> nowPage: " + nowPage); 

// 파일 전송시 사용할 임시 파일 저장소
// String tempDir = application.getRealPath("/pdsv3/temp");

// 최종 파일 저장소
// String upDir = application.getRealPath("/pdsv3/storage");

%>







