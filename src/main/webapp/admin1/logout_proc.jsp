<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<%
session.invalidate();

response.sendRedirect(root + "/index.jsp");
%>
