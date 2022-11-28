package project;


//this will have the entire ticket detail required along with the train
public class Ticket extends Train{
	private int p_id;
	private int u_id;
	private String pName;
	private String pGender;
	private int pPNR;
	private int pResStatus;
	private String pSeatType ;
	
	//setter
	public void setp_Id(int Id) {
		this.p_id=Id;
	}
	
	public void setpSeatType(String s) {
		this.pSeatType = s;
	}
	public void setu_Id(int Id) {
		this.u_id=Id;
	}
	public void setp_Name(String name) {
		this.pName = name;
	}
	public void setp_Gender(String g) {
		this.pGender=g;
	}
	public void setp_PNR(int pnr) {
		this.pPNR=pnr;
	}
	public void setp_ResStatus(int status) {
		this.pResStatus=status;
	}
	
	//getter
	public String getpSeatType() {
		return this.pSeatType;
	}
	public int getpid() {
		return this.p_id;
	}
	public int getuid() {
		return this.u_id;
	}
	public int getpnr() {
		return this.pPNR;
	}
	public int getStatus() {
		return this.pResStatus;
	}
	public String getpName() {
		return this.pName;
	}
	public String getpGender() {
		return this.pGender;
	}
	
	//setter
	@Override
	public void setId(int Id) {
		// TODO Auto-generated method stub
		super.setId(Id);
	}
	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		super.setName(name);
	}
	@Override
	public void setArrival(String arr) {
		// TODO Auto-generated method stub
		super.setArrival(arr);
	}
	@Override
	public void setDeparture(String dept) {
		// TODO Auto-generated method stub
		super.setDeparture(dept);
	}
	@Override
	public void setDuration(int d) {
		// TODO Auto-generated method stub
		super.setDuration(d);
	}
	@Override
	public void setAvailSeat(int s) {
		// TODO Auto-generated method stub
		super.setAvailSeat(s);
	}
	@Override
	public void setACSeat(int s) {
		// TODO Auto-generated method stub
		super.setACSeat(s);
	}
	@Override
	public void setNACSeat(int s) {
		// TODO Auto-generated method stub
		super.setNACSeat(s);
	}	
	
	//getters
	@Override
	public int getId() {
		// TODO Auto-generated method stub
		return super.getId();
	}
	@Override
	public int getDuration() {
		// TODO Auto-generated method stub
		return super.getDuration();
	}
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return super.getName();
	}
	@Override
	public String getArrival() {
		// TODO Auto-generated method stub
		return super.getArrival();
	}
	@Override
	public String getDeparture() {
		// TODO Auto-generated method stub
		return super.getDeparture();
	}
	@Override
	public int getAvailSeat() {
		// TODO Auto-generated method stub
		return super.getAvailSeat();
	}
	@Override
	public int getACSeat() {
		// TODO Auto-generated method stub
		return super.getACSeat();
	}
	@Override
	public int getNACSeat() {
		// TODO Auto-generated method stub
		return super.getNACSeat();
	}
}
