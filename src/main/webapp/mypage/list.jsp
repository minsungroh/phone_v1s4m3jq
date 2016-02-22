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
		  
	});
	
	function trace(payno, mypageno) {
	    var win_file = window.open("../trace/read.do?payno=" + payno + "&mypageno=" + mypageno ,  '배송조회', 'width=1200px, height=550px',
	        'scrollbars=no');

	    var x = (screen.width - 1200) / 2;
	    var y = (screen.height - 550) / 2;

	    win_file.moveTo(x, y);
	  }
	
	
	 function detail_read(mno, waybil) {
	      var win_file = window.open("./detail_read.do?mno=" + mno +"&waybil=" + waybil, '주문상세보기', 'width=1000px, height=600px',
	          'scrollbars=no');

	      var x = (screen.width - 1000) / 2;
	      var y = (screen.height - 600) / 2;

	      win_file.moveTo(x, y);
	    }
	 
	 
function update(payno, my_state, mno){
	if(my_state != "구매 결정 대기"){
		var sm = confirm("배송완료가 되지 않은 제품을 구매확정하시겠습니까?");
		if(sm == true){
			location.href="./update.do?payno=" + payno + "&mno=" + mno;
		} else {
			return false;
		}
	} else if(my_state == "구매 결정 대기") {
		location.href="./update.do?payno=" + payno + "&mno=" + mno;
	}
}

function take_back(mno, waybil){
	 var win_file = window.open("./take_back.do?mno=" + mno +"&waybil=" + waybil, '반품신청', 'width=1000px, height=600px',
     'scrollbars=no');

 var x = (screen.width - 1000) / 2;
 var y = (screen.height - 600) / 2;

 win_file.moveTo(x, y);
}

function take_back_cancel(mno, waybil){
	   var win_file = window.open("./take_back_cancel.do?mno=" + mno +"&waybil=" + waybil, '반품취소', 'width=1000px, height=600px',
	     'scrollbars=no');

	 var x = (screen.width - 1000) / 2;
	 var y = (screen.height - 600) / 2;

	 win_file.moveTo(x, y);
}

function replace_back(mno, waybil){
    var win_file = window.open("./replace_back.do?mno=" + mno +"&waybil=" + waybil, '교환신청', 'width=1000px, height=600px',
      'scrollbars=no');

  var x = (screen.width - 1000) / 2;
  var y = (screen.height - 600) / 2;

  win_file.moveTo(x, y);
}

function replace_back_cancel(mno, waybil){
    var win_file = window.open("./replace_back_cancel.do?mno=" + mno +"&waybil=" + waybil, '교환취소', 'width=1000px, height=600px',
      'scrollbars=no');

  var x = (screen.width - 1000) / 2;
  var y = (screen.height - 600) / 2;

  win_file.moveTo(x, y);
}

</script>

<style>  
a {
  text-decoration: none;
  font-size: 12px;
  color: #333;
}

ul, li {
  list-style: none;
  padding: 0;
  margin: 0;
}

ul.nav li ul {
  padding-left: 10px;
}

button{
 margin-bottom: 2%;
 width:40%;
}

button:hover{
  color: red;
  font-weight: bold;
}
</style>


</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->

  <DIV class='title'>마이페이지</DIV>

  <DIV class='content'>
    <FORM name='frm' id="frm" method='POST' action='./.jsp'>
      <fieldset>
        <legend class='legend'></legend>
        <div style="border: none;">
          <table border="1" style="border-collapse: collapse; width: 100%;">
              <colgroup>
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
              </colgroup>
              <tr>
<%--               <%
              String grade = (String)request.getAttribute("grade");
              String gd = "";
              if(grade.equals("F")){
                gd = "새내기";
              } else if(grade.equals("D")){
                gd = "브론즈";
              } else if(grade.equals("C")){
                gd = "실버";
              } else if(grade.equals("B")){
                gd = "골드";
              } else if(grade.equals("A")){
                gd = "사파이어";
              } else if(grade.equals("S")){
                gd = "VIP";
              }
              %> --%>
                <td style="font-size: 15px;">구매등급 : ${grade }</td>
                <td style="font-size: 15px;">입금대기 : ${pay_wait } 건</td>
                <td style="font-size: 15px;">결재완료 : ${pay_ok } 건</td>
                <td style="font-size: 15px;">상품준비중 : ${product_ready } 건</td>
                <td style="font-size: 15px;">배송중 : ${delivery } 건</td>
                <td style="font-size: 15px;">구매결정대기 : ${ok_wait } 건</td>
                <td style="font-size: 15px;">구매완료 : ${complate } 건</td>
              </tr>  
          </table>
        </div>
          <div style="border:none; width:20%; float: left">
            <div>
              <ul class="nav">
                <div style="background-color: #e5e5cc">
                <li><a href="" style="font-weight: bold; font-size: 15px;">MY 쇼핑</a>
                  <ul>
                    <li><a href="" onclick="">주문목록(배송조회)</a></li>
                    <li><a href="#">취소/반품/환불내역</a></li>
                  </ul>
                  </li>
                  </div>
                  <div style="background-color: #cce5ff">
                <li><a href="" style="font-weight: bold; font-size: 15px;">MY 활동</a>
                  <ul>
                    <li><a href="#">문의하기</a></li>
                    <li><a href="#">상품평</a></li>
                    <li><a href="#">FAQ</a></li>
                  </ul>
                  </li>
                  </div>
                  <div style="background-color: #e0e0eb;">
                     <li><a href="" style="font-weight: bold; font-size: 15px;">MY 정보</a>
                  <ul>
                    <li><a href="#">개인정보수정</a></li>
                    <li><a href="#">비밀번호수정</a></li>
                  </ul>
                  </li>
                  </div>
              </ul>
            </div>
          </div>
          <div style="border:none; float: left; width:79.5%;">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">주문목록/배송조회</span>
            </div>
           <div id="order" style="margin: 2%;">
            <c:forEach var="vo" items="${list }">
                <div style="border: 1px solid #898989; margin-bottom: 5%;">
                   <div style="background-color: #CCCCCC">
                      <span>주문일 : ${vo.payday }</span>
                      | <span>총 주문 금액 : <fmt:formatNumber value="${vo.paymoney }" pattern="￦#,###,### 원" /></span>
                      <span style="float: right;"><a href="" style="font-size: 15px; color: blue;" onclick="detail_read(${vo.mno}, ${vo.waybil})">주문상세보기&gt;</a></span>
                   </div>
                   <br>
                   <table style="width:80%; margin: 0 auto;">
                    <colgroup>
                      <col style="width:70%;">
                      <col style="width:30%;">
                    </colgroup>
                    <tr>
                    <td>
                      <a href="../p_content/read.do?p_contentno=${vo.p_contentno }&p_categoryno=${vo.p_categoryno }" target="_blank"><img src="../p_content/storage/${vo.payfile1 }" style="float: left; margin-right: 2%; width:100px;"></img></a><br>
                      <span>${vo.item}</span><br>
                      <span><fmt:formatNumber value="${vo.paymoney }" pattern="￦#,###,### 원" /> / ${vo.pcnt } 개 </span>
                   </td>
                   <td style="text-align: center; border-left: 1px solid #898989;">
                      <span>${vo.my_state}</span><br>
                      <button type="button" onclick="trace(${vo.payno}, ${vo.mypageno})">배송조회</button><br>  
                    <c:if test="${vo.ordersubmit == 'N'}">
                      <button type="button" onclick="update(${vo.payno }, '${vo.my_state }', ${vo.mno })">구매확정</button><br>
                   </c:if>
                   <c:choose>
                   <c:when test="${vo.takeback_state == 'N' }">
                      <button type="button" onclick="take_back(${vo.mno}, ${vo.waybil })">반품신청</button><br>
                   </c:when>
                   <c:when test="${vo.takeback_state == 'Y' }">
                      <button type="button" onclick="take_back_cancel(${vo.mno}, ${vo.waybil })">반품취소</button><br>
                   </c:when>
                   </c:choose>
                   <c:choose>
                      <c:when test="${vo.replace_state == 'N' }">
                           <button type="button" onclick="replace_back(${vo.mno}, '${vo.waybil }')" style="margin-bottom: 3%">교환신청</button><br>
                      </c:when>
                       <c:when test="${vo.replace_state == 'Y' }">
                          <button type="button" onclick="replace_back_cancel(${vo.mno}, '${vo.waybil }')" style="margin-bottom: 3%">교환취소</button><br>
                      </c:when>
                   </c:choose>
                   </td>
                </table>
          </div>
        
         </c:forEach>
          </div>
     </div>
     <div>
         ${paging }
     </div>
      </fieldset>
    </FORM>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>
