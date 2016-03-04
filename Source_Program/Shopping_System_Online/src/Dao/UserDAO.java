package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Shopcar;
import Model.User;
import Action.HibernateUtils;


public class UserDAO {
	
	public Boolean create(User user){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(User user){
		Session session=HibernateUtils.getSession();
		String command="delete User where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(user);
		Query query=session.createQuery(command);
		query.setParameter("id", user.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(User user){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(user); 
		tx.commit();
		session.close();
		return true;
	}

	public User queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return user;
	}
	
	public User queryByName(String name){
		String command="from User as u where u.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<User> users=query.list();
		//User user=(User)session.get(User.class, id);
		//tx.commit();
		session.close();
		if(users.isEmpty())//if(users.isEmpty())
			return null;
	    return users.get(0);
	}
	
	public User queryByShopcar(/*Integer scid*/Shopcar shopcar){
		//String command="from User as u where u.shopcar_id='";
		String command="from User as u where u.shopcar=:shopcar";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//Query query=session.createQuery(command+scid+"'"); 
		Query query=session.createQuery(command); 
		query.setParameter("shopcar", shopcar);
		List<User> users=query.list(); 
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(users.isEmpty())
			return null;
		return users.get(0);
	}
	
	public 	List<User> queryAll(){
		String command="from User u";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<User> users=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return users;
	}
}