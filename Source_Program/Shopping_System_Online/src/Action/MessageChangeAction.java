package Action;

import Model.Boss;
import Model.Manager;
import Model.User;
import Service.BossServiceImpl;
import Service.ManagerServiceImpl;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class MessageChangeAction extends ActionSupport{
		private String selecttype;
		private int id;
		private String name;
		private String mail;
		private String adress;
		private String tele;
		private String oldpassword;
		private String newpassword;
		private String checkpassword;
		
		public String check(){
			System.out.println("name:"+this.getName());
			System.out.println("id:"+this.getId());
			System.out.println("selecttype:"+this.getSelecttype());
			System.out.println("adress:"+this.getAdress());
			System.out.println("tele:"+this.getTele());
			System.out.println("mail:"+this.getMail());
			System.out.println("newpassword:"+this.getNewpassword());
			if(this.getSelecttype()!=null&&this.getSelecttype().equals("User"))
			{
				UserServiceImpl usi=new UserServiceImpl();
				User u=usi.getUserDAO().queryById(this.getId());
				if(usi.getUserDAO().queryByName(this.getName())!=null)
				{
					return "failed";
				}
				u.setName(this.getName());
				u.setMail(this.getMail());
				u.setTel(this.getTele());
				if(u.getPassword().equals(this.getOldpassword()))
				{
					u.setPassword(this.getNewpassword());
					usi.getUserDAO().update(u);
					return "success";
				}
				else
				{
					return "failed";
				}
			}
			else if(this.getSelecttype()!=null&&this.getSelecttype().equals("Manager"))
			{
				ManagerServiceImpl msi=new ManagerServiceImpl();
				Manager m=msi.getManagerDAO().queryById(this.getId());
				if(msi.getManagerDAO().queryByName(this.getName())!=null)
				{
					return "failed";
				}
				m.setName(this.getName());
				m.setMail(this.getMail());
				m.setTel(this.getTele());
				if(m.getPassword().equals(this.getOldpassword()))
				{
					m.setPassword(this.getNewpassword());
					msi.getManagerDAO().update(m);
					return "success";
				}
				else
				{
					return "failed";
				}
			}
			else if(this.getSelecttype()!=null&&this.getSelecttype().equals("Boss"))
			{
				BossServiceImpl bsi=new BossServiceImpl();
				Boss b=bsi.getBossDAO().queryById(this.getId());
				if(bsi.getBossDAO().queryByName(this.getName())!=null)
				{
					return "failed";
				}
				b.setName(this.getName());
				b.setMail(this.getMail());
				b.setTel(this.getTele());
				b.setAdress(this.getAdress());
				if(b.getPassword().equals(this.getOldpassword()))
				{
					b.setPassword(this.getNewpassword());
					bsi.getBossDAO().update(b);
					return "success";
				}
				else
				{
					return "failed";
				}
			}
			return "failed";
		}
		public String getSelecttype() {
			return selecttype;
		}
		public void setSelecttype(String selecttype) {
			this.selecttype = selecttype;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getMail() {
			return mail;
		}
		public void setMail(String mail) {
			this.mail = mail;
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
		public String getNewpassword() {
			return newpassword;
		}
		public void setNewpassword(String newpassword) {
			this.newpassword = newpassword;
		}
		public String getOldpassword() {
			return oldpassword;
		}
		public void setOldpassword(String oldpassword) {
			this.oldpassword = oldpassword;
		}
		public String getCheckpassword() {
			return checkpassword;
		}
		public void setCheckpassword(String checkpassword) {
			this.checkpassword = checkpassword;
		}
		

}
