<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  $(function() {

  });

  // 마우스 오른쪽 방지
  document.oncontextmenu = function() { return false; }
  
  // 새로고침 방지
  function doNotReload() {
    if ((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
        || (event.keyCode == 116)) // function F5 //78 ,82 ctrl+N , ctrl+R 

    {
      event.keyCode = 0;
      event.cancelBubble = true;
      event.returnValue = false;
    }
  }
  document.onkeydown = doNotReload;
</script>

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->

  <DIV class='title'>알림</DIV>

  <DIV class='content' style='width: 60%;'>
    <fieldset>
      <ul>
      <c:forEach var="msgs" items="${msgs }">
        <li style="list-style: none; text-align: center;">${msgs }</li>
      </c:forEach>
        <li class='none' style='margin-top: 2em;'>
     <c:forEach var="links" items="${links }">
          ${links }
     </c:forEach>
        </li>
      </ul>
    </fieldset>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

