package Action;

import Model.Sendmessage;
import Model.User;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UserManagementSendmessageUpdateAction extends ActionSupport{
	private int sendmessageid;
	private int userid;
	private String sendadress;
	private String sendtoname;
	private String sendpostcode;
	
	public String delete()
	{
		System.out.println("sendmessageid:"+this.getSendmessageid());
		UserServiceImpl usi=new UserServiceImpl();
		Sendmessage sm=usi.getSendmessageDAO().queryById(this.getSendmessageid());
		if(usi.getSendmessageDAO().delete(sm))
			return "success";
		return "failed";
	}
	public String add()
	{
		System.out.println("sendtoname:"+this.getSendtoname());
		System.out.println("sendadress:"+this.getSendadress());
		System.out.println("sendpostcode:"+this.getSendpostcode());
		System.out.println("userid:"+this.getUserid());
		UserServiceImpl usi=new UserServiceImpl();
		User u=usi.getUserDAO().queryById(this.getUserid());
		Sendmessage sm=new Sendmessage();
		sm.setAdress(this.getSendadress());
		sm.setToname(this.getSendtoname());
		sm.setPostcode(this.getSendpostcode());
		sm.setUser(u);
		if(usi.getSendmessageDAO().create(sm))
			return "success";
		return "failed";

	}
	public String update()
	{
		System.out.println("sendmessageid:"+this.getSendmessageid());
		System.out.println("sendtoname:"+this.getSendtoname());
		System.out.println("sendadress:"+this.getSendadress());
		System.out.println("sendpostcode:"+this.getSendpostcode());
		UserServiceImpl usi=new UserServiceImpl();
		Sendmessage sm=usi.getSendmessageDAO().queryById(this.getSendmessageid());
		sm.setAdress(this.getSendadress());
		sm.setToname(this.getSendtoname());
		sm.setPostcode(this.getSendpostcode());
		if(usi.getSendmessageDAO().update(sm))
			return "success";
		return "failed";
	}
	
	public int getSendmessageid() {
		return sendmessageid;
	}
	public void setSendmessageid(int sendmessageid) {
		this.sendmessageid = sendmessageid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getSendadress() {
		return sendadress;
	}
	public void setSendadress(String sendadress) {
		this.sendadress = sendadress;
	}
	public String getSendtoname() {
		return sendtoname;
	}
	public void setSendtoname(String sendtoname) {
		this.sendtoname = sendtoname;
	}
	public String getSendpostcode() {
		return sendpostcode;
	}
	public void setSendpostcode(String sendpostcode) {
		this.sendpostcode = sendpostcode;
	}
	
}
