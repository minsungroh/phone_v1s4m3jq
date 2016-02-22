<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.phone.p_category.P_categoryVO" %>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">



$(function(){
	  $('#down_apple').hide();
	  $('#down_samsung').hide();
	  $('#down_lg').hide();
	  $('#down_sounds').hide();
	  $('#down_accessory').hide();
	});
	
	function apple(){
		$('#down_apple').show();
		$('#down_samsung').hide();
		$('#down_lg').hide();
		$('#down_sounds').hide();
		$('#down_accessory').hide();
		
	}
	
	function samsung(){
		$('#down_samsung').show();
		$('#down_apple').hide();
		$('#down_lg').hide();
		$('#down_sounds').hide();
		$('#down_accessory').hide();
	}
	
	function lg(){
		$('#down_samsung').hide();
		$('#down_apple').hide();
		$('#down_lg').show();                                                                                         
		$('#down_sounds').hide();
		$('#down_accessory').hide();
	}
	
	function sounds(){
		$('#down_samsung').hide();
		$('#down_apple').hide();
		$('#down_lg').hide();
		$('#down_sounds').show();
		$('#down_accessory').hide();
	}
	
	function accessory(){
		$('#down_samsung').hide();
		$('#down_apple').hide();
		$('#down_lg').hide();
		$('#down_sounds').hide();
		$('#down_accessory').show();
	}
</script>


<%
String root = request.getContextPath(); 
%>

<%
ArrayList<P_categoryVO> list = (ArrayList<P_categoryVO>)request.getAttribute("list");

%>


<!-- 화면 상단 메뉴 --> 
<DIV style='text-align: left; margin: 0px; padding: 0px;'>
  <br>
  <nav id="topMenu">
    <ul>
      <li><a class='menuLink' href='<%=root %>/index.do'>HOME</a></li>
      <%
      if (session.getAttribute("id") == null){
      %>
        <li><a class='menuLink' href='<%=root %>/member/login.do'>로그인</a></li>
      <%
      }else{
      %>
        <li><a class='menuLink' href="#">장바구니</a></li>      
        <li><a class='menuLink' href="#">마이페이지</a></li>
        <li><a class='menuLink' href="#">고객센터</a></li>
        <li><a class='menuLink' href='<%=root %>/member/logout.do'>로그아웃</a></li>      
      <%  
      }
      %>
      <!-- 필요한 메뉴 적어서 올리기 -->
      <li><a class='menuLink' href="javascript:apple();">Apple</a></li>
      <li><a class='menuLink' href="javascript:samsung();">Samsung</a></li>
      <li><a class='menuLink' href="javascript:lg();">LG</a></li>
      <li><a class='menuLink' href="javascript:sounds();">Sound</a></li>
      <li><a class='menuLink' href="javascript:accessory();">Accessory</a></li>

      <%
      if (session.getAttribute("act") == null){
      %>
        <li><a class='menuLink' href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a></li>
      <%
      }else{
      %>
        <li><a class='menuLink' href='<%=root %>/admin1/logout_proc.jsp'>Logout</a></li>
        <li><a class='menuLink' href='<%=root %>/admin1/list.jsp'>관리자</a></li>
      <%
      }
      %>
      
    </ul>
  </nav>

</DIV>





<DIV id="down_apple" >
<input type='hidden' name='p_categoryno' id='p_categoryno' value='0'>

    <ul>   
      <li>
       <span class="apple" style="margin-left: 40px;">
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=1'>Iphone6+  </a><a  href='<%=root %>/p_content/show_list.do?p_categoryno=7'> Iphone6   </a>
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=2'> Iphone5   </a>
      </span>
      </li>  
    </ul>

</DIV>


<DIV id="down_samsung" >
<input type='hidden' name='p_categoryno' id='p_categoryno' value='0'>

    <ul>    
      <li>
       <span class="apple" style="margin-left: 40px;">
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=3'>Galaxy6  </a><a  href='<%=root %>/p_content/show_list.do?p_categoryno=8'> GalaxyNote5   </a>
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=9'> Galaxy5   </a>
      </span>
      </li>    
    </ul>

</DIV>

<DIV id="down_lg" >
<input type='hidden' name='p_categoryno' id='p_categoryno' value='0'>

    <ul>    
      <li>
       <span class="apple" style="margin-left: 40px;">
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=4'>V10  </a><a  href='#'> G4   </a><a  href='#'> 넥서스   </a>
      <a  href='#'> G프로   </a>
      </span>
      </li>    
    </ul>

</DIV>

<DIV id="down_sounds" >
<input type='hidden' name='p_categoryno' id='p_categoryno' value='0'>

    <ul>    
      <li>
       <span class="apple" style="margin-left: 40px;">
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=5'>Speaker  </a><a  href='#'> Earphone   </a><a  href='#'> Headphone   </a>
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=11'> Bluetooth   </a>
      </span>
      </li>    
    </ul>

</DIV>

<DIV id="down_accessory" >
<input type='hidden' name='p_categoryno' id='p_categoryno' value='0'>

    <ul>    
      <li>
       <span class="apple" style="margin-left: 40px;">
      <a  href='<%=root %>/p_content/show_list.do?p_categoryno=10'>Cable/Charger  </a><a  href='#'> stand   </a><a  href='#'> ETC </a>
      </span>
      </li>    
    </ul>

</DIV>
