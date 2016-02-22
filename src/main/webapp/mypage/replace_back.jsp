<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
  $(function() {
    // 사이트 메뉴 액션
    /* $("ul.nav li ul").hide();
    $("ul.nav li a").click(function(event) {
      $(this).siblings("ul").toggle("normal", "swing");
    }); */
  });
  
  function reason(){
    if($("#replace_reason").val() == "p3"){
		  $("#replace_content").prop("disabled", "");
	  } else {
		  $("#replace_content").prop("disabled", "disabled");
	  }
  }
</script>



</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

  <!-- ----------------------------------------- -->
          <div style="border:none; width:95%; margin: 0 auto" id="order_menu">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">교환신청&nbsp;<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;교환하실 상품의 사유를 선택하세요.</span></span>
            </div>
           <form name="frm" id="frm" method="post" action="./replace_update.do">
            <input type="hidden" name="payno" id="payno" value="${replace_back.payno }">
            <input type="hidden" name="replace_state" id="replace_state" value="${replace_back.takeback_state }">
           <div id="order" style="margin: 2%;">
             <table border="1" style="width: 100%; border-collapse: collapse; text-align: center;">
                <colgroup>
                  <col style="width:40%"/>
                  <col style="width:15%;"/>
                  <col style="width:15%;"/>
                  <col style="width:15%;"/>
                  <col style="width:15%;"/>
                </colgroup>
                <tr>
                  <th>상품명</th>
                  <th>상품금액</th>
                  <th>수량</th>
                  <th>배송비</th>
                  <th>주문상태</th>
                </tr>
                <tr>
                  <td style="text-align: left;"> <a href="../p_content/read.do?p_contentno=${replace_back.p_contentno }&p_categoryno=${vo.p_categoryno }" target="_blank">
                  <img src="../p_content/storage/${replace_back.payfile1 }" style="float: left; margin-right: 2%; width:100px;"></a>
                      <br><span>${replace_back.item}</span></td>
                  <td><fmt:formatNumber value="${replace_back.paymoney }" pattern="￦#,###,### 원" /></td>
                  <td>${replace_back.pcnt}</td>
                  <td>0원</td>
                  <td>${replace_back.my_state }</td>
                </tr>
                <tr>
                  <td colspan="5" style="height:30px;">
                    <select name="replace_reason" id="replace_reason" onchange="reason()" required="required">
                      <option value="none">교환사유선택</option>
                      <option value="p1">배송된 상품의 파손/불량 불량</option>
                      <option value="p2">다른 상품이 잘못 배송됨</option>
                      <option value="p3">기타</option>
                    </select>
                    <input type="text" name="replace_content" id="replace_content" size="60px" placeholder="기타 상세 사유를 입력해 주세요." disabled="disabled">
             </table>
             <br>
             <br>
             <table border="1" style="width: 100%; border-collapse: collapse; text-align: center;">
                <tr>
                <td><input type="radio" name="replace_money" id="replace_money" value="ok" checked="checked">교환일 경우 저희 쪽에서 택배를 보내드립니다(배송비 무료)</td>
                </tr>
                <tr>
                <td>고객분의 실수이라고 판단될 경우 추후 배송비가 발생할 수 있습니다</td>
                 </tr>
             </table>
              <br><br>

     <div style="text-align: center;">
        <button type="submit">반품신청</button>
        <button type="button" onclick="window.close();">닫기</button>
      </div>
  </DIV>
</form>
  <!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>
