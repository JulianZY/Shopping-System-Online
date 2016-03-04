<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Boss" import="Model.Shop"
import="Service.ManagerServiceImpl" import="Model.Manager"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店主信息管理</title>
    
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
		String searchfile=null;
		String bossname=null;
		List<Boss> bosses=new ArrayList<Boss>();
		Boss b1=new Boss();
		ManagerServiceImpl msi=new ManagerServiceImpl();
		int mid=(Integer)se.getAttribute("CurrentLogin");
		Manager mm=msi.getManagerDAO().queryById(mid);
		String managername=mm.getName();
		int managerid=mm.getId();
			searchfile=request.getParameter("searchfile");
			if(searchfile!=null)
			{
				Boss b2=msi.queryBoss(searchfile);
				if(b2!=null)
				{
					bosses.add(b2);
				}
			}
			else
			{
				bosses=msi.queryAllBoss();
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
    <%
    	if(bosses!=null&&!bosses.isEmpty()) 
    	{
    		for(int i=0;i<bosses.size();i++)
    		{
    			b1=bosses.get(i);
    			%>	
    			<table frame="box" width="600px" height="5px" bgcolor="#cff">
    			<tr>
    			<td><%=b1.getName()%></td><td><%=b1.getShop().getName()%></td>
    			</tr>
    			</table>
    			<s:form action="manageboss_delete">
    				<input type="hidden" name="bossid" value="<%=b1.getId()%>">
    				<table frame="box" width="600px" height="5px" bgcolor="#cff">
    				<tr>
    				<td align="left"><s:submit value="删除店主" style="width:100px"/></td>
    				</tr>
    				</table>
    			</s:form>
    			<c:form action="manager_update_jumppage">
    				<input type="hidden" name="jumptype" value="Boss">
    				<input type="hidden" name="id" value="<%=b1.getId()%>">
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
    	<table><tr><td>无店主信息!!!</td></tr></table>
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
