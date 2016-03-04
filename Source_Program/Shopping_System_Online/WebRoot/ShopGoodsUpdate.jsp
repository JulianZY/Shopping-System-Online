<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" import="Model.Shop"
	import="Model.Goods" import="Model.Goodstype"
	import="Service.ManagerServiceImpl" import="Service.BossServiceImpl"
	import="Model.Boss"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/struts-tags"%>
<%@ taglib prefix="z" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>店铺货物更新</title>

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
		String goodsid=request.getParameter("goodsid");
		String shopid=request.getParameter("shopid");
		String add=request.getParameter("add");
		
		ManagerServiceImpl msi=new ManagerServiceImpl();
		int bid=(Integer)se.getAttribute("CurrentLogin");
		Boss b=msi.getBossDAO().queryById(bid);
		
		String bossname=null;
		int bossid=0;
		String shopname=null;
		String shopadress=null;
		int shopmarks=0;
		int shoplevel=0; 
		if(b!=null)
		{
			bossname=b.getName();
			bossid=b.getId();
			shopname=b.getShop().getName();
			shopadress=b.getShop().getAdress();
			shopmarks=b.getShop().getMarks();
			shoplevel=b.getShop().getLevel();
		}
		
		/* if(goodsid!=null)
		{
			se.setAttribute("tempgoodsid", goodsid);
		}
		else
		{
			if(se.getAttribute("tempgoodsid")!=null)
			{
				goodsid=(String)se.getAttribute("tempgoodsid");
			}
			else
			{
				goodsid=null;
			}
		}
		if(shopid!=null)
		{
			se.setAttribute("tempshopid", shopid);
		}
		else
		{
			if(se.getAttribute("tempshopid")!=null)
			{
				shopid=(String)se.getAttribute("tempshopid");
			}
			else
			{
				shopid=null;
			}
		}
		if(add!=null)
		{
			se.setAttribute("tempadd", add);
		}
		else
		{
			if(se.getAttribute("tempadd")!=null)
			{
				add=(String)se.getAttribute("tempadd");
			}
			else
			{
				add=null;
			}
		} */
		
		List<Goodstype> alltypes=new ArrayList<Goodstype>();
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
	<%
		if(goodsid!=null)
	    {
	    	int id=Integer.parseInt(goodsid);
	    	Goods g=msi.getGoodsDAO().queryById(id);
	%>
	<s:form action="manageshopgoods_update" validate="true">
		<input name="signal6" value="x" type="hidden">
		<input name="goodsid" value="<%=id%>" type="hidden">
        <tr><td>商品名(<%=g.getName()%>,不含特殊字符)</td><td><input type="text" name="goodsname" /></td><td><s:fielderror fieldName="goodsname" cssStyle="color: red" /></td></tr>
        <tr><td>商品介绍(<%=g.getIntroduce()%>,不超过100字)</td><td><input type="text" name="goodsintroduce" /></td><td><s:fielderror fieldName="goodsintroduce" cssStyle="color: red" /></td></tr>
        <tr><td>商品积分(<%=g.getMark()%>,不为负)</td><td><input type="text" name="goodsmark" /></td><td><s:fielderror fieldName="goodsmark" cssStyle="color: red" /></td></tr>
        <tr><td>商品数目(<%=g.getNum()%>)</td><td><input type="text" name="goodsnum" /></td><td><s:fielderror fieldName="goodsnum" cssStyle="color: red" /></td></tr>
        <tr><td>价格(<%=g.getPrice()%>)</td><td><input type="text" name="goodsprice" /></td><td><s:fielderror fieldName="goodsprice" cssStyle="color: red" /></td></tr>
		<tr><td><s:submit value="更新" /></td><td><input type="reset" value="重置"></td></tr>
	</s:form>
	<tr>
		<td>商品类型：</td>
		<td>
		<%
				List<Goodstype> gt=msi.getGoodstypeDAO().queryByGoods(g);
	    		if(gt!=null&&!gt.isEmpty())
	    		{
	    			for(int l=0;l<gt.size();l++)
	    			{
						%>
						 &nbsp;<%=gt.get(l).getType()%>&nbsp;
						<%
					}
		    	}
		%>
		</td>
	</tr>
	<tr>
		<c:form action="manageshopgoods_goodstype_add">
			<td><label for="selectgoodstype">选择添加类型:</label></td>
			<td><select name="selectgoodstype" id="selectgoodstype">
				<%
					alltypes=msi.queryAllGoodstype();
					if(alltypes!=null&&!alltypes.isEmpty())
					{
				    			for(int k=0;k<alltypes.size();k++)
				    			{
				%>
				<option value="<%=alltypes.get(k).getId()%>"><%=alltypes.get(k).getType()%></option>
				<%
								}
					}
				%>
			</select></td>
			<input type="hidden" name="goodsid" value="<%=goodsid%>">
			<td><c:submit value="添加" /></td>
		</c:form>
	</tr>
	<tr>
		<z:form action="manageshopgoods_goodstype_delete">
			<td><label for="selectgoodstype">选择删除类型:</label></td>
			<td><select name="selectgoodstype" id="selectgoodstype">
				<%
					alltypes=msi.getGoodstypeDAO().queryByGoods(g);
					if(alltypes!=null&&!alltypes.isEmpty())
					{
				    			for(int k=0;k<alltypes.size();k++)
				    			{
				%>
				<option value="<%=alltypes.get(k).getId()%>"><%=alltypes.get(k).getType()%></option>
				<%
								}
					}
				%>
			</select></td>
			<input type="hidden" name="goodsid" value="<%=goodsid%>">
			<td><z:submit value="删除" /></td>
		</z:form>
	</tr>
	<%
		}
	    if(add!=null&&shopid!=null)
	    {
	%>
	
		<s:form action="manageshopgoods_add" validate="true">
			<input name="signal6" value="x" type="hidden">
			<input type="hidden" name="shopid" value="<%=shopid%>">
	<tr>
        	<td>商品名(不含特殊字符):</td><td><input type="text" name="searchfile" /></td><td><s:fielderror fieldName="goodsname" cssStyle="color: red" /></td>
	</tr>
	<tr>
        	<td>商品介绍(不超过100字):</td><td><input type="text" name="goodsintroduce" /></td><td><s:fielderror fieldName="goodsintroduce" cssStyle="color: red" /></td>
	</tr>
	<tr>
        	<td>商品积分(不为负):</td><td><input type="text" name="goodsmark" /></td><td><s:fielderror fieldName="goodsmark" cssStyle="color: red" /></td>
	</tr>
	<tr>
        	<td>商品数目:</td><td><input type="text" name="goodsnum" /></td><td><s:fielderror fieldName="goodsnum" cssStyle="color: red" /></td>
	</tr>
	<tr>
        	<td>价格:<input type="text" name="goodsprice" /></td><td><s:fielderror fieldName="goodsprice" cssStyle="color: red" /></td>
	</tr>
	<tr>
			<td><label for="selectgoodstype">选择添加一个类型:</label></td>
			<td><select name="selectgoodstype" id="selectgoodstype">
				<%
					alltypes=msi.queryAllGoodstype();
					if(alltypes!=null&&!alltypes.isEmpty())
					{
				    			for(int k=0;k<alltypes.size();k++)
				    			{
				%>
				<option value="<%=alltypes.get(k).getId()%>"><%=alltypes.get(k).getType()%></option>
				<%
								}
					}
				%>
			</select></td>
	</tr>
	<tr>
			<td><s:submit value="新增(类型之后添加)"/></td><td><s:reset value="重置" /></td>
	</tr>
		</s:form>
	
	<%
		}
	%>
	</table>
	<br>
	<a href="ShowShopGoods.jsp">返回商品列表</a>
	</div>
</div>
</div>
</div>
</body>
</html>
