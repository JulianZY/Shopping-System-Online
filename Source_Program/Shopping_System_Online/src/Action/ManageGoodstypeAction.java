package Action;

import Model.Goodstype;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ManageGoodstypeAction extends ActionSupport{
	private String typeid;
	private String type;
	
	public String delete()
	{
		System.out.println("typeid:"+this.getTypeid());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		int id=Integer.parseInt(this.getTypeid());
		Goodstype g=msi.getGoodstypeDAO().queryById(id);
		if(msi.deleteGoodstype(g))
			return "success";
		return "failed";
	}
	public String add()
	{
		System.out.println("type:"+this.getType());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		Goodstype g=new Goodstype();
		g.setType(this.getType());
		if(msi.getGoodstypeDAO().queryByType(this.getType())==null)
		{
			msi.createGoodstype(g);
			return "success";
		}
		return "failed";
	}

	public String change()
	{
		System.out.println("typeid:"+this.getTypeid());
		System.out.println("type:"+this.getType());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		int id=Integer.parseInt(this.getTypeid());
		Goodstype g=msi.getGoodstypeDAO().queryById(id);
		if(g!=null&&msi.getGoodstypeDAO().queryByType(this.getType())==null)
		{
			g.setType(this.getType());
			msi.getGoodstypeDAO().update(g);
			return "success";
		}
		return "failed";
	}
	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
