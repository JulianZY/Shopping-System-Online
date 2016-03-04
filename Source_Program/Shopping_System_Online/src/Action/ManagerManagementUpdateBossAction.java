package Action;

import Model.Boss;
import Model.Shop;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ManagerManagementUpdateBossAction extends ActionSupport{
	private int bossid;
	private String bossname;
	private String bosspassword;
	private String bossmail;
	private String bosstele;
	private String bossadress;
	private String bosstruename;
	private String shopname;
	private int shoplevel;
	private int shopmarks;
	private String shopadress;
	
	public String update()
	{
		System.out.println("bossid:"+this.getBossid());
		System.out.println("bossname:"+this.getBossname());
		System.out.println("bosspassword:"+this.getBosspassword());
		System.out.println("bossmail:"+this.getBossmail());
		System.out.println("bosstele:"+this.getBosstele());
		System.out.println("bossadress:"+this.getBossadress());
		System.out.println("bosstruename:"+this.getBosstruename());
		System.out.println("shopname:"+this.getShopname());
		System.out.println("shoplevel:"+this.getShoplevel());
		System.out.println("shopmarks:"+this.getShopmarks());
		System.out.println("shopadress:"+this.getShopadress());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Boss b=msi.getBossDAO().queryById(this.getBossid());
		Shop s=b.getShop();
		s.setName(this.getShopname());
		s.setLevel(this.getShoplevel());
		s.setMarks(this.getShopmarks());
		s.setAdress(this.getShopadress());
		if(msi.getBossDAO().queryByName(this.getBossname())!=null)
		{
			return "failed";
		}
		b.setName(this.getBossname());
		b.setPassword(this.getBosspassword());
		b.setMail(this.getBossmail());
		b.setTel(this.getBosstele());
		b.setAdress(this.getBossadress());
		b.setTruename(this.getBosstruename());
		b.setShop(s);
		if(msi.getBossDAO().update(b))
			return "success";
		return "failed";
	}

	public int getBossid() {
		return bossid;
	}

	public void setBossid(int bossid) {
		this.bossid = bossid;
	}

	public String getBossname() {
		return bossname;
	}

	public void setBossname(String bossname) {
		this.bossname = bossname;
	}

	public String getBosspassword() {
		return bosspassword;
	}

	public void setBosspassword(String bosspassword) {
		this.bosspassword = bosspassword;
	}

	public String getBossmail() {
		return bossmail;
	}

	public void setBossmail(String bossmail) {
		this.bossmail = bossmail;
	}

	public String getBosstele() {
		return bosstele;
	}

	public void setBosstele(String bosstele) {
		this.bosstele = bosstele;
	}

	public String getBossadress() {
		return bossadress;
	}

	public void setBossadress(String bossadress) {
		this.bossadress = bossadress;
	}

	public String getBosstruename() {
		return bosstruename;
	}

	public void setBosstruename(String bosstruename) {
		this.bosstruename = bosstruename;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public int getShoplevel() {
		return shoplevel;
	}

	public void setShoplevel(int shoplevel) {
		this.shoplevel = shoplevel;
	}

	public int getShopmarks() {
		return shopmarks;
	}

	public void setShopmarks(int shopmarks) {
		this.shopmarks = shopmarks;
	}

	public String getShopadress() {
		return shopadress;
	}

	public void setShopadress(String shopadress) {
		this.shopadress = shopadress;
	}
	
	
}
