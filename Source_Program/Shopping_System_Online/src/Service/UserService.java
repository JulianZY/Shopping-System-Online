package Service;

import java.util.List;

import Model.Comment;
import Model.Goods;
import Model.Orderlist;
import Model.Sendmessage;
import Model.Shopcar;
import Model.Transrecord;
import Model.User;

public interface UserService {
	
	public Boolean login(String username,String password);
	public Boolean register(User newuser);
	public Boolean createOrder(Orderlist Orderlist);
	public Boolean cancelOrder(Orderlist Orderlist);
	public Boolean payMoney(Orderlist orderlist);
	public List<Transrecord> queryTRecord(User user);
	public Shopcar queryShopcar(User user);
	public Boolean updateUser(User user);
	public List<Goods> searchGoodsByName(String goodsname);
	public List<Goods> searchGoodsByType(String goodstype);
	public Boolean createSendmessage(Sendmessage sendmessage);
	public List<Sendmessage> querySendmessage(User user);
	public Boolean updateSendmessage(Sendmessage sendmessage);
	public List<Comment> queryComments(User user);
}
