package Model;

import java.util.Date;

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

@Entity(name="Transrecord")
@Table(name="transrecord")
public class Transrecord {
	private int id;
	private int sid;
	private int gid;
	private int uid;
	private int transnum;
	private Date transdate;
	private double transamount;
	private int smid;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public int getTransnum() {
		return transnum;
	}
	public void setTransnum(int transnum) {
		this.transnum = transnum;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getTransdate() {
		return transdate;
	}
	public void setTransdate(Date transdate) {
		this.transdate = transdate;
	}
	public double getTransamount() {
		return transamount;
	}
	public void setTransamount(double transamount) {
		this.transamount = transamount;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getSmid() {
		return smid;
	}
	public void setSmid(int smid) {
		this.smid = smid;
	}
	

}
