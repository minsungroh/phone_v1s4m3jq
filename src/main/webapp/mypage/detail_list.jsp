<%@ page contentType="text/html; charset=UTF-8"%>
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
  
  function trace(payno, mypageno) {
      var win_file = window.open("../trace/read.do?payno=" + payno +"&mypageno=" + mypageno, '배송조회', 'width=1200px, height=550px',
          'scrollbars=no');

      var x = (screen.width - 1200) / 2;
      var y = (screen.height - 550) / 2;

      win_file.moveTo(x, y);
    }
  
  
  function order(){
    $("#order").css("display", "block");
    $("#order_menu").css("display", "block");
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

* {
font-size: 15px;
}

button{
 margin-bottom: 2%;
 width:40%;
}
</style>


</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

  <!-- ----------------------------------------- -->

          <div style="border:none; width:95%; margin: 0 auto" id="order_menu">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">주문목록/배송조회</span>
            </div>
           <div id="order" style="margin: 2%;">
                <div style="border: none; margin-bottom: 1%;">
                   <div>
                      <span>주문일 : ${detail_date }</span>
                      | <span>총 주문 금액 : <fmt:formatNumber value="${detail_list.paymoney }" pattern="￦#,###,### 원" /></span>
                   </div>
                   <br>
                   <table style="width:70%; margin: 0 auto;">
                    <colgroup>
                      <col style="width:70%;">
                      <col style="width:30%;">
                    </colgroup>
                    <tr>
                    <td>
                      <a href="../p_content/read.do?p_contentno=${detail_list.p_contentno }&p_categoryno=${detail_list.p_categoryno }" target="_blank"><img src="../p_content/storage/${detail_list.payfile1 }" style="float: left; margin-right: 2%; width:100px;"></img></a><br>
                      <span>${detail_list.item}</span><br>
                      <span><fmt:formatNumber value="${detail_list.paymoney }" pattern="￦#,###,### 원" /> / ${detail_list.pcnt} 개 </span>
                   </td>
                   <td style="text-align: center; border-left: 1px solid #898989;">
                      <span>${detail_list.my_state }</span><br>
                      <button type="button" onclick="trace(${detail_list.payno }, ${detail_list.mypageno })">배송조회</button><br>
                      <button type="button" onclick="">반품신청</button><br>
                      <button type="button" onclick="">교환문의</button>
                   </td>
                </table>
          </div>
          <br>
          <table border="1" style="width:100%; margin: 0 auto; border-collapse: collapse;">
            <colgroup>
              <col style="width:20%;"/>
              <col style="width:80%;"/>
            </colgroup>
            <tr>
              <th colspan="2" style="border-bottom: 2px solid black; text-align: left; background-color: rgba(157, 216, 169, 0.46)">받는사람 정보</th>
            </tr>
            <tr>
              <td style="text-align: center; background-color: rgba(157, 216, 169, 0.46)">수령인</td>
              <td>&nbsp;${detail_list.resive_name}</td>
            </tr>
            <tr>
              <td style="text-align: center; background-color: rgba(157, 216, 169, 0.46)">연락처</td>
              <td>&nbsp;${detail_list.resive_phone}</td>
            </tr>
            <tr>
              <td style="text-align: center; background-color: rgba(157, 216, 169, 0.46)">주소</td>
              <td>&nbsp;(${detail_list.resive_post})${detail_list.resive_addr1} ${detail_list.resive_addr2}</td>
           </tr>
          </table>
          <br>
          <table border="1" style="width:100%; margin: 0 auto; border-collapse: collapse;">
            <colgroup>
              <col style="width:55%;"/>
              <col style="width:30%;"/>
              <col style="width:15%"/>
            </colgroup>
            <tr>
              <th colspan="3" style="text-align: left; border-bottom: 2px solid black">결제정보</th>
            </tr>
            <tr>
              <td colspan="3">결제수단</td>
            </tr>
            <tr>

              <td>[${pay_detail } / ${input_detail }]</td>
              <td>총 상품 가격</td>
              <td><fmt:formatNumber value="${detail_list.paymoney }" pattern="￦#,###,### 원" /></td>
            </tr>
            <tr>
           <%--  <%
            String discount = "";
            if(vo.getDiscount() == 1 || vo.getDiscount() == 0){
              discount = "일시불";
            } else if(vo.getDiscount() == 3){
              discount = "3개월";
            } else if(vo.getDiscount() == 4){
              discount = "4개월";
            } else if(vo.getDiscount() == 5){
              discount = "5개월";
            }
            %> --%>
              <td><%-- <%=input %> / <%=discount %> --%></td>
              <td>할인 금액</td>
              <td>0원</td>
            </tr>
            <tr>
              <td></td>
              <td>총 배송비</td>
              <td>0원</td>
            </tr>
            <tr>
              <td style="border-top: 2px solid #898989"></td>
              <td style="border-top: 2px solid #898989">${pay }</td>
              <td style="border-top: 2px solid #898989"><fmt:formatNumber value="${detail_list.paymoney }" pattern="￦#,###,### 원" /></td>
            </tr>
            <tr>
              <td></td>
              <td>총 결제 금액</td>
              <td><fmt:formatNumber value="${detail_list.paymoney }" pattern="￦#,###,### 원" /></td>
            </tr>
          </table>
          </div>
     </div>
     <div style="text-align: center;">
        <button type="button" onclick="window.close();">닫기</button>
      </div>
  </DIV>

  <!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>
