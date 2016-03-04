package Service;

import java.util.List;

import Dao.BossDAO;
import Dao.CommentDAO;
import Dao.GoodsDAO;
import Dao.GoodstypeDAO;
import Dao.ManagerDAO;
import Dao.OrderlistDAO;
import Dao.PictureDAO;
import Dao.SendmessageDAO;
import Dao.ShopDAO;
import Dao.ShopcarDAO;
import Dao.TransrecordDAO;
import Dao.UserDAO;
import Model.Boss;
import Model.Comment;
import Model.Goods;
import Model.Goodstype;
import Model.Manager;
import Model.Shop;
import Model.Transrecord;
import Model.User;

public class ManagerServiceImpl implements ManagerService {
	
	private UserDAO userDAO=new UserDAO();
	private OrderlistDAO orderlistDAO=new OrderlistDAO();
	private GoodsDAO goodsDAO=new GoodsDAO();
	private TransrecordDAO transrecordDAO=new TransrecordDAO();
	private ShopcarDAO shopcarDAO=new ShopcarDAO();
	private GoodstypeDAO goodstypeDAO=new GoodstypeDAO();
	private SendmessageDAO sendmessageDAO=new SendmessageDAO();
	private ManagerDAO managerDAO=new ManagerDAO();
	private BossDAO bossDAO=new BossDAO();
	private ShopDAO shopDAO=new ShopDAO();
	private CommentDAO commentDAO=new CommentDAO();
	private PictureDAO pictureDAO=new PictureDAO();
	

	@Override
	public Boolean login(String managername, String password) {
		 Manager m=this.managerDAO.queryByName(managername);
	        if(m!=null&&m.getPassword().equals(password))
	        	return true;
	        return false;
	}

	@Override
	public Boolean updateManager(Manager manager) {
		this.managerDAO.update(manager);
		return true;
	}

	@Override
	public User queryUser(String username) {
		return this.userDAO.queryByName(username);
	}
	
	@Override
	public List<User> queryAllUsers(){
		return this.userDAO.queryAll();
	}
	
	@Override
	public Boolean deleteUser(User user) {
		if(this.userDAO.queryById(user.getId())!=null)
		{
		    this.userDAO.delete(user);
		    return true;
		}
		return false;
	}

	@Override
	public Boss queryBoss(String bossname) {
		return this.bossDAO.queryByName(bossname);
	}
	
	@Override
	public List<Boss> queryAllBoss(){
		return this.bossDAO.queryAll();
	}
	
	@Override
	public Boolean deleteBoss(Boss boss) {
		if(this.bossDAO.queryById(boss.getId())!=null)
		{
			this.bossDAO.delete(boss);
			return true;
		}
		return false;
	}

	@Override
	public List<Transrecord> queryAllTRecord() {
		return this.transrecordDAO.queryAll();
	}

	@Override
	public List<Transrecord> queryTRecordByUser(String username) {
		User u=this.userDAO.queryByName(username);
		if(u!=null)
		    return this.transrecordDAO.queryByUser(u.getId());
		return null;
	}

	@Override
	public List<Transrecord> queryTRecordByShop(Shop shop) {
		Shop s=this.shopDAO.queryById(shop.getId());
		if(s!=null)
		{
			return this.transrecordDAO.queryByShop(s.getId());
		}
		return null;
	}

	@Override
	public Boolean deleteTRecord(Transrecord transrecord) {
		if(this.transrecordDAO.queryById(transrecord.getId())!=null)
		{
			this.transrecordDAO.delete(transrecord);
			return true;
		}
		return false;
	}

	@Override
	public Boolean createTRecord(Transrecord transrecord) {
		this.transrecordDAO.create(transrecord);
		return true;
	}

	@Override
	public List<Goods> queryGoods(String goodsname) {
		return this.goodsDAO.queryByName(goodsname);
	}

	@Override
	public Boolean deleteGoods(Goods goods) {
		if(this.goodsDAO.queryById(goods.getId())!=null)
		{
			this.goodsDAO.delete(goods);
			return true;
		}
		return false;
	}

	@Override
	public List<Goodstype> queryAllGoodstype() {
		return this.goodstypeDAO.queryAll();
	}

	@Override
	public Boolean updateGoodstype(Goodstype goodstype) {
		this.goodstypeDAO.update(goodstype);
		return true;
	}

	@Override
	public Boolean createGoodstype(Goodstype goodstype) {
			this.goodstypeDAO.create(goodstype);
			return true;
	}

	@Override
	public Boolean deleteGoodstype(Goodstype goodstype) {
		if(this.goodstypeDAO.queryById(goodstype.getId())!=null)
		{
			this.goodstypeDAO.delete(goodstype);
			return true;
		}
		return false;
	}

	@Override
	public List<Comment> queryAllComment() {
		return this.commentDAO.queryAll();
	}

	@Override
	public List<Comment> queryCommentByGoods(Goods goods) {
		return this.commentDAO.queryByGoods(goods);
	}

	@Override
	public Boolean deleteComment(Comment comment) {
		if(this.commentDAO.queryById(comment.getId())!=null)
		{
			this.commentDAO.delete(comment);
			return true;
		}
		return false;
	}
	
	public ManagerDAO getManagerDAO() {
		return managerDAO;
	}

	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	public BossDAO getBossDAO() {
		return bossDAO;
	}

	public void setBossDAO(BossDAO bossDAO) {
		this.bossDAO = bossDAO;
	}

	public ShopDAO getShopDAO() {
		return shopDAO;
	}

	public void setShopDAO(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}

	public CommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
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

	public PictureDAO getPictureDAO() {
		return pictureDAO;
	}

	public void setPictureDAO(PictureDAO pictureDAO) {
		this.pictureDAO = pictureDAO;
	}

}
