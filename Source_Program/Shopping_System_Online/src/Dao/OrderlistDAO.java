package Dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Goods;
import Model.Orderlist;
import Model.Transrecord;
import Model.User;
import Action.HibernateUtils;


public class OrderlistDAO {
	
	public Boolean create(Orderlist orderlist){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.save(orderlist); 
		session.saveOrUpdate(orderlist);
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Orderlist orderlist){
		Session session=HibernateUtils.getSession();
		String command="delete Orderlist where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(orderlist); 
		Query query=session.createQuery(command);
		query.setParameter("id", orderlist.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Orderlist orderlist){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(orderlist);
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean createorderlist(Orderlist orderlist){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//String command="insert into orderlist (amountpay,fromdate,num,status,goods_id,sendmessage_id,user_id,addmessage) values ('"+orderlist.getAmountpay()+"','"+getdate()+"','"+orderlist.getNum()+"','"+orderlist.getStatus()+"','"+orderlist.getGoods().getId()+"','"+orderlist.getSendmessage().getId()+"','"+orderlist.getUser().getId()+"','"+orderlist.getAddmessage()+"')";
		String command="insert into orderlist (amountpay,fromdate,num,status,goods_id,sendmessage_id,user_id,addmessage) values (?,?,?,?,?,?,?,?)";
		Query query=session.createSQLQuery(command);
		query.setParameter(0,orderlist.getAmountpay());
		query.setParameter(1,new Date());
		query.setParameter(2,orderlist.getNum());
		query.setParameter(3,orderlist.getStatus());
		query.setParameter(4,orderlist.getGoods().getId());
		query.setParameter(5,orderlist.getSendmessage().getId());
		query.setParameter(6,orderlist.getUser().getId());
		query.setParameter(7,orderlist.getAddmessage());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	} 

	public Orderlist queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Orderlist orderlist=(Orderlist)session.get(Orderlist.class, id);
		tx.commit();
		session.close();
		return orderlist;
	}
	
	public 	List<Orderlist> queryByStatus(Integer stid){
		String command="from Orderlist o where o.status='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command+stid+"'"); 
		List<Orderlist> orderlists=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return orderlists;
	}
	
	public 	List<Orderlist> queryByGoods(/*Integer gid*/Goods goods){
		/*String command="from Orderlist o where o.goods_id='";*/
		String command="from Orderlist o where o.goods=:goods";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+gid+"'"); */
		Query query=session.createQuery(command);
		query.setParameter("goods", goods);
		List<Orderlist> orderlists=query.list(); 
		//Orderlist orderlist=orderlists.get(0);
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		/*if(orderlists.isEmpty())
			return null;*/
		return orderlists;
	}
	
	//////////////////////////////////
	public 	List<Orderlist> queryByUser(/*Integer uid*/User user){
		/*String command="from Orderlist o where o.user_id='";*/
		String command="from Orderlist o where o.user=:user";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+uid+"'"); */
		Query query=session.createQuery(command); 
		query.setParameter("user", user);
		List<Orderlist> orderlists=query.list(); 
		//Orderlist orderlist=orderlists.get(0);
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return orderlists;
	}
	///////////////////////////////////
	
	public 	List<Orderlist> queryAll(){
		String command="from Orderlist o";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Orderlist> orderlists=query.list(); 
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return orderlists;
	}
}