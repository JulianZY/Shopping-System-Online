package Model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="Power")
@Table(name="power")
public class Power {
	private int id;
	private String pow;
	private List<Boss> bosses;
	private List<User> users;
	private List<Manager> managers;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPow() {
		return pow;
	}
	public void setPow(String pow) {
		this.pow = pow;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="power")
	public List<Boss> getBosses() {
		return bosses;
	}
	public void setBosses(List<Boss> bosses) {
		this.bosses = bosses;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="power")
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="power")
	public List<Manager> getManagers() {
		return managers;
	}
	public void setManagers(List<Manager> managers) {
		this.managers = managers;
	}
	

}
