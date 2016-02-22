<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="com.phone.payment.*" %>
<% PaymentVO paymentVO = (PaymentVO)request.getAttribute("PaymentVO"); %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script> <!-- 이 부분은 jquery 선언 후 사용해야 된다. -->

<script type="text/javascript"> 
$(function(){
	  $("#rname").attr("value", "");
	  $("#zipcode").attr("value", "");
	  $("#address1").attr("value", "");
	  $("#address2").attr("value", "");
	  evt("card1", "click", card_p);
	  evt("card2", "click", etrans_p);
	  evt("card3", "click", btrans_p);
     evt("s_card", "change", s_card_p);
	  evt("m_phone", "blur", phone_format_p);
});


function delivery1(){
	$("#rname").attr("value", "");
	$("#zipcode").attr("value", "");
	$("#address1").attr("value", "");
	$("#address2").attr("value", "");
	$("#m_phone").attr("value", "");
}

function delivery2(rname, zipcode, address1, address2, tel){
	 $("#rname").attr("value", rname);
	  $("#zipcode").attr("value", zipcode);
	  $("#address1").attr("value", address1);
	  $("#address2").attr("value", address2);
	  $("#m_phone").attr("value", tel);
}

/* 전화번호 입력 정규화, 자동 - 입력(예 01040793588 --> 010-4079-3588)*/
function phone_format_p() {
  var num = $("#m_phone").val();
  
  var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  
  $("#m_phone").val(phone_num);
  
  $("#mobile1").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1"));
  $("#mobile2").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$2"));
  $("#mobile3").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$3"));
  
}

function card_p(){
	$("#card_select").css("display", "block");
	$("#deposit_select").css("display", "none");
	$("#phone_select").css("display", "none");
}

function etrans_p(){
	 $("#card_select").css("display", "none");
	  $("#deposit_select").css("display", "block");
	  $("#phone_select").css("display", "none");
}

function btrans_p(){
	  $("#card_select").css("display", "none");
	  $("#deposit_select").css("display", "none");
	  $("#phone_select").css("display", "block");
}

function s_card_p(){
	<% int money = paymentVO.getPaymoney() - paymentVO.getDiscount_money();%>
	if(<%=paymentVO.getPaymoney() %> >= 50000){
	$("#discount").prop("disabled", "");
	}
}

function deliveryaddr(mno) {
    var win_file1 = window.open("../deliveryaddr/list.do?mno=" + mno, '주소변경', 'width=750px, height=550px',
        'scrollbars=no');

    var x = (screen.width - 750) / 2;
    var y = (screen.height - 550) / 2;

    win_file1.moveTo(x, y);
  }
 
 
 function update(p_contentno, mno, card_input, discount, deposit_input, phone_input, caseno){	 
     var card = $(":radio[name='paymeans']:checked").val();
     $("#rname").prop("name","resive_name");
     $("#zipcode").prop("name", "resive_post");
     $("#address1").prop("name", "resive_addr1");
     $("#address2").prop("name", "resive_addr2");
     $("#m_phone").prop("name", "resive_phone");
     $("#card_input").attr("value", card_input);
     $("#discount").attr("value", discount);
     $("#deposit_input").attr("value", deposit_input);
     $("#phone_input").attr("value", phone_input);
     $("#frm").attr("action", "./update.do?p_contentno=" + p_contentno + "&mno=" + mno + "&caseno=" + caseno);
     
     if($(':radio[id="card1"]:checked').val() == "card"){
    	 if($("#card_input").val() == "none"){
  	       alert("결재할 카드를 선택해 주세요");
  	       return false; 
      } 
     } else if($(':radio[id="card2"]:checked').val() == "deposit"){
    	 if($("#deposit_input").val() == "none"){
  	       alert("결재할 무통장통장을 선택해 주세요");
  	       return false; 
      }
     } else if($(':radio[id="card3"]:checked').val() == "phone"){
    	 if($("#phone_input").val() == "none"){
    	     alert("결재할 핸드폰 통신사를 선택해 주세요.");
    	     return false;
    	 }
     } else {
    	 return true;
     }
  }


 function memo(){
	 $("#delivery_memo").attr("value", "");
 }

</script>
 <style type="text/css">
*{
font-size: 15px;
}
</style>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="../menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='title' style="font-size: 2em; text-align: center; font-weight: bold; color: #FF0000">주문서</DIV>

<DIV style="width:70%; margin: 0 auto;">
<FORM name='frm' id="frm" method='POST' action='./.do' onsubmit="return update(${PaymentVO.p_contentno }, ${PaymentVO.mno}, '${PaymentVO.card_input}', ${PaymentVO.discount}, '${PaymentVO.deposit_input}', 
	'${PaymentVO.phone_input}' , ${PaymentVO.caseno}, '${PaymentVO.delivery_memo }')">
  <input type="hidden" name="payno" id="payno" value="${PaymentVO.payno}">
  <input type="hidden" name="mno" id="mno" value="${MemberVO.mno}">
  <span style="font-weight: bold;">1. 주문상품 확인</span>
  <fieldset style="border: none;">
    <table border="1" style="width:100%; border-collapse: collapse; border-bottom: 2px solid black">
      <colgroup>
        <col style="width:70%; border-left: none;"/>
        <col style="width:10%;"/> 
        <col style="width:10%;"/>
        <col style="width:10%; border-right: none;"/>
      </colgroup>
        <TR style="background-color: #CCCCCC;">
          <TH class='th'>상품정보</TH>
          <TH class='th'>수량(EA)</TH>
          <TH class='th'>할인금액</TH>
          <TH class='th'>결재금액</TH>
      </TR>
      <tr>
        <td style="padding-left: 1%;">
          <a href="../p_content/read.do?p_contentno=${contentVO.p_contentno }&p_categoryno=${contentVO.p_categoryno}"><img src="../p_content/storage/${contentVO.file }" style="float: left; width:100px;"></a>&nbsp;
          <span style="line-height:80px; vertical-align: middle;"><a href="../p_content/read.do?p_contentno=${contentVO.p_contentno }&p_categoryno=${contentVO.p_categoryno}">[ ${PaymentVO.orderno} ] ${item}</a></span></td>
        <td style="text-align: center;">${PaymentVO.pcnt}</td>
        <td style="text-align: center;">0</td>
        <td style="text-align: center;"><fmt:formatNumber value="${PaymentVO.paymoney}" pattern="#,###,###"/></td>
       </tr>
    </table>
    <table style="width:100%; border-collapse: collapse;">
      <colgroup>
        <col style="width:20%" />
        <col style="width:3%" />
        <col style="width:20%" />
        <col style="width:3%" />
        <col style="width:20%" />
        <col style="width:3%" />
        <col style="width:20%" />
      </colgroup>
      <tr>
        <th>상품금액<br><br><fmt:formatNumber value="${PaymentVO.paymoney }" pattern="#,###,###"/></th>
        <th><img src="./images/ico_plus.gif"></th>
        <th>배송비<br><br>0</th>
        <th><img src="./images/ico_minus.gif"></th>
        <th>할인금액<br><br><fmt:formatNumber value="${PaymentVO.discount_money }" pattern="#,###,###"/> </th>
        <th><img src="./images/ico_total.gif"></th>
        <th>총 결제금액<br><br><fmt:formatNumber value="${PaymentVO.paymoney}" pattern="#,###,###"/></th>
    </table>
    <br><br>
    
    <!-- 2. 배송지 정보 -->
    <table border="1" style="width:100%; border-collapse: collapse;">
      <colgroup>
        <col style="width:20%;" />
        <col style="width:80%;" />
      </colgroup>
      <tr>
        <th colspan="2">2. 배송지 정보 입력&nbsp;<span style="font-size: 13px; color: #ff6600;">( * 필수입력  )</span></th>
      </tr>
      <tr>
        <td style="line-height: 35px;">배송지 선택</td>
        <td>
         <label><input type="radio" name="delivery" id="delivery" checked="checked" value="new" 
         onclick="delivery1()">새로운배송지</label>
         <label><input type="radio" name="delivery" id="delivery" value="default"
         onclick="delivery2('${MemberVO.mname}', '${MemberVO.zipcode}', '${MemberVO.address1}', '${MemberVO.address2}', '${MemberVO.tel}')">회원정보와 동일한 배송지</label>
         <button type="button" style="margin-left: 35%;" onclick="deliveryaddr(${MemberVO.mno})">나의 배송 주소록</button>
        </td>
       </tr>
        <tr>
          <td style="line-height: 35px;">받으시는 분</td>
          <td><input type="text" name="rname" id="rname" size="15px" value="${MemberVO.mname}" required="required"></td>
        </tr>
        <tr>
          <td style="line-height: 35px;">배송지</td>
          <td><ul><li class="create_form">
        <label class='label' for="zipcode">우편번호</label>
        <input type="text" name="zipcode" id="zipcode" value="${MemberVO.zipcode}" placeholder="우편번호" required="required">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
     </li>   
     <li class="create_form">
        <label class='label' for="address1">주소</label>
        <input type="text" name="address1" id="address1" value="${MemberVO.address1}" size="50" placeholder="주소" required="required">
     </li>
     <li class="create_form">
        <label class='label' for="address2">상세 주소</label>
        <input type="text" name="address2" id="address2" value="${MemberVO.address2}" size="30" placeholder="상세 주소" autocomplete="off" required="required">   
        <!-- ***** DAUM 우편번호 API 시작 *****  -->
          
          <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 90px;position:relative">
          <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
          </div>
          
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
          <script>
              // 우편번호 찾기 찾기 화면을 넣을 element
              var element_wrap = document.getElementById('wrap');
          
              function foldDaumPostcode() {
                  // iframe을 넣은 element를 안보이게 한다.
                  element_wrap.style.display = 'none';
              }
          
              function DaumPostcode() {
                  // 현재 scroll 위치를 저장해놓는다.
                  var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                  new daum.Postcode({
                      oncomplete: function(data) {
                          // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          
                          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                          var fullAddr = data.address; // 최종 주소 변수
                          var extraAddr = ''; // 조합형 주소 변수
          
                          // 기본 주소가 도로명 타입일때 조합한다.
                          if(data.addressType === 'R'){
                              //법정동명이 있을 경우 추가한다.
                              if(data.bname !== ''){
                                  extraAddr += data.bname;
                              }
                              // 건물명이 있을 경우 추가한다.
                              if(data.buildingName !== ''){
                                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                              }
                              // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                              fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                          }
          
                          // 우편번호와 주소 정보를 해당 필드에 넣는다.
                          document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                          document.getElementById('address1').value = fullAddr;
          
                          // iframe을 넣은 element를 안보이게 한다.
                          // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                          element_wrap.style.display = 'none';
          
                          // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                          document.body.scrollTop = currentScroll;
                          $("#address2").focus();
                      },
                      // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                      onresize : function(size) {
                          element_wrap.style.height = size.height+'px';
                      },
                      width : '100%',
                      height : '100%'
                  }).embed(element_wrap);
          
                  // iframe을 넣은 element를 보이게 한다.
                  element_wrap.style.display = 'block';
              }
          </script>
        <!-- ***** DAUM 우편번호 API 종료 *****  -->
      </li></ul>
      </td>
      <tr>
      <td style="line-height: 35px;">휴대번호</td>
      <td><ul>
      <li class="create_form">
        <label for="m_agency">휴대전화</label>
        <label for="m_phone"></label>
        <input type="text" name="m_phone" id="m_phone" value="${MemberVO.tel}" size="30" required="required" placeholder="하이픈(-) 제외한 숫자만 입력" autocomplete="off"> 
        <span id="phone_content" style="font-size: 10px; color:#999999; margin-left: 2%; display: inline;">하이픈(<span style="font-size: 1em;">-</span>) 을 제외한 숫자만 입력하시기 바랍니다 </span>
      </li></ul>
      </td>
      <tr>
        <td style="line-height: 35px;">배송매시지</td>
        <td><span>상품명 : ${item }</span><br>
        <div id="divNm"><input type="text" name="delivery_memo" id="delivery_memo" size="50px" maxlength="30" value="빠른 배송 부탁드립니다" onfocus="memo();">
        <span>30자 까지 입력 가능</span><br>
        <span>· 부재시 연락가능한 전화번호 또는 상품수령이 가능한 장소를 남겨주세요.</span>
    </table>
    <br>
    <!-- 3. 결제정보 -->
     <table style="width:100%; border-collapse: collapse;" border="1">
        <colgroup>
          <col style="width:25%;"/>
          <col style="width:75%;"/>
        </colgroup>
        <tr>
          <th colspan="2">3. 결제정보 입력</th>
        </tr>
        <tr>
          <td style="line-height: 35px;">신용/체크 카드</td>
          <td><label><input type="radio" name="paymeans" id="card1" value="card" checked="checked">신용/체크카드</label></td>
        </tr>
        <tr>
          <td style="line-height: 35px;">기타결제</td>
          <td><label><input type="radio" name="paymeans" id="card2" value="deposit">무통장입금</label>
              <label><input type="radio" name="paymeans" id="card3" value="phone">휴대폰결제</label>
              
               <div id="card_select" style="border: 2px solid black; display: block">
                <label>카드 선택</label><span id="payment_bigo"></span>
                <select id="card_input" name="card_input">
                  <option value="none" selected="selected">카드선택</option>
                  <option value="bc">비씨카드</option>
                  <option value="kbc">KB국민카드</option>
                  <option value="uric">우리카드</option>
                  <option value="sinhanc">신한카드</option>
                  <option value="hyundaec">현대카드</option>
                  <option value="samsungc">삼성카드</option>
                </select><br>
                <label>할부선택</label>
                  <select id="discount" name="discount" disabled="disabled">
                    <option value="1" selected="selected">일시불</option>
                    <option value="3">3개월</option>
                    <option value="4">4개월</option>
                    <option value="5">5개월</option>
                  </select><br>
                  <p>할부는 5만원 이상부터 가능합니다</p>
              </div>
                <div id="deposit_select" style="display: none">
                <label>입금은행</label>
                <select id="deposit_input" name="deposit_input">
                    <option value="none" selected="selected">은행선택</option>
                    <option value="kbb">국민은행</option>
                    <option value="urib">우리은행</option>
                    <option value="sinhanb">신한은행</option>
                    <option value="hanab">하나은행</option>
                    <option value="postb">우체국</option>
                </select>
              </div>
              <div id="phone_select" style="display: none">
                <label>통신사를 선택해주세요</label>
                <select id="phone_input" name="phone_input">
                    <option value="none" selected="selected">통신사 선택</option>
                    <option value="skt">SKT</option>
                    <option value="lgu">LGU+</option>
                    <option value="kt">KT</option>
                    <option value="kct">알뜰폰-KCT</option>
                    <option value="hm">알뜰폰-헬로모바일</option>
                </select>
              </div>
          </td>
     </table>
     <br>
     <!-- 결제 총 금액 -->
     <table border="1" style="width: 100%; border-collapse: collapse;">
     <tr>
       <th>4. 결제 총 금액</th>
      </tr>
      <tr>
        <td><div style="width:30%; margin: 0 auto; text-align: center; background-color: #AAAA00"><fmt:formatNumber value="${PaymentVO.paymoney}" pattern="#,###,###" />원</div></td>
      </tr>
     </table>
     <div style="text-align: center;">
     <input type="submit" value="결제하기">
     <button type="button" onclick="location.href='./delete.do?payno=' + ${PaymentVO.payno}">취소</button>
     </div>
  </fieldset>
</FORM>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 