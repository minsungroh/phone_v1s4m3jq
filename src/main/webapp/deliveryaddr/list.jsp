<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.deliveryaddr.DeliveryAddrVO" %>
<%@ page import="web.tool.*" %>
<% DeliveryAddrVO read = (DeliveryAddrVO)request.getAttribute("read");%>
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
  $('#panel_frm').hide();
  $('#panel_frm_remove').hide();
  evt("dphone", "blur", phone_format);
});

function create(mno){
  $('#panel_frm').show();
  $('#frm').attr('action', './create.do?mno=' + mno);
  $('#sort').attr('value', '');
  $('#submit').html('등록');
  $('#sort').focus();
}

function create_cancel(){
  $('#panel_frm').hide();
}

function update(dno, mno, dcategory, dname, dzipcode, daddr1, daddr2, dphone){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do?mno=' + mno);
  // $('#codeno').val(codeno); // Chrome Elements에 변경이 안됨
  $('#dno').attr('value', dno);
  // $('#sort').val(sort);          // Chrome Elements에 변경이 안됨
  $('#dcategory').attr('value', dcategory);
  $('#dname').attr('value', dname);
  $('#dzipcode').attr('value', dzipcode);
  $('#daddr1').attr('value', daddr1);
  $('#daddr2').attr('value', daddr2);
  $('#dphone').attr('value', dphone);
  $('#submit').html('저장');
  $('#dcategory').focus();
}

function remove(dno, mno){
  $('#panel_frm_remove').show();
  $('#frm_remove').attr('action', './delete.do?mno=' + mno);
  $('#dno', frm_remove).attr('value', dno);
}

function delete_cancel(){
  $('#panel_frm_remove').hide();
}

function phone_format() {
	  var num = $("#dphone").val();
	  
	  var phone_num = num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	  
	  $("#dphone").val(phone_num);
	  
	  $("#mobile1").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1"));
	  $("#mobile2").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$2"));
	  $("#mobile3").val(num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$3"));
}
	
function use(name, post, addr1, addr2, phone){
	$("#rname", opener.document).attr("value", name);
	$("#zipcode", opener.document).attr("value", post);
	$("#address1", opener.document).attr("value", addr1);
	$("#address2", opener.document).attr("value", addr2);
	$("#m_phone", opener.document).attr("value", phone);
	window.close();
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
<!-- ----------------------------------------- -->
<%
ArrayList<DeliveryAddrVO> list = (ArrayList<DeliveryAddrVO>)request.getAttribute("list");
%>

<DIV class='title'>배송 주소록</DIV>
<DIV id='panel_frm' class='content' style='padding: 10px 0px 10px 0px; width: 70%;'>
<FORM name='frm' id='frm' method='POST' action='./create.do'>
  <fieldset style="width:100%; margin: 0 auto;">
    <input type='hidden' name='dno' id='dno' value="0"> 
    <input type='hidden' name='mno' id='mno' value="${mno }">
  <ul>
    <li class="create_form">
    <label for='dcategory' class="label">배송지</label>
    <input type='text' name='dcategory' id='dcategory' size='15' value="우리집" >
    </li>
    <li class="create_form">
    <label for='dname' class="label">수령인</label>
    <input type='text' name='dname' id='dname' size='15' value="왕눈이" required="required">
    </li>
     <li class="create_form">
        <label class='label' for="dzipcode">우편번호</label>
        <input type="text" name="dzipcode" id="dzipcode" value="" size="10" placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
      </li>   
      <li class="create_form">
        <label class='label' for="daddr1">주소</label>
        <input type="text" name="daddr1" id="daddr1" value="" size="30" placeholder="주소">
     </li>
     <li class="create_form">
        <label class='label' for="daddr2">상세 주소</label>
        <input type="text" name="daddr2" id="daddr2" value="" size="30" placeholder="상세 주소" autocomplete="off">   
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
                          document.getElementById('dzipcode').value = data.zonecode; //5자리 새우편번호 사용
                          document.getElementById('daddr1').value = fullAddr;
          
                          // iframe을 넣은 element를 안보이게 한다.
                          // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                          element_wrap.style.display = 'none';
          
                          // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                          document.body.scrollTop = currentScroll;
                          $("#daddr2").focus();
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
      </li>
      <li class="create_form">
        <label for="dphone" class="label">휴대폰번호</label>
        <input type="text" name="dphone" id="dphone" value="" size="30" required="required" placeholder="하이픈(-) 제외한 숫자만 입력" autocomplete="off"><br>
      </li>
    </ul>
    <div style="text-align: center;">
  <button type="submit" id='submit'>등록</button>
  <button type="button" onclick="create_cancel()">취소</button>
  </div>
  </fieldset>
</FORM>
</DIV>

<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='dno' id='dno' value='0'>
  <input type='hidden' name='mno' id='mno' value="${mno }">
  
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="delete_cancel()">취소</button>
</FORM>
</DIV>

<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
    <col style='width: 22%;'/>
    <col style='width: 41%;'/>
    <col style='width: 7%;'/>
  </colgroup>
  <TR>
    <TH class='th'>배송지</TH>
    <TH class='th'>수령인</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>관리</TH>
  </TR>

<%
  for(int i = 0; i < list.size(); i++){
    DeliveryAddrVO vo = list.get(i);
    int dno = vo.getDno();
    String addr = vo.getDaddr1() + " " + vo.getDaddr2();
%> 
  <TR>
    <TD class='td'><a href="javascript:use('<%=vo.getDname()%>', '<%=vo.getDzipcode()%>', '<%=vo.getDaddr1()%>', '<%=vo.getDaddr2()%>', '<%=vo.getDphone()%>')"><%=vo.getDcategory() %></a></TD>
    <TD class='td'><a href="javascript:use('<%=vo.getDname()%>', '<%=vo.getDzipcode()%>', '<%=vo.getDaddr1()%>', '<%=vo.getDaddr2()%>', '<%=vo.getDphone()%>')"><%=vo.getDname() %></a></TD>
    <TD class='td'><%=vo.getDphone()  %></TD>
    <TD class='td'><%=Tool.textLength(50, addr)  %>
    <%if(!vo.getDzipcode().equals("")){ %>
    (<%=vo.getDzipcode()%>)</TD>
    <%} %>
    <TD class='td'>
      <A href="javascript:update(<%=dno%>, <%=vo.getMno()%>, '<%=vo.getDcategory()%>', '<%=vo.getDname()%>', '<%=vo.getDzipcode() %>', '<%=vo.getDphone()%>', '<%=vo.getDaddr1()%>', '<%=vo.getDaddr2()%>')"><IMG src='./images/update.png' title='수정'></A><br>
      <A href="javascript:remove(<%=dno%>, <%=vo.getMno()%>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="create(${mno});">등록</button>
  <button type="button" onclick="javascript:window.close();">취소</button>
</DIV>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 



