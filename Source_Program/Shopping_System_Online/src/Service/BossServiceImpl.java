package Service;

import java.util.ArrayList;
import java.util.List;

import Dao.BossDAO;
import Dao.CommentDAO;
import Dao.GoodsDAO;
import Dao.GoodstypeDAO;
import Dao.OrderlistDAO;
import Dao.PictureDAO;
import Dao.ShopDAO;
import Dao.TransrecordDAO;
import Model.Boss;
import Model.Goods;
import Model.Goodstype;
import Model.Orderlist;
import Model.Picture;
import Model.Shop;
import Model.Transrecord;

public class BossServiceImpl implements BossService {
	
	private BossDAO bossDAO=new BossDAO();
	private ShopDAO shopDAO=new ShopDAO();
	private GoodsDAO goodsDAO=new GoodsDAO();
	private OrderlistDAO orderlistDAO=new OrderlistDAO();
	private TransrecordDAO transrecordDAO=new TransrecordDAO();
	private PictureDAO pictureDAO=new PictureDAO();
	private CommentDAO commentDAO=new CommentDAO();
	private GoodstypeDAO goodstypeDAO=new GoodstypeDAO();
	
	@Override
	public Boolean login(String bossname, String password) {
		Boss b1=bossDAO.queryByName(bossname);
        if(b1!=null&&b1.getPassword().equals(password))
        	return true;
        return false;
	}

	@Override
	public Boolean register(Boss newboss) {
		Boss b2=bossDAO.queryByName(newboss.getName());
		if(b2!=null)
			return false;
		else{
			bossDAO.create(newboss);
			return true;
		}
	}

	@Override
	public Boolean updateBoss(Boss boss) {
		this.bossDAO.update(boss);
		return true;
	}

	@Override
	public Boolean updateShop(Shop shop) {
		this.shopDAO.update(shop);
		return true;
	}

	@Override
	public List<Goods> queryAllGoods(Shop shop) {
		return this.goodsDAO.queryByShop(shop);
	}

	@Override
	public List<Goods> queryGoodsByType(Shop shop,Goodstype goodstype) {
		List<Goods> g=this.goodsDAO.queryByShop(shop);
		if(g.isEmpty())
			return null;
		List<Goods> g2=new ArrayList<Goods>();
		for(int j=0;j<g.size();j++)
		{
			Goods gx=g.get(j);
			if(gx.getGoodstypes().contains(goodstype));
			    g2.add(gx);
		}
		return g2;
	}

	@Override
	public Goods queryGoodsByName(Shop shop,String goodsname) {
		List<Goods> gs=this.goodsDAO.queryByShop(shop);
		if(gs.isEmpty())
			return null;
		for(int i=0;i<gs.size();i++)
		{
			if(gs.get(i).getName().equals(goodsname))
				return gs.get(i);
		}
		return null;
	}

	@Override
	public Boolean createGoods(Shop shop,Goods goods) {
		List<Goods> gs=this.goodsDAO.queryByShop(shop);
		gs.add(goods);
		shop.setGoods(gs);
		this.shopDAO.update(shop);
		return true;
	}

	@Override
	public Boolean updateGoods(Goods goods) {
		this.goodsDAO.update(goods);
		return true;
	}

	@Override
	public Boolean deleteGoods(Shop shop,Goods goods) {
		/*List<Goods> gs=this.goodsDAO.queryByShop(shop);
		if(gs!=null&&!gs.isEmpty())
		{
			for(int i=0;i<gs.size();i++)
			{
				if(gs.get(i).equals(goods))
					gs.remove(i);
			}
			shop.setGoods(gs);
			this.shopDAO.update(shop);
			return true;
		}
		return false;*/
		this.getGoodsDAO().delete(goods);
		return true;
	}

	@Override
	public List<Orderlist> queryAllOrderlist(Shop shop) {
		List<Goods> gs=this.goodsDAO.queryByShop(shop);
		List<Orderlist> go=new ArrayList<Orderlist>();
		if(!gs.isEmpty())
		{
			for(int j=0;j<gs.size();j++)
			{
				List<Orderlist> or=this.orderlistDAO.queryByGoods(gs.get(j));
				if(!or.isEmpty())
				{
					for(int k=0;k<or.size();k++)
						go.add(or.get(k));
				}
			}
			return go;
		}
		return null;
	}

	@Override
	public List<Orderlist> queryOrderlistByName(Shop shop,Goods goods) {
		List<Orderlist> lo=this.orderlistDAO.queryByGoods(goods);
		return lo;
	}

	@Override
	public List<Transrecord> queryAllTRecord(Shop shop) {
		List<Transrecord> tr=this.transrecordDAO.queryByShop(shop.getId());
		return tr;
	}

	@Override
	public List<Transrecord> queryTRecordByGoods(Shop shop,Goods goods) {
		List<Transrecord> tr1=this.transrecordDAO.queryByShop(shop.getId());
		List<Transrecord> tr2=this.transrecordDAO.queryByGoods(goods.getId());
		for(int i=0;i<tr2.size();i++)
		{
			if(tr1.contains(tr2.get(i)))
				tr1.remove(tr2.get(i));
		}
		return tr1;
	}
	
	@Override
	public Boolean deleteGoodsPicture(Goods goods, Picture picture) {
		List<Picture> pics=this.getPictureDAO().queryByGoods(goods);
		if(pics!=null&&!pics.isEmpty())
		{
			for(int i=0;i<pics.size();i++)
			{
				if(pics.get(i).getId()==picture.getId())
					pics.remove(i);
			}
		}
		goods.setPictures(pics);
		this.getGoodsDAO().update(goods);
		this.getPictureDAO().delete(picture);
		return true;
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

	public GoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public OrderlistDAO getOrderlistDAO() {
		return orderlistDAO;
	}

	public void setOrderlistDAO(OrderlistDAO orderlistDAO) {
		this.orderlistDAO = orderlistDAO;
	}

	public TransrecordDAO getTransrecordDAO() {
		return transrecordDAO;
	}

	public void setTransrecordDAO(TransrecordDAO transrecordDAO) {
		this.transrecordDAO = transrecordDAO;
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

	public GoodstypeDAO getGoodstypeDAO() {
		return goodstypeDAO;
	}

	public void setGoodstypeDAO(GoodstypeDAO goodstypeDAO) {
		this.goodstypeDAO = goodstypeDAO;
	}

	

	

}
