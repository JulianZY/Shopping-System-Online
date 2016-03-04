<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User" import="Model.Shopcar"
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
    
    <title>用户信息管理</title>
    
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
		String username=null;
		List<User> users=new ArrayList<User>();
		User u1=new User();
		ManagerServiceImpl msi=new ManagerServiceImpl();
		int mid=(Integer)se.getAttribute("CurrentLogin");
		Manager mm=msi.getManagerDAO().queryById(mid);
		String managername=mm.getName();
		int managerid=mm.getId();
		if(se!=null)
		{
			searchfile=request.getParameter("searchfile");
			if(searchfile!=null)
			{
				User u2=msi.getUserDAO().queryByName(searchfile);
				if(u2!=null)
				{
					users.add(u2);
				}
			}
			else
			{
				users=msi.queryAllUsers();
			}
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
    	if(users!=null&&!users.isEmpty()) 
    	{
    		for(int i=0;i<users.size();i++)
    		{
    			u1=users.get(i);
    			%>	
    			<table frame="box" width="600px" height="5px" bgcolor="#cff">
    			<tr>
    			<td><%=u1.getName()%></td>
    			</tr>
    			</table>
    			<s:form action="manageuser_delete">
    				<input type="hidden" name="userid" value="<%=u1.getId()%>">
    				<table frame="box" width="600px" height="5px" bgcolor="#cff">
    				<tr>
    				<td><s:submit value="删除用户"/></td>
    				</tr>
    				</table>
    			</s:form>
    			<c:form action="manager_update_jumppage">
    				<input type="hidden" name="jumptype" value="User">
    				<input type="hidden" name="id" value="<%=u1.getId()%>">
    				<table frame="box" width="600px" height="5px" bgcolor="#cff">
    				<tr>
    				<td><c:submit value="更新信息"/></td>
    				</tr>
    				</table>
    			</c:form>
    			<%
    		}
    	}
    	else
    	{
    	%>
    	<table><tr><td>无用户信息!!!</td></tr></table>
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
