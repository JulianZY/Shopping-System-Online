package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Transrecord;
import Model.User;
import Action.HibernateUtils;


public class TransrecordDAO {
	
	public Boolean create(Transrecord transrecord){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(transrecord); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Transrecord transrecord){
		Session session=HibernateUtils.getSession();
		String command="delete Transrecord where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(transrecord); 
		Query query=session.createQuery(command);
		query.setParameter("id", transrecord.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Transrecord transrecord){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(transrecord); 
		tx.commit();
		session.close();
		return true;
	}

	public Transrecord queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Transrecord transrecord=(Transrecord)session.get(Transrecord.class, id);
		tx.commit();
		session.close();
		return transrecord;
	}
	
	public List<Transrecord> queryByUser(Integer uid){
		String command="from Transrecord as tr where tr.uid='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+uid+"'"); 
		List<Transrecord> transrecords=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return transrecords;
	}
	
	public List<Transrecord> queryByGoods(Integer gid){
		String command="from Transrecord as tr where tr.gid='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+gid+"'"); 
		List<Transrecord> transrecords=query.list();  
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return transrecords;
	}
	
	public List<Transrecord> queryByShop(Integer sid){
		String command="from Transrecord as tr where tr.sid='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+sid+"'"); 
		List<Transrecord> transrecords=query.list();  
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return transrecords;
	}
	
	public 	List<Transrecord> queryAll(){
		String command="from Transrecord tr";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Transrecord> transrecords=query.list();   
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return transrecords;
	}
	
	/*public Transrecord query(Transrecord transrecord){
		String command1="from Transrecord as tr where tr.uid='";
		String command2="',tr.gid='";
		String command3="',tr.sid='";
		String command4="',tr.transnum='";
		String command5="',tr.transamount='";
		String command6="',tr.transdate='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command1+transrecord.getUid()
				+command2+transrecord.getGid()+command3+transrecord.getSid()
				+command4+transrecord.getTransnum()+command5+transrecord.getTransamount()
				+command6+transrecord.getTransdate()+"'"); 
		List<Transrecord> transrecords=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(transrecords.isEmpty())
			return null;
		return transrecords.get(0);
	}*/
}