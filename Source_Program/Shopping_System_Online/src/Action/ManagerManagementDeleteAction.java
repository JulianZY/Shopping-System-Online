package Action;

import Model.Boss;
import Model.Goods;
import Model.User;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ManagerManagementDeleteAction extends ActionSupport{
		private String userid;
		private String bossid;
		private String goodsid;
		public String deleteuser()
		{
			System.out.println("userid:"+this.getUserid());
			ManagerServiceImpl msi=new ManagerServiceImpl();
			int id=Integer.parseInt(this.getUserid());
			User u=msi.getUserDAO().queryById(id);
			if(msi.deleteUser(u))
				return "success";
			return "failed";
		}
		public String deleteboss()
		{
			System.out.println("bossid:"+this.getBossid());
			ManagerServiceImpl msi=new ManagerServiceImpl();
			int id=Integer.parseInt(this.getBossid());
			Boss b=msi.getBossDAO().queryById(id);
			if(msi.deleteBoss(b))
				return "success";
			return "failed";
		}
		public String deletegoods()
		{
			System.out.println("goodsid:"+this.getGoodsid());
			ManagerServiceImpl msi=new ManagerServiceImpl();
			int id=Integer.parseInt(this.getGoodsid());
			Goods g=msi.getGoodsDAO().queryById(id);
			if(msi.deleteGoods(g))
				return "success";
			return "failed";
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getBossid() {
			return bossid;
		}
		public void setBossid(String bossid) {
			this.bossid = bossid;
		}
		public String getGoodsid() {
			return goodsid;
		}
		public void setGoodsid(String goodsid) {
			this.goodsid = goodsid;
		}

}
