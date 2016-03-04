package Service;

import java.util.Date;
import java.util.List;

import Dao.CommentDAO;
import Dao.GoodsDAO;
import Dao.GoodstypeDAO;
import Dao.OrderlistDAO;
import Dao.PictureDAO;
import Dao.SendmessageDAO;
import Dao.ShopDAO;
import Dao.ShopcarDAO;
import Dao.TransrecordDAO;
import Dao.UserDAO;
import Model.Comment;
import Model.Goods;
import Model.Goodstype;
import Model.Orderlist;
import Model.Sendmessage;
import Model.Shop;
import Model.Shopcar;
import Model.Transrecord;
import Model.User;

public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO=new UserDAO();
	private OrderlistDAO orderlistDAO=new OrderlistDAO();
	private GoodsDAO goodsDAO=new GoodsDAO();
	private TransrecordDAO transrecordDAO=new TransrecordDAO();
	private ShopcarDAO shopcarDAO=new ShopcarDAO();
	private GoodstypeDAO goodstypeDAO=new GoodstypeDAO();
	private SendmessageDAO sendmessageDAO=new SendmessageDAO();
	private PictureDAO pictureDAO=new PictureDAO();
	private CommentDAO commentDAO=new CommentDAO();
	private ShopDAO shopDAO=new ShopDAO();
	@Override
	public Boolean login(String username, String password) {
        User u1=userDAO.queryByName(username);
        if(u1!=null&&u1.getPassword().equals(password))
        	return true;
        return false;
	}

	@Override
	public Boolean register(User newuser) {
		User u2=userDAO.queryByName(newuser.getName());
		if(u2!=null)
			return false;
		else{
			userDAO.create(newuser);
			return true;
		}
	}

	@Override
	public Boolean createOrder(Orderlist orderlist) {
		this.orderlistDAO.create(orderlist);
		return true;
	}

	@Override
	public Boolean cancelOrder(Orderlist orderlist) {
		this.orderlistDAO.delete(orderlist);
		return true;
	}

	@Override
	public Boolean payMoney(Orderlist orderlist) {
		User u=orderlist.getUser();
		Goods g=orderlist.getGoods();
		Shop s=g.getShop();
		orderlist.setStatus(1);
		Shopcar sc=u.getShopcar();
		List<Goods> gos=this.getGoodsDAO().queryByShopcar(sc);
		
		if(u.getLeftmoney()<orderlist.getAmountpay())
		{
			return false;
		}
		u.setLeftmoney(u.getLeftmoney()-orderlist.getAmountpay());
		u.setMarks(u.getMarks()+g.getMark()*orderlist.getNum());
		s.setMarks(s.getMarks()+g.getMark()*orderlist.getNum()*10);
		gos.add(orderlist.getGoods());
		sc.setGoodss(gos);
		if(u.getMarks()>u.getVlevel()*10000&&u.getMarks()<100000)
		{
			u.setVlevel(u.getVlevel()+1);
		}
		if(s.getMarks()>s.getLevel()*100000&&u.getMarks()<500000)
		{
			s.setLevel(s.getLevel()+1);
		}
		 g.setNum(g.getNum()-orderlist.getNum());
		 this.goodsDAO.update(g);
		 this.userDAO.update(u);
		 this.orderlistDAO.update(orderlist);
		 this.shopDAO.update(s);
		 this.shopcarDAO.update(sc);
		 
		 System.out.println("ids-test1");
		 Transrecord tr=new Transrecord();
		 tr.setGid(g.getId());
		 tr.setUid(u.getId());
		 tr.setSid(g.getShop().getId());
		 tr.setSmid(orderlist.getSendmessage().getId());
		 tr.setTransdate(new Date());
		 tr.setTransnum(orderlist.getNum());
		 tr.setTransamount(orderlist.getAmountpay());
		 this.transrecordDAO.create(tr);
		 System.out.println("ids-test2");
		 return true;
	}

	@Override
	public List<Transrecord> queryTRecord(User user) {
		
		List<Transrecord> trs=this.transrecordDAO.queryByUser(user.getId());
		return trs;
	}

	@Override
	public Shopcar queryShopcar(User user) {
		return this.shopcarDAO.queryByUser(user);
	}

	@Override
	public Boolean updateUser(User user) {
		this.userDAO.update(user);
		return true;
	}

	@Override
	public List<Goods> searchGoodsByName(String goodsname) {
		List<Goods> gos=this.goodsDAO.queryByName(goodsname);
		return gos;
	}

	@Override
	public List<Goods> searchGoodsByType(String goodstype) {
		Goodstype gt=this.goodstypeDAO.queryByType(goodstype);
		List<Goods> gos=this.goodsDAO.queryByGoodstype(gt);
		return gos;
	}

	@Override
	public Boolean createSendmessage(Sendmessage sendmessage) {
		this.sendmessageDAO.create(sendmessage);
		return true;
	}

	@Override
	public List<Sendmessage> querySendmessage(User user) {
		List<Sendmessage> sms=this.sendmessageDAO.queryByUser(user);
		return sms;
	}

	@Override
	public Boolean updateSendmessage(Sendmessage sendmessage) {
		this.sendmessageDAO.update(sendmessage);
		return true;
	}
	@Override
	public List<Comment> queryComments(User user) {
		List<Comment> lc=this.commentDAO.queryByUser(user);
		return lc;
	}

	

	public OrderlistDAO getOrderlistDAO() {
		return orderlistDAO;
	}

	public void setOrderlistDAO(OrderlistDAO orderlistDAO) {
		this.orderlistDAO = orderlistDAO;
	}

	public GoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public TransrecordDAO getTransrecordDAO() {
		return transrecordDAO;
	}

	public void setTransrecordDAO(TransrecordDAO transrecordDAO) {
		this.transrecordDAO = transrecordDAO;
	}

	public ShopcarDAO getShopcarDAO() {
		return shopcarDAO;
	}

	public void setShopcarDAO(ShopcarDAO shopcarDAO) {
		this.shopcarDAO = shopcarDAO;
	}

	public GoodstypeDAO getGoodstypeDAO() {
		return goodstypeDAO;
	}

	public void setGoodstypeDAO(GoodstypeDAO goodstypeDAO) {
		this.goodstypeDAO = goodstypeDAO;
	}

	public SendmessageDAO getSendmessageDAO() {
		return sendmessageDAO;
	}

	public void setSendmessageDAO(SendmessageDAO sendmessageDAO) {
		this.sendmessageDAO = sendmessageDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public PictureDAO getPictureDAO() {
		return pictureDAO;
	}

	public void setPictureDAO(PictureDAO pictureDAO) {
		this.pictureDAO = pictureDAO;
	}

	public CommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public ShopDAO getShopDAO() {
		return shopDAO;
	}

	public void setShopDAO(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}

	
}
