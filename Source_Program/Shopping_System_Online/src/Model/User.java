package Model;

import java.util.List;

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

@Entity(name="User")
@Table(name="user")
public class User {
	private int id;
	private String name;
	private String mail;
	private String tel;
	private String password;
	private int vlevel;
	private int marks;
	private double leftmoney;
	private Picture headphoto;
	private Power power;
	private List<Sendmessage> sendmessages;
	private Shopcar shopcar;
	private List<Orderlist> orderlists;
	private List<Comment> comments;
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getVlevel() {
		return vlevel;
	}
	public void setVlevel(int vlevel) {
		this.vlevel = vlevel;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public double getLeftmoney() {
		return leftmoney;
	}
	public void setLeftmoney(double leftmoney) {
		this.leftmoney = leftmoney;
	}
	
	@OneToOne(cascade={CascadeType.ALL})
	public Picture getHeadphoto() {
		return headphoto;
	}
	public void setHeadphoto(Picture headphoto) {
		this.headphoto = headphoto;
	}
	
	@ManyToOne(cascade={CascadeType.ALL})
	//@JoinColumn(name="power_id")
	public Power getPower() {
		return power;
	}
	public void setPower(Power power) {
		this.power = power;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="user")
	public List<Sendmessage> getSendmessages() {
		return sendmessages;
	}
	public void setSendmessages(List<Sendmessage> sendmessages) {
		this.sendmessages = sendmessages;
	}
	
	@OneToOne(cascade={CascadeType.ALL})
	//@JoinColumn(name="shopcar_id")
	public Shopcar getShopcar() {
		return shopcar;
	}
	public void setShopcar(Shopcar shopcar) {
		this.shopcar = shopcar;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="user")
	public List<Orderlist> getOrderlists() {
		return orderlists;
	}
	public void setOrderlists(List<Orderlist> orderlists) {
		this.orderlists = orderlists;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="user")
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	

}
