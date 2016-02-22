<%@page import="com.phone.content.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% String root = application.getContextPath(); %>
<% ContentVO contentVO = (ContentVO)request.getAttribute("ContentVO"); %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="<%=root %>/resources/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="<%=root %>/resources/js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=root %>/resources/js/jquery.cookie.js"></script> <!-- 이 부분은 jquery 선언 후 사용해야 된다. -->

<script type="text/javascript"> 
window.onload = function(){
 
}

</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="../menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>회원 조회</DIV>
<%=contentVO.getContentno() %>
<DIV class='content'>
<FORM name='frm' method='get' action='../payment/create.do'>
  <input type="hidden" name="contentno" id="contentno" value="<%=contentVO.getContentno() %>">
  <fieldset style="margin-top: -10px">
    <ul>
      <li>
        <label for="title">제목 : </label>
        <input type="text" name="title" id="title" value="<%=contentVO.getTitle() %>">
      </li>
      <li class="content">
        <label for="content">내용</label>
        <input type="text" name="content" id="content" value="<%=contentVO.getContent() %>" size="25px">
      </li>
     <li>
        <label for="file">thumbfile</label>
        <input type="text" name="file" id="file" value="<%=contentVO.getFile() %>">
      </li>
           <li>
        <label for="itemnum">제품번호</label>
        <input type="text" name="itemnum" id="itemnum" value="<%=contentVO.getItemnum() %>">
      </li>
     <li>
        <label for="money">금액</label>
        <input type="text" name="money" id="money" value="<%=contentVO.getMoney() %>">
      </li>
      <li>
        <label for="productcnt">수량</label>
        <input type="text" name="productcnt" id="productcnt" value="<%=contentVO.getProductcnt() %>">
      </li>
     <li>
        <label for="p_categoryno">카테고리 번호</label>
        <%-- <input type="text" name="p_categoryno" id="p_categoryno" value="<%=contentVO.getP_categoryno() %>"> --%>
      </li>
    </ul>
    <button type="submit">전송</button>
  </fieldset>
</FORM>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 