<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="java.io.*" 
import="Service.UserServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户头像上传</title>
    
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
		String uid=request.getParameter("uid");
		UserServiceImpl usi=new UserServiceImpl();
		String imgpath=null;
		if(uid!=null)
		{
			se.setAttribute("uid",uid);
		}
		else
		{
			uid=se.getAttribute("uid").toString();
		}
		
		int usid=Integer.parseInt(uid);
		if(usid!=0)
		{
			imgpath=usi.getUserDAO().queryById(usid).getHeadphoto().getPath();
			imgpath=request.getContextPath()+imgpath;
		}
	%><style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:1200px;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:1000px; background:#9ff;}
		#content { float:right; width:900px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
		#userheadphoto { width:190; height:190; margin:0 auto;}
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  <div id="content">
  	<center>
   
 	<div id="userheadphoto"><img src="<%=imgpath%>" height="190" width="190"/></div>
    <form action="uploadheadphoto" method="POST" enctype="multipart/form-data">
    	<input type="file" name="upload" ><s:fielderror cssStyle="color: red"/><br>
    	<input type="hidden" name="id" value="<%=usid%>">
    	<!-- <input type="hidden" name="id" value="134"> -->
    	<input type="submit" value="提交"/>
    </form>
  		</center>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
