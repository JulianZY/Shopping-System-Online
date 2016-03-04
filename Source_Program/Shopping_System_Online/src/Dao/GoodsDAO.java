package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Goods;
import Model.Goodstype;
import Model.Shop;
import Model.Shopcar;
import Action.HibernateUtils;


public class GoodsDAO {
	
	public Boolean create(Goods goods){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(goods); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Goods goods){
		Session session=HibernateUtils.getSession();
		String command="delete Goods where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(goods); 
		Query query=session.createQuery(command);
		query.setParameter("id", goods.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean deletegoodstype(int gid,int gtid){
		Session session=HibernateUtils.getSession();
		String command="delete from goods_goodstype where goods_id='"+gid+"' and goodstypes_id='"+gtid+"'";
		Transaction tx=session.beginTransaction();
		//session.delete(goods); 
		Query query=session.createSQLQuery(command);
		//query.setParameter("id", goods.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Goods goods){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(goods); 
		tx.commit();
		session.close();
		return true;
	}

	public Goods queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Goods goods=(Goods)session.get(Goods.class, id);
		tx.commit();
		session.close();
		return goods;
	}
	
	public List<Goods> queryByName(String name){
		String command="from Goods as g where g.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<Goods> goodses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return goodses;
	}
	
	///////////////////////
	public 	List<Goods> queryByShop(/*Integer sid*/Shop shop){
		/*String command="from Goods as g where g.shop_id='";*/
		String command="from Goods as g where g.shop=:shop";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+sid+"'");*/ 
		Query query=session.createQuery(command);
		query.setParameter("shop", shop);
		List<Goods> goodses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return goodses;
	}
	///////////////////////
	
	public List<Goods> queryByShopcar(Shopcar shopcar){
		String command="select g from Goods g inner join g.shopcars sc where sc=:shopcar";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command);
		query.setParameter("shopcar", shopcar);
		List<Goods> goodses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return goodses;
	}
	
	public 	List<Goods> queryByGoodstype(Goodstype goodstype){
		String command="select g from Goods g inner join g.goodstypes gt where gt=:goodstype";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command);
		query.setParameter("goodstype", goodstype);
		List<Goods> goodses=query.list();
		tx.commit();
		session.close();
		return goodses;
	}
	
	public 	List<Goods> queryAll(){
		String command="from Goods g";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Goods> goodses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return goodses;
	}
}