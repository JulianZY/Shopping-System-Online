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
    
    <title>Error page</title>
    
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
    	用户名不存在或密码错误！！！
    	<br>
    	<a href="index.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("username")!=null&&request.getParameter("repassword")!=null)
    	{
    	%> 
    	<p>
    	用户名已存在！！！
    	<br>
    	<a href="register.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("bossname")!=null&&request.getParameter("shopname")!=null)
    	{
    	%> 
    	<p>
    	此名称已存在！！！
    	<br>
    	<a href="apply.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal4")!=null)
    	{
    	%> 
    	<p>
    	修改出错，此名称已存在！！！
    	<br>
    	<a href="MessageChange.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal5")!=null)
    	{
    	%> 
    	<p>
    	类型已存在！！！
    	<br>
    	<a href="ManageGoodstype.jsp">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("userid")!=null&&request.getParameter("signal7")==null)
    	{
    	%> 
    	<p>
    	用户更新出错！！！
    	<br>
    	<s:form name="usererror_return">
    		<input type="hidden" value="<%=request.getParameter("userid")%>" name="id">
    		<input type="hidden" value="User" name="jumptype">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("bossid")!=null)
    	{
    	%> 
    	<p>
    	店主更新出错！！！
    	<br>
    	<s:form name="bosserror_return">
    		<input type="hidden" value="<%=request.getParameter("bossid")%>" name="id">
    		<input type="hidden" value="Boss" name="jumptype">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("goodsid")!=null&&request.getParameter("signal6")==null)
    	{
    	%> 
    	<p>
    	商品更新出错！！！
    	<br>
    	<s:form name="goodserror_return">
    		<input type="hidden" value="<%=request.getParameter("goodsid")%>" name="id">
    		<input type="hidden" value="Goods" name="jumptype">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("allpay")!=null)
    	{
    	%> 
    	<p>
    	余额不足，付款失败！！！
    	<br>
    	<a href="ShowOrderlist">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal6")!=null&&request.getParameter("goodsid")!=null)
    	{
    	%> 
    	<p>
    	商品更新失败！！！
    	<br>
    	<s:form name="shopgoodsupdateerror_return">
    		<input type="hidden" value="<%=request.getParameter("goodsid")%>" name="goodsid">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal6")!=null&&request.getParameter("shopid")!=null)
    	{
    	%> 
    	<p>
    	商品添加失败！！！
    	<br>
    	<s:form name="shopgoodsadderror_return">
    		<input type="hidden" value="<%=request.getParameter("shopid")%>" name="shopid">
    		<input type="hidden" value="x" name="add">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("fillmoneynumber")!=null)
    	{
    	%> 
    	<p>
    	银行账户不存在或余额不足！！！
    	<br>
    	<a href="FillMoney">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal7")!=null&&request.getParameter("sendmessageid")!=null)
    	{
    	%> 
    	<p>
    	送货信息更新失败！！！
    	<br>
    	<s:form name="sendmessageupdateerror_return">
    		<input type="hidden" value="<%=request.getParameter("sendmessageid")%>" name="sendmessageid">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("signal7")!=null&&request.getParameter("userid")!=null)
    	{
    	%> 
    	<p>
    	送货信息添加失败！！！
    	<br>
    	<s:form name="sendmessageadderror_return">
    		<input type="hidden" value="x" name="add">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("orderuser")!=null&&request.getParameter("ordergoods")!=null)
    	{
    	%> 
    	<p>
    	评论失败！！！
    	<br>
    	<s:form name="commenterror_return">
    		<input type="hidden" value="<%=request.getParameter("orderuser")%>" name="orderuser">
    		<input type="hidden" value="<%=request.getParameter("ordergoods")%>" name="ordergoods">
    		<input type="submit" value="返回">
    	</s:form>
    	</p>
    	<%
    	}
    	if(request.getParameter("")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="">返回</a>
    	</p>
    	<%
    	}
    	if(request.getParameter("")!=null)
    	{
    	%> 
    	<p>
    	
    	<br>
    	<a href="">返回</a>
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
