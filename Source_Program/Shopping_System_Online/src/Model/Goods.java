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

import org.apache.struts2.components.Text;

@Entity(name="Goods")
@Table(name="goods")
public class Goods {
	private int id;
	private String name;
	private int num;
	private double price;
	private int mark;
	private String introduce;
	private List<Goodstype> goodstypes;
	private Shop shop;
	private List<Comment> comments;
	private List<Shopcar> shopcars;
	private List<Orderlist> orderlists;
	private List<Picture> pictures;
	
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	@ManyToMany(cascade={CascadeType.ALL})
	//@JoinTable(name="goodstype_goods",joinColumns={@JoinColumn(name="goods_id")},inverseJoinColumns={@JoinColumn(name="goodstype_id")})
	public List<Goodstype> getGoodstypes() {
		return goodstypes;
	}
	public void setGoodstypes(List<Goodstype> goodstypes) {
		this.goodstypes = goodstypes;
	}
	
	@ManyToOne(cascade={CascadeType.ALL})
	//@JoinColumn(name="shop_id")
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="goods")
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	@ManyToMany(cascade={CascadeType.ALL})
	//@JoinColumn(name="shopcar_id")
	public List<Shopcar> getShopcars() {
		return shopcars;
	}
	public void setShopcars(List<Shopcar> shopcars) {
		this.shopcars = shopcars;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="goods")
	public List<Orderlist> getOrders() {
		return orderlists;
	}
	public void setOrders(List<Orderlist> orderlists) {
		this.orderlists = orderlists;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="goods")
	public List<Picture> getPictures() {
		return pictures;
	}
	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}
	
}
