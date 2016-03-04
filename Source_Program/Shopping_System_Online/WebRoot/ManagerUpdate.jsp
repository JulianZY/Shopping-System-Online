<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User" 
import="Model.Boss" import="Model.Goods" import="Model.Goodstype" import="Service.ManagerServiceImpl" import="Model.Manager"%>
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
    
    <title>管理员更新管理</title>
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
		String id=request.getParameter("id");
		String jumptype=request.getParameter("jumptype");
		if(id!=null&&jumptype!=null)
		{
			se.setAttribute("tempid1", id);
			se.setAttribute("tempjumptype1", jumptype);
		}
		else
		{
			id=(String)se.getAttribute("tempid1");
			jumptype=(String)se.getAttribute("tempjumptype1");
		}
		User u=new User();
		Boss b=new Boss();
		Goods g=new Goods();
		ManagerServiceImpl msi=new ManagerServiceImpl();
		int mid=(Integer)se.getAttribute("CurrentLogin");
		Manager mm=msi.getManagerDAO().queryById(mid);
		String managername=mm.getName();
		int managerid=mm.getId();
		
		List<Goodstype> alltypes=msi.getGoodstypeDAO().queryAll();
		if(id!=null&&jumptype!=null&&jumptype.equals("User"))
		{
			int userid=Integer.parseInt(id);
			u=msi.getUserDAO().queryById(userid);
		}
		if(id!=null&&jumptype!=null&&jumptype.equals("Boss"))
		{
			int bossid=Integer.parseInt(id);
			b=msi.getBossDAO().queryById(bossid);
		}
		if(id!=null&&jumptype!=null&&jumptype.equals("Goods"))
		{
			int goodsid=Integer.parseInt(id);
			g=msi.getGoodsDAO().queryById(goodsid);
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
    <% 
    	if(u!=null&&jumptype!=null&&jumptype.equals("User"))
    	{
    %>
    <div id="content">
    
    <s:form action="manageuser_update" >
    	<input name="userid" value="<%=id%>" type="hidden">
    	<table>
      <tr><td>用户姓名(<%=u.getName()%>,不含特殊字符)</td><td><input type="text" name="username"/></td><td><s:fielderror fieldName="username" cssStyle="color: red"/></td></tr>
        <tr><td>密码(<%=u.getPassword()%>,6~20位)</td><td><input type="text" name="userpassword"/></td><td><s:fielderror fieldName="userpassword" cssStyle="color: red"/></td></tr>
       <tr><td>邮箱(<%=u.getMail()%>)</td><td><input type="text" name="usermail"/></td><td><s:fielderror fieldName="usermail" cssStyle="color: red"/></td></tr>
        <tr><td>电话(<%=u.getTel()%>,11位数)</td><td><input type="text" name="usertele"/></td><td><s:fielderror fieldName="usertele" cssStyle="color: red"/></td></tr>
        <tr><td>余额(<%=u.getLeftmoney()%>)</td><td><input type="text" name="userleftmoney"/></td><td><s:fielderror fieldName="userleftmoney" cssStyle="color: red"/></td></tr>
  		<tr><td>VIP等级(<%=u.getVlevel()%>,0~10)</td><td><input type="text" name="uservlevel"/></td><td><s:fielderror fieldName="uservlevel" cssStyle="color: red"/></td></tr>
       <tr><td>积分(<%=u.getMarks()%>,大于0)</td><td><input type="text" name="usermarks"/></td><td><s:fielderror fieldName="usermarks" cssStyle="color: red"/></td></tr>
        <tr><td><s:submit value="更新" /></td><td><s:reset value="重置"/></td><td><a href="ShowUser.jsp">取消</a></td></tr>
        </table>
    </s:form>
    
    </div>
    <% 
    	}
    	if(b!=null&&jumptype!=null&&jumptype.equals("Boss"))
    	{
    %>
    <div id="content">
    
    <s:form action="manageboss_update" >
    	<input name="bossid" value="<%=id%>" type="hidden">
    	<table>
        <tr><td>店长姓名(<%=b.getName()%>,不含特殊字符)</td><td><input type="text" name="bossname"/></td><td><s:fielderror fieldName="bossname" cssStyle="color: red"/></td></tr>
       	<tr><td>密码(<%=b.getPassword()%>,6~20位)</td><td><input type="text" name="bosspassword"/></td><td><s:fielderror fieldName="bosspassword" cssStyle="color: red"/></td></tr>
        <tr><td>邮箱(<%=b.getMail()%>)</td><td><input type="text" name="bossmail"/></td><td><s:fielderror fieldName="bossmail" cssStyle="color: red"/></td></tr>
        <tr><td>电话(<%=b.getTel()%>,11位数)</td><td><input type="text" name="bosstele"/></td><td><s:fielderror fieldName="bosstele" cssStyle="color: red"/></td></tr>
        <tr><td>地址(<%=b.getAdress()%>)</td><td><input type="text" name="bossadress"/></td><td></td></tr>
        <tr><td>真实姓名(<%=b.getTruename()%>)</td><td><input type="text" name="bosstruename"/></td><td><s:fielderror fieldName="bosstruename" cssStyle="color: red"/></td></tr>
        <tr><td>店名(<%=b.getShop().getName()%>)</td><td><input type="text" name="shopname"/></td><td><s:fielderror fieldName="shopname" cssStyle="color: red"/></td></tr>
        <tr><td>店铺等级(<%=b.getShop().getLevel()%>,1~5)</td><td><input type="text" name="shoplevel"/></td><td><s:fielderror fieldName="shoplevel" cssStyle="color: red"/></td></tr>
        <tr><td>店铺积分(<%=b.getShop().getMarks()%>,大于0)</td><td><input type="text" name="shopmarks"/></td><td><s:fielderror fieldName="shopmarks" cssStyle="color: red"/></td></tr>
       <tr><td>店铺地址(<%=b.getShop().getAdress()%>)</td><td><input type="text" name="shopadress"/></td><td></td></tr>
        <tr><td><s:submit value="更新"/></td><td><s:reset value="重置"/></td><td><a href="ShowBoss.jsp">取消</a></td></tr>
        </table>
    </s:form>
    
    </div>
    <% 
    	}
    	if(g!=null&&jumptype!=null&&jumptype.equals("Goods"))
    	{
     %>
     <div id="content">
     
    <s:form action="managegoods_update">
    	<input name="goodsid" value="<%=id%>" type="hidden"/>
    	<table>
        <tr><td>商品名(<%=g.getName()%>,不含特殊字符)</td><td><input type="text" name="goodsname"/></td><td><s:fielderror fieldName="goodsname" cssStyle="color: red"/></td></tr>
        <tr><td>商品介绍(<%=g.getIntroduce()%>,不超过100字)</td><td><input type="text" name="goodsintroduce"/></td><td><s:fielderror fieldName="goodsintroduce" cssStyle="color: red"/></td></tr>
       	<tr><td>商品积分(<%=g.getMark()%>,不为负)</td><td><input type="text" name="goodsmark"/></td><td><s:fielderror fieldName="goodsmark" cssStyle="color: red"/></td></tr>
        <tr><td>商品数目(<%=g.getNum()%>)</td><td><input type="text" name="goodsnum"/></td><td><s:fielderror fieldName="goodsnum" cssStyle="color: red"/></td></tr>
        <tr><td>价格(<%=g.getPrice()%>)</td><td><input type="text" name="goodsprice"/></td><td><s:fielderror fieldName="goodsprice" cssStyle="color: red"/></td></tr>
        <tr><td><s:submit value="更新"/></td><td><s:reset value="重置"/></td><td><a href="ShowGoods.jsp">取消</a></td></tr>
        </table>
    </s:form>
    	<table>
    	<tr><td>商品类型：</td></tr>
    	<tr><td>
    	<% 
    		alltypes=msi.getGoodstypeDAO().queryByGoods(g);
    		if(alltypes!=null&&!alltypes.isEmpty())
    		{
    			for(int l=0;l<alltypes.size();l++)
    			{
    			%>
    			&nbsp;<%=alltypes.get(l).getType()%>&nbsp;
    			<%
    			}
    		}
    	%>
    	</td></tr>
    	</table>
    <c:form action="managegoods_goodstype_add">
    	<table>
    	<tr><td><label for="selectgoodstype">选择添加类型:</label></td>
    		<td><select name="selectgoodstype" id="selectgoodstype">
    		<% 
    			List<Goodstype> gts=msi.queryAllGoodstype();
    			if(gts!=null&&!gts.isEmpty())
    			{
    				for(int k=0;k<gts.size();k++)
    				{
    				%>
    				<option value="<%=gts.get(k).getId()%>"><%=gts.get(k).getType()%></option>
    				<% 
    				}
    			}
    		%>
    		</select>
    		</td>
    		<td><input type="hidden" name="jumptype" value="Goods" /></td>
    		<td><c:submit value="添加"/></td></tr>
    		</table>
    </c:form>
    <z:form action="managegoods_goodstype_delete">
    	<table>
    	<tr><td><label for="selectgoodstype">选择删除类型:</label></td>
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
    		<td><input type="hidden" name="jumptype" value="Goods"/></td>
    		<td><z:submit value="删除"/></td></tr>
    		</table>
    </z:form>
    	</div>
    <% 
    	}
    %>
    </div>
    </div>
    </div>
  </body>
</html>