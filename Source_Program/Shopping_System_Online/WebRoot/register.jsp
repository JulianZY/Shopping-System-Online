<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:1000px; background:#9ff;}
		#content { float:right; width:900px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
	</style>
  </head>
  
  <body>
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  	<div id="content">
  	<table>
    <s:form action="register" validate="true">
        <tr><td>用户姓名(不要包含特殊英文字符):</td><td><input type="text" name="username"/></td><td><s:fielderror fieldName="username" cssStyle="color: red"/></td></tr>
        <tr><td>密码(6~20位,无特殊字符):</td><td><input type="password" name="password"/></td><td><s:fielderror fieldName="password" cssStyle="color: red"/></td></tr>
        <tr><td>确认密码:</td><td><input type="password" name="repassword"/></td><td><s:fielderror fieldName="repassword" cssStyle="color: red"/></td></tr>
        <tr><td>邮箱:</td><td><input type="text" name="mail"/></td><td><s:fielderror fieldName="mail" cssStyle="color: red"/></td></tr>
        <tr><td>电话:</td><td><input type="text" name="tele"/></td><td><s:fielderror fieldName="tele" cssStyle="color: red"/></td></tr>
      	<tr><td><s:submit value="注册" /></td><td><s:reset value="重置"/></td></tr>
    </s:form>
    </table>
    <br>
    <a href="index.jsp">取消/返回主页</a>
    </div>
  </div>
  </div>
  </body>
</html>
