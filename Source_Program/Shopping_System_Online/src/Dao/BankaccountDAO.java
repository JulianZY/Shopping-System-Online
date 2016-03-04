package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Bank;
import Model.Bankaccount;
import Action.HibernateUtils;


public class BankaccountDAO {
	
	public Boolean create(Bankaccount bankaccount){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(bankaccount); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Bankaccount bankaccount){
		Session session=HibernateUtils.getSession();
		String command="delete Bankaccount where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(bankaccount); 
		Query query=session.createQuery(command);
		query.setParameter("id", bankaccount.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Bankaccount bankaccount){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(bankaccount); 
		tx.commit();
		session.close();
		return true;
	}

	public Bankaccount queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Bankaccount bankaccount=(Bankaccount)session.get(Bankaccount.class, id);
		tx.commit();
		session.close();
		return bankaccount;
	}
	
	public Bankaccount queryByName(String name){
		String command="from Bankaccount as bc where bc.name='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+name+"'"); 
		List<Bankaccount> bankaccounts=query.list(); 
		//Bankaccount bankaccount=bankaccounts.get(0);
		//Bankaccount bankaccount=(bankaccount)session.get(Bankaccount.class, id);
		tx.commit();
		session.close();
		if(bankaccounts.isEmpty())
			return null;
		return bankaccounts.get(0);
	}
	
	/////////////////////////////
	public 	List<Bankaccount> queryByBank(/*int bid*/Bank bank){
		/*String command="from Bankaccount bc where bank_id='";*/
		String command="from Bankaccount bc where bank=:bank";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+bid+"'"); */
		Query query=session.createQuery(command); 
		query.setParameter("bank", bank);
		List<Bankaccount> bankaccounts=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return bankaccounts;
	}
	////////////////////////////
	
	public 	List<Bankaccount> queryAll(){
		String command="from Bankaccount bc";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Bankaccount> bankaccounts=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return bankaccounts;
	}
}