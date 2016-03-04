<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" 
import="Model.User" import="Model.Boss" import="Model.Manager" import="Service.ManagerServiceImpl"
import="Service.UserServiceImpl" import="Service.BossServiceImpl" import="Model.Transrecord"
import="Model.Shop" import="Model.Goods" import="Model.Comment"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评论信息</title>
    
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
		UserServiceImpl usi=new UserServiceImpl();
		BossServiceImpl bsi=new BossServiceImpl();
		int upid=0;
		
		String selecttype=null;
		String selectshowway=null;
		String searchfile=null;
		int recordnum=0;
		
		String commenttext=null;
		String goodsname=null;
		String username=null;
		String shopname=null;
		
		Boss b=new Boss();
		User u=new User();
		Manager mm=new Manager();
		
		String managername=null;
		int managerid=0;
		
		String bossname=null;
		int bossid=0;
		String shopname2=null;
		String shopadress=null;
		int shopmarks=0;
		int shoplevel=0; 
		
		String username2=null;
		String usermail=null;
		String usertele=null;
		int uservlevel=0;
		int usermarks=0;
		double userleftmoney=0;
		
		List<Comment> comments=new ArrayList<Comment>();
		if(se!=null)
		{
			selecttype=se.getAttribute("selecttype").toString();
			selectshowway=request.getParameter("selectshowway");
			searchfile=request.getParameter("searchfile");
			if(selecttype!=null&&selecttype.equals("Manager"))
			{
				comments=msi.queryAllComment();
				int mid=(Integer)se.getAttribute("CurrentLogin");
				mm=msi.getManagerDAO().queryById(mid);
				managername=mm.getName();
				managerid=mm.getId();
			}
			if(selecttype!=null&&selecttype.equals("User"))
			{
				//u=(User)se.getAttribute("CurrentLogin");
				upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				u=usi.getUserDAO().queryById(upid);
				
				comments=usi.queryComments(u);
				
				username2=u.getName();
				usermail=u.getMail();
				usertele=u.getTel();
				uservlevel=u.getVlevel();
				usermarks=u.getMarks();
				userleftmoney=u.getLeftmoney();
			}
			if(selecttype!=null&&selecttype.equals("Boss"))
			{
				//b=(Boss)se.getAttribute("CurrentLogin");
				upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				b=bsi.getBossDAO().queryById(upid);
				
				int id=Integer.parseInt(request.getParameter("goodsid"));
				se.setAttribute("CurrentSelectGoods", id);
				Goods gg=bsi.getGoodsDAO().queryById(id);
				comments=bsi.getCommentDAO().queryByGoods(gg);
				
				bossname=b.getName();
				bossid=b.getId();
				shopname2=b.getShop().getName();
				shopadress=b.getShop().getAdress();
				shopmarks=b.getShop().getMarks();
				shoplevel=b.getShop().getLevel();
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
		#userheadphoto { float:left; width:190; height:190; margin:0 auto;}
	</style>
  </head>
  
  <body>
  <div id="allcontainer">
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  	<%
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
  	
  	<s:form action="showcomment">
  		<table>
  		<tr>
  		<td><label for="selectshowway">按 :</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="A">常规</option>
  			<option value="B">用户名</option>
  			<option value="C">店铺名</option>
  			<option value="D">商品名</option>
  		</select></td>
  		<td> 查询,请输入(人名/店名/货物名)：</td><td><input name="searchfile" type="text"></td>
  		<td><s:submit value="开始查询"/></td>
  		</tr>
  		</table>
  	</s:form>
  	
  	<%
  		if(selectshowway==null||selectshowway=="A")
  		{
  			if(comments!=null&&!comments.isEmpty())
  			{
  				for(int k=0;k<comments.size();k++)
  				{
  					goodsname=comments.get(k).getGoods().getName();
  					shopname=comments.get(k).getGoods().getShop().getName();
  					username=comments.get(k).getUser().getName();
  					commenttext=comments.get(k).getText();
  					%>
  					<table frame="above" width="600px" height="50px" bgcolor="#cff">
  					<tr>
  					<td>店铺：</td><td><%=shopname%></td><td>评论人：</td><td><%=username%></td><td>商品名：</td><td><%=goodsname%></td>
  					</tr>
  					<tr>
  					<td>评论内容：&nbsp;</td><td colspan="4"><%=commenttext%></td>
  					</tr>
  					</table>
  					<s:form action="comment_delete">
  						<input type="hidden" name="commentid" value="<%=comments.get(k).getId()%>"/>
  						<table frame="above" width="600px" height="5px" bgcolor="#cff">
  						<tr>
  						<td align="left"><s:submit value="删除" style="width:100px"/></td>
  						</tr>
  						</table>
  					</s:form>
  					
  					<%
  					recordnum++;
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有评论！！！</td></tr></table>
  				<%
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="B")
  		{
  			if(searchfile!=null)
  			{
  				User u2=usi.getUserDAO().queryByName(searchfile);
  				if(u2!=null)
  				{
  					comments=u2.getComments();
  				}
  				if(comments!=null&&!comments.isEmpty())
  				{
  					for(int k=0;k<comments.size();k++)
  					{
  						goodsname=comments.get(k).getGoods().getName();
  						shopname=comments.get(k).getGoods().getShop().getName();
  						username=comments.get(k).getUser().getName();
  						commenttext=comments.get(k).getText();
  						%>
  						<table frame="above" width="600px" height="50px" bgcolor="#cff">
  					<tr>
  					<td>店铺：</td><td><%=shopname%></td><td>评论人：</td><td><%=username%></td><td>商品名：</td><td><%=goodsname%></td>
  					</tr>
  					<tr>
  					<td>评论内容：&nbsp;</td><td colspan="4"><%=commenttext%></td>
  					</tr>
  					</table>
  					<s:form action="comment_delete">
  						<input type="hidden" name="commentid" value="<%=comments.get(k).getId()%>"/>
  						<table frame="above" width="600px" height="5px" bgcolor="#cff">
  						<tr>
  						<td align="left"><s:submit value="删除" style="width:100px"/></td>
  						</tr>
  						</table>
  					</s:form>
  						<%
  						recordnum++;
  					}
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有评论！！！</td></tr></table>
  				<%
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="C")
  		{
  			if(searchfile!=null)
  			{
  				List<Shop> shops=msi.getShopDAO().queryByName(searchfile);
  				if(shops!=null&&!shops.isEmpty())
  				{
  					for(int i=0;i<shops.size();i++)
  					{
  						List<Goods> gos=msi.getGoodsDAO().queryByShop(shops.get(i));
  						if(gos!=null&&!gos.isEmpty())
  						{
  							for(int j=0;j<gos.size();j++)
  							{
  								List<Comment> cos=msi.getCommentDAO().queryByGoods(gos.get(j));
  								if(cos!=null&&!cos.isEmpty())
  								{
  									for(int k=0;k<cos.size();k++)
  									{
  										comments.add(cos.get(k));
  									}
  								}
  							}
  						}
  					}
  				}
  				if(comments!=null&&!comments.isEmpty())
  				{
  					for(int k=0;k<comments.size();k++)
  					{
  						goodsname=comments.get(k).getGoods().getName();
  						shopname=comments.get(k).getGoods().getShop().getName();
  						username=comments.get(k).getUser().getName();
  						commenttext=comments.get(k).getText();
  						%>
  						<table frame="above" width="600px" height="50px" bgcolor="#cff">
  					<tr>
  					<td>店铺：</td><td><%=shopname%></td><td>评论人：</td><td><%=username%></td><td>商品名：</td><td><%=goodsname%></td>
  					</tr>
  					<tr>
  					<td>评论内容：&nbsp;</td><td colspan="4"><%=commenttext%></td>
  					</tr>
  					</table>
  					<s:form action="comment_delete">
  						<input type="hidden" name="commentid" value="<%=comments.get(k).getId()%>"/>
  						<table frame="above" width="600px" height="5px" bgcolor="#cff">
  						<tr>
  						<td align="left"><s:submit value="删除" style="width:100px"/></td>
  						</tr>
  						</table>
  					</s:form>
  						<%
  						recordnum++;
  					}
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有评论！！！</td></tr></table>
  				<%
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="D")
  		{
  			if(searchfile!=null)
  			{
  				List<Goods> goodss=msi.queryGoods(searchfile);
  				if(goodss!=null&&!goodss.isEmpty())
  				{
  					for(int j=0;j<goodss.size();j++)
  					{
  						List<Comment> cos=msi.getCommentDAO().queryByGoods(goodss.get(j));
  						if(cos!=null&&!cos.isEmpty())
  						{
  							for(int k=0;k<cos.size();k++)
  							{
  								comments.add(cos.get(k));
  							}
  						}
  					}
  				}
  				if(comments!=null&&!comments.isEmpty())
  				{
  					for(int k=0;k<comments.size();k++)
  					{
  						goodsname=comments.get(k).getGoods().getName();
  						shopname=comments.get(k).getGoods().getShop().getName();
  						username=comments.get(k).getUser().getName();
  						commenttext=comments.get(k).getText();
  						%>
  						<table frame="above" width="600px" height="50px" bgcolor="#cff">
  					<tr>
  					<td>店铺：</td><td><%=shopname%></td><td>评论人：</td><td><%=username%></td><td>商品名：</td><td><%=goodsname%></td>
  					</tr>
  					<tr>
  					<td>评论内容：&nbsp;</td><td colspan="4"><%=commenttext%></td>
  					</tr>
  					</table>
  					<s:form action="comment_delete">
  						<input type="hidden" name="commentid" value="<%=comments.get(k).getId()%>"/>
  						<table frame="above" width="600px" height="5px" bgcolor="#cff">
  						<tr>
  						<td align="left"><s:submit value="删除" style="width:100px"/></td>
  						</tr>
  						</table>
  					</s:form>
  						<%
  						recordnum++;
  					}
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有评论！！！</td></tr></table>
  				<%
  			}
  		}
  		%>
  		<br>
  		<a href="ManagerManagement.jsp">返回管理界面</a>
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
    			<td>用户名：</td><td><%=username2%></td>
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
  		if(comments!=null&&!comments.isEmpty())
  		{
  			for(int k=0;k<comments.size();k++)
  			{
  				goodsname=comments.get(k).getGoods().getName();
  				shopname=comments.get(k).getGoods().getShop().getName();
  				username=comments.get(k).getUser().getName();
  				commenttext=comments.get(k).getText();
  				%>
  				<table frame="above" width="600px" height="50px" bgcolor="#cff">
  				<tr>
  				<td>店铺：</td><td><%=shopname%></td><td>评论人：</td><td><%=username%></td><td>商品名：</td><td><%=goodsname%></td>
  				</tr>
  				<tr>
  				<td>评论内容：&nbsp;</td><td colspan="4"><%=commenttext%></td>
  				</tr>
  				</table>
  				<%
  				recordnum++;
  			}
  		}
  		else
  		{
  			%>
  			<table><tr><td>没有评论！！！</td></tr></table>
  			<%
  		}
  		%>
  		<br>
  		<a href="UserManagement.jsp">返回管理界面</a>
  		</div>
  		
  		<%
  	}
  	if(selecttype!=null&&selecttype.equals("Boss"))
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
        	<td>店名：</td><td><%=shopname2%></td>
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
  		<%
  		if(comments!=null&&!comments.isEmpty())
  		{
  			for(int k=0;k<comments.size();k++)
  			{
  				goodsname=comments.get(k).getGoods().getName();
  				shopname=comments.get(k).getGoods().getShop().getName();
  				username=comments.get(k).getUser().getName();
  				commenttext=comments.get(k).getText();
  				%>
  				<table frame="above" width="600px" height="50px" bgcolor="#cff">
  				<tr>
  				<td>店铺：</td><td><%=shopname%></td><td>评论人：</td><td><%=username%></td><td>商品名：</td><td><%=goodsname%></td>
  				</tr>
  				<tr>
  				<td>评论内容：&nbsp;</td><td colspan="4"><%=commenttext%></td>
  				</tr>
  				</table>
  				<%
  				recordnum++;
  			}
  		}
  		else
  		{
  			%>
  			<table><tr><td>没有评论！！！</td></tr></table>
  			<%
  		}
  		%>
  		<br>
  		<a href="ShowShopGoods.jsp">返回商品列表</a>
  		</div>
  		<%
  	}
  	%>
  	</div>
  	</div>
  	</div>
  </body>
</html>
