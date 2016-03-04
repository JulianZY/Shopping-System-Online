package Action;

import java.util.Date;

import Model.Comment;
import Model.Goods;
import Model.User;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CommentCreateAction extends ActionSupport{
	private int orderuser;
	private int ordergoods;
	private String commenttext;
	
	public String createcomment()
	{
		System.out.println("orderuser:"+this.getOrderuser());
		System.out.println("ordergoods:"+this.getOrdergoods());
		System.out.println("commenttext:"+this.getCommenttext());
		ManagerServiceImpl msi=new ManagerServiceImpl();
		User u=msi.getUserDAO().queryById(this.getOrderuser());
		Goods g=msi.getGoodsDAO().queryById(this.getOrdergoods());
		Comment c=new Comment();
		c.setGoods(g);
		c.setCommentdate(new Date());
		c.setText(this.getCommenttext());
		c.setUser(u);
		if(msi.getCommentDAO().create(c))
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
	public String getCommenttext() {
		return commenttext;
	}
	public void setCommenttext(String commenttext) {
		this.commenttext = commenttext;
	}
	
}
