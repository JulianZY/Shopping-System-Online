<%@page contentType="image/jpeg" %><%@page language="java" pageEncoding="utf-8"%>
<jsp:useBean id="image" scope="page" class="Action.MakeCertPic"/><%
 String str = image.getCertPic(0,0,response.getOutputStream());
 session.setAttribute("certCode",str);
  out.clear(); 
  out = pageContext.pushBody();
 
%>