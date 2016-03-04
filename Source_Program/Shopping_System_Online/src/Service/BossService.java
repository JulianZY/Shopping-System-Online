package Service;

import java.util.List;

import Model.Boss;
import Model.Goods;
import Model.Goodstype;
import Model.Orderlist;
import Model.Picture;
import Model.Shop;
import Model.Transrecord;

public interface BossService {
	
	public Boolean login(String bossname,String password);
	public Boolean register(Boss newboss);
	public Boolean updateBoss(Boss boss);
	public Boolean updateShop(Shop shop);
	public List<Goods> queryAllGoods(Shop shop);
	public List<Goods> queryGoodsByType(Shop shop,Goodstype goodstype);
	public Goods queryGoodsByName(Shop shop,String goodsname);
	public Boolean createGoods(Shop shop,Goods goods);
	public Boolean updateGoods(Goods goods);
	public Boolean deleteGoods(Shop shop,Goods goods);
	public List<Orderlist> queryAllOrderlist(Shop shop);
	public List<Orderlist> queryOrderlistByName(Shop shop,Goods goods);
	public List<Transrecord> queryAllTRecord(Shop shop);
	public List<Transrecord> queryTRecordByGoods(Shop shop,Goods goods);
	public Boolean deleteGoodsPicture(Goods goods,Picture picture);
}
