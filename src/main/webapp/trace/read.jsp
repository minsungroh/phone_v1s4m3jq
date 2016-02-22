<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.phone.trace.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.tool.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
<script type="text/javascript">
 $(function(){ 
	  $("#delivery_cb").hide();
	  evt("manager_phone", "blur", phone_format);
	  evt("agent_phone", "blur", tel_format);
	  $("#dsc_div").hide();
});
 
 function delivery_create(){
	 $("#delivery_cb").show();
	 $("#frm").attr("action", "../trace_situation/create.do");
	 $("#submit").html("등록");
	 $("#date").focus();
	 var Now = new Date();
	 var date = Now.getFullYear();
	 date += '-' + Now.getMonth() + 1 ;
	 date += '-' + Now.getDate();
	 
	 var time = "";
	 var p = "";
	 if(Now.getHours() < 10){
		 p = 0;
	 }
	 
	 var m = "";
	 if(Now.getMinutes() < 10){
		 m = 0;
	 }
	 time += p + Now.getHours();
	 time += ':' + m + Now.getMinutes();
	  
	 
	  $("#trace_date").attr("value", date);
	  $("#trace_time").attr("value", time);
 }
 
 function create_cancel(){
	 $("#delivery_cb").hide();
 }
 
 function phone_format() {
	    var num = $("#manager_phone").val();
	    
	    var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	    
	    $("#manager_phone").val(phone_num);
	    
	    $("#mobile1").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1"));
	    $("#mobile2").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$2"));
	    $("#mobile3").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$3"));
	}
 
 function tel_format() {
     var num = $("#agent_phone").val();
     
     var phone_num = num.replace(/(^01.{0}|^01.{2}|[0-9]{2})([0-9]+)([0-9]{4})/,"$1-$2-$3");
     
     $("#agent_phone").val(phone_num);
     
     $("#mobile1").val(num.replace(/(^01.{0}|^01.{2}|[0-9]{2})([0-9]+)([0-9]{4})/,"$1"));
     $("#mobile2").val(num.replace(/(^01.{0}|^01.{2}|[0-9]{2})([0-9]+)([0-9]{4})/,"$2"));
     $("#mobile3").val(num.replace(/(^01.{0}|^01.{2}|[0-9]{2})([0-9]+)([0-9]{4})/,"$3"));
 }
 
 function delivery_state_chage(){
	 $("#dsc_div").show();
	 $("#trace_state").focus();
 }
 
 function update_cancel(){
	 $("#dsc_div").hide();
 }
 
 function review(){
	 opener.location.reload();
	 
	 return true;
 }
</script>
 <style type="text/css">
 * {
 font-size: 15px;
 }
 </style>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<DIV style="width: 80%; margin: 0 auto; font-weight: bold; font-size: 1.5em;">배송조회<br>
 <span style="font-size: 13px; color: #AAAAAA;">고객님이 주문하신 상품에 대한 기본 배송정보입니다</span></DIV>
<DIV class='content'>
  <table border="1" style="border-collapse: collapse; width: 100%; text-align: center;">
    <colgroup>
      <col style="width:15%" />
      <col style="width:35%;" />
      <col style="width:15%;" />
      <col style="width:35%;"/>
    </colgroup>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">운송장 번호</td>
      <td>${read.waybil } - ${read.waybil2 }</td>
      <td style="font-weight: bold; background-color:  #b3e0ff;">배송상태</td>
      <td>${read.trace_state }
        <div id="dsc_div">
          <form name="frm_update" id="frm_update" method="POST" action="./update.do" onsubmit="return review();">
          <input type="hidden" name="payno" value="${read.payno }">
          <input type="hidden" name="mypageno" value="${read.mypageno }">
            <select name="trace_state" id="trace_state" required="required">
                <option value="상품준비중" selected="selected">상품준비중</option>
                <option value="배송중">배송중</option>
                <option value="배송완료">배송완료</option>
            </select>
            <button type="submit">변경</button>
            <button type="button" onclick="update_cancel();">취소</button>
          </form>
        </div>
      </td>
    </tr>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">배송지</td>
      <td colspan="3">(${read.resive_post }) ${read.resive_addr1} ${read.resive_addr2 } </td>
      
    </tr>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">수량</td>
      <td>${read.pcnt} 개</td>
      <td style="font-weight: bold; background-color:  #b3e0ff;">받는 분</td>
      <td>${read.resive_name }</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">품명명</td>
      <td colspan="3">${read.item }</td>
  </table>
</DIV>
<br>

<div id="delivery_cb">
<form name="frm" id="frm" method="post" action="./create.do" >
<input type="hidden" name="traceno" id="traceno" value="${read.traceno }">
<table border="1" style="width:90%; margin:0 auto; border-collapse: collapse; text-align: center;">
  <colgroup>
    <col width="10%" />
    <col width="10%" />
    <col width="15%" />
    <col width="15%" />
    <col width="10%" />
    <col width="15%" />
    <col width="25%" />
  </colgroup>
  <tr>
  <th style="background-color:  #b3e0ff;">일자</th>
  <th style="background-color:  #b3e0ff;">시간</th>
  <th style="background-color:  #b3e0ff;">대리점이름</th>
  <th style="background-color:  #b3e0ff;">대리점번호</th>
  <th style="background-color:  #b3e0ff;">담당자이름</th>
  <th style="background-color:  #b3e0ff;">담당자번호</th>
  <th style="background-color:  #b3e0ff;">구분</th>
 </tr>
 <tr>
<td><input type="date" name="trace_date" id="trace_date" value="" required="required"></td>
<td><input type="time" name="trace_time" id="trace_time" value="" required="required"></td>
<td>
    <select name="agent" id="agent" style="width:80%;" required="required">
        <optgroup label="서울">
          <option value="강북지점">강북지점</option>
          <option value="강남지점">강남지점</option>
          <option value="종로지점">종로지점</option>
        </optgroup>
        <optgroup label="경기/인천">
          <option value="판교지점">판교지점</option>
          <option value="파주지점">파주지점</option>
          <option value="인천지점">인천지점</option>
          <option value="고양지점">고양지점</option>
        </optgroup>
        <optgroup label="충청도">
          <option value="서천지점">서천지점</option>
        </optgroup>
        <optgroup label="전라도">
          <option value="나주지점">나주지점</option>
        </optgroup>
        <optgroup label="부산">
          <option value="부산지점">부산지점</option>
        </optgroup>
        <optgroup label="제주도">
          <option value="제주지점">제주지점</option>
        </optgroup>
      </select>
</td>
<td><input type="tel" name="agent_phone" id="agent_phone" value="" size="15px" placeholder="02-" required="required"></td>
<td><input type="text" name="manager" id="manager" value="" size="10px" required="required"></td>
<td><input type="tel" name="manager_phone" id="manager_phone" value="" size="15px" placeholder="010-" required="required"></td>
<td><input type="text" name="content" id="content" value="" size="35px" required="required"></td>
 </tr>
  <tr>
    <td colspan="7">
    <div style="text-align: center;">
  <button type="submit" id='submit'>등록</button>
  <button type="button" onclick="create_cancel()">취소</button>
  </div>
  </tr>
</table> 
</form>
</div>

<DIV style="width: 80%; margin: 0 auto; font-weight: bold; font-size: 1.5em;">배송현황<br>
 <span style="font-size: 13px; color: #AAAAAA;">담당자 이름을 클릭하면 연락처를 확인하실 수 있습니다.</span></DIV>
  <DIV class='content'>
  <table border="1" style="border-collapse: collapse; width:100%; text-align: center;">
      <colgroup>
        <col style="width:15%;"/>
        <col style="width:15%;"/>
        <col style="width:20%;" />
        <col style="width:20%;" />
        <col style="width:30%;" />
      </colgroup>
      <tr>
        <th style="background-color:  #b3e0ff;">일자</th>
        <th style="background-color:  #b3e0ff;">시간</th>
        <th style="background-color:  #b3e0ff;">대리점</th>
        <th style="background-color:  #b3e0ff;">담당자</th>
        <th style="background-color:  #b3e0ff;">구분</th>
     </tr>
      <c:forEach var="trace" items="${trace }">
           <tr>
          <td>${trace.tdate }</td>
          <td>${trace.tstime }</td>
          <td>${trace.agent } / ${trace.agent_phone }</td>
          <td>${trace.manager } / ${trace.manager_phone }</td>
          <td>${trace.content }</td>
      </tr>
       </c:forEach>
  </table>
  </DIV>
  <div style="text-align: center;">
    <button type="button" onclick="delivery_create();">등록</button>
    <button type="button" onclick="delivery_state_chage()">배송상태 변경</button>
    <button type="button" onclick="window.close();">닫기</button>
  </div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 