<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User"
import="Model.Sendmessage" import="Service.UserServiceImpl"%>
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
    
    <title>用户送货信息</title>
    
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
		User u=new User();
		
		int id=0;
		UserServiceImpl usi=new UserServiceImpl();
		
		List<Sendmessage> sendmessages=new ArrayList<Sendmessage>();
		
		int sendmessageid=0;
		String sendadress=null;
  		String sendtoname=null;
  		String sendpostcode=null;
  		
  		String username=null;
		String usermail=null;
		String usertele=null;
		int uservlevel=0;
		int usermarks=0;
		double userleftmoney=0;
		
		if(se!=null)
		{
			//u=(User)se.getAttribute("CurrentLogin");
			id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			u=usi.getUserDAO().queryById(id);
			
			//sendmessages=u.getSendmessages();
			sendmessages=usi.querySendmessage(u);
			
			username=u.getName();
			usermail=u.getMail();
			usertele=u.getTel();
			uservlevel=u.getVlevel();
			usermarks=u.getMarks();
			userleftmoney=u.getLeftmoney();
		}
	%>
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:1200px;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:1000px; background:#6f6;}
		#content { float:right; width:695px; height:1000px;background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
		#userheadphoto { float:left; width:190; height:190; margin:0 auto;}
		a:hover { color:#ff0;}
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
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
    <% 
    	if(sendmessages!=null&&!sendmessages.isEmpty())
    	{
    		for(int i=0;i<sendmessages.size();i++)
    		{
    			Sendmessage sm=sendmessages.get(i);
    			sendmessageid=sm.getId();
    			sendtoname=sm.getToname();
    			sendadress=sm.getAdress();
    			sendpostcode=sm.getPostcode();
    		%>
    		<table width="600px" height="10px" frame="above" bgcolor="#cff">
    		<tr>
    			<td>收件人：</td><td><%=sendtoname%></td><td>送货地址：</td><td><%=sendadress%></td><td>目的地邮政编码：</td><td><%=sendpostcode%></td>
    		</tr>
    		</table>
    		
    		<table width="600px" height="10px" bgcolor="#cff">
    		<s:form action="usermanagement_sendmessage_delete">
    			<input type="hidden" name="sendmessageid" value="<%=sendmessageid%>">
    			<tr align="left"><td><s:submit value="删除" style="width:100px"/></td></tr>
    		</s:form>
    		<c:form action="usermanagement_sendmessage_update_jump">
    			<input type="hidden" name="sendmessageid" value="<%=sendmessageid%>">
    			<tr align="left"><td><c:submit value="更新" style="width:100px"/></td></tr>
    		</c:form>
    		</table>
    		<%
    		}
    	}
    %>
    	<s:form action="usermanagement_sendmessage_add_jump">
    		<input type="hidden" name="add" value="Add">
    		<table width="600px" height="10px" bgcolor="#cff" frame="above"><tr align="left"><td><s:submit value="添加新地址" style="width:100px"/></td></tr></table>
    	</s:form>
    <br>
    <a href="UserManagement.jsp">返回用户管理界面</a>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
