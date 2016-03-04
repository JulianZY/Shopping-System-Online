package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Boss;
import Model.Comment;
import Model.Shop;
import Action.HibernateUtils;


public class BossDAO {
	
	public Boolean create(Boss boss){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(boss); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Boss boss){
		Session session=HibernateUtils.getSession();
		String command="delete Boss where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(boss); 
		Query query=session.createQuery(command);
		query.setParameter("id", boss.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Boss boss){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(boss); 
		tx.commit();
		session.close();
		return true;
	}

	public Boss queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Boss boss=(Boss)session.get(Boss.class, id);
		tx.commit();
		session.close();
		return boss;
	}
	
	/////////////////////////////////
	public List<Boss> queryByShop(/*Integer sid*/Shop shop){
		/*String command="from Boss bo where bo.shop_id='";*/
		String command="from Boss bo where bo.shop=:shop";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+sid+"'");*/ 
		Query query=session.createQuery(command);
		query.setParameter("shop", shop);
		List<Boss> bosses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return bosses;
	}
	//////////////////////////////
	
	public Boss queryByName(String name){
		String command="from Boss as bo where bo.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<Boss> bosses=query.list();
		//Boss boss=bosses.get(0);
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(bosses.isEmpty())
			return null;
		return bosses.get(0);
	}
	
	public 	List<Boss> queryByTruename(String truename){
		String command="from Boss as bo where bo.truename='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+truename+"'"); 
		List<Boss> bosses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return bosses;
	}
	
	public 	List<Boss> queryAll(){
		String command="from Boss bo";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Boss> bosses=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return bosses;
	}
}