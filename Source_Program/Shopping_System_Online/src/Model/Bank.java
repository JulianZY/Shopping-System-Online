package Model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="Bank")
@Table(name="bank")
public class Bank {
	private int id;
	private String name;
	private String adress;
	private List<Bankaccount> bankaccounts;
	
	@Id
	@GeneratedValue
	//@Column(name="id")
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
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	@OneToMany(cascade={CascadeType.ALL},mappedBy="bank")
	public List<Bankaccount> getBankaccounts() {
		return bankaccounts;
	}
	public void setBankaccounts(List<Bankaccount> bankaccounts) {
		this.bankaccounts = bankaccounts;
	}

}
