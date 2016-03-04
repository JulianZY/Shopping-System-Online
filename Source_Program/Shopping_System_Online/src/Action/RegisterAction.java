package Action;

import Dao.PowerDAO;
import Model.Picture;
import Model.Shopcar;
import Model.User;
import Service.UserServiceImpl;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private String username;
	private String password;
	private String repassword;
	private String mail;
	private String tele;
	
	public String check(){
		System.out.println("username= "+this.getUsername());
		System.out.println("password= "+this.getPassword());
		System.out.println("repassword= "+this.getRepassword());
		System.out.println("mail= "+this.getMail());
		System.out.println("tele= "+this.getTele());
		UserServiceImpl usi=new UserServiceImpl();
		User u1=new User();
		PowerDAO p=new PowerDAO();
		u1.setName(this.getUsername());
		u1.setPassword(this.getPassword());
		u1.setMail(this.getMail());
		u1.setTel(this.getTele());
		u1.setHeadphoto(null);
		u1.setLeftmoney(0);
		u1.setMarks(0);
		u1.setOrderlists(null);
		u1.setVlevel(0);
		//u1.setShopcar(null);
		u1.setSendmessages(null);
		u1.setPower(p.queryById(2));
		u1.setShopcar(new Shopcar());
		Picture pc=new Picture();
		pc.setName("default.png");
		//pc.setPath(ServletActionContext.getServletContext().getRealPath("/WEB-INF/Resource/Images"+"\\"+"default.png"));
		pc.setPath("/Resource/Images"+"\\"+"default.png");
		u1.setHeadphoto(pc);
		if(usi.register(u1))
			return "success";
		return "failed";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
}
