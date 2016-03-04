<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Boss" import="Model.Shop"
import="Service.ManagerServiceImpl" import="Model.Goods" import="Model.Manager"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="z" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>商品信息管理</title>
    
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
		String selectshowway=null;
		String shopname=null;
		String goodsname=null;
		int goodsid=0;
		String searchfile=null;
		List<Goods> goodss=new ArrayList<Goods>();
		ManagerServiceImpl msi=new ManagerServiceImpl();
		
		int mid=(Integer)se.getAttribute("CurrentLogin");
		Manager mm=msi.getManagerDAO().queryById(mid);
		String managername=mm.getName();
		int managerid=mm.getId();
		
		searchfile=request.getParameter("searchfile");
		System.out.println(searchfile);
		selectshowway=request.getParameter("selectshowway");
		System.out.println(selectshowway);
		if(searchfile!=null)
		{
			if(selectshowway!=null&&selectshowway.equals("Goods"))
			{
				goodss=msi.queryGoods(searchfile);
			}
			if(selectshowway!=null&&selectshowway.equals("Shop"))
			{
				List<Shop> shops=msi.getShopDAO().queryByName(searchfile);
				if(shops!=null&&!shops.isEmpty())
				{
					for(int i=0;i<shops.size();i++)
					{
						List<Goods> gos=msi.getGoodsDAO().queryByShop(shops.get(i));
						if(gos!=null&&!gos.isEmpty())
						{
							for(int j=0;j<gos.size();j++)
							{
								Goods g=gos.get(j);
								goodss.add(g);
							}
						}
					}
				}
			}
		}
		else
		{
			goodss=msi.getGoodsDAO().queryAll();
		}
	%>
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:4000px;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:3800px; background:#6f6;}
		#content { float:right; width:695px; height:3800px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
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
  	
  	<z:form action="selectshowgoodstype">
  		<table width="695px">
  		<tr>
  		<td><label for="selectshowway">请选择查询类型:</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="Shop">店铺名</option>
  			<option value="Goods">商品名</option>
  		</select></td><td>输入查询条目：</td><td><input type="text" name="searchfile"></td>
  		<td><z:submit value="查询"/></td>
  		<tr>
  		</table>
  	</z:form>
  	
  	<%
  		if(goodss!=null&&!goodss.isEmpty()) 
  		{ 
  			for(int j=0;j<goodss.size();j++)
  			{
  				shopname=goodss.get(j).getShop().getName();
  				goodsname=goodss.get(j).getName();
  				goodsid=goodss.get(j).getId();
  	%>
  	<table frame="box" width="600px" height="5px" bgcolor="#cff">
  	<tr>
  		<td>名称：</td><td><%=goodsname%></td><td>所属店铺：</td><td><%=shopname%></td>
  	</tr>
  	</table>
  		<s:form action="managegoods_delete">
  			<input name="goodsid" type="hidden" value="<%=goodsid%>">
  			<table frame="box" width="600px" height="5px" bgcolor="#cff">
  			<tr>
  			<td align="left"><s:submit value="删除" style="width:100px"/></td>
  			</tr>
  			</table>
  		</s:form>
  		<c:form action="manager_update_jumppage">
  			<input name="id" type="hidden" value="<%=goodsid%>">
  			<input name="jumptype" type="hidden" value="Goods">
  			<table frame="box" width="600px" height="5px" bgcolor="#cff">
  			<tr>
  			<td align="left"><c:submit value="更新信息" style="width:100px"/></td>
  			</tr>
  			</table>
  		</c:form>
  	
  	<%
  			} 
  		}
  		else
  		{
  			%>
  			<table><tr><td>没有商品信息!!!</td></tr></table>
  			<%
  		}
  	%>
  	<br>
	<a href="ManagerManagement.jsp">返回管理界面</a>
		</div>
	</div>
	</div>
	</div>
  </body>
</html>
