<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
$(function(){
 
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title'>장바구니 등록</DIV>
 
<DIV class='content'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='mno'>회원번호</label>
        <input type='text' name='mno' id='mno' value='1' required="required">
      </li>
      <li>
        <label class='label' for='producttitle'>상품이름</label>
        <input type='text' name='producttitle' id='producttitle' value='상품' required="required">
      </li>
      <li>
        <label class='label' for='productno'>상품번호</label>
        <input type='text' name='productno' id='productno' value='1' required="required">
      </li>
      <li>
        <label class='label' for='cnt'>수량</label>
        <input type='text' name='cnt' id='cnt' value='1' required="required">
      </li>
      <li>
        <label class='label' for='total'>합계</label>
        <input type='text' name='total' id='total' value='10000' required="required">
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
