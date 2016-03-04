package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Boss;
import Model.Shop;
import Model.Transrecord;
import Action.HibernateUtils;


public class ShopDAO {
	
	public Boolean create(Shop shop){
		Session session=HibernateUtils.getSession();
		//session.clear();
		Transaction tx=session.beginTransaction();
		session.save(shop);
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Shop shop){
		Session session=HibernateUtils.getSession();
		//session.clear();
		String command="delete Shop where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(shop);
		Query query=session.createQuery(command);
		query.setParameter("id", shop.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Shop shop){
		Session session=HibernateUtils.getSession();
		//session.clear();
		Transaction tx=session.beginTransaction();
		session.update(shop);
		tx.commit();
		session.close();
		return true;
	}

	public Shop queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Shop shop=(Shop)session.get(Shop.class, id);
		tx.commit();
		session.close();
		return shop;
	}
	
	public List<Shop> queryByName(String name){
		String command="from Shop as s where s.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<Shop> shops=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return shops;
	}
	
	/////////////////////////////
	public Shop queryByName(Boss boss){
		String command="from Shop as s where s.boss=:boss";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		query.setParameter("boss", boss);
		List<Shop> shops=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(shops.isEmpty())
			return null;
		return shops.get(0);
	}
	//////////////////////////////
	
	public 	List<Shop> queryAll(){
		String command="from Shop s";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Shop> shops=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return shops;
	}
	
	/*public Shop query(Shop shop){
		String command1="from Shop as s where s.name='";
		String command2="',s.adress='";
		String command3="',s.marks='";
		String command4="',s.level='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command1+shop.getName()+command2+shop.getAdress()
				+command3+shop.getMarks()+command4+shop.getLevel()+"'"); 
		List<Shop> shops=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(shops.isEmpty())
			return null;
		return shops.get(0);
	}*/
}