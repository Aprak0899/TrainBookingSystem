package project;
public class Train {
	private int tId;
	private String tName;
	private String tArrival;
	private String tDeparture;
	private int tDuration;
	//setter
	public void setId(int Id) {
		this.tId=Id;
	}
	public void setName(String name) {
		this.tName=name;
	}
	public void setArrival(String arr) {
		this.tArrival=arr;
	}
	public void setDeparture(String dept) {
		this.tDeparture=dept;
	}
	public void setDuration(int d) {
		this.tDuration=d;
	}
	//getter
	public int getId() {
		return tId;
	}
	public int getDuration() {
		return tDuration;
	}
	public String getName() {
		return tName;
	}
	public String getArrival() {
		return tArrival;
	}
	public String getDeparture() {
		return tDeparture;
	}
}
