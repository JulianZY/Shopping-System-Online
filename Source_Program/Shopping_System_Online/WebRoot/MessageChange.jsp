<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Boss" import="Model.Manager"
 import="Model.User" import="Dao.UserDAO" import="Dao.BossDAO" import="Dao.ManagerDAO" import="Service.ManagerServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    
    <title>个人信息更新</title>
    
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
		ManagerServiceImpl msi=new ManagerServiceImpl();
		
		String selecttype=null;
		User u=new User();
		Boss b=new Boss();
		Manager m=new Manager();
		String id=null;
		
		String bossname=null;
		int bossid=0;
		String shopname=null;
		String shopadress=null;
		int shopmarks=0;
		int shoplevel=0; 
		
		String username=null;
		String usermail=null;
		String usertele=null;
		int uservlevel=0;
		int usermarks=0;
		double userleftmoney=0;
		
		String managername=null;
		int managerid=0;
		
		if(se!=null)
		{
			selecttype=se.getAttribute("selecttype").toString();
			id=request.getParameter("id");
			if(selecttype.equals("User"))
			{
				//u=(User)se.getAttribute("CurrentLogin");
				upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				u=msi.getUserDAO().queryById(upid);
				
				username=u.getName();
				usermail=u.getMail();
				usertele=u.getTel();
				uservlevel=u.getVlevel();
				usermarks=u.getMarks();
				userleftmoney=u.getLeftmoney();
				
			}
			if(selecttype.equals("Boss"))
			{
				//b=(Boss)se.getAttribute("CurrentLogin");
				upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				b=msi.getBossDAO().queryById(upid);
				
				bossname=b.getName();
				bossid=b.getId();
				shopname=b.getShop().getName();
				shopadress=b.getShop().getAdress();
				shopmarks=b.getShop().getMarks();
				shoplevel=b.getShop().getLevel();
				
			}
			if(selecttype.equals("Manager"))
			{
				//m=(Manager)se.getAttribute("CurrentLogin");
				upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				m=msi.getManagerDAO().queryById(upid);
				
				managername=m.getName();
				managerid=m.getId();
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
  	
    <% 
    if(selecttype!=null&&selecttype.equals("User")&&id==null)
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
    	
    			<s:form action="changemessage" validate="true">
    			    <input name="signal4" value="x" type="hidden">
    				<br><input name="selecttype" value="User" type="hidden">
    				<br><input name="id" value=<%=u.getId()%> type="hidden">
    				<table>
    				<tr><td>姓名（原值为：<%=u.getName()%>，不含特殊字符）：</td><td><input name="name" type="text"/></td><td><s:fielderror fieldName="name" cssStyle="color: red"/></td></tr>
    				<tr><td>邮箱（原值为：<%=u.getMail()%>）：</td><td><input name="mail" type="text"/></td><td><s:fielderror fieldName="mail" cssStyle="color: red"/></td></tr>
    				<tr><td>联系电话（原值为：<%=u.getTel()%>）：</td><td><input name="tele" type="text"/></td><td><s:fielderror fieldName="tele" cssStyle="color: red"/></td></tr>
    				<tr><td>旧密码：</td><td><input name="oldpassword" type="password"/></td><td><s:fielderror fieldName="oldpassword" cssStyle="color: red"/></td></tr>
					<tr><td>新密码(6~20位,不含特殊字符)：</td><td><input name="newpassword" type="password"/></td><td><s:fielderror fieldName="newpassword" cssStyle="color: red"/></td></tr>
    				<tr><td>确认密码：</td><td><input name="checkpassword" type="password"/></td><td><s:fielderror fieldName="checkpassword" cssStyle="color: red"/></td></tr>
    				<tr><td><s:submit value="保存修改" /></td><td><s:reset value="重置"/></td><td></td></tr>
    			</table>
    </s:form>
    
    <br>
    <a href="ShowMessage.jsp">取消</a>
    </div>
    <%
    } 
    if(selecttype!=null&&selecttype.equals("Manager")&&id==null)
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
    	
    <s:form action="changemessage" validate="true">
   		 <input name="signal4" value="x" type="hidden">
        <br><input name="selecttype" value="Manager" type="hidden">
        <br><input name="id" value=<%=m.getId()%> type="hidden">
        <table>
    	<tr><td>姓名（原值为：<%=m.getName()%>，不含特殊字符）：</td><td><input name="name" type="text"></td><td><s:fielderror fieldName="name" cssStyle="color: red"/></td></tr>
    	<tr><td>邮箱（原值为：<%=m.getMail()%>）：</td><td><input name="mail" type="text"></td><td><s:fielderror fieldName="mail" cssStyle="color: red"/></td></tr>
		<tr><td>联系电话（原值为：<%=m.getTel()%>）：</td><td><input name="tele" type="text"></td><td><s:fielderror fieldName="tele" cssStyle="color: red"/></td></tr>
		<tr><td>旧密码：</td><td><input name="oldpassword" type="password"></td><td><s:fielderror fieldName="oldpassword" cssStyle="color: red"/></td></tr>
		<tr><td>新密码(6~20位,不含特殊字符)：</td><td><input name="newpassword" type="password"></td><td><s:fielderror fieldName="newpassword" cssStyle="color: red"/></td></tr>
		<tr><td>确认密码：</td><td><input name="checkpassword" type="password"></td><td><s:fielderror fieldName="checkpassword" cssStyle="color: red"/></td></tr>
		<tr><td><s:submit value="保存修改" /></td><td><s:reset value="重置"/></td><td></td></tr>
		</table>
    	<!-- <input type="button" id="submit2" value="保存修改" onClick="changemanager(m,se)"> -->
    </s:form>
    	
    	<br>
		<a href="ShowMessage.jsp">取消</a>
		</div>
    <%
    }
    if(selecttype!=null&&selecttype.equals("Boss")&&id==null)
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
    	
    <s:form action="changemessage" validate="true">
    	<input name="signal4" value="x" type="hidden">
        <br><input name="selecttype" value="Boss" type="hidden">
        <br><input name="id" value=<%=b.getId()%> type="hidden">
        <table>
    	<tr><td>姓名（原值为：<%=b.getName()%>，不含特殊字符）：</td><td><input name="name" type="text"></td><td><s:fielderror fieldName="name" cssStyle="color: red"/></td></tr>
    	<tr><td>邮箱（原值为：<%=b.getMail()%>）：</td><td><input name="mail" type="text"></td><td><s:fielderror fieldName="mail" cssStyle="color: red"/></td></tr>
		<tr><td>联系电话（原值为：<%=b.getTel()%>）：</td><td><input name="tele" type="text"></td><td><s:fielderror fieldName="tele" cssStyle="color: red"/></td></tr>
		<tr><td>居住地址（原值为：<%=b.getAdress()%>）：</td><td><input name="adress" type="text"></td><td></td></tr>
		<tr><td>旧密码：</td><td><input name="oldpassword" type="password"></td><td><s:fielderror fieldName="oldpassword" cssStyle="color: red"/></td></tr>
		<tr><td>新密码(6~20位,不含特殊字符)：</td><td><input name="newpassword" type="password"></td><td><s:fielderror fieldName="newpassword" cssStyle="color: red"/></td></tr>
		<tr><td>确认密码：</td><td><input name="checkpassword" type="password"></td><td><s:fielderror fieldName="checkpassword" cssStyle="color: red"/></td></tr>
		<tr><td><s:submit value="保存修改" />&nbsp;&nbsp;&nbsp;&nbsp;<s:reset value="重置"/></td><td></td></tr>
		</table>
    	<!-- <input type="button" id="submit3" value="保存修改" onClick="changeboss(b,se)"> -->
    </s:form>
    	
    	<br>
		<a href="ShowMessage.jsp">取消</a>
	 	</div>
    <%
    }
    if(id!=null)
    {
    	%>
    	<div id="content">
    	<br>修改成功！！！
    	</div>
    	<%
    }
    %>
    <br>&nbsp;<a href="ShowMessage.jsp">返回</a>
  </div>
  </div>
  </div>
  </body>
</html>
