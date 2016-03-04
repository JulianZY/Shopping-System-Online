package Action;

import Model.User;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ManagerManagementUpdateUserAction extends ActionSupport{
		private int userid;
		private String username;
		private String userpassword;
		private String usermail;
		private String usertele;
		private double userleftmoney;
		private int uservlevel;
		private int usermarks;
		
		public String update()
		{
			System.out.println("userid:"+this.getUserid());
			System.out.println("username:"+this.getUsername());
			System.out.println("userpassword:"+this.getUserpassword());
			System.out.println("usermail:"+this.getUsermail());
			System.out.println("usertele:"+this.getUsertele());
			System.out.println("userleftmoney:"+this.getUserleftmoney());
			System.out.println("uservlevel:"+this.getUservlevel());
			System.out.println("usermarks:"+this.getUsermarks());
			ManagerServiceImpl msi=new ManagerServiceImpl();
			User u=msi.getUserDAO().queryById(this.getUserid());
			if(msi.getUserDAO().queryByName(this.getUsername())!=null)
			{
				return "failed";
			}
			u.setName(this.getUsername());
			u.setPassword(this.getUserpassword());
			u.setMail(this.getUsermail());
			u.setTel(this.getUsertele());
			u.setLeftmoney(this.getUserleftmoney());
			u.setVlevel(this.getUservlevel());
			u.setMarks(this.getUsermarks());
			if(msi.getUserDAO().update(u))
				return "success";
			return "failed";
		}
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getUserpassword() {
			return userpassword;
		}
		public void setUserpassword(String userpassword) {
			this.userpassword = userpassword;
		}
		public String getUsermail() {
			return usermail;
		}
		public void setUsermail(String usermail) {
			this.usermail = usermail;
		}
		public String getUsertele() {
			return usertele;
		}
		public void setUsertele(String usertele) {
			this.usertele = usertele;
		}
		public double getUserleftmoney() {
			return userleftmoney;
		}
		public void setUserleftmoney(double userleftmoney) {
			this.userleftmoney = userleftmoney;
		}
		public int getUservlevel() {
			return uservlevel;
		}
		public void setUservlevel(int uservlevel) {
			this.uservlevel = uservlevel;
		}
		public int getUsermarks() {
			return usermarks;
		}
		public void setUsermarks(int usermarks) {
			this.usermarks = usermarks;
		} 
}
