<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Boss" 
import="Model.Manager" import="Model.User" import="Service.ManagerServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
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
	ManagerServiceImpl msi=new ManagerServiceImpl();
	User u=new User();
	Boss b=new Boss();
	Manager mm=new Manager();
	
	String name=null;
	String password=null;
	String mail=null;
	String tele=null;
	String adress=null;
	String truename=null;
	String selecttype=null;
	
	String username=null;
	String usermail=null;
	String usertele=null;
	int uservlevel=0;
	int usermarks=0;
	double userleftmoney=0;
	
	String bossname=null;
	int bossid=0;
	String shopname=null;
	String shopadress=null;
	int shopmarks=0;
	int shoplevel=0; 
	
	String managername=null;
	int managerid=0;
	
	if(se.getAttribute("selecttype")!=null)
	{
		selecttype=se.getAttribute("selecttype").toString();
	}
	//ManagerDAO md=new ManagerDAO();
	if(se!=null&&selecttype!=null)
	{
	    if(selecttype.equals("Boss"))
	    {
			//Boss b=(Boss)se.getAttribute("CurrentLogin");//.getAttribute("CurrentLogin");
			int id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			b=msi.getBossDAO().queryById(id);
			
			if(b!=null)
			{
				name=b.getName();
				password=b.getPassword();
				mail=b.getMail();
				tele=b.getTel();
				adress=b.getAdress();
				truename=b.getTruename();
				
				bossname=b.getName();
				bossid=b.getId();
				shopname=b.getShop().getName();
				shopadress=b.getShop().getAdress();
				shopmarks=b.getShop().getMarks();
				shoplevel=b.getShop().getLevel();
			}
		}
		if(selecttype.equals("Manager"))
	    {
			//Manager m=(Manager)se.getAttribute("CurrentLogin");//.getAttribute("CurrentLogin");
			int id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			mm=msi.getManagerDAO().queryById(id);
			if(mm!=null)
			{
				name=mm.getName();
				password=mm.getPassword();
				mail=mm.getMail();
				tele=mm.getTel();
				
				managername=mm.getName();
				managerid=mm.getId();
			}
		}
		if(selecttype.equals("User"))
	    {
			//User u=(User)se.getAttribute("CurrentLogin");//.getAttribute("CurrentLogin");
			int id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			u=msi.getUserDAO().queryById(id);
			if(u!=null)
			{
				name=u.getName();
				password=u.getPassword();
				mail=u.getMail();
				tele=u.getTel();
				
				username=u.getName();
				usermail=u.getMail();
				usertele=u.getTel();
				uservlevel=u.getVlevel();
				usermarks=u.getMarks();
				userleftmoney=u.getLeftmoney();
			}
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
		#userheadphoto { float:left; width:190; height:190; margin:0 auto;}
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent"> 
    <% if(selecttype!=null&&selecttype.equals("Boss"))
    {
    %>
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
    <tr>
        <td> 欢迎您！老板：</td><td><%=name%></td>
	</tr>
	<tr>
        <td>以下为您的相关信息：</td>
	</tr>
	<tr>
        <td>密码：</td><td><%=password%></td>
	</tr>
	<tr>
        <td> 邮箱：</td><td><%=mail%></td>
	</tr>
	<tr>
        <td>联系方式：</td><td><%=tele%></td>
	</tr>
	<tr>
        <td>居住地址：</td><td><%=adress%></td>
	</tr>
	<tr>
        <td>真实姓名：</td><td><%=truename%></td>
	</tr>
	</table>
    <a href="MessageChange.jsp" id="BossMessageChange">
  		修改个人信息
  	</a>
  	<br>
  	<a href="index.jsp">返回主页</a>
  	</div>
    <% 
    }
    if(selecttype!=null&&selecttype.equals("Manager"))
    {
	%>
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
	<table>
	<tr>
  		<td>欢迎您！管理员：</td><td><%=name%></td>
  	</tr>
  	<tr>
  		<td>以下为您的相关信息：</td>
  	</tr>
  	<tr>
  		<td>密码：</td><td><%=password%></td>
  	</tr>
  	<tr>
  		<td>邮箱：</td><td><%=mail%></td>
  	</tr>
  	<tr>
  		<td>联系方式：</td><td><%=tele%></td>
  	</tr>
  	</table>
  	<a href="MessageChange.jsp" id="ManagerMessageChange">
  		修改个人信息
  	</a>
  	<br>
  	<a href="index.jsp">返回主页</a>
  	</div>
    <% 
    }
    if(selecttype!=null&&selecttype.equals("User"))
    {
	%>
	<div id="sidebar">
  			<div id="userheadphoto">
    		<img src="<%=request.getContextPath()%><%=u.getHeadphoto().getPath()%>" height="190" width="190"/>
    		</div>
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
	<table>
	<tr>
  		<td>欢迎您！顾客：</td><td><%=name%></td>
  	</tr>
  	<tr>
  		<td>以下为您的相关信息：</td>
  	</tr>
  	<tr>
  		<td>密码：</td><td><%=password%></td>
  	</tr>
  	<tr>
  		<td>邮箱：</td><td><%=mail%></td>
  	</tr>
  	<tr>
  		<td>联系方式：</td><td><%=tele%></td>
  	</tr>
  	</table>
  	<a href="MessageChange.jsp" id="UserMessageChange">
  		修改个人信息
  	</a>
  	<br>
  	<a href="index.jsp">返回主页</a>
  	</div>
    <%
    }
     %>
  </div>
  </div>
  </div>
  </body>
</html>
