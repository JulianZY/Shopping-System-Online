package Action;

import com.opensymphony.xwork2.ActionSupport;

import Service.BossServiceImpl;
import Service.ManagerServiceImpl;
import Service.UserServiceImpl;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	
	private String name;
	private String password;
	private String selecttype;
	private String inputcertCode;
	private String truecertCode;
	public String check(){
		
		System.out.println("type= "+selecttype);
		System.out.println("name= "+name);
		System.out.println("password= "+password);
		if(this.getSelecttype()!=null&&this.getSelecttype().equals("User"))
		{
		      UserServiceImpl usi=new UserServiceImpl();
		      if(usi.login(this.getName(), this.getPassword()))
		          return "success";
		      return "failed";
		}
		if(this.getSelecttype()!=null&&this.getSelecttype().equals("Boss"))
		{
		      BossServiceImpl bsi=new BossServiceImpl();
		      if(bsi.login(this.getName(), this.getPassword()))
		          return "success";
		      return "failed";
		}
		if(this.getSelecttype()!=null&&this.getSelecttype().equals("Manager"))
		{
		      ManagerServiceImpl msi=new ManagerServiceImpl();
		      if(msi.login(this.getName(), this.getPassword()))
		          return "success";
		      return "failed";
		}
		else 
			return "failed";
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSelecttype() {
		return selecttype;
	}
	public void setSelecttype(String selecttype) {
		this.selecttype = selecttype;
	}
	public String getInputcertCode() {
		return inputcertCode;
	}
	public void setInputcertCode(String inputcertCode) {
		this.inputcertCode = inputcertCode;
	}
	public String getTruecertCode() {
		return truecertCode;
	}
	public void setTruecertCode(String truecertCode) {
		this.truecertCode = truecertCode;
	}

}
