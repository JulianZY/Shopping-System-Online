<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User" import="Model.Boss" import="Model.Manager" 
import="Dao.UserDAO" import="Dao.BossDAO" import="Dao.ManagerDAO" import="Service.ManagerServiceImpl"
import="Model.Goods" import="Model.Goodstype" import="Model.Picture" %>
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
    
    <title>梦想购物网站</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- <link rel="stylesheet" type="text/css" href="css/index.css"/> -->
	
	
	<script type="text/javascript">
	function changeimg()
	{
		var myimg = document.getElementById("code"); 
		now = new Date(); 
		myimg.src="makeCertPic.jsp?code="+now.getTime();
		
	} 
	</script>
	<style type="text/css">
		/* body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;} */
		#allcontainer {margin:0 auto; background-image:url(images/bigbackground.jpg);width:100%;height:1200px;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#sidebar { float:left; width:200px; height:1000px; background:#6f6;}
		#content { float:right; width:695px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
		#userheadphoto { float:left; width:190; height:190; margin:0 auto;}
				
		#content2 { float:right; width:695px; height:1000px; background-image:url(images/blank.png); solid:#dbdbdb;}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
		#content2 ul { padding:0 0 5px 0; overflow:auto;}
		#content2 ul li { width:134px; float:left; margin:5px 0 0px 11px; display:inline; text-align:center; list-style-type:none;}
		#content2 ul li a {	display:block;}
		#content2 ul li a:hover {	color:#ff0;}
		#content2 ul li img { margin-bottom:3px;}
		a:hover {	color:#ff0;}
	</style>
	<%
	HttpSession se=request.getSession();
	int id=0;
	//request.getParameter("name");
	//se.setAttribute("user", u);
	if(se.getAttribute("CurrentLogin")==null)
	{
		se.setAttribute("name", request.getParameter("name"));
		se.setAttribute("password", request.getParameter("password"));
		se.setAttribute("selecttype",request.getParameter("selecttype"));
		se.setAttribute("loginsignal", request.getParameter("loginsignal"));
	}
	else 
	{
		if(se.getAttribute("loginsignal")!=null&&se.getAttribute("loginsignal").toString().equals("T"))
		{
			if(request.getParameter("loginsignal")==null)
			{
			se.setAttribute("name",se.getAttribute("name"));
			se.setAttribute("password", se.getAttribute("password"));
			se.setAttribute("selecttype",se.getAttribute("selecttype"));
			se.setAttribute("loginsignal", "T");
			}
			else
			{
				se.setAttribute("loginsignal", "F");
			}
		} 
		if(se.getAttribute("loginsignal")!=null&&se.getAttribute("loginsignal").toString().equals("F"))
		{
	    se.setAttribute("name", request.getParameter("name"));
		se.setAttribute("password", request.getParameter("password"));
		se.setAttribute("selecttype",request.getParameter("selecttype"));
		se.setAttribute("loginsignal", request.getParameter("loginsignal"));
		}
	}
	
	String name=null;
	String password=null;
	String selecttype=null;
	String loginsignal=null;
	if(se.getAttribute("selecttype")!=null)
	{
		selecttype=se.getAttribute("selecttype").toString();
		loginsignal=se.getAttribute("loginsignal").toString();
	}
	if(loginsignal!=null&&loginsignal.equals("T"))
	{
	if(se.getAttribute("name")!=null&&se.getAttribute("password")!=null)
	{
		name=se.getAttribute("name").toString();
		password=se.getAttribute("password").toString();
		if(selecttype.equals("User"))
		{
		User u=new User();
	    UserDAO ud=new UserDAO();
		u=ud.queryByName(name);
		se.setAttribute("CurrentLogin", u.getId());
		}
		if(selecttype.equals("Boss"))
		{
		Boss b=new Boss();
	    BossDAO bd=new BossDAO();
		b=bd.queryByName(name);
		se.setAttribute("CurrentLogin", b.getId());
		}
		if(selecttype.equals("Manager"))
		{
		Manager m=new Manager();
	    ManagerDAO md=new ManagerDAO();
		m=md.queryByName(name);
		se.setAttribute("CurrentLogin", m.getId());
		System.out.println("Test a manager page!");
		}
		}
	}
	ManagerServiceImpl msi=new ManagerServiceImpl();
	List<Goods> allgoods=msi.getGoodsDAO().queryAll();
 	List<Goodstype> alltypes=msi.queryAllGoodstype();
 	String searchfile=request.getParameter("searchfile");
 	String selectshowtype=request.getParameter("selectshowtype");
 	%>
  </head>
  
  <body> 
    <div id="allcontainer">
 	<div id="container">													
    <div id="header"></div>
    <div id="mainContent">
    <%
    if(name==null&&password==null)
    {
    %>
    <div id="sidebar">
    please login!!!<br>没有账户？<a href="register.jsp" target="_blank">去注册</a><br>
    <a href="apply.jsp" target="_blank">申请注册店铺</a><br> 
    <% if(selecttype==null)
    	{
    %>
    		
       			<s:form action="login" style="height: 165px; width: 219px; " target="_blank">
       			<table>
 				<tr>
 					<td>
 						<label for="selecttype">请选择登录类型:</label>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<select name="selecttype" id="selecttype">
 							<option value="User">用户</option>
 							<option value="Boss">店主</option>
 							<option value="Manager">管理员</option>
 						</select>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<input name="loginsignal" value="T"
 							type="hidden"></td>
 				</tr>
 				<tr>
 					<td>姓名:</td>
 				</tr>
 				<tr>
 					<td>
 						<input type="text" name="name"></td>
 				</tr>
 				<tr>
 					<td>密码:</td>
 				</tr>
 				<tr>
 					<td>
 						<input type="password" name="password"></td>
 				</tr>
 				<tr>
 					<td>验证码：</td>
 				</tr>
 				<tr>
 					<td>
 						<input type="text" name="inputcertCode" />
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<img id="code" src="makeCertPic.jsp"></td>
 				</tr>
 				<tr>
 					<td>
 						<a href="javascript:changeimg()">看不清，换一张</a>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<s:submit value="登录"/>
 					</td>
 				</tr>
 				</table>
			</s:form>
		
 	</div>
 	
 	<div id="content2">
	
 		<s:form action="selectshowway_index">
 		<table>
 		<tr>
 		<td><label for="selectshowtype">请选择查询类型:</label></td>
 		<td><select name="selectshowtype" id="selectshowtype">
 		<% 
 		if(alltypes!=null&&!alltypes.isEmpty())
 		{
 			for(int j=0;j<alltypes.size();j++)
 			{
 				 Goodstype gt=alltypes.get(j);
 		%>
 			<option value="<%=gt.getId()%>"><%=gt.getType()%></option>
 		<% 
 			}
 		%>
 			<option value="<%=alltypes.size()%>">所有商品</option>
 		<%
 		}
 		
 		%>
 		</select></td>
 		<td>输入查询商品名：</td><td><input type="text" name="searchfile"></td>
 		<td><s:submit value="查询"/></td>
 		</tr>
 		</table>
 	</s:form>
 	
 	<ul>
 	<%
 		if(searchfile!=null&&selectshowtype!=null)
 		{
 			int typeid=Integer.parseInt(selectshowtype);
 			if(typeid==alltypes.size())
 			{
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						if(tg.getName().indexOf(searchfile)!=0||searchfile.indexOf(tg.getName())!=0||tg.getName().equals(searchfile))
 						{
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						}
 					}
 				}
 			}
 			if(typeid!=alltypes.size())
 			{
 				Goodstype tp3=msi.getGoodstypeDAO().queryById(typeid);
 				allgoods=msi.getGoodsDAO().queryByGoodstype(tp3);
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						if(tg.getName().indexOf(searchfile)!=0||searchfile.indexOf(tg.getName())!=0||tg.getName().equals(searchfile))
 						{
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						}
 					}
 				}
 			}
 		}
 		if(searchfile==null&&selectshowtype!=null)
 		{
 			int typeid=Integer.parseInt(selectshowtype);
 			if(typeid==alltypes.size())
 			{
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%></a></li>
 					<%
 						
 					}
 				}
 			}
 			if(typeid!=alltypes.size())
 			{
 				Goodstype tp3=msi.getGoodstypeDAO().queryById(typeid);
 				allgoods=msi.getGoodsDAO().queryByGoodstype(tp3);
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						
 					}
 				}
 			}
 		}
 		if(searchfile==null&&selectshowtype==null)
 		{
 			if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						
 					}
 				}
 		}
 	%>
 	</ul>
 	</div>
 <%
    	}
    }
    if(selecttype!=null)
 {
 	if(selecttype.equals("User"))
   {
   		int uid=(Integer)se.getAttribute("CurrentLogin");
   		User u=msi.getUserDAO().queryById(uid);	
   	%>
   	<div id="sidebar">
   			<div id="userheadphoto">
    		<img src="<%=request.getContextPath()+u.getHeadphoto().getPath()%>" height="190" width="190"/>
    		</div>
    		welcome!!!<%=name%><br>
   			<a href="ShowMessage.jsp">查看我的信息</a><br>
   			<a href="UserManagement.jsp">我的空间</a><br>
   			<a href="index.jsp?loginsignal=F">注销登录</a><br>
   	</div>
   	
   	<div id="content2">
	
 		<s:form action="selectshowway_index">
 		<table>
 		<tr>
 		<td><label for="selectshowtype">请选择查询类型:</label></td>
 		<td><select name="selectshowtype" id="selectshowtype">
 		<% 
 		if(alltypes!=null&&!alltypes.isEmpty())
 		{
 			for(int j=0;j<alltypes.size();j++)
 			{
 				 Goodstype gt=alltypes.get(j);
 		%>
 			<option value="<%=gt.getId()%>"><%=gt.getType()%></option>
 		<% 
 			}
 		%>
 			<option value="<%=alltypes.size()%>">所有商品</option>
 		<%
 		}
 		
 		%>
 		</select></td>
 		<td>输入查询商品名：</td><td><input type="text" name="searchfile"></td>
 		<td><s:submit value="查询"/></td>
 		</tr>
 		</table>
 	</s:form>
 	
 	<ul>
 	<% 
 	
 	if(se.getAttribute("CurrentLogin")!=null)
 	{
 		int userid3=(Integer)se.getAttribute("CurrentLogin");
 		User u3=msi.getUserDAO().queryById(userid3);
 		if(searchfile!=null&&selectshowtype!=null)
 		{
 			int typeid=Integer.parseInt(selectshowtype);
 			if(typeid==alltypes.size())
 			{
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						if(tg.getName().indexOf(searchfile)!=0||searchfile.indexOf(tg.getName())!=0||tg.getName().equals(searchfile))
 						{
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>&orderuser=<%=u3.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						}
 					}
 				}
 			}
 			if(typeid!=alltypes.size())
 			{
 				Goodstype tp3=msi.getGoodstypeDAO().queryById(typeid);
 				allgoods=msi.getGoodsDAO().queryByGoodstype(tp3);
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						if(tg.getName().indexOf(searchfile)!=0||searchfile.indexOf(tg.getName())!=0||tg.getName().equals(searchfile))
 						{
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>&orderuser=<%=u3.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						}
 					}
 				}
 			}
 		}
 		if(searchfile==null&&selectshowtype!=null)
 		{
 			int typeid=Integer.parseInt(selectshowtype);
 			if(typeid==alltypes.size())
 			{
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>&orderuser=<%=u3.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						
 					}
 				}
 			}
 			if(typeid!=alltypes.size())
 			{
 				Goodstype tp3=msi.getGoodstypeDAO().queryById(typeid);
 				allgoods=msi.getGoodsDAO().queryByGoodstype(tp3);
 				if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>&orderuser=<%=u3.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						
 					}
 				}
 			}
 		}
 		if(searchfile==null&&selectshowtype==null)
 		{
 			if(allgoods!=null&&!allgoods.isEmpty())
 				{
 					for(int i=0;i<allgoods.size();i++)
 					{
 						Goods tg=allgoods.get(i);
 						
 							List<Picture> ps=msi.getPictureDAO().queryByGoods(tg);
 							Picture tp=new Picture();
 							if(ps!=null&&!ps.isEmpty())
 								tp=ps.get(0);
 						
 					%>
 					<li style="list-style-type:none;"><a href="GoodsWatch.jsp?ordergoods=<%=tg.getId()%>&orderuser=<%=u3.getId()%>" target="_blank"><img src="<%=request.getContextPath()+tp.getPath()%>" height="134" width="90"/><br><%=tg.getName()%><br><%=tg.getPrice()%>元</a></li>
 					<%
 						
 					}
 				}
 		}
 	}
 	%>
 	</ul>
 	</div>
   	<%
   }
 }
  %>
 <%if(selecttype!=null)
 {
  if(selecttype.equals("Manager"))
 {
 	String managername=null;
	int managerid=0;
	int mid=(Integer)se.getAttribute("CurrentLogin");
	Manager mm=msi.getManagerDAO().queryById(mid);
	if(mm!=null)
	{
		managername=mm.getName();
		managerid=mm.getId();
	}
 %>
 <div id="sidebar">
  			<table>
  				<tr>
  				<td>welcome!!!</td><td></td>
  				</tr>
  				<tr>
            	  <td>管理员:</td><td><%=managername%></td>
            	  </tr>
            	  <tr>
            	  <td>ID:</td><td><%=managerid%></td>
            	  </tr>
            </table>
 </div>
 <div id="content">
  <a href="ShowMessage.jsp">查看我的信息</a><br>
  <a href="ManagerManagement.jsp">进入管理界面</a><br>
  <a href="index.jsp?loginsignal=F">注销登录</a><br>
  </div>
  <%
  }
 if(selecttype.equals("Boss"))
 {
 	String bossname=null;
	int bossid=0;
	String shopname=null;
	String shopadress=null;
	int shopmarks=0;
	int shoplevel=0; 
	
	int bid=(Integer)se.getAttribute("CurrentLogin");
	Boss b=msi.getBossDAO().queryById(bid);
	if(b!=null)
	{
		bossname=b.getName();
		bossid=b.getId();
		shopname=b.getShop().getName();
		shopadress=b.getShop().getAdress();
		shopmarks=b.getShop().getMarks();
		shoplevel=b.getShop().getLevel();
	}
 %>
 <div id="sidebar">
  			<table>
  			<tr>
  				<td>welcome!!!</td><td></td>
  			</tr>
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
				<td>等级:</td><td><%=shoplevel%></td>
			</tr>
    		</table>
	</div>
  <div id="content">
  <a href="ShowMessage.jsp">查看我的信息</a><br>
  <a href="BossManagement.jsp">我的店铺</a><br>
  <a href="index.jsp?loginsignal=F">注销登录</a><br>
  </div>
 <% 
   }
  }
 if(se!=null&&(se.getAttribute("CurrentLogin")==null||"User".equals(((String)se.getAttribute("selecttype")))))
 {
 	%>
 	
 	<%
 	
}
 
 if(request.getAttribute("loginsignal")=="F")
  		{
  			se.invalidate();
  		}
 %>
 </div>
 </div>
 </div>
  </body>
</html>
