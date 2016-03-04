package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Manager;
import Model.Orderlist;
import Action.HibernateUtils;


public class ManagerDAO {
	
	public Boolean create(Manager manager){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(manager); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Manager manager){
		Session session=HibernateUtils.getSession();
		String command="delete Manager where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(manager); 
		Query query=session.createQuery(command);
		query.setParameter("id", manager.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Manager manager){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(manager); 
		tx.commit();
		session.close();
		return true;
	}

	public Manager queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Manager manager=(Manager)session.get(Manager.class, id);
		tx.commit();
		session.close();
		return manager;
	}
	
	public Manager queryByName(String name){
		String command="from Manager as m where m.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<Manager> managers=query.list(); 
		
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(managers.isEmpty())
			return null;
		return managers.get(0);
	}
	
	
	public 	List<Manager> queryAll(){
		String command="from Manager u";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Manager> managers=query.list(); 
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return managers;
	}
}