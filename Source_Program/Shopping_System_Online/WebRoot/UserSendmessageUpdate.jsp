<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User" 
import="Service.UserServiceImpl" import="Model.Sendmessage"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户送货信息更新</title>
    
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
		int upid=0;
		
		String sendmessageid=request.getParameter("sendmessageid");
		String add=request.getParameter("add");
		UserServiceImpl usi=new UserServiceImpl();
		User u=new User();
		int userid=0;
		Sendmessage send=new Sendmessage();
		
		String username=null;
		String usermail=null;
		String usertele=null;
		int uservlevel=0;
		int usermarks=0;
		double userleftmoney=0;
		
		if(se!=null)
		{
			//u=(User)se.getAttribute("CurrentLogin");
			upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			u=usi.getUserDAO().queryById(upid);
			userid=u.getId();
			
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
    <%
    	if(sendmessageid!=null)
    	{
    		int id=Integer.parseInt(sendmessageid);
    		send=usi.getSendmessageDAO().queryById(id);
    		%>
    		
    		<s:form action="usermanagement_sendmessage_update">
    			<input type="hidden" name="signal7" value="x">
    			<input type="hidden" name="sendmessageid" value="<%=send.getId()%>">
    		<tr>
    			<td>送达地址(<%=send.getAdress()%>)</td><td><input type="text" name="sendadress"/></td><td></td>
    		</tr>
    		<tr>
        		<td>收件人(<%=send.getToname()%>,不含特殊字符)</td><td><input type="text" name="sendtoname"/></td><td><s:fielderror fieldName="sendtoname" cssStyle="color: red"/></td>
			</tr>
    		<tr>
        		<td>目的地邮政编码(<%=send.getPostcode()%>,6位)</td><td><input type="text" name="sendpostcode"/></td><td><s:fielderror fieldName="sendpostcode" cssStyle="color: red"/></td>
			</tr>
    		<tr>
        		<td><s:submit value="保存修改"/></td><td><input type="reset" value="重置"></td>
        	</tr>
    		</s:form>
    		
    		<%
    	} 
    	if(add!=null)
    	{
    		%>
    		
    		<s:form action="usermanagement_sendmessage_add">
    			<input type="hidden" name="signal7" value="x">
    			<input type="hidden" name="userid" value="<%=userid%>">
    		<tr>
    			<td>送达地址:</td><td><input type="text" name="sendadress"/></td><td></td>
    		</tr>
    		<tr>
        		<td>收件人(不含特殊字符):</td><td><input type="text" name="sendtoname"/></td><td><s:fielderror fieldName="sendtoname" cssStyle="color: red"/></td>
			</tr>
    		<tr>
        		<td>目的地邮政编码(6位):</td><td><input type="text" name="sendpostcode"/></td><td><s:fielderror fieldName="sendpostcode" cssStyle="color: red"/></td>
			</tr>
    		<tr>
        		<td><s:submit value="新增记录"/></td><td><input type="reset" value="重置"></td>
        	</tr>
    		</s:form>
    		
    		<%
    	}
    %>
    </table>
    <br>
    <a href="UserManagement.jsp">返回</a>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
