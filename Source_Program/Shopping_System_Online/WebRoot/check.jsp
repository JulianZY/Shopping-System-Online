<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="Model.User" 
import="Service.ManagerServiceImpl" import="Model.Boss" import="Model.Manager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆信息确认</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% 
	HttpSession se=request.getSession(); 
	String s1=request.getParameter("inputcertCode");
	String s2=(String)se.getAttribute("certCode");
	System.out.println("input:"+s1);
	System.out.println("true:"+s2);
	String s3=request.getParameter("name");
	String s4=request.getParameter("password");
	String s5=request.getParameter("selecttype");
	System.out.println("name:"+s3);
	System.out.println("password:"+s4);
	System.out.println("selecttype:"+s5);
	ManagerServiceImpl msi=new ManagerServiceImpl();
	%>
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#content { float:right; width:900px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
	</style>
  </head>
  
  <body>
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  <div id="content">
  	<center>
    
    <% 
    if(s1!=null&&s2!=null&&!s1.equals(s2))
    {
    %>
    <br>验证码输入错误！！！关闭本页面重新输入！！！
    <%
    }
    if(s1!=null&&s2!=null&&s1.equals(s2))
    {
    	if(s3!=null&&s5!=null&&s5.equals("User"))
    	{
    		User u=msi.getUserDAO().queryByName(s3);
    		if(u!=null&&u.getPassword().equals(s4))
    		{
    			se.setAttribute("name",s3);
				se.setAttribute("password", s4);
				se.setAttribute("selecttype",s5);
				se.setAttribute("loginsignal", "T");
				se.setAttribute("CurrentLogin", u.getId());
				%>
				<br>登陆成功！！！
				<br><a href="index.jsp">返回主页</a>
				<%
				
    		}
    		if(u==null)
    		{
    		%>
    		<br>用户名不存在！！！关闭本页面重新输入！！！
    		<%
    		}
    		if(u!=null&&!u.getPassword().equals(s4))
    		{
    		%>
    		<br>密码不正确！！！关闭本页面重新输入！！！
    		<%
    		}
    	}
    	if(s3!=null&&s5!=null&&s5.equals("Manager"))
    	{
    		Manager m=msi.getManagerDAO().queryByName(s3);
    		if(m!=null&&m.getPassword().equals(s4))
    		{
    			se.setAttribute("name",s3);
				se.setAttribute("password", s4);
				se.setAttribute("selecttype",s5);
				se.setAttribute("loginsignal", "T");
				se.setAttribute("CurrentLogin", m.getId());
				%>
				<br>登陆成功！！！
				<br><a href="index.jsp">返回主页</a>
				<%
				
    		}
    		if(m==null)
    		{
    		%>
    		<br>用户名不存在！！！关闭本页面重新输入！！！
    		<%
    		}
    		if(m!=null&&!m.getPassword().equals(s4))
    		{
    		%>
    		<br>密码不正确！！！关闭本页面重新输入！！！
    		<%
    		}
    	}
    	if(s3!=null&&s5!=null&&s5.equals("Boss"))
    	{
    		Boss b=msi.getBossDAO().queryByName(s3);
    		if(b!=null&&b.getPassword().equals(s4))
    		{
    			se.setAttribute("name",s3);
				se.setAttribute("password", s4);
				se.setAttribute("selecttype",s5);
				se.setAttribute("loginsignal", "T");
				se.setAttribute("CurrentLogin", b.getId());
				%>
				<br>登陆成功！！！
				<br><a href="index.jsp">返回主页</a>
				<%
				
    		}
    		if(b==null)
    		{
    		%>
    		<br>用户名不存在！！！关闭本页面重新输入！！！
    		<%
    		}
    		if(b!=null&&!b.getPassword().equals(s4))
    		{
    		%>
    		<br>密码不正确！！！关闭本页面重新输入！！！
    		<%
    		}
    	}
    }
    %>
    </center>
    </div>
  </div>
  </div>
  </body>
</html>
