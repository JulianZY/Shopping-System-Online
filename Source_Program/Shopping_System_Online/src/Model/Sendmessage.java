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

@Entity(name="Sendmessage")
@Table(name="sendmessage")
public class Sendmessage {
	private int id;
	private String adress;
	private String toname;
	private String postcode;
	private User user;
	private List<Orderlist> orderlists;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getToname() {
		return toname;
	}
	public void setToname(String toname) {
		this.toname = toname;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	@ManyToOne(cascade={CascadeType.ALL})
	//@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="sendmessage")
	public List<Orderlist> getOrderlists() {
		return orderlists;
	}
	public void setOrderlists(List<Orderlist> orderlists) {
		this.orderlists = orderlists;
	}
	

}
