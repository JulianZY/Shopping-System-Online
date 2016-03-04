package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Shop;
import Model.Shopcar;
import Model.User;
import Action.HibernateUtils;


public class ShopcarDAO {
	
	public Boolean create(Shopcar shopcar){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(shopcar); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Shopcar shopcar){
		Session session=HibernateUtils.getSession();
		String command="delete Shopcar where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(shopcar); 
		Query query=session.createQuery(command);
		query.setParameter("id", shopcar.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Shopcar shopcar){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(shopcar); 
		session.close();
		return true;
	}

	public Shopcar queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Shopcar shopcar=(Shopcar)session.get(Shopcar.class, id);
		tx.commit();
		session.close();
		return shopcar;
	}
	
	/////////////////////////
	public Shopcar queryByUser(User user){
		//String command="from User as u where u.id='";
		String command="from Shopcar as sc where sc.user=:user";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Query query=session.createQuery(command); 
		query.setParameter("user", user);
		List<Shopcar> shopcars=query.list();
		tx.commit();
		session.close();
		if(shopcars.isEmpty())
			return null;
		return shopcars.get(0);
	}
    /////////////////////////
	
	public 	List<Shopcar> queryAll(){
		String command="from Shopcar sc";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Shopcar> shopcars=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return shopcars;
	}
}