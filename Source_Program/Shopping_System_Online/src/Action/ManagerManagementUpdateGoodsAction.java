package Action;




import java.util.List;
import Model.Goods;
import Model.Goodstype;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ManagerManagementUpdateGoodsAction extends ActionSupport{
	private int goodsid;
	private String goodsname;
	private String goodsintroduce;
	private int goodsnum;
	private int goodsmark;
	private double goodsprice;
	private int selectgoodstype;
	
	public String update()
	{
		System.out.println("goodsid:"+this.getGoodsid());
		System.out.println("goodsname:"+this.getGoodsname());
		System.out.println("goodsintroduce:"+this.getGoodsintroduce());
		System.out.println("goodsnum:"+this.getGoodsnum());
		System.out.println("goodsmark:"+this.getGoodsmark());
		System.out.println("goodsprice:"+this.getGoodsprice());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=msi.getGoodsDAO().queryById(this.getGoodsid());
		g.setName(this.getGoodsname());
		g.setIntroduce(this.getGoodsintroduce());
		g.setNum(this.getGoodsnum());
		g.setMark(this.getGoodsmark());
		g.setPrice(this.getGoodsprice());
		if(msi.getGoodsDAO().update(g))
			return "success";
		return "failed";
	}
	public String addgoodstype()
	{
		System.out.println("selectgoodstype:"+this.getSelectgoodstype());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=msi.getGoodsDAO().queryById(this.getGoodsid());
		List<Goodstype> gts=msi.getGoodstypeDAO().queryByGoods(g);
		Goodstype gt=msi.getGoodstypeDAO().queryById(this.getSelectgoodstype());
		gts.add(gt);
		g.setGoodstypes(gts);
		if(msi.getGoodsDAO().update(g))
			return "success";
		return "failed";
	}
	public String deletegoodstype()
	{
		System.out.println("selectgoodstype:"+this.getSelectgoodstype());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goods g=msi.getGoodsDAO().queryById(this.getGoodsid());
		List<Goodstype> gts=msi.getGoodstypeDAO().queryByGoods(g);
		Goodstype gt=msi.getGoodstypeDAO().queryById(this.getSelectgoodstype());
		gts.remove(gt);
		g.setGoodstypes(gts);
		if(msi.getGoodsDAO().update(g))
			return "success";
		return "failed";
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

	public int getSelectgoodstype() {
		return selectgoodstype;
	}

	public void setSelectgoodstype(int selectgoodstype) {
		this.selectgoodstype = selectgoodstype;
	}
	
}
