<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.cart.CartVO" %>
 
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
  $('#panel_update').hide();
  $('#panel_frm_remove').hide();
});
 
function create(){
  $('#panel_frm').show();
  $('#panel_frm').attr('action', './create.do');
  $('#mno').val('');
  $('#producttitle').val('');
  $('#productno').val('');
  $('cnt').val('');
  $('total').val('');
  $('#submit').html('등록');
  $('#sort').focus();
}
 
function create_cancel(){
  $('#panel_frm').hide();
}
 
function update(cartno, cnt){
  $('#panel_update').show();
  $('#frm').attr('action', './update.do');
  $('#cartno').attr('value', cartno);
  $('#cnt').attr('value', cnt);
  $('#submit').html('저장');
  $('#sort').focus();
}

function update_cancel(){
	  $('#panel_update').hide();
	}
function remove(cartno){
	  //alert(cartno);
	  $('#panel_frm_remove').show();
	  $('#cartno', frm_remove).attr('value', cartno);
	  
	}
	 
	function delete_cancel(){
	  $('#panel_frm_remove').hide();
	}
	
	
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<CartVO> list = (ArrayList<CartVO>)request.getAttribute("list");
%>
<DIV class='title'>장바구니 목록</DIV>

<DIV id='panel_update' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
<FORM name='update_frm' method='POST' action='./update.do'>
<input type='hidden' name='cartno' id='cartno' value='0'>
  
  <label for='cnt'>수량</label>
  <input type='number' name='cnt' id='cnt'   value='1' required="required">
 
  <button type="submit" id='submit'>수정</button>
  <button type="button" onclick="update_cancel()">취소</button>
</FORM>
</DIV>

<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='cartno' id='cartno'> 
  
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="delete_cancel()">취소</button>
</FORM>
</DIV>

 
<DIV id='panel_frm' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
<FORM name='frm' method='POST' action='./create.do'>
<input type='hidden' name='cartno' id='cartno' value='0'>
  
  
  <label for='mno'>회원번호</label>
  <input type='number' name='mno' id='mno' value='1' required="required">
 
  <label for='producttitle'>상품이름</label>
  <input type='text' name='producttitle' id='producttitle' value='배터리' required="required">
 
  <label for='productno'>상품번호</label>
  <input type='number' name='productno' id='productno' value='1' required="required"><br>
  
  <label for='cnt'>수량</label>
  <input type='number' name='cnt' id='cnt'   value='1' required="required">
  
  <label for='total'>합계</label>
  <input type='number' name='total' id='total'   value='10000' required="required">
  
 
  <button type="submit" id='submit'>등록</button>
  <button type="button" onclick="create_cancel()">취소</button>
</FORM>
</DIV>
 
<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 15%;'/>
  </colgroup>
  <TR>
    <TH class='th'>장바구니번호</TH>
    <TH class='th'>회원번호</TH>
    <TH class='th'>상품 이름</TH>
    <TH class='th'>상품 번호</TH>
    <TH class='th'>수량</TH>
    <TH class='th'>합계</TH>
    <TH class='th'>수정</TH>
  </TR>
 
<%
  for(int index=0; index < list.size(); index++){
    CartVO vo = list.get(index);
    int cartno = vo.getCartno();
 
%> 
  <TR>
    <TD class='td'><%=cartno %></TD>
    <TD class='td'>
    <a href="./list2.do?cartno=<%=cartno %>&mno=<%=vo.getMno()%>"><%=vo.getMno() %></a>
    </TD>
    <TD class='td'><%=vo.getProducttitle() %></TD>
    <TD class='td'><%=vo.getProductno() %></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'><%=vo.getTotal() %></TD>
    <TD class='td'>
      <A href="javascript: update(<%=cartno%>,<%=vo.getCnt() %>)"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript: remove(<%=cartno%>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>
 
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="create();">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
 
 
 
 
