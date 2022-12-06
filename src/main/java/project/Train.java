package project;

import java.util.Comparator;

public class Train{
	private int tId;
	private String tName;
	private String tArrival;
	private String tDeparture;
	private int tDuration;
	private int tAvailSeat;
	private int tACSeat;
	private int tNACSeat;
	
	private int fareGeneral;
	private int fareAC;
	
	//setter
	public void setId(int Id) {
		this.tId=Id;
	}
	
	public void setFareGeneral(int fare) {
		this.fareGeneral=fare;
	}
	public void setFareAC(int fare) {
		this.fareAC=fare;
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
	public void setAvailSeat(int s) {
		this.tAvailSeat=s;
	}
	public void setACSeat(int s) {
		this.tACSeat=s;
	}
	public void setNACSeat(int s) {
		this.tNACSeat=s;
	}
	
	
	//getter
	public int getAvailSeat() {
		return this.tAvailSeat;
	}
	public int getACSeat() {
		return this.tACSeat;
	}
	public int getNACSeat() {
		return this.tNACSeat;
	}
	public int getId() {
		return tId;
	}
	
	public int getFareGenral() {
		return this.fareGeneral;
	}
	public int getFareAC() {
		return this.fareAC;
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
	
	
	// Usage of comparator
    public static Comparator<Train> DurComparator = new Comparator<Train>() {
		@Override
		public int compare(Train o1, Train o2) {
			int dur1= o1.getDuration();
			int dur2= o2.getDuration();

	        // Returning in ascending order
	        return dur1-dur2;
		}
    };
 
 // Usage of comparator
    public static Comparator<Train> DeptComparator = new Comparator<Train>() {
		@Override
		public int compare(Train o1, Train o2) {
			String arr1= o1.getDeparture();
			String arr2= o2.getDeparture();

			// Returning in ascending order
            return arr1.compareTo(arr2);
		}
    };
    public static Comparator<Train> AcComparator = new Comparator<Train>() {
		@Override
		public int compare(Train o1, Train o2) {
			int dur1= o1.getACSeat();
			int dur2= o2.getACSeat();

	        // Returning in descending order
	        return dur2-dur1;
		}
    };
 
    public static Comparator<Train> NacComparator = new Comparator<Train>() {
		@Override
		public int compare(Train o1, Train o2) {
			int dur1= o1.getNACSeat();
			int dur2= o2.getNACSeat();

	        // Returning in ascending order
	        return dur2-dur1;
		}
    };
 
}
