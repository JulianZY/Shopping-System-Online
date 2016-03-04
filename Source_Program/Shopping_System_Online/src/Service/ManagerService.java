package Service;

import java.util.List;

import Model.Boss;
import Model.Comment;
import Model.Goods;
import Model.Goodstype;
import Model.Manager;
import Model.Shop;
import Model.Transrecord;
import Model.User;

public interface ManagerService {
	
	public Boolean login(String managername,String password);
	public Boolean updateManager(Manager manager);
	
	public User queryUser(String username);
	public List<User> queryAllUsers();
	public Boolean deleteUser(User user);
	
	public Boss queryBoss(String bossname);
	public List<Boss> queryAllBoss();
	public Boolean deleteBoss(Boss boss);
	
	public List<Transrecord> queryAllTRecord();
	public List<Transrecord> queryTRecordByUser(String username);
	public List<Transrecord> queryTRecordByShop(Shop shop);
	public Boolean deleteTRecord(Transrecord transrecord);
	
	public Boolean createTRecord(Transrecord transrecord);
	
	public List<Goods> queryGoods(String goodsname);
	public Boolean deleteGoods(Goods goods);
	
	public List<Goodstype> queryAllGoodstype();
	public Boolean updateGoodstype(Goodstype goodstype);
	public Boolean createGoodstype(Goodstype goodstype);
	public Boolean deleteGoodstype(Goodstype goodstype);
	
	public List<Comment> queryAllComment();
	public List<Comment> queryCommentByGoods(Goods goods);
	public Boolean deleteComment(Comment comment);
}
