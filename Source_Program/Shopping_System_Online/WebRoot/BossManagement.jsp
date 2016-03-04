<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Boss" 
import="Model.Shop" import="Service.BossServiceImpl" import="Model.Shop"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店主管理界面</title>
    
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
		String bossname=null;
		int bossid=0;
		String shopname=null;
		String shopadress=null;
		int shoplevel=0;
		int shopmarks=0;
		Boss b=new Boss();
		Shop s=new Shop();
		BossServiceImpl bsi=new BossServiceImpl();
		if(se!=null)
		{
			//b=(Boss)se.getAttribute("CurrentLogin");
			id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			b=bsi.getBossDAO().queryById(id);
			
			if(b!=null)
			{
				bossname=b.getName();
				bossid=b.getId();
				shopname=b.getShop().getName();
				shopadress=b.getShop().getAdress();
				shoplevel=b.getShop().getLevel();
				shopmarks=b.getShop().getMarks();
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
        <td> 店主：</td><td><%=bossname%></td>
	</tr>
	<tr>
	    <td>ID:</td><td><%=bossid%></td>
	</tr>
	<tr>
        <td>店名：</td><td><%=shopname%></td>
	</tr>
	<tr>
	 	<td>地址:</td><td><%=shopadress%></td> 
	</tr>
	<tr> 
	 	<td>积分:</td><td><%=shopmarks%></td> 
	</tr>
	<tr> 
		<td> 等级:</td><td><%=shoplevel%></td>
	</tr>
    </table>
	</div>
	<div id="content">
    	<a href="ShowOrderlist.jsp">查看订单信息</a>
    	<br><a href="ShowTRecord.jsp">查看交易记录</a>
    	<br><a href="ShowShopGoods.jsp">查看货物仓库</a>
    	<br><a href="ShopMessageUpdate.jsp">更新店铺信息</a> 
    	<br><a href="index.jsp">返回主页</a>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
