<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.cart.CartVO" %>
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
  <% ArrayList<CartVO> list = (ArrayList<CartVO>)request.getAttribute("list"); %>
  <%
  CartVO blogVO = (CartVO)request.getAttribute("CartVO");
  %>
  
  <DIV class='title'>개인 장바구니 목록</DIV>
  
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">장바구니번호</th>
          <th class="th">상품명</th>
          <th class="th">상품이미지</th>
          <th class="th">도착 예정일</th>
          <th class="th">판매가</th>
          <th class="th">수량</th>
          <th class="th">합계</th>
          <th class="th">기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <%
          for(int index = 0; index < list.size(); index++){
            CartVO vo = list.get(index);
            int cartno = vo.getCartno();
            int total= vo.getTotal();
            int cnt = vo.getCnt();
            
          %>
          <tr>
            <td class="td"><%=cartno %></td>
            <td class="td_left">
              <a href="./read.do?cartno=<%=cartno %>&mno=<%=vo.getMno()%>"><%=Tool.textLength(10, vo.getProducttitle())%></a> 
            </td>
            <td class="td">이미지</td>
            <td class="td">도착 예정일</td>
            <td class="td"><%=vo.getTotal() %></td>
            <td class="td"><%=vo.getCnt() %></td>
            <td class="td"><%=total*cnt %></td>
            <td class="td">
              <a href="./update.do?blogno=<%=cartno%>&Mno=<%=vo.getMno()%>"><img src="./images/update.png" title="수정" /></a>
              <a href="./delete.do?blogno=<%=cartno %>&Mno=<%=vo.getMno()%>"><img src="./images/delete.png" title="삭제" /></a>
            </td>
          </tr>
          <%  
        }
        %>
      </tbody>
    </table>
    
    <button>주문</button>
    <br><br>
  </div>
<%-- ---------------------------------------------------------------------------------------------- --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<%-- body 종료 --%>
</html>


