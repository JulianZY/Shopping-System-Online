package Action;

import java.util.ArrayList;
import java.util.List;

import Model.Goods;
import Model.Goodstype;
import Model.Picture;
import Service.BossServiceImpl;
import Service.ManagerServiceImpl;

public class BossManagementGoodsAction {
	private int goodsid;
	private String goodsname;
	private String goodsintroduce;
	private int goodsnum;
	private int goodsmark;
	private double goodsprice;
	private String searchfile;
	private int selectgoodstype;
	private String shopid;
	
	public String delete()
	{
		System.out.println("goodsid:"+this.getGoodsid());
		BossServiceImpl bsi=new BossServiceImpl();
		Goods g=bsi.getGoodsDAO().queryById(this.getGoodsid());
		if(bsi.deleteGoods(g.getShop(), g))
		{
			return "success";
		}
		return "failed";
	}
	public String add()
	{
		System.out.println("searchfile:"+this.getSearchfile());
		System.out.println("goodsintroduce:"+this.getGoodsintroduce());
		System.out.println("goodsnum:"+this.getGoodsnum());
		System.out.println("goodsmark:"+this.getGoodsmark());
		System.out.println("goodsprice:"+this.getGoodsprice());
		System.out.println("selectgoodstype:"+this.getSelectgoodstype());
		System.out.println("shopid:"+this.getShopid());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=new Goods();
		List<Picture> pics=new ArrayList<Picture>();
		g.setPictures(pics);
		g.setName(this.getSearchfile());
		g.setIntroduce(this.getGoodsintroduce());
		g.setMark(this.getGoodsmark());
		g.setNum(this.getGoodsnum());
		g.setPrice(this.getGoodsprice());
		int id=Integer.parseInt(this.getShopid());
		g.setShop(msi.getShopDAO().queryById(id));
		List<Goodstype> gts=new ArrayList<Goodstype>();
		gts.add(msi.getGoodstypeDAO().queryById(this.getSelectgoodstype()));
		g.setGoodstypes(gts);
		if(msi.getGoodsDAO().create(g))
			return "success";
		return "failed";
	}
	public String update()
	{
		System.out.println("goodsid:"+this.getGoodsid());
		System.out.println("goodsname:"+this.getGoodsname());
		System.out.println("goodsintroduce:"+this.getGoodsintroduce());
		System.out.println("goodsprice:"+this.getGoodsprice());
		System.out.println("goodsmark:"+this.getGoodsmark());
		System.out.println("goodsnum:"+this.getGoodsnum());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=msi.getGoodsDAO().queryById(this.getGoodsid());
		g.setName(this.getGoodsname());
		g.setIntroduce(this.getGoodsintroduce());
		g.setMark(this.getGoodsmark());
		g.setNum(this.getGoodsnum());
		g.setPrice(this.getGoodsprice());
		if(msi.getGoodsDAO().update(g))
			return "success";
		return "failed";
	}
	public String addgoodstype()
	{
		System.out.println("goodsid:"+this.getGoodsid());
		System.out.println("selectgoodstype:"+this.getSelectgoodstype());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=msi.getGoodsDAO().queryById(this.getGoodsid());
		List<Goodstype> gts=msi.getGoodstypeDAO().queryByGoods(g);
		gts.add(msi.getGoodstypeDAO().queryById(this.getSelectgoodstype()));
		g.setGoodstypes(gts);
		if(msi.getGoodsDAO().update(g))
			return "success";
		return "failed";
	}
	public String deletegoodstype()
	{
		System.out.println("goodsid:"+this.getGoodsid());
		System.out.println("selectgoodstype:"+this.getSelectgoodstype());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=msi.getGoodsDAO().queryById(this.getGoodsid());
		Goodstype gt=msi.getGoodstypeDAO().queryById(this.getSelectgoodstype());
		
		List<Goods> gds=msi.getGoodsDAO().queryByGoodstype(gt);
		List<Goodstype> gts=msi.getGoodstypeDAO().queryByGoods(g);
		
		gts.remove(msi.getGoodstypeDAO().queryById(this.getSelectgoodstype()));
		gds.remove(g);
		
		g.setGoodstypes(gts);
		gt.setGoods(gds);
		msi.getGoodsDAO().update(g);
		msi.getGoodstypeDAO().update(gt);
		msi.getGoodsDAO().deletegoodstype(this.getGoodsid(), this.getSelectgoodstype());
		return "success";
	}
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoodsintroduce() {
		return goodsintroduce;
	}
	public void setGoodsintroduce(String goodsintroduce) {
		this.goodsintroduce = goodsintroduce;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public int getGoodsmark() {
		return goodsmark;
	}
	public void setGoodsmark(int goodsmark) {
		this.goodsmark = goodsmark;
	}
	public double getGoodsprice() {
		return goodsprice;
	}
	public void setGoodsprice(double goodsprice) {
		this.goodsprice = goodsprice;
	}
	public String getSearchfile() {
		return searchfile;
	}
	public void setSearchfile(String searchfile) {
		this.searchfile = searchfile;
	}
	public int getSelectgoodstype() {
		return selectgoodstype;
	}
	public void setSelectgoodstype(int selectgoodstype) {
		this.selectgoodstype = selectgoodstype;
	}
	public String getShopid() {
		return shopid;
	}
	public void setShopid(String shopid) {
		this.shopid = shopid;
	}
	
}
