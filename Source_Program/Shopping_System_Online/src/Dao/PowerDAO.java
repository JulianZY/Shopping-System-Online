package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Power;
import Model.Sendmessage;
import Action.HibernateUtils;


public class PowerDAO {
	
	public Boolean create(Power power){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(power); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Power power){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.delete(power); 
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Power power){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(power); 
		tx.commit();
		session.close();
		return true;
	}

	public Power queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Power power=(Power)session.get(Power.class, id);
		tx.commit();
		session.close();
		return power;
	}
	
	public 	List<Power> queryAll(){
		String command="from Power p";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Power> powers=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return powers;
	}
}