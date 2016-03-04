package Model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;
import javax.persistence.Id;  
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;  
import javax.persistence.TemporalType;

@Entity(name="Shopcar")
@Table(name="shopcar")
public class Shopcar {
	private int id;
	private List<Goods> goodss;
	private User user;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToMany(cascade={CascadeType.ALL},mappedBy="shopcars")
	public List<Goods> getGoodss() {
		return goodss;
	}
	public void setGoodss(List<Goods> goodss) {
		this.goodss = goodss;
	}
	@OneToOne(cascade={CascadeType.ALL},mappedBy="shopcar")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
