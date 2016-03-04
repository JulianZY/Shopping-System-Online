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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;  
import javax.persistence.TemporalType;  

@Entity(name="Goodstype")
@Table(name="goodstype")
public class Goodstype {
	private int id;
	private String type;
	private List<Goods> goods;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@ManyToMany(cascade={CascadeType.ALL},mappedBy="goodstypes")
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	
}
