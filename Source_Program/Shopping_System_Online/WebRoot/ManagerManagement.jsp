<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Manager" 
import="Service.ManagerServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员管理界面</title>
    
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
		int id=0;
		ManagerServiceImpl msi=new ManagerServiceImpl();
		String managername=null;
		int managerid=0;
		Manager m=new Manager();
		if(se!=null)
		{
			//m=(Manager)se.getAttribute("CurrentLogin");
			id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			m=msi.getManagerDAO().queryById(id);
			
			if(m!=null)
			{
				managername=m.getName();
				managerid=m.getId();
			}
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
	</style>
  </head>
  
  <body>
    <div id="allcontainer">
  	<div id="container">
  	<div id="header"></div>
  	<div id="mainContent">
  		<div id="sidebar">
  			<table>
  				<tr>
            	  <td>管理员:&nbsp;<%=managername%></td>
            	  </tr>
            	  <tr>
            	  <td>ID:&nbsp;<%=managerid%></td>
            	  </tr>
            </table>
        </div>
        <div id="content">
    		<a href="ShowTRecord.jsp">查看交易记录</a> <br>
   			<a href="ShowComment.jsp">查看评论列表</a> <br>
    		<a href="ShowUser.jsp">用户信息管理</a> <br>
    		<a href="ShowBoss.jsp">店主信息管理</a> <br>
    		<a href="ShowGoods.jsp">商品信息管理</a> <br>
    		<a href="ManageGoodstype.jsp">管理商品类型</a> <br>
    		<a href="index.jsp">返回主页</a> <br>
    	</div>
    </div>
    </div>
    </div>
  </body>
</html>
