package Action;

import java.util.Date;

import Model.Goods;
import Model.Orderlist;
import Model.Sendmessage;
import Model.User;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class OrderlistCreateAction extends ActionSupport{
	private int orderuser;
	private int ordergoods;
	private String ordernum;
	private double orderonegoodsspend;
	private int selectsendmessage;
	private String orderlistaddmessage;
	
	public String createorder()
	{
		System.out.println("orderuser:"+this.getOrderuser());
		System.out.println("ordergoods:"+this.getOrdergoods());
		System.out.println("ordernum:"+this.getOrdernum());
		System.out.println("orderonegoodsspend:"+this.getOrderonegoodsspend());
		System.out.println("selectsendmessage:"+this.getSelectsendmessage());
		System.out.println("orderlistaddmessage:"+this.getOrderlistaddmessage());
		UserServiceImpl usi=new UserServiceImpl();
		Goods g=usi.getGoodsDAO().queryById(this.getOrdergoods());
		User u=usi.getUserDAO().queryById(this.getOrderuser());
		Sendmessage sm=usi.getSendmessageDAO().queryById(this.getSelectsendmessage());
		int gnum=Integer.parseInt(this.getOrdernum());
		Orderlist o=new Orderlist();
		o.setFromdate(new Date());
		o.setGoods(g);
		o.setUser(u);
		o.setNum(gnum);
		o.setStatus(0);
		o.setAmountpay(gnum*this.getOrderonegoodsspend());
		o.setSendmessage(sm);
		o.setAddmessage(this.getOrderlistaddmessage());
		if(usi.getOrderlistDAO().createorderlist(o))
			return "success";
		return "failed";
	}
	public int getOrderuser() {
		return orderuser;
	}
	public void setOrderuser(int orderuser) {
		this.orderuser = orderuser;
	}
	public int getOrdergoods() {
		return ordergoods;
	}
	public void setOrdergoods(int ordergoods) {
		this.ordergoods = ordergoods;
	}
	public String getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public double getOrderonegoodsspend() {
		return orderonegoodsspend;
	}
	public void setOrderonegoodsspend(double orderonegoodsspend) {
		this.orderonegoodsspend = orderonegoodsspend;
	}
	public int getSelectsendmessage() {
		return selectsendmessage;
	}
	public void setSelectsendmessage(int selectsendmessage) {
		this.selectsendmessage = selectsendmessage;
	}
	public String getOrderlistaddmessage() {
		return orderlistaddmessage;
	}
	public void setOrderlistaddmessage(String orderlistaddmessage) {
		this.orderlistaddmessage = orderlistaddmessage;
	}
	
}
