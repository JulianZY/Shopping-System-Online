package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Comment;
import Model.Goods;
import Model.User;
import Action.HibernateUtils;


public class CommentDAO {
	
	public Boolean create(Comment comment){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.save(comment); 
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Comment comment){
		Session session=HibernateUtils.getSession();
		String command="delete Comment where id=:id";
		Transaction tx=session.beginTransaction();
		//session.delete(comment); 
		Query query=session.createQuery(command);
		query.setParameter("id", comment.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Comment comment){
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		session.update(comment); 
		tx.commit();
		session.close();
		return true;
	}

	public Comment queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Comment comment=(Comment)session.get(Comment.class, id);
		tx.commit();
		session.close();
		return comment;
	}
	
	//////////////////////////////
	public List<Comment> queryByGoods(/*Integer gid*/Goods goods){
		/*String command="from Comment as c where c.goods_id='";*/
		String command="from Comment as c where c.goods=:goods";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+gid+"'");*/ 
		Query query=session.createQuery(command);
		query.setParameter("goods", goods);
		List<Comment> comments=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return comments;
	}
	/////////////////////////////
	public List<Comment> queryByUser(/*Integer gid*/User user){
		/*String command="from Comment as c where c.goods_id='";*/
		String command="from Comment as c where c.user=:user";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+gid+"'");*/ 
		Query query=session.createQuery(command);
		query.setParameter("user", user);
		List<Comment> comments=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return comments;
	}
	/////////////////////////////
	
	public 	List<Comment> queryAll(){
		String command="from Comment c";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Comment> comments=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return comments;
	}
}