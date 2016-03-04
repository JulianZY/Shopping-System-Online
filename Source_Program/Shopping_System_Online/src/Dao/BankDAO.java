package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Bank;
import Model.Boss;
import Action.HibernateUtils;


public class BankDAO {
	
	public Boolean create(Bank bank){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(bank); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Bank bank){
		Session session=HibernateUtils.getSession();
		String command="delete Bank where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(bank); 
		Query query=session.createQuery(command);
		query.setParameter("id", bank.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Bank bank){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(bank); 
		tx.commit();
		session.close();
		return true;
	}

	public Bank queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Bank bank=(Bank)session.get(Bank.class, id);
		tx.commit();
		session.close();
		return bank;
	}
	
	public Bank queryByName(String name){
		String command="from Bank as b where b.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<Bank> banks=query.list();
		//Bank bank=banks.get(0);
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		if(banks.isEmpty())
			return null;
		return banks.get(0);
	}
	
	
	public 	List<Bank> queryAll(){
		String command="from Bank b";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Bank> banks=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return banks;
	}
}