package Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Action.HibernateUtils;
import Model.Goods;
import Model.Orderlist;
import Model.Picture;
import Model.User;

public class PictureDAO {
	public Boolean create(Picture picture){
		Session session=HibernateUtils.getSession();
		//session.clear();
		//Picture p=(Picture)session.merge(picture);
		Transaction tx=session.beginTransaction();
		session.save(picture);
		tx.commit();
		session.close();
		return true;
	} 
	
	public Boolean delete(Picture picture){
		Session session=HibernateUtils.getSession();
		//session.clear();
		String command="delete Picture where id=:id";
		Transaction tx=session.beginTransaction();
		//session.refresh(picture);
		//Picture p=(Picture)session.load(Picture.class,picture.getId());
		//if(p!=null)
		//{
			//session.delete("from Picture as p where p.id=:id");
		//}
		//else
		//{
			//session.delete(p);
		//}
		Query query=session.createQuery(command);
		query.setParameter("id", picture.getId());
		query.executeUpdate();
		tx.commit();
		session.close();
		return true;
	}
	
	public Boolean update(Picture picture){
		Session session=HibernateUtils.getSession();
		//session.clear();
		//Picture p=(Picture)session.load(Picture.class,picture.getId());
		Transaction tx=session.beginTransaction();
		session.update(picture); 
		tx.commit();
		session.close();
		return true;
	}
	
	public Picture queryById(Integer id){
		//String command="from User as u where u.id='";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		//session.createQuery(command+id+"'"); 
		Picture picture=(Picture)session.get(Picture.class, id);
		tx.commit();
		session.close();
		return picture;
	}
	
	public List<Picture> queryByGoods(Goods goods)
	{
		String command="from Picture p where p.goods=:goods";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		/*Query query=session.createQuery(command+gid+"'"); */
		Query query=session.createQuery(command);
		query.setParameter("goods", goods);
		List<Picture> pictures=query.list(); 
		//Orderlist orderlist=orderlists.get(0);
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		/*if(orderlists.isEmpty())
			return null;*/
		return pictures;
	}
	
	public Picture queryByUser(User u)
	{
		return u.getHeadphoto();
	}
	public 	List<Picture> queryAll(){
		String command="from Picture p";
		Session session=HibernateUtils.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery(command); 
		List<Picture> pictures=query.list();
		//User user=(User)session.get(User.class, id);
		tx.commit();
		session.close();
		return pictures;
	}
}
