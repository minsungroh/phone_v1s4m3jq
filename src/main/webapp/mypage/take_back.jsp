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
  
  function reason(paymoney, money){
	 // $("#default").html(paymoney);
	 var tot = paymoney + money;
	 $("#default").html("￦ " + comma(paymoney));
	 $("#take").html("￦ " + comma(tot));
	  $("#item_won").html("￦ " + comma(paymoney));
	  $("#add_trace").html("￦ " + comma(money));
	  if($("#takeback_reason").val() == "p4" || $("#takeback_reason").val() == "p5" || $("#takeback_reason").val() == "p6"){
		  $("#resive").html(0);
	  } else {
	  $("#resive").html("￦ " + comma(money));
	  }
	  
	  $("#total").html("￦ " + comma(tot));
	  
    if($("#takeback_reason").val() == "p7"){
		  $("#reason_content").prop("disabled", "");
	  } else {
		  $("#reason_content").prop("disabled", "");
	  }
  }
  
  function send(){
	  if($("#takeback_reason").val() == 'none'){
		  return false;
	  }
	  
	  return true;
  }
</script>



</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

  <!-- ----------------------------------------- -->
          <div style="border:none; width:95%; margin: 0 auto" id="order_menu">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">반품신청&nbsp;<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;반품하실 상품의 사유를 선택하세요.</span></span>
            </div>
           <form name="frm" id="frm" method="post" action="./traceback_update.do" onsubmit="return send();">
            <input type="hidden" name="payno" id="payno" value="${take_back.payno }">
            <input type="hidden" name="takeback_state" id="takeback_state" value="${take_back.takeback_state }">
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
                  <td style="text-align: left;"> <a href="../p_content/read.do?p_contentno=${take_back.p_contentno }&p_categoryno=${vo.p_categoryno }" target="_blank">
                  <img src="../p_content/storage/${take_back.payfile1 }" style="float: left; margin-right: 2%; width:100px;"></a>
                      <br><span>${take_back.item}</span></td>
                  <td><fmt:formatNumber value="${take_back.paymoney }" pattern="￦#,###,### 원" /></td>
                  <td>${take_back.pcnt} 개</td>
                  <td>0원</td>
                  <td>${take_back.my_state }</td>
                </tr>
                <tr>
                  <td colspan="5" style="height:30px;">
                    <select name="takeback_reason" id="takeback_reason" onchange="reason(${take_back.paymoney },
                    5000)" required="required">
                      <option value="none" selected="selected">반품 사유 선택</option>
                      <option value="p1">상품에 이상 없으나, 구매 의사 없어짐</option>
                      <option value="p2">색상을 잘 못 선택함</option>
                      <option value="p3">상품이 상품상세 정보와 틀림</option>
                      <option value="p4">배송된 상품의 파손/불량 불량</option>
                      <option value="p5">상품이 배송되지 않고 있음</option>
                      <option value="p6">다른 상품이 잘못 배송됨</option>
                      <option value="p7">기타</option>
                    </select>
                    <input type="text" name="reason_content" id="reason_content" size="60px" placeholder="기타 상세 사유를 입력해 주세요." disabled="disabled">
             </table>
             <br>
             <table border="1" style="width: 100%; border-collapse: collapse;">
                 <colgroup>
                  <col style="width: 26%"/>
                  <col style="width: 8%;"/>
                  <col style="width: 25%"/>
                  <col style="width: 8%;"/>
                  <col style="width: 25%"/>
                  <col style="width: 8%;"/>
                   
                 </colgroup>
                 <tr>
                  <th colspan="6">환불예상금액 확인&nbsp;<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;환불예상금액은 아래 예상금액과 다를 수 있습니다.</span></th>
                 </tr>
                 <tr>
                  <td>원 결재 금액</td>
                  <td><span id="default"><fmt:formatNumber value="0" pattern="￦#,###,###" /></span></td>
                  <td>차감 금액 : </td>
                  <td><span id="minus"><fmt:formatNumber value="0" pattern="￦#,###,###" /></span></td>
                  <td style="color: red; font-weight: bold;">환불 예상 금액</td>
                  <td><span id="take" style="color: red; font-weight: bold;">0</span></td>
                </tr>
                <ul>
                <tr>
                  <td><li>상품금액</li></td>
                  <td><span id="item_won"><fmt:formatNumber value="0" pattern="￦#,###,###" /></span></td>
                  <td><li>추가배송비</li></td>
                  <td><span id="add_trace"><fmt:formatNumber value="0" pattern="￦#,###,###" /></span></td>
                  <td></td>
                  <td></tr>
                </tr>
                <tr>  
                  <td><li>할인금액</li></td>
                  <td><span id="discount"><fmt:formatNumber value="0" pattern="￦#,###,###" /></span></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </ul>
             </table>
             <br>
             <table border="1" style="width: 100%; border-collapse: collapse;">
                <tr>
                  <th>반송배송비<span style="border-left: 1px solid #898989; font-size: 13px; color: #BBBBBB;">&nbsp;반송배송비를 결제하셔야만 반품신청이 가능합니다.</span></th>
                 </tr>
                 <tr>
                 <ul>
                  <td><li><span style="font-weight: bold; color: red">구매자 책임사유</span>에 의한 반품이므로<span style="font-weight: bold; color: red"> 반품배송비</span>
                  <span style="font-weight: bold; color: red" id="resive"><fmt:formatNumber value="0" pattern="￦#,###,###" /></span> 을 구매자가 부담합니다.</li>
                  </td>
                  </ul>
                </tr>
                <tr>
                <td><input type="radio" name="resive_money" id="resive_money1" value="box">박스에 동봉(반품 배송시 상품과 함께 반품배송비를 동봉하겠습니다.)</td>
                 </tr>
                 <tr>
                <td><input type="radio" name="resive_money" id="resive_money1" value="phone" checked="checked">판매자에게 직접송금(판매자에게 연락 후 반품배송비를 입금처리하겠습니다.)</td>
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
