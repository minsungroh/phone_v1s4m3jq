<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.p_content.P_contentVO" %>
<%@ page import="web.tool.Tool" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" 
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
});
</script>

<script type="text/javascript">
</script>
</head>

<%-- body 시작 --%>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
  <% ArrayList<P_contentVO> list = (ArrayList<P_contentVO>)request.getAttribute("list"); %>
  
  <div class='content_menu' style='width: 90%;'>
    <A href='../p_category/list.do'>전체 게시판 목록</A> ｜
    <A href='./list.do'>게시판</A>｜
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
   
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">번호</th>
          <th class="th">제목</th>
          <th class="th">Thumb파일</th>
          <th class="th">업로드파일</th>
          <th class="th">상품값</th>
          <th class="th">댓글수</th>
          <th class="th">기타</th>
        </tr>

      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <%
          for(int index = 0; index < list.size(); index++){
            P_contentVO vo = list.get(index);
            int p_contentno = vo.getP_contentno();
          %>
          <tr>
            <td class="td"><%=p_contentno %></td>
            <td class="td_left">
              <a href="./read.do?p_contentno=<%=p_contentno %>&p_categoryno=<%=vo.getP_categoryno()%>"><%=Tool.textLength(20, vo.getTitle())%></a> 
            </td>
            <td class="td"><%=Tool.textLength(10, vo.getFile()) %></td>
            <td class="td"><%=Tool.textLength(10, vo.getFile1()) %></td>
            <td class="td"><%=vo.getMoney() %></td>
            <td class="td"><%=vo.getReplycnt() %></td>
            <td class="td">
              <a href="./update.do?p_contentno=<%=p_contentno%>"><img src="./images/update.png" title="수정" /></a>
              <a href="./delete.do?p_contentno=<%=p_contentno %>&p_categoryno=<%=vo.getP_categoryno()%>"><img src="./images/delete.png" title="삭제" /></a>
              <%=vo.getP_categoryno() %>
            </td>
          </tr>
          <% 
        }
        %>
      </tbody>
    </table>
    <br><br>
  </div>
<%-- ---------------------------------------------------------------------------------------------- --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<%-- body 종료 --%>
</html>


