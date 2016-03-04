<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="java.io.*" 
import="Service.BossServiceImpl" import="Model.Picture" import="Model.Goods"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品图片上传</title>
    
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
		String gid=request.getParameter("gid");
		BossServiceImpl bsi=new BossServiceImpl();
		String imgpath=null;
		List<Picture> pics=new ArrayList<Picture>();
		if(gid!=null)
		{
			se.setAttribute("gid",gid);
		}
		else
		{
			gid=se.getAttribute("gid").toString();
		}
		
		int gsid=Integer.parseInt(gid);
		if(gsid!=0)
		{	Goods g=bsi.getGoodsDAO().queryById(gsid);
			pics=bsi.getPictureDAO().queryByGoods(g);
			//imgpath=usi.getUserDAO().queryById(usid).getHeadphoto().getPath();
		}
	%><style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:4000px;}
		a:hover { color:#ff0;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:3800px; background:#9ff;}
		#content { float:right; width:900px; height:3800px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  <div id="content">
  	<center>
    
    <%
    if(pics!=null&&!pics.isEmpty())
    {
    	for(int i=0;i<pics.size();i++)
    	{
    		imgpath=pics.get(i).getPath();
    		imgpath=request.getContextPath()+imgpath;
    		%>
    		<div><img src="<%=imgpath%>" height="190" width="190"/></div>
    		<br>
    		<s:form action="deletegoodspicture">
    			<input type="hidden" name="picid" value="<%=pics.get(i).getId()%>">
    			<input type="hidden" name="id" value="<%=gsid%>">
    			<s:submit value="删除"/>
    		</s:form>
    		<%
    	}
    	
    }
    %>
    <form action="uploadgoodspicture" method="POST" enctype="multipart/form-data">
    	<input type="file" name="upload" ><s:fielderror cssStyle="color: red"/><br>
    	<input type="hidden" name="id" value="<%=gsid%>">
    	<!-- <input type="hidden" name="id" value="134"> -->
    	<input type="submit" value="添加"/>
    </form>
  	</center>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
