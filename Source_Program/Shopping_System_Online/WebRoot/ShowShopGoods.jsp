<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" import="Service.BossServiceImpl"
import="Model.Goods" import="Model.Shop" import="Model.Boss" import="Model.Goodstype" import="Service.ManagerServiceImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="z" uri="/struts-tags" %>
<%@ taglib prefix="y" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店铺仓库</title>
    
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
		
		BossServiceImpl bsi=new BossServiceImpl();
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Boss b=new Boss();
		Shop s=new Shop();
		List<Goods> goodss=new ArrayList<Goods>();
		int goodstypeid=0;
		String searchfile=null;
		String selectshowway=null;
		String selectgoodstype=null;
		
		int goodsid=0;
		String goodsname=null;
		String goodsintroduce=null;
		String goodstype="";
		int goodsmark=0;
		int goodsnum=0;
		double goodsprice=0;
		
		String bossname=null;
		int bossid=0;
		String shopname=null;
		String shopadress=null;
		int shopmarks=0;
		int shoplevel=0; 
		
		if(se!=null)
		{
			searchfile=request.getParameter("searchfile");
			selectshowway=request.getParameter("selectshowway");
			selectgoodstype=request.getParameter("selectgoodstype");
			//b=(Boss)se.getAttribute("CurrentLogin");
			upid=Integer.parseInt(se.getAttribute("CurrentLogin").toString());
			b=bsi.getBossDAO().queryById(upid);
			if(b!=null)
			{
				s=b.getShop();
				goodss=bsi.getGoodsDAO().queryByShop(s);
				
				bossname=b.getName();
				bossid=b.getId();
				shopname=b.getShop().getName();
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
    <table>
    <tr>
    <s:form action="bossmanagement_goods_select">
        <td><label for="selectshowway">按 :</label></td>
  		<td><select name="selectshowway" id="selectshowway">
  			<option value="All">所有</option>
  			<option value="A">商品类型</option>
  			<option value="B">商品名</option>
  		</select></td>
  		<td>查询,输入商品名（按类型无需输入）：</td><td><input type="text" name="searchfile"></td>
    	<td><label for="selectgoodstype">选择商品类型 :</label></td>
    	<td><select name="selectgoodstype" id="selectgoodstype">
  			<% 
  			List<Goodstype> gts=msi.queryAllGoodstype();
  			if(gts!=null&&!gts.isEmpty())
  			{
  				for(int i=0;i<gts.size();i++)
  				{
  					goodstypeid=gts.get(i).getId();
  			%>
  			<option value="<%=goodstypeid%>"><%=gts.get(i).getType()%></option>
  			<% 
  				}
  			}
  			%>
  		</select></td>
    	<td><s:submit value="查询"/></td>
    </s:form>
    </tr>
    </table>
    <%
    if(selectshowway==null||selectshowway=="All")
    {
			if(goodss!=null&&!goodss.isEmpty())
			{
				for(int i=0;i<goodss.size();i++)
				{
					goodsid=goodss.get(i).getId();
					goodsname=goodss.get(i).getName();
					goodsintroduce=goodss.get(i).getIntroduce();
					goodsnum=goodss.get(i).getNum();
					goodsmark=goodss.get(i).getMark();
					goodsprice=goodss.get(i).getPrice();
					List<Goodstype> gt=bsi.getGoodstypeDAO().queryByGoods(goodss.get(i));
					if(gt!=null&&!gt.isEmpty())
					{
						for(int j=0;j<gt.size();j++)
						{
							goodstype+=gt.get(j).getType()+"、";
						}
					}
				%>
				<table frame="box" width="600px" height="100px" bgcolor="#cff">
				<tr>
					<td>名称：</td><td><%=goodsname%></td><td>介绍：</td><td><%=goodsintroduce%></td><td>价格：</td><td><%=goodsprice%></td>
				</tr>
				<tr>
					<td>数量：</td><td><%=goodsnum%></td><td>积分：</td><td><%=goodsmark%></td><td>商品类型：</td><td><%=goodstype%></td>
				</tr>
				<tr>
				<s:form action="bossmanagement_goods_delete">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><s:submit value="删除商品"/></td>
				</s:form>
				<c:form action="bossmanagement_goods_update_jump">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><c:submit value="更新商品信息"/></td>
				</c:form>
				<z:form action="bossmanagement_goodscomments">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><z:submit value="查看商品评论"/></td>
				</z:form>
				<y:form action="goodspicture_update_jump" target="_blank">
					<input type="hidden" name="gid" value="<%=goodsid%>">
					<td><y:submit value="更新商品图片"/></td>
				</y:form>
				</tr>
				</table>
				<%
				}
			}
			else
			{
			%>
			<table><tr><td>没有商品!!!</td></tr></table>
			<%
			}
    }
    if(selectshowway!=null&&selectshowway=="A")
    {
    	if(selectgoodstype!=null)
    	{
    		int id=Integer.parseInt(selectgoodstype);
    		Goodstype gtp=msi.getGoodstypeDAO().queryById(id);
    		List<Goods> gd=new ArrayList<Goods>();
    		if(goodss!=null&&!goodss.isEmpty())
    		{
    			for(int i=0;i<goodss.size();i++)
    			{
    				if(goodss.get(i).getGoodstypes().contains(gtp))
    				{
    					gd.add(goodss.get(i));
    				}
    			}
    			goodss=gd;
    			for(int j=0;j<goodss.size();j++)
				{
					goodsid=goodss.get(j).getId();
					goodsname=goodss.get(j).getName();
					goodsintroduce=goodss.get(j).getIntroduce();
					goodsnum=goodss.get(j).getNum();
					goodsmark=goodss.get(j).getMark();
					goodsprice=goodss.get(j).getPrice();
					List<Goodstype> gt=bsi.getGoodstypeDAO().queryByGoods(goodss.get(j));
					if(gt!=null&&!gt.isEmpty())
					{
						for(int k=0;k<gt.size();k++)
						{
							goodstype+=gt.get(k).getType()+"、";
						}
					}
				%>
				<table frame="box" width="600px" height="100px" bgcolor="#cff">
				<tr>
					<td>名称：</td><td><%=goodsname%></td><td>介绍：</td><td><%=goodsintroduce%></td><td>价格：</td><td><%=goodsprice%></td>
				</tr>
				<tr>
					<td>数量：</td><td><%=goodsnum%></td><td>积分：</td><td><%=goodsmark%></td><td>商品类型：</td><td><%=goodstype%></td>
				</tr>
				<tr>
				<s:form action="bossmanagement_goods_delete">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><s:submit value="删除商品"/></td>
				</s:form>
				<c:form action="bossmanagement_goods_update_jump">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><c:submit value="更新商品信息"/></td>
				</c:form>
				<z:form action="bossmanagement_goodscomments">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><z:submit value="查看商品评论"/></td>
				</z:form>
				<y:form action="goodspicture_update_jump" target="_blank">
					<input type="hidden" name="gid" value="<%=goodsid%>">
					<td><y:submit value="更新商品图片"/></td>
				</y:form>
				</tr>
				</table>
				<%
				}
    		}
    		else
			{
			%>
			<table><tr><td>没有商品!!!</td></tr></table>
			<%
			}
    	}
    	
    }
    if(selectshowway!=null&&selectshowway=="B")
    {
    	if(searchfile!=null)
    	{
    		List<Goods> gd=new ArrayList<Goods>();
    		if(goodss!=null&&!goodss.isEmpty())
    		{
    			for(int i=0;i<goodss.size();i++)
    			{
    				if(goodss.get(i).getName().equals(searchfile))
    				{
    					gd.add(goodss.get(i));
    				}
    			}
    			goodss=gd;
    			for(int j=0;j<goodss.size();j++)
				{
					goodsid=goodss.get(j).getId();
					goodsname=goodss.get(j).getName();
					goodsintroduce=goodss.get(j).getIntroduce();
					goodsnum=goodss.get(j).getNum();
					goodsmark=goodss.get(j).getMark();
					goodsprice=goodss.get(j).getPrice();
					List<Goodstype> gt=bsi.getGoodstypeDAO().queryByGoods(goodss.get(j));
					if(gt!=null&&!gt.isEmpty())
					{
						for(int k=0;k<gt.size();k++)
						{
							goodstype+=gt.get(k).getType()+"、";
						}
					}
				%>
				<table frame="box" width="600px" height="100px" bgcolor="#cff">
				<tr>
					<td>名称：</td><td><%=goodsname%></td><td>介绍：</td><td><%=goodsintroduce%></td><td>价格：</td><td><%=goodsprice%></td>
				</tr>
				<tr>
					<td>数量：</td><td><%=goodsnum%></td><td>积分：</td><td><%=goodsmark%></td><td>商品类型：</td><td><%=goodstype%></td>
				</tr>
				<tr>
				<s:form action="bossmanagement_goods_delete">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><s:submit value="删除商品"/></td>
				</s:form>
				<c:form action="bossmanagement_goods_update_jump">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><c:submit value="更新商品信息"/></td>
				</c:form>
				<z:form action="bossmanagement_goodscomments">
					<input type="hidden" name="goodsid" value="<%=goodsid%>">
					<td><z:submit value="查看商品评论"/></td>
				</z:form>
				<y:form action="goodspicture_update_jump" target="_blank">
					<input type="hidden" name="gid" value="<%=goodsid%>">
					<td><y:submit value="更新商品图片"/></td>
				</y:form>
				</tr>
				</table>
				<%
				}
    		}
    		else
			{
			%>
			<table><tr><td>没有商品!!!</td></tr></table>
			<%
			}	
    	}
    }
    %>
    <table frame="box" width="600px" height="10px" bgcolor="#cff">
    <tr>
    <s:form action="bossmanagement_goods_add_jump">
    	<input name="shopid" type="hidden" value="<%=b.getShop().getId()%>">
    	<input name="add" type="hidden" value="Add">
    	<td align="left"><s:submit value="添加新商品" style="width:100px"/></td>
    </s:form>
    </tr>
    </table>
    <br>
    <a href="BossManagement.jsp">返回店铺管理界面</a>
    </div>
  </div>
  </div>
  </div>
  </body>
</html>
