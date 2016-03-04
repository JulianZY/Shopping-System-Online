<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Goodstype" 
import="Service.ManagerServiceImpl" import="Model.Manager"%>
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
    
    <title>商品类型管理</title>
    
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
		int typenum=0;
		String gtype=null;
		int typeid=0;
		List<Goodstype> goodstypes=new ArrayList<Goodstype>();
		ManagerServiceImpl msi=new ManagerServiceImpl();
		
		int mid=(Integer)se.getAttribute("CurrentLogin");
		Manager mm=msi.getManagerDAO().queryById(mid);
		String managername=mm.getName();
		int managerid=mm.getId();
		
		goodstypes=msi.queryAllGoodstype();
		//response.setContentType("text/html;charset=gb2312");
		//request.setCharacterEncoding("gb2312");
	%>
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:6000px;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:5800px; background:#6f6;}
		#content { float:right; width:695px; height:5800px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
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
  	<br>
  	<%
  		if(goodstypes!=null&&!goodstypes.isEmpty()) 
  		{ 
  			for(int i=0;i<goodstypes.size();i++) 
  			{
  				gtype=goodstypes.get(i).getType();
  				typeid=goodstypes.get(i).getId();
  			%>
  			<table frame="above" width="600px" height="5px" bgcolor="#cff">
  			<tr>
  			<td><%=gtype%></td>
  			</tr>
  			</table>
  			<s:form action="managegoodstypes_delete">
  			
  			<input name="typeid" type="hidden" value="<%=typeid%>"/>
  			<table width="600px" height="5px" bgcolor="#cff">
  			<tr>
  		    <td><s:submit value="删除"/></td>
  		    </tr>
  		    </table>
  		    </s:form>
  		    <c:form action="managegoodstypes_change">
  		   <input name="signal5" type="hidden" value="x"/>
  			<input name="typeid" type="hidden" value="<%=typeid%>"/>
  			<table frame="below" width="600px" height="5px" bgcolor="#cff">
  			<tr>
  			<td>修改:</td><td><input name="type" type="text"/></td>
  		   	<td><c:submit value="修改"/></td>
  		   	</tr>
  		   	</table>
  		    </c:form>
  			<%
  			typenum++;
  			}
  		 } 
  		 else 
  		 {
  		 	%>
  			<table><tr><td>没有分类条目!!!</td></tr></table>
  			<%
  		}
  	%>
  	
  	
  	<z:form action="managegoodstypes_add"> <!--   method="post"    -->
  			<%-- <z:textfield name="type" label="请输入添加的类型"/> --%>
  			<input name="signal5" type="hidden" value="x"/>
  			<table frame="box" width="600px" height="10px" bgcolor="#cff">
  			<tr><td>添加:<input name="type" type="text"/></td>
  			<td><z:submit value="添加"/></td></tr>
  			 </table>
  	</z:form>
  	

  	<br>
  	<a href="ManagerManagement.jsp">返回管理界面</a>
  		</div>
  	</div>
  	</div>
  	</div>
  </body>
</html>
