package project;

public class Passenger {
	private String name;
	private String gender;
	private String seatType; 
	//set
	public void setName(String n) {
		this.name=n;
	}
	public void setGender(String n) {
		this.gender=n;
	}
	public void setSeatType(String n) {
		this.seatType=n;
	}
	//get
	public String getName() {
		return this.name;
	}
	public String getGender() {
		return this.gender;
	}
	public String getSeatType() {
		return this.seatType;
	}
}
