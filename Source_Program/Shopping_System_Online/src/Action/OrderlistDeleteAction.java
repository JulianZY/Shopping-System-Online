package Action;

import Model.Orderlist;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class OrderlistDeleteAction extends ActionSupport{
	private int orderlistid;

	public String delete()
	{
		System.out.println("orderlistid"+this.getOrderlistid());
		UserServiceImpl usi=new UserServiceImpl();
		Orderlist o=usi.getOrderlistDAO().queryById(this.getOrderlistid());
		if(usi.cancelOrder(o))
			return "success";
		return "failed";
	}
	public int getOrderlistid() {
		return orderlistid;
	}

	public void setOrderlistid(int orderlistid) {
		this.orderlistid = orderlistid;
	}
}
