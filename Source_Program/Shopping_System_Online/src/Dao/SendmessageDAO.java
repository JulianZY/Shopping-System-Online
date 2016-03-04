package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Sendmessage;
import Model.Shopcar;
import Model.User;
import Action.HibernateUtils;


public class SendmessageDAO {
	
	public Boolean create(Sendmessage sendmessage){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(sendmessage); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Sendmessage sendmessage){
		Session session=HibernateUtils.getSession();
		String command="delete Sendmessage where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(sendmessage); 
		Query query=session.createQuery(command);
		query.setParameter("id", sendmessage.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Sendmessage sendmessage){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(sendmessage); 
		tx.commit();
		session.close();
		return true;
	}

	public Sendmessage queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Sendmessage sendmessage=(Sendmessage)session.get(Sendmessage.class, id);
		tx.commit();
		session.close();
		return sendmessage;
	}
	
	public List<Sendmessage> queryByToname(String toname){
		String command="from Sendmessage as sm where sm.toname='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+toname+"'"); 
		List<Sendmessage> sendmessages=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return sendmessages;
	}
	
	////////////////////////////////
	public 	List<Sendmessage> queryByUser(/*Integer uid*/User user){
		/*String command="from Sendmessage as sm where sm.user_id='";*/
		String command="from Sendmessage as sm where sm.user=:user";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+uid+"'"); */
		Query query=session.createQuery(command);
		query.setParameter("user", user);
		List<Sendmessage> sendmessages=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return sendmessages;
	}
	///////////////////////////////
	
	public 	List<Sendmessage> queryAll(){
		String command="from Sendmessage sm";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Sendmessage> sendmessages=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return sendmessages;
	}
}