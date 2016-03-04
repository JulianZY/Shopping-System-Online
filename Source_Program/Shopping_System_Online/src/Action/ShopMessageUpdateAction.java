package Action;

import Model.Shop;
import Service.BossServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ShopMessageUpdateAction extends ActionSupport{
	private int shopid;
	private String shopadress;
	private String shopname;
	
	public String update()
	{
		System.out.println("shopid:"+this.getShopid());
		System.out.println("shopadress:"+this.getShopadress());
		System.out.println("shopname:"+this.getShopname());
		BossServiceImpl bsi=new BossServiceImpl();
		Shop s=bsi.getShopDAO().queryById(this.getShopid());
		s.setName(this.getShopname());
		s.setAdress(this.getShopadress());
		if(bsi.updateShop(s))
			return "success";
		return "failed";
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getShopadress() {
		return shopadress;
	}
	public void setShopadress(String shopadress) {
		this.shopadress = shopadress;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	
}
