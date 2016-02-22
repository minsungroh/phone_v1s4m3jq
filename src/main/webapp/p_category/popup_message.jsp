<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>

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
  var cnt = ${cnt};
  if (cnt == 1){
    opener.location.reload();
    window.close();    
  }
});

function popup_close(){
  window.close(); 
}
</script>
  <style type="text/css">
   body { background:#171717; color: white;}
 </style>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
<%
ArrayList<String> msgs = (ArrayList<String>)request.getAttribute("msgs");
ArrayList<String> links = (ArrayList<String>)request.getAttribute("links");
%> 
<DIV class='content' style='margin: 40px auto;'>
  <fieldset>
    <ul>
    <%
    for(int i=0; i<msgs.size(); i++){
      %>
       <li class='none' style='margin-top: 1em;'><%=msgs.get(i) %></li>
      <%
    }
    %>
    <li class='none' style='margin-top: 1em; margin-bottom: 1em;'>
     <%
        for(int i=0; i<links.size(); i++){
      %>
        <%=links.get(i) %>
      <%
        }
       %>
    </li>
   
    </ul>
  </fieldset>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 
