<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" 
import="Model.User" import="Model.Boss" import="Model.Manager" import="Service.ManagerServiceImpl"
import="Service.UserServiceImpl" import="Service.BossServiceImpl" import="Model.Transrecord"
import="Model.Shop" import="Model.Goods"%>
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
    
    <title>交易记录</title>
    
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
		
		ManagerServiceImpl msi=new ManagerServiceImpl();
		UserServiceImpl usi=new UserServiceImpl();
		BossServiceImpl bsi=new BossServiceImpl();
		String selecttype=null;
		String selectshowway=null;
		String searchfile=null;
		int recordnum=0;
		
		String shopname=null;
  		String username=null;
  		String goodsname=null;
  		int transnum=0;
  		double transamount=0;
  		String transdate=null;
  		String sendadress=null;
  		String sendtoname=null;
  		String sendpostcode=null;
		
		User u=new User();
		Boss b=new Boss();
		Manager mm=new Manager();
		
		String managername=null;
		int managerid=0;
		
		String bossname2=null;
		int bossid2=0;
		String shopname2=null;
		String shopadress2=null;
		int shopmarks2=0;
		int shoplevel2=0;
		
		String username2=null;
		String usermail=null;
		String usertele=null;
		int uservlevel=0;
		int usermarks=0;
		double userleftmoney=0; 
		
		List<User> users=new ArrayList<User>();
		List<Transrecord> transrecords=new ArrayList<Transrecord>();
		if(se!=null)
		{
			selecttype=se.getAttribute("selecttype").toString();
			selectshowway=request.getParameter("selectshowway");
			searchfile=request.getParameter("searchfile");
			if(selecttype!=null&&selecttype.equals("Manager"))
			{
				transrecords=msi.queryAllTRecord();
				int mid=(Integer)se.getAttribute("CurrentLogin");
				mm=msi.getManagerDAO().queryById(mid);
				managername=mm.getName();
				managerid=mm.getId();
			}
			if(selecttype!=null&&selecttype.equals("User"))
			{
				//u=(User)se.getAttribute("CurrentLogin");
				id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				u=msi.getUserDAO().queryById(id);
				transrecords=usi.getTransrecordDAO().queryByUser(id);
				
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
				id=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
				b=msi.getBossDAO().queryById(id);
				transrecords=bsi.queryAllTRecord(b.getShop());
				
				bossname2=b.getName();
				bossid2=b.getId();
				shopname2=b.getShop().getName();
				shopadress2=b.getShop().getAdress();
				shopmarks2=b.getShop().getMarks();
				shoplevel2=b.getShop().getLevel();
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
  
  <body >
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
  	<table width="695px" frame="box" height="50px">
  	<tr>
  	<s:form action="showtransrecord">
  		<td><label for="selectshowway">按 :</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="A">常规</option>
  			<option value="B">用户名</option>
  			<option value="C">店铺名</option>
  			<option value="D">商品名</option>
  			<option value="E">日期</option>
  		</select> </td><td>查询,请输入(人名/店名/货物名/日期[xxxx-xx-xx])：</td><td><input name="searchfile" type="text"></td>
  		<td><s:submit value="开始查询"/></td>
  	</s:form>
  	</tr>
  	</table>
  	
  	<%
  		if(selectshowway==null||selectshowway=="A")
  		{
  			if(!transrecords.isEmpty())
  			{
  				for(int i=0;i<transrecords.size();i++)
  				{
  					shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  					username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  					goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  					transnum=transrecords.get(i).getTransnum();
  					transamount=transrecords.get(i).getTransamount();
  					transdate=transrecords.get(i).getTransdate().toString();
  					sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  				recordnum++;
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有交易记录！！！</td></tr></table>
  				<%
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="B")
  		{
  			if(searchfile!=null)
  			{
  				User u1=usi.getUserDAO().queryByName(searchfile);
  				transrecords=usi.queryTRecord(u1);
  				if(!transrecords.isEmpty())
  				{
  					for(int i=0;i<transrecords.size();i++)
  					{
  						shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  						username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  						goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  						transnum=transrecords.get(i).getTransnum();
  						transamount=transrecords.get(i).getTransamount();
  						transdate=transrecords.get(i).getTransdate().toString();
  						sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  					recordnum++;
  					}
  				}
  				else
  				{
  					%>
  					<table><tr><td>没有交易记录！！！</td></tr></table>
  					<%
  				}
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="C")
  		{
  			if(searchfile!=null)
  			{
  				List<Shop> shops=msi.getShopDAO().queryByName(searchfile);
  				transrecords=null;
  				if(!shops.isEmpty())
  				{
  					for(int j=0;j<shops.size();j++)
  					{
  						List<Transrecord> trs=msi.queryTRecordByShop(shops.get(j));
  						for(int k=0;k<trs.size();k++)
  						{
  							transrecords.add(trs.get(k));
  						}
  					}
  					if(!transrecords.isEmpty())
  					{
  						for(int i=0;i<transrecords.size();i++)
  						{
  							shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  							username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  							goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  							transnum=transrecords.get(i).getTransnum();
  							transamount=transrecords.get(i).getTransamount();
  							transdate=transrecords.get(i).getTransdate().toString();
  							sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  						recordnum++;
  						}
  					}
  				}
  				else
  				{
  					%>
  					<table><tr><td>没有交易记录！！！</td></tr></table>
  					<%
  				}
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="D")
  		{
  			if(searchfile!=null)
  			{
  				List<Goods> goodss=msi.queryGoods(searchfile);
  				transrecords=null;
  				if(!goodss.isEmpty())
  				{
  					for(int j=0;j<goodss.size();j++)
  					{
  						List<Transrecord> trs=msi.getTransrecordDAO().queryByGoods(goodss.get(j).getId());
  						for(int k=0;k<trs.size();k++)
  						{
  							transrecords.add(trs.get(k));
  						}
  					}
  					if(!transrecords.isEmpty())
  					{
  						for(int i=0;i<transrecords.size();i++)
  						{
  							shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  							username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  							goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  							transnum=transrecords.get(i).getTransnum();
  							transamount=transrecords.get(i).getTransamount();
  							transdate=transrecords.get(i).getTransdate().toString();
  							sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  						recordnum++;
  						}
  					}
  				}
  				else
  				{
  					%>
  					<table><tr><td>没有交易记录！！！</td></tr></table>
  					<%
  				}
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="E")
  		{
  			if(searchfile!=null)
  			{
  				if(!transrecords.isEmpty())
  				{
  					for(int i=0;i<transrecords.size();i++)
  					{
  						if(transrecords.get(i).getTransdate().toString().indexOf(searchfile)!=0)
  						{
  							shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  							username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  							goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  							transnum=transrecords.get(i).getTransnum();
  							transamount=transrecords.get(i).getTransamount();
  							transdate=transrecords.get(i).getTransdate().toString();
  							sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  						recordnum++;
  						}
  						if(recordnum==0)
  						{
  							%>
  							<table><tr><td>没有交易记录！！！</td></tr></table>
  							<%
  						}
  					}
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有交易记录！！！</td></tr></table>
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
  	<table>
  	<tr>
  	<s:form action="showtransrecord">
  		<td><label for="selectshowway">按 :</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="A">常规</option>
  			<option value="E">日期</option>
  		</select></td> 
  		<td>查询,请输入日期[xxxx-xx-xx](常规查询不用输)：</td><td><input name="searchfile" type="text"></td>
  		<td><s:submit value="开始查询"/></td>
  	</s:form>
  	</tr>
  	</table>
  	<%
  		if(selectshowway==null||selectshowway=="A")
  		{
  			 if(transrecords!=null&&!transrecords.isEmpty())
  			{
  				for(int i=0;i<transrecords.size();i++)
  				{
  					shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  					username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  					goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  					transnum=transrecords.get(i).getTransnum();
  					transamount=transrecords.get(i).getTransamount();
  					transdate=transrecords.get(i).getTransdate().toString();
  					sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  				recordnum++;
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有交易记录！！！</td></tr></table>
  				<%
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="E")
  		{
  			if(searchfile!=null)
  			{
  				if(transrecords!=null&&!transrecords.isEmpty())
  				{
  					for(int i=0;i<transrecords.size();i++)
  					{
  						if(transrecords.get(i).getTransdate().toString().indexOf(searchfile)!=0)
  						{
  							shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  							username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  							goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  							transnum=transrecords.get(i).getTransnum();
  							transamount=transrecords.get(i).getTransamount();
  							transdate=transrecords.get(i).getTransdate().toString();
  							sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  						recordnum++;
  						}
  						if(recordnum==0)
  						{
  							%>
  							<table><tr><td>没有交易记录！！！</td></tr></table>
  							<%
  						}
  					}
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有交易记录！！！</td></tr></table>
  				<%
  			}
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
        		<td> 店主：</td><td><%=bossname2%></td>
			</tr>
			<tr>
	    		<td>ID:</td><td><%=bossid2%></td>
			</tr>
			<tr>
        		<td>店名：</td><td><%=shopname2%></td>
			</tr>
			<tr>
	 			<td>地址:</td><td><%=shopadress2%></td> 
			</tr>
			<tr> 
	 			<td>积分:</td><td><%=shopmarks2%></td> 
			</tr>
			<tr> 
				<td> 等级:</td><td><%=shoplevel2%></td>
			</tr>
    		</table>
			</div>
  	
  	<div id="content">
  	<table>
  	<tr>
  	<s:form action="showtransrecord">
  		<td><label for="selectshowway">按 :</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="A">常规</option>
  			<option value="E">日期</option>
  		</select></td> 
  		<td>查询,请输入日期[xxxx-xx-xx](常规查询不用输)：</td><td><input name="searchfile" type="text"></td>
  		<td><s:submit value="开始查询"/></td>
  	</s:form>
  	</tr>
  	</table>
  	<%
  		if(selectshowway==null||selectshowway=="A")
  		{
  			if(!transrecords.isEmpty())
  			{
  				for(int i=0;i<transrecords.size();i++)
  				{
  					shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  					username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  					goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  					transnum=transrecords.get(i).getTransnum();
  					transamount=transrecords.get(i).getTransamount();
  					transdate=transrecords.get(i).getTransdate().toString();
  					sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  				recordnum++;
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有交易记录！！！</td></tr></table>
  				<%
  			}
  		}
  		if(selectshowway!=null&&selectshowway=="E")
  		{
  			if(searchfile!=null)
  			{
  				if(!transrecords.isEmpty())
  				{
  					for(int i=0;i<transrecords.size();i++)
  					{
  						if(transrecords.get(i).getTransdate().toString().indexOf(searchfile)!=0)
  						{
  							shopname=msi.getShopDAO().queryById(transrecords.get(i).getSid()).getName();
  							username=msi.getUserDAO().queryById(transrecords.get(i).getUid()).getName();
  							goodsname=msi.getGoodsDAO().queryById(transrecords.get(i).getGid()).getName();
  							transnum=transrecords.get(i).getTransnum();
  							transamount=transrecords.get(i).getTransamount();
  							transdate=transrecords.get(i).getTransdate().toString();
  							sendtoname=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getToname();
  					sendadress=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getAdress();
  					sendpostcode=msi.getSendmessageDAO().queryById(transrecords.get(i).getSmid()).getPostcode();
  			%>
  				<table width="690px" frame="box" height="50px" align="center" bgcolor="#cff">
  				<tr><td>卖家：</td><td><%=shopname%></td><td>买家：</td><td><%=username%></td><td>商品：</td><td><%=goodsname%></td></tr>
  				<tr><td>交易时间：</td><td><%=transdate%></td><td>交易数目：</td><td><%=transnum%></td><td>总支付：</td><td><%=transamount%></td></tr>
  				<tr><td>收件人：</td><td><%=sendtoname%></td><td>收件地址：</td><td><%=sendadress%></td><td>邮编：</td><td><%=sendpostcode%></td></tr>
  				</table>
  				
  			<%
  						recordnum++;
  						}
  						if(recordnum==0)
  						{
  							%>
  							<table><tr><td>没有交易记录！！！</td></tr></table>
  							<%
  						}
  					}
  				}
  			}
  			else
  			{
  				%>
  				<table><tr><td>没有交易记录！！！</td></tr></table>
  				<%
  			}
  		}
  		%>
  		<br>
  		<a href="BossManagement.jsp">返回管理界面</a>
  		</div>
  		<%
  	}
  	%>
  	</div>
  	</div>
  	</div>
  </body>
</html>
