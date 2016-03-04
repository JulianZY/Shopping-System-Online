package Action;

import Dao.PowerDAO;
import Model.Boss;
import Model.Shop;
import Service.BossServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ApplyAction extends ActionSupport{
	private String bossname;
	private String password;
	private String repassword;
	private String adress;
	private String tele;
	private String truename;
	private String mail;
	private String shopadress;
	private String shopname;
	public String check()
	{
		System.out.println("bossname= "+this.getBossname());
		System.out.println("password= "+this.getPassword());
		System.out.println("repassword= "+this.getRepassword());
		System.out.println("adress= "+this.getAdress());
		System.out.println("tele= "+this.getTele());
		System.out.println("truename= "+this.getTruename());
		System.out.println("mail= "+this.getMail());
		System.out.println("shopadress= "+this.getShopadress());
		System.out.println("shopname= "+this.getShopname());
		BossServiceImpl bsi=new BossServiceImpl();
		Boss b1=new Boss();
		Shop s1=new Shop();
		s1.setAdress(this.getShopadress());
		s1.setName(this.getShopname());
		s1.setLevel(1);
		PowerDAO p=new PowerDAO();
		b1.setName(this.getBossname());
		b1.setPassword(this.getPassword());
		b1.setAdress(this.getAdress());
		b1.setTel(this.getTele());
		b1.setTruename(this.getTruename());
		b1.setMail(this.getMail());
		b1.setPower(p.queryById(3));
		b1.setShop(s1);
		if(bsi.register(b1))
			return "success";
		return "failed";
	}
	public String getBossname() {
		return bossname;
	}
	public void setBossname(String bossname) {
		this.bossname = bossname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
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
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	
}
