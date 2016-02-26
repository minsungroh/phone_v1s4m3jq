<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.cart.CartVO" %>
<%@ page import="web.tool.Tool" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
$(function(){
	 
	  $('#panel_frm_remove').hide();
	});

function update(pcnt_id, cartno){
	  var pcnt = $('#' + pcnt_id).val();
	  // alert('pcnt: ' + pcnt);
	  // return;
	  
    var update_frm = $("#update_frm");  // frmCreate 폼 검색 
	  $('#cartno', update_frm).val(cartno);
	  $('#pcnt', update_frm).val(pcnt);
	  $('#update_frm').submit();
	  
	}

function remove(cartno){
    // alert(cartno);
    
    $('#cartno', frm_remove).attr('value', cartno);
    //$('#panel_frm_remove').submit;
    $('#frm_remove').submit();
  }
</script>


</head>

<%-- body 시작 --%>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
  <% ArrayList<CartVO> list = (ArrayList<CartVO>)request.getAttribute("list"); %>
  <%
  CartVO blogVO = (CartVO)request.getAttribute("CartVO");
  %>
 <DIV id='panel_update' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
<FORM name='update_frm' id='update_frm' method='POST' action='./update2.do'>
<input type='hidden' name='cartno' id='cartno' > <input type='hidden' name='pcnt' id='pcnt'>
</FORM>
</DIV>
  
  
  <DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
    <FORM name='frm_remove' id='frm_remove' method='POST' action='./delete2.do'>
      <input type='hidden' name='cartno' id='cartno'> 
    </FORM>
  </DIV>
  
  <DIV class='title'>개인 장바구니 목록</DIV>
  
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">장바구니번호</th>
          <th class="th">상품명</th>
          <th class="th">상품이미지</th>
          <th class="th">도착 예정일</th>
          <th class="th">단가</th>
          <th class="th">수량</th>
          <th class="th">금액</th>
          <th class="th">기타</th>
          <th class="th">선택</th>
        </tr>
      
      </thead>
      <%
      int all = 0 ;
      %>
      <%-- table 내용 --%>
      <tbody>
        <%
       
          for(int index = 0; index < list.size(); index++){
            CartVO vo = list.get(index);
            int cartno = vo.getCartno();
            int pcnt = vo.getPcnt();
            int money= vo.getMoney();
            int tot = pcnt * money;
            int p_categoryno = vo.getP_categoryno();
            
            int p_contentno= vo.getP_contentno();
            String file = vo.getFile();
            
            all = all + tot;
            
          %>
          <tr>
            <td class="td"><%=cartno %></td>
            <td class="td_left">
              <a href="../p_content/read.do?p_contentno=<%=p_contentno %>&p_categoryno=<%=p_categoryno %>"><%=Tool.textLength(10, vo.getTitle())%></a> 
            </td>
           
            <td class="td"><img src="../p_content/storage/<%=file %>" style="float: left; width:100px;"></td>
            <td class="td">
             2일뒤 도착
            </td>
            <td class="td"><fmt:formatNumber value="<%=money %>" pattern="#,###,###" />원</td>
            <td class="td">
            <input type='number' name='pcnt' id='pcnt_<%=index %>'   value='<%=pcnt %>' required="required" min="1" max="5" step="1" style="width:40px;">
            <a href="javascript: update('pcnt_<%=index%>', <%=cartno%>)"><img src="./images/btn_modify.gif" title="수정" /></a>
            </td>
            <td class="td"><fmt:formatNumber value="<%=tot %>" pattern="#,###,###" /> 원</td>
            <td class="td">
              
              <A href="javascript: remove(<%=cartno%>)"><img src="./images/delete.gif" title="삭제" /></a>
             
            </td>
            <td class="td">
             <input type="radio" name='s_cart' id="s_cart<%=cartno %>">
            </td>
          </tr>
          <%  
        }
        %>
        
        
      </tbody>
    </table>
    합계 :<%=all %>
    <DIV class='bottom'>
   
    <br>
   <button type='button' onclick="create();">주문</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
  </div>
<%-- ---------------------------------------------------------------------------------------------- --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<%-- body 종료 --%>
</html>


