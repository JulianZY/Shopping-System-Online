package Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;  
import javax.persistence.FetchType;
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

@Entity(name="Orderlist")
@Table(name="orderlist")
public class Orderlist {
	private int id;
	private int status;
	private int num;
	private Goods goods;
	private Date fromdate;
	private double amountpay;
	private User user;
	private Sendmessage sendmessage;
	private String addmessage;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	@ManyToOne(cascade={CascadeType.ALL})
	//@JoinColumn(name="goods_id")
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getFromdate() {
		return fromdate;
	}
	public void setFromdate(Date fromdate) {
		this.fromdate = fromdate;
	}
	public double getAmountpay() {
		return amountpay;
	}
	public void setAmountpay(double amountpay) {
		this.amountpay = amountpay;
	}
	
	@ManyToOne(cascade={CascadeType.ALL})
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(cascade={CascadeType.ALL})
	public Sendmessage getSendmessage() {
		return sendmessage;
	}
	public void setSendmessage(Sendmessage sendmessage) {
		this.sendmessage = sendmessage;
	}
	
	public String getAddmessage() {
		return addmessage;
	}
	public void setAddmessage(String addmessage) {
		this.addmessage = addmessage;
	}
	
	
	

}
