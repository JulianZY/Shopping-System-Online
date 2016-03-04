<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.User"
import="Model.Boss" import="Service.BossServiceImpl" import="Service.UserServiceImpl"
import="Model.Orderlist" import="Model.Goods"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
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
    
    <title>订单信息</title>
    
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
		int id=0;
		
		User u=new User();
		Boss b=new Boss();
		UserServiceImpl usi=new UserServiceImpl();
		BossServiceImpl bsi=new BossServiceImpl();
		String selecttype=null;
		List<Orderlist> orderlists=new ArrayList<Orderlist>();
		String selectshowway=request.getParameter("selectshwoway");
		String searchfile=request.getParameter("searchfile");
		
		int orderlistid=0;
		int orderliststatus=0;
		int orderlistnum=0;
		double orderlistpay=0;
		double Allpay=0;
		double leftmoney=0;
		
		String orderlistusername=null;
		String orderlistgoodsname=null;
		String orderlistshopname=null;
		String orderlisttime=null;
		String orderlistaddmessage=null;
		String sendadress=null;
  		String sendtoname=null;
  		String sendpostcode=null;
		
		String submitstring="";
		
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
		
		
		if(se!=null)
		{
			selecttype=se.getAttribute("selecttype").toString();
			if(selecttype!=null&&selecttype.equals("User"))
			{
				//u=(User)se.getAttribute("CurrentLogin");
				id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				u=usi.getUserDAO().queryById(id);
				
				leftmoney=u.getLeftmoney();
				orderlists=bsi.getOrderlistDAO().queryByUser(u);
				
				username=u.getName();
				usermail=u.getMail();
				usertele=u.getTel();
				uservlevel=u.getVlevel();
				usermarks=u.getMarks();
				userleftmoney=u.getLeftmoney();
				
			}
			if(selecttype!=null&&selecttype.equals("Boss"))
			{
				//b=(Boss)se.getAttribute("CurrentLogin");
				id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				b=bsi.getBossDAO().queryById(id);
								
				bossname=b.getName();
				bossid=b.getId();
				shopname=b.getShop().getName();
				shopadress=b.getShop().getAdress();
				shopmarks=b.getShop().getMarks();
				shoplevel=b.getShop().getLevel();
				
				List<Goods> gos=bsi.queryAllGoods(b.getShop());
				if(gos!=null&&!gos.isEmpty())
				{
					for(int i=0;i<gos.size();i++)
					{
						List<Orderlist> ols=bsi.getOrderlistDAO().queryByGoods(gos.get(i));
						if(ols!=null&&!ols.isEmpty())
						{
							for(int j=0;j<ols.size();j++)
							{
								Orderlist o=ols.get(j);
								orderlists.add(o);
							}
						}
					}
				}
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
  			<%
  			if(orderlists!=null&&!orderlists.isEmpty()) 
  			{ 
  				for(int k=0;k<orderlists.size();k++) 
  				{
  					orderlistid=orderlists.get(k).getId();
  					orderlistnum=orderlists.get(k).getNum();
  					orderliststatus=orderlists.get(k).getStatus();
  					orderlistaddmessage=orderlists.get(k).getAddmessage();
  					if(orderliststatus==0) 
  					{ 
  						submitstring+=orderlistid+"#";
  						orderlistpay=orderlists.get(k).getAmountpay();
  						orderlistusername=orderlists.get(k).getUser().getName();
  						orderlistgoodsname=orderlists.get(k).getGoods().getName();
  						orderlistshopname=orderlists.get(k).getGoods().getShop().getName();
  						orderlistshopname=orderlists.get(k).getFromdate().toString();
  						sendtoname=orderlists.get(k).getSendmessage().getToname();
  					    sendadress=orderlists.get(k).getSendmessage().getAdress();
  					    sendpostcode=orderlists.get(k).getSendmessage().getPostcode();
  						%>
  						<table frame="box" width="600px" height="100px" bgcolor="#cff">
  						<tr>
  							<td>订单号：</td><td><%=orderlistid%></td><td>商品名：</td><td><%=orderlistgoodsname%></td><td>店铺名：</td><td><%=orderlistshopname%></td>
  						</tr>
  						<tr>
  							<td>交易数目：</td><td><%=orderlistnum%></td><td>交易金额：</td><td><%=orderlistpay%></td><td>下单时间：</td><td><%=orderlisttime%></td>
  						</tr>
  						<tr>
  							<td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td>
  						</tr>
  						<tr>
  							<td>备注：</td><td><%=orderlistaddmessage%></td>
  						</tr>
  						</table>
  						<s:form action="orderlist_delete">
  							<input name="orderlistid" type="hidden" value="<%=orderlistid%>"/>
  							<table frame="box" width="600px" height="5px" bgcolor="#cff">
  							<tr>
  							<td align="left"><s:submit value="删除订单" style="width:100px"/></td>
  							</tr>
  							</table>
  						</s:form>
  						
  						
  						<%
  						Allpay+=orderlistpay;
  					}
  				 }
  				 %>
  				 <table frame="box" width="600px" height="10px" bgcolor="#cff">
  				<tr><td>总交易额：</td><td><%=Allpay%></td><td>账户余额：</td><td><%=leftmoney%></td>
  				</tr>
  				</table>
  				<c:form action="orderlist_pay_jump">
  				    <input type="hidden" name="userid" value="<%=u.getId()%>">
  					<input type="hidden" name="allpay" value="<%=Allpay%>">
  					<input type="hidden" name="ids" value="<%=submitstring%>">
  				<table frame="box" width="600px" height="5px" bgcolor="#cff">
  				<tr>
  					<td align="left"><c:submit value="付款结账" style="width:100px"/></td>
  				</tr>
  				</table>
  				</c:form>
  				
  	<%
  			} 
  			else
  			{
  			%>
  			<table><tr><td>无商品订单!!!</td></tr></table>
  			<%
  			}
  			%>
  			<br>
  			<a href="UserManagement.jsp">返回用户管理界面</a>
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
  	  	
  	  	<s:form action="bossmanagement_orderlist_typeselect">
  	  	<table>
  	  	<tr>
  		<td><label for="selectshowway">按：</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="All">所有</option>
  			<option value="Goods">商品</option>
  		</select></td><td>查询,输入（商品名）：</td><td><input type="text" name="searchfile"></td>
  		<td><s:submit value="查询"/></td>
  		</tr>
		</table>
  		</s:form>
		
  	<%
  		if(selectshowway==null||selectshowway.equals("All")) 
  		{
  			if(orderlists!=null&&!orderlists.isEmpty())
  		 	{ 	
  		 		for(int k=0;k<orderlists.size();k++) 
  		 		{
  					orderlistid=orderlists.get(k).getId();
  					orderlistnum=orderlists.get(k).getNum();
  					orderliststatus=orderlists.get(k).getStatus();
  					orderlistaddmessage=orderlists.get(k).getAddmessage();
  					String status="未支付"; 
  					if(orderliststatus==1) 
  						status="已支付";
  					orderlistpay=orderlists.get(k).getAmountpay();
  					orderlistusername=orderlists.get(k).getUser().getName();
  					orderlistgoodsname=orderlists.get(k).getGoods().getName();
  					orderlistshopname=orderlists.get(k).getGoods().getShop().getName();
  					orderlistshopname=orderlists.get(k).getFromdate().toString();
  					sendtoname=orderlists.get(k).getSendmessage().getToname();
  					sendadress=orderlists.get(k).getSendmessage().getAdress();
  					sendpostcode=orderlists.get(k).getSendmessage().getPostcode();
  					%>
  					<table frame="box" width="600px" height="100px" bgcolor="#cff">
  					<tr>
  						<td>订单号：</td><td><%=orderlistid%></td><td>商品名：</td><td><%=orderlistgoodsname%></td><td>订单状态：</td><td><%=status%></td> 
  					</tr>
  					<tr>
  						<td>交易数目：</td><td><%=orderlistnum%></td><td>交易金额：</td><td><%=orderlistpay%></td><td>下单时间：</td><td><%=orderlisttime%></td>
  					</tr>
  					<tr>
  						<td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td>
  					</tr>
  					<tr>
  						<td>备注：</td><td><%=orderlistaddmessage%></td>
  					</tr>
  					</table>
  					<s:form action="orderlist_delete">
  						<input name="orderlistid" type="hidden" value="<%=orderlistid%>">
  						<table frame="box" width="600px" height="5px" bgcolor="#cff">
  						<tr>
  						<td align="left"><s:submit value="删除订单" style="width:100px"/></td>
  						</tr>
  						</table>
  					</s:form>
  	<%			} 
  			}
  			else
  			{
  			%>
  			<table><tr><td>无商品订单!!!</td></tr></table>
  			<%
  			} 
  		} 
  		if(selectshowway!=null&&selectshowway.equals("Goods")) 
  		{
  			if(searchfile!=null)
  			{
  				List<Goods> gos=bsi.getGoodsDAO().queryByShop(b.getShop());
  				orderlists=new ArrayList<Orderlist>();
  				if(gos!=null&&!gos.isEmpty())
  				{
  					for(int n=0;n<gos.size();n++)
  					{
  						if(gos.get(n).getName().equals(searchfile))
  						{
  							List<Orderlist> oo=bsi.getOrderlistDAO().queryByGoods(gos.get(n));
  							if(oo!=null&&!oo.isEmpty())
  							{
  								for(int x=0;x<oo.size();x++)
  								{
  									orderlists.add(oo.get(x));
  								}
  							}
  						}
  					}
  				}
  			}
  			if(orderlists!=null&&!orderlists.isEmpty())
  		 	{ 	
  		 		for(int k=0;k<orderlists.size();k++) 
  		 		{
  					orderlistid=orderlists.get(k).getId();
  					orderlistnum=orderlists.get(k).getNum();
  					orderliststatus=orderlists.get(k).getStatus();
  					orderlistaddmessage=orderlists.get(k).getAddmessage();
  					String status="未支付"; 
  					if(orderliststatus==1) 
  						status="已支付";
  					orderlistpay=orderlists.get(k).getAmountpay();
  					orderlistusername=orderlists.get(k).getUser().getName();
  					orderlistgoodsname=orderlists.get(k).getGoods().getName();
  					orderlistshopname=orderlists.get(k).getGoods().getShop().getName();
  					orderlistshopname=orderlists.get(k).getFromdate().toString();
  					sendtoname=orderlists.get(k).getSendmessage().getToname();
  					sendadress=orderlists.get(k).getSendmessage().getAdress();
  					sendpostcode=orderlists.get(k).getSendmessage().getPostcode();
  					%>
  					<table frame="box" width="600px" height="100px" bgcolor="#cff">
  					<tr>
  						<td>订单号：</td><td><%=orderlistid%></td><td>商品名：</td><td><%=orderlistgoodsname%></td><td>订单状态：</td><td><%=status%></td>
  					</tr>
  					<tr>
  						<td>交易数目：</td><td><%=orderlistnum%></td><td>交易金额：</td><td><%=orderlistpay%></td><td>下单时间：</td><td><%=orderlisttime%></td>
  					</tr>
  					<tr>
  						<td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td>
  					</tr>
  					<tr>
  						<td>备注：</td><td><%=orderlistaddmessage%></td><td>交易用户：<%=orderlistusername%></td>
  					</tr>
  					</table>
  					<s:form action="orderlist_delete">
  						<input name="orderlistid" type="hidden" value="<%=orderlistid%>">
  						<table frame="box" width="600px" height="5px" bgcolor="#cff">
  						<tr>
  						<td align="left"><s:submit value="删除订单" style="width:100px"/></td>
  						</tr>
  						</table>
  					</s:form>
  					
  	<%			} 
  			}
  			else
  			{
  			%>
  			<table><tr><td>无商品订单!!!</td></tr></table>
  			<%
  			} 
  		} 
  		%>
  		<br>
  		<a href="BossManagement.jsp">返回店铺管理界面</a>
  		</div>
  		<%
  		}
  		%>
  </div>
  </div>
  </div>
  </body>
</html>
