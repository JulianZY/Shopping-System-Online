package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Goods;
import Model.Goodstype;
import Model.Manager;
import Action.HibernateUtils;


public class GoodstypeDAO {
	
	public Boolean create(Goodstype goodstype){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(goodstype);
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Goodstype goodstype){
		Session session=HibernateUtils.getSession();
		String command="delete Goodstype where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(goodstype); 
		Query query=session.createQuery(command);
		query.setParameter("id", goodstype.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Goodstype goodstype){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(goodstype); 
		tx.commit();
		session.close();
		return true;
	}

	public Goodstype queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Goodstype goodstype=(Goodstype)session.get(Goodstype.class, id);
		tx.commit();
		session.close();
		return goodstype;
	}
	
	public Goodstype queryByType(String type){
		String command="from Goodstype as gt where gt.type='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+type+"'"); 
		List<Goodstype> goodstypes=query.list(); 
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(goodstypes.isEmpty())
			return null;
		return goodstypes.get(0);
	}
	
	public List<Goodstype> queryByGoods(Goods goods){
		String command="select gt from Goodstype gt inner join gt.goods gos where gos=:goods";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command);
		query.setParameter("goods", goods);
		List<Goodstype> goodstypes=query.list(); 
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return goodstypes;
	}
	
	
	public 	List<Goodstype> queryAll(){
		String command="from Goodstype gt";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Goodstype> goodstypes=query.list(); 
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return goodstypes;
	}
}