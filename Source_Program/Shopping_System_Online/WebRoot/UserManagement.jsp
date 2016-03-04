<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User" import="Service.UserServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理界面</title>
    
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
		User u=new User();
		int id=0;
		UserServiceImpl usi=new UserServiceImpl();
		
		String username=null;
		String usermail=null;
		String usertele=null;
		int uservlevel=0;
		int usermarks=0;
		double userleftmoney=0;
		
		if(se!=null)
		{
			//u=(User)se.getAttribute("CurrentLogin");
			id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			u=usi.getUserDAO().queryById(id);
			
			username=u.getName();
			usermail=u.getMail();
			usertele=u.getTel();
			uservlevel=u.getVlevel();
			usermarks=u.getMarks();
			userleftmoney=u.getLeftmoney();
		}
		
	%>
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:1200px;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:1000px; background:#6f6;}
		#content { float:right; width:695px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
		#userheadphoto { float:left; width:190; height:190; margin:0 auto;}
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  		<div id="sidebar">
  			<div id="userheadphoto">
    		<img src="<%=request.getContextPath()%><%=u.getHeadphoto().getPath()%>" height="190" width="190"/>
    		</div>
    		<table>
    			<tr>
    			<s:form action="headphoto_change_jump" target="_blank">
    				<input type="hidden" name="uid" value="<%=id%>">
    				<td><s:submit value="修改头像" /></td>
    			</s:form>
    			<s:form action="headphoto_change_default">
    				<input type="hidden" name="id" value="<%=id%>">
    				<td><s:submit value="设为默认" /></td>
    			</s:form>
    			</tr>
    		</table>
    		
    		<br>
    	<table>
    	<tr>
    		<td>用户名：</td><td><%=username%></td>
    	</tr>
    	<tr>
        	<td>邮箱：</td><td><%=usermail%></td>
		</tr>
		<tr>
			<td>联系方式：</td><td><%=usertele%></td>
		</tr>
		<tr>
        	<td>积分：</td><td><%=usermarks%></td>
		</tr> 
		<tr>
			<td>VIP等级：</td><td><%=uservlevel%></td>
		</tr>
		<tr>
			<td>账户余额：</td><td><%=userleftmoney%></td>
		</tr>
    	</table>
    	</div>
    	<div id="content">
   	 		<a href="ShowOrderlist.jsp">我的购物车</a> <br>
    		<a href="ShowTRecord.jsp">我的交易记录</a> <br>
    		<a href="FillMoney.jsp">充值</a> <br>
    		<a href="AdressComplete.jsp">送货信息</a><br>
  			<a href="ShowComment.jsp">我的评论记录</a><br>
  			<a href="index.jsp">返回主页</a><br>
  		</div>
  	<!-- <a href="examupload.jsp">-></a><br> -->
  	</div>
  	</div>
  	</div>
  </body>
</html>
