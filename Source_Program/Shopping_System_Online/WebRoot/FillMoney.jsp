<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User" 
import="Model.Bank" import="Model.Bankaccount" import="Dao.BankDAO" import="Dao.BankaccountDAO" 
import="Service.UserServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户充值</title>
    
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
		UserServiceImpl usi=new UserServiceImpl();
		int id=0;
		BankDAO bankDAO=new BankDAO();
		User u=new User();
		List<Bank> banks=bankDAO.queryAll();
		
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
    <s:form action="fillmoney">
    	<tr>
      	<td><label for="bankid">请选择银行:</label></td>
  		<td><select name="bankid" id="bankid">
    	<%
    	if(banks!=null&&!banks.isEmpty())
    	{
    		for(int i=0;i<banks.size();i++)
    		{
    		%>
    		<option value="<%=banks.get(i).getId()%>"><%=banks.get(i).getName()%></option>
    		<%
    		}
    	}
    	%>
    	</select></td>
    	</tr>
    	<tr>
    	   <td><input type="hidden" name="userid" value="<%=u.getId()%>"/></td>
    	</tr>
    	<tr>
			<td>账户名:</td><td><input type="text" name="bankaccountname" /></td>
		</tr>
		<tr>
        	<td>密码:</td><td><input type="password" name="bankaccountpassword" /></td>
        </tr>
        <tr>
        	<td>充值金额:</td><td><input type="text" name="fillmoneynumber" /></td>
        </tr>
        <tr>
			<td><s:submit value="提交"/></td>
		</tr>
    </s:form>
    </table>
    <br>
    <a href="UserManagement.jsp">取消/返回</a>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
