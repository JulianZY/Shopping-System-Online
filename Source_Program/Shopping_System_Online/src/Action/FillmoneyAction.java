package Action;

import java.util.List;

import Dao.BankDAO;
import Dao.BankaccountDAO;
import Model.Bank;
import Model.Bankaccount;
import Model.User;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class FillmoneyAction extends ActionSupport{
	private int bankid;
	private int userid;
	private String bankaccountname;
	private String bankaccountpassword;
	private double fillmoneynumber;
	
	public String fillmoney()
	{
		System.out.println("bankid:"+this.getBankid());
		System.out.println("userid:"+this.getUserid());
		System.out.println("bankaccountname:"+this.getBankaccountname());
		System.out.println("bankaccountpassword:"+this.getBankaccountpassword());
		System.out.println("fillmoneynumber:"+this.getFillmoneynumber());
		BankDAO bankDAO=new BankDAO();
		BankaccountDAO bankaccountDAO=new BankaccountDAO();
		Bank b=bankDAO.queryById(this.getBankid());
		UserServiceImpl usi=new UserServiceImpl();
		User u=usi.getUserDAO().queryById(this.getUserid());
		List<Bankaccount> bcs=bankaccountDAO.queryByBank(b);
		String index="failed";
		for(int i=0;i<bcs.size();i++)
		{
			if(bcs.get(i).getName().equals(this.getBankaccountname())&&bcs.get(i).getPassword().equals(this.getBankaccountpassword()))
			{
				index="success";
				if(bcs.get(i).getFunds()<this.getFillmoneynumber())
				{
					return "failed";
				}
				else
				{
					Bankaccount bc=bcs.get(i);
					bc.setFunds(bc.getFunds()-this.getFillmoneynumber());
					u.setLeftmoney(u.getLeftmoney()+this.getFillmoneynumber());
					if(bankaccountDAO.update(bc)&&usi.getUserDAO().update(u))
					{
						return "success";
					}
				}
			}
		}
		return index;
	}
	public int getBankid() {
		return bankid;
	}
	public void setBankid(int bankid) {
		this.bankid = bankid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getBankaccountname() {
		return bankaccountname;
	}
	public void setBankaccountname(String bankaccountname) {
		this.bankaccountname = bankaccountname;
	}
	public String getBankaccountpassword() {
		return bankaccountpassword;
	}
	public void setBankaccountpassword(String bankaccountpassword) {
		this.bankaccountpassword = bankaccountpassword;
	}
	public double getFillmoneynumber() {
		return fillmoneynumber;
	}
	public void setFillmoneynumber(double fillmoneynumber) {
		this.fillmoneynumber = fillmoneynumber;
	}
	
}
