package Action;

import java.util.List;

import Model.Goods;
import Model.Orderlist;
import Model.Shopcar;
import Model.User;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PayAction extends ActionSupport{
	private int userid;
	private double allpay;
	private String ids;
	
	public String pay()
	{
		System.out.println("allpay:"+this.getAllpay());
		System.out.println("ids"+this.getIds());
		UserServiceImpl usi=new UserServiceImpl();
		String[] idss=this.getIds().split("#");
		String index="success";
		User u=usi.getUserDAO().queryById(this.getUserid());
		//Shopcar sc=u.getShopcar();
		//List<Goods> gos=usi.getGoodsDAO().queryByShopcar(sc);
		if(this.getAllpay()>u.getLeftmoney())
			return "failed";
		for(int i=0;i<idss.length;i++)
		{
			int id=Integer.parseInt(idss[i]);
			System.out.println("id::"+id);
			Orderlist o=usi.getOrderlistDAO().queryById(id);
			//gos.add(o.getGoods());
			Boolean x=usi.payMoney(o);
			if(x==false)
				index="failed";
		}
		//sc.setGoodss(gos);
		//User u2=usi.getUserDAO().queryById(this.getUserid());
		//u2.setShopcar(sc);
		//usi.getUserDAO().update(u2);
		return index;
	}
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public double getAllpay() {
		return allpay;
	}
	public void setAllpay(double allpay) {
		this.allpay = allpay;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
