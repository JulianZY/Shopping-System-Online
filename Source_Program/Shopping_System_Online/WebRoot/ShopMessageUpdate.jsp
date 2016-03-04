<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Service.BossServiceImpl" 
import="Model.Boss" import="Model.Shop"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店铺信息更新</title>
    
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
		BossServiceImpl bsi=new BossServiceImpl();
		Boss b=new Boss();
		Shop s=new Shop();
		String id=null;
		
		String bossname=null;
		int bossid=0;
		String shopname=null;
		String shopadress=null;
		int shopmarks=0;
		int shoplevel=0; 
		
		if(se!=null)
		{
			id=se.getAttribute("CurrentLogin").toString();
			int bid=Integer.parseInt(id);
			b=bsi.getBossDAO().queryById(bid);
			s=b.getShop();
			
			bossname=b.getName();
			bossid=b.getId();
			shopname=b.getShop().getName();
			shopadress=b.getShop().getAdress();
			shopmarks=b.getShop().getMarks();
			shoplevel=b.getShop().getLevel();
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
  	<table>
    <s:form action="bossmanagement_shopmessage_update" >
    	<input name="shopid" value="<%=s.getId()%>" type="hidden">
        <tr><td>地址(<%=b.getAdress()%>)</td><td><input type="text" name="shopadress" /></td><td></td></tr>
        <tr><td>店名(<%=s.getName()%>,不含特殊字符)</td><td><input type="text" name="shopname" /></td><td><s:fielderror fieldName="shopname" cssStyle="color: red"/></td></tr>
        <tr><td><s:submit value="更新" /></td><td><s:reset value="重置"/></td><td></td></tr>
    </s:form>
    </table>
    <br>
    <a href="BossManagement.jsp">取消/返回</a>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
