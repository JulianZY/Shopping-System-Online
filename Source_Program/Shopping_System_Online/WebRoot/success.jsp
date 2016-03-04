<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Success page</title>
    
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
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:1200px;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:1000px; background:#9ff;}
		#content { float:right; width:900px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  <div id="content">
  	<center>
   
    <% 
    	if(request.getParameter("loginsignal")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="index.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("username")!=null&&request.getParameter("repassword")!=null)
    	{
    	%> 
    	<p>
    	用户注册成功！！！
    	<br>
    	<a href="index.jsp">返回首页</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("bossname")!=null&&request.getParameter("shopname")!=null)
    	{
    	%> 
    	<p>
    	您的店铺已成功注册！！！
    	<br>
    	<a href="index.jsp">返回首页</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal4")!=null)
    	{
    	%> 
    	<p>
    	修改成功！！！
    	<br>
    	<a href="ShowMessage.jsp">返回信息界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("userid")!=null&&request.getParameter("signal7")==null)
    	{
    	%> 
    	<p>
    	用户更新成功！！！
    	<br>
    	<a href="ShowUser.jsp">返回信息界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("bossid")!=null)
    	{
    	%> 
    	<p>
    	店主更新成功！！！
    	<br>
    	<a href="ShowBoss.jsp">返回信息界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("goodsid")!=null&&request.getParameter("signal6")==null)
    	{
    	%> 
    	<p>
    	商品更新成功！！！
    	<br>
    	<a href="ShowGoods.jsp">返回信息界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("allpay")!=null)
    	{
    	%> 
    	<p>
    	付款成功！！！
    	<br>
    	<a href="UserManagement.jsp">返回用户管理界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal6")!=null&&request.getParameter("goodsid")!=null)
    	{
    	%> 
    	<p>
    	商品更新成功！！！
    	<br>
    	<a href="ShowShopGoods.jsp">返回商品展示界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal6")!=null&&request.getParameter("shopid")!=null)
    	{
    	%> 
    	<p>
    	商品添加成功！！！
    	<br>
    	<a href="ShowShopGoods.jsp">返回商品展示界面</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("fillmoneynumber")!=null)
    	{
    	%> 
    	<p>
    	充值成功！！！
    	<br>
    	<a href="UserManagement.jsp">返回用户管理界面</a>
    	
    	</p>
    	<%
    	}
    	if(request.getParameter("signal7")!=null&&request.getParameter("sendmessageid")!=null)
    	{
    	%> 
    	<p>
    	送货信息更新成功！！！
    	<br>
    	<a href="AdressComplete.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal7")!=null&&request.getParameter("userid")!=null)
    	{
    	%> 
    	<p>
    	送货信息添加成功！！！
    	<br>
    	<a href="AdressComplete.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("orderuser")!=null&&request.getParameter("ordergoods")!=null)
    	{
    	%> 
    	<p>
    	评论成功！！！
    	<br>
    	<s:form name="commentsuccess_return">
    		<input type="hidden" value="<%=request.getParameter("orderuser")%>" name="orderuser">
    		<input type="hidden" value="<%=request.getParameter("ordergoods")%>" name="ordergoods">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	%> 
    	</center>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
