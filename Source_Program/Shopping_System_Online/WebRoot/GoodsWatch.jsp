<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Model.Goods" 
import="Model.Goods" import="Model.Shop" import="Model.Goodstype" import="Model.Orderlist"
import="Service.UserServiceImpl" import="Model.User" import="Model.Boss" import="Model.Comment"
import="Model.Sendmessage" import="Model.Picture" import="Model.Transrecord"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% 
		String userid=request.getParameter("orderuser");
		String goodsid=request.getParameter("ordergoods");
		HttpSession se=request.getSession();
		if(userid!=null||goodsid!=null)
		{
			se.setAttribute("tempuserid2", userid);
			se.setAttribute("tempgoodsid2", goodsid);
		}
		else
		{
			userid=(String)se.getAttribute("tempuserid2");
			goodsid=(String)se.getAttribute("tempgoodsid2");
		}
		UserServiceImpl usi=new UserServiceImpl();
		Goods g=usi.getGoodsDAO().queryById(Integer.parseInt(goodsid));
		Shop s=g.getShop();
		Boss b=s.getBoss();
		User u=new User();
		double discountprice=g.getPrice();
		List<Comment> comments=usi.getCommentDAO().queryByGoods(g);
		List<Sendmessage> sms=new ArrayList<Sendmessage>();
		List<Picture> pics=usi.getPictureDAO().queryByGoods(g);
		List<Goods> gs=new ArrayList<Goods>();
		List<Transrecord> tss=new ArrayList<Transrecord>();
		if(userid!=null)
		{
			u=usi.getUserDAO().queryById(Integer.parseInt(userid));
			discountprice=g.getPrice()*(1-u.getVlevel()/20);
			sms=usi.getSendmessageDAO().queryByUser(u);
			gs=usi.getGoodsDAO().queryByShopcar(u.getShopcar());
			tss=usi.queryTRecord(u);
		}
		
		 
		
		Boolean index=false;
		/* if(gs!=null&&!gs.isEmpty())
		{
			for(int i=0;i<gs.size();i++)
			{
				if(gs.get(i).getId()==g.getId())
					index=true;
			}
		} */
		if(tss!=null&&!tss.isEmpty())
		{
			for(int i=0;i<tss.size();i++)
			{
				if(tss.get(i).getGid()==g.getId())
					index=true;
			}
		}
		
	%>
	<style type="text/css">
		body { font-family:Verdana; font-size:14px; margin:0; padding:0; background-image:url(images/bigbackground.jpg);width:100%;height:100%;background-repeat:no repeat ;}
		#container {margin:0 auto; width:900px;}
		#header { height:150px; margin-bottom:5px; background-image:url(images/header.jpg);}
		#mainContent { margin-bottom:5px;}
		#content { float:right; width:900px; height:1000px; background-image:url(images/blank.png);}/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/
		#userheadphoto { float:left; width:190; height:190; margin:0 auto;}
		
		#showgoods { float:right; width:900px; height:200px; background-color:none;solid:#dbdbdb;}
		#showgoods ul { padding:0 0 5px 0; overflow:auto;}
		#showgoods ul li { width:150px; float:left; margin:5px 0 0px 11px; display:inline; text-align:center; list-style-type:none;}
		#showgoods ul li img { margin-bottom:3px;}
		a:hover { color:#ff0;}
	</style>
  </head>
  
  <body>
  <div id="container">
  <div id="header"></div>
  <div id="mainContent">
  	<div id="content">
    <div id="showgoods">
    <ul>
    <% 
    if(pics!=null&&!pics.isEmpty())
    {
    	for(int i=0;i<pics.size();i++)
    	{
    	%>
    	<li><img src="<%=request.getContextPath()+pics.get(i).getPath()%>" height="150" width="150"/></li>
    	<% 
    	}
    }
    %>
    </ul>
    </div>
    <br>
    <table frame="box" cellpadding="5" width="550px" height="200px" bgcolor="#cff">
    <tr>
        <td>店铺：</td><td><%=s.getName()%></td><td>店铺等级：</td><td><%=s.getLevel()%>星</td>
    </tr>
    <tr>
        <td>商品：</td><td><%=g.getName()%></td><td>价格：</td><td><%=g.getPrice()%>(打折后:<%=discountprice%>)</td>
    </tr>
    <tr>
        <td>仓库余量：</td><td><%=g.getNum()%></td><td>送积分：</td><td><%=g.getMark()%></td>
    </tr>
    </table>
    
    <table frame="box" width="550px" height="100px" bgcolor="#cff">
    <tr>
    <td align="left">商品简介：</td>
    </tr>
    <tr>
    <td>&nbsp;&nbsp;<%=g.getIntroduce()%></td>
    </tr>       
    </table>
    <br>
    <% 
    if(se.getAttribute("CurrentLogin")!=null&&"User".equals((String)se.getAttribute("selecttype")))
    {
    %>
    
    <s:form action="orderlist_create">
             <input type="hidden" name="orderuser" value="<%=u.getId()%>">
             <input type="hidden" name="ordergoods" value="<%=g.getId()%>">
          <table frame="box" width="550px">
             <tr><td>订购数量：</td><td><input type="text" name="ordernum"></td></tr>
        	<tr><td><label for="selectsendmessage">请选择送货信息:</label></td>
 		<td><select name="selectsendmessage" id="selectsendmessage">
 		<% 
 		if(sms!=null&&!sms.isEmpty())
 		{
 			for(int j=0;j<sms.size();j++)
 			{
 			Sendmessage sm=sms.get(j);
 		%>
 			<option value="<%=sm.getId()%>"><%=sm.getAdress()%>&nbsp;<%=sm.getToname()%></option>
 		<% 
 			}
 		}
 		
 		%>
 		</select></td></tr>
 			 <tr><td>备注说明：</td><td><input type="text" name="orderlistaddmessage"></td></tr>
             <tr><td style="width:100px;"><s:submit value="加入购物车"/></td></tr>
         </table>   
         	<input type="hidden" name="orderonegoodsspend" value="<%=discountprice%>"> 
	 </s:form>
    
    <%
    	}
    	if(index)
    	{
    	%>
    	
    	<s:form action="comment_create" validate="true">
    			<input type="hidden" name="orderuser" value="<%=u.getId()%>"><br>
             	<input type="hidden" name="ordergoods" value="<%=g.getId()%>"><br>
            <table frame="box" width="550px" bgcolor="#fff">
    			<tr><td><input type="text" name="commenttext" style="width:550;height:100"></td></tr>
    			<tr><td><s:fielderror fieldName="commenttext" cssStyle="color: red"/></td></tr>
    			<tr><td align="center"><s:submit value="提交评论" style="width:200px"/></td></tr>
    		</table>
    	</s:form>
    	
  		 <% 
   		}
   		else
   		{
   			if(se.getAttribute("CurrentLogin")!=null)
   			{
   			%>
   			<table>
   			<tr><td>您未购买此商品，无权评论！！！</td></tr>
   			</table>
   			<%
   			}
   			else
   			{
   			%>
   			<table>
   			<tr><td>您未登陆，无权评论！！！</td></tr>
   			</table>
   			<%
   			}
   		}
   	if(comments!=null&&!comments.isEmpty())
   	{
   		for(int i=0;i<comments.size();i++)
   		{
			Comment c=comments.get(i);
   			%>
   			<br>
   			<table frame="box" width="600px" bgcolor="#ccc">
   			<tr align="left" height="10px"><td>评论人：&nbsp;<%=c.getUser().getName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评论时间：&nbsp;<%=c.getCommentdate()%></td></tr>
   			</table>
   			<table frame="box" width="600px" bgcolor="#ccc">
   			<tr><td height="50px">&nbsp;&nbsp;<%=c.getText()%></td></tr>
   			<tr><td></td></tr>
   			</table>
   			<%
   		}
   		
   	}
   %>
  	</div>
  </div>
  </div>
  </body>
</html>
