<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="web.tool.Tool" %>

<%
// ----------------------------------------------------------------------------
// 요청된 주소로 자동 이동
// ----------------------------------------------------------------------------
// String url= request.getRequestURL().toString();
// System.out.println("--> url: " + url);
// --> url: http://localhost:9090/artbox_v1jq/noticev3/update_form.jsp

Enumeration<String> enumeration = request.getParameterNames();
String params = "";

while(enumeration.hasMoreElements()){
  // System.out.println("-->" + enumeration.nextElement());
  String name = enumeration.nextElement();
  String value = request.getParameter(name);
  params = params + name + "=" + value + "&";
  // System.out.println("--> params: " + params);
}

String url_address = request.getRequestURL() + "?" + params;
System.out.println("--> url_address: " + url_address);
//----------------------------------------------------------------------------

boolean sw = Tool.isMaster(request) || Tool.isAdmin(request);
// System.out.println("--> 인증: " + sw);

if (sw == false){
  String root = request.getContextPath();
  response.sendRedirect(root + "/admin1/login_ck_form.jsp?url_address=" + url_address);    

  return;
}

%>


