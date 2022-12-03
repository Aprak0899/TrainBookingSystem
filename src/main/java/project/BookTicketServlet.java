package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookTicketServlet
 */
public class BookTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/trainbookingsystem?allowPublicKeyRetrieval=true&useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "root";
	
    private int ipno;
    private int itno;
    private int pnr;
    private String seatClass;
    private int Availability_of_seats;
    private int General_seats;
    private int AC_seats;
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tid = req.getParameter("tid");
		String tno = req.getParameter("tno");
		String pno = req.getParameter("pno");
		String seatType = req.getParameter("c");
		
		System.out.println(" get seatType = "+seatType);
		
		if(seatType.matches("AC")) {
			this.seatClass="A";
		}else {
			this.seatClass="G";
		}
		this.ipno = Integer.valueOf(pno);
		this.itno = Integer.valueOf(tno);
		System.out.println("tid = "+tid+" tno = "+tno+" pno = "+pno);
		RequestDispatcher dispatcher = null;
		req.setAttribute("tid", Integer.valueOf(tid));
		req.setAttribute("tno", Integer.valueOf(tno));
		req.setAttribute("pno", Integer.valueOf(pno));
		dispatcher=req.getRequestDispatcher("AddPasssenger.jsp");
		dispatcher.forward(req, resp);
	}

	//-------------connection------------------
	
		protected Connection getConnection() {
			Connection connection = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return connection;
		}
		//get seat status
		public void getSeatStatus() throws SQLException {
			
			try (Connection connection = getConnection();
					// insert
					PreparedStatement statement = connection.prepareStatement("SELECT Availability_of_seats, General_seats, AC_seats FROM train where Train_no=?;");) 
			{
				
				statement.setInt(1, itno);
				 ResultSet rs=statement.executeQuery();
				 if(rs.next()) {
					 this.Availability_of_seats=rs.getInt(1);
					 this.General_seats=rs.getInt(2);
					 this.AC_seats=rs.getInt(3);
					 
				 }
			}
			
		}
		
		//===================change train's seat availability ======================================
		
		public boolean updateTrain() throws SQLException {
			
			boolean rowUpdated;
			
			//true for Ac and false for NAC
			System.out.println("seat = "+this.seatClass);
			boolean seatType=this.seatClass.matches("A")?true:false;
			//System.out.println("total seat = "+t.getAvailSeat()+" ac = "+t.getACSeat()+" NAC = "+t.getNACSeat()+" Is AC =  "+seatType);
			try (Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement("update train set Availability_of_seats = ?, General_seats = ?, AC_seats= ? where Train_no = ?;");) 
			{
				//System.out.println("updated USer:"+statement);
				
				statement.setInt(1, this.Availability_of_seats-this.ipno);
				if(seatType) {
					//true for ac
					statement.setInt(2, this.General_seats);
					statement.setInt(3, this.AC_seats-this.ipno);
				}else {
					//inc non ac seat
					statement.setInt(2, this.General_seats-this.ipno);
					//dont increment ac seat
					statement.setInt(3, this.AC_seats);
				}
				statement.setInt(4, this.itno);

				rowUpdated = statement.executeUpdate() > 0;
			}
			
			return rowUpdated;
		}
		//==================book ticket by updating passenger status to 1======================
		
		public boolean BookTicket(Ticket t) throws SQLException {
			boolean rowUpdated;
			try (Connection connection = getConnection();
					// insert
					PreparedStatement statement = connection.prepareStatement("INSERT INTO passenger (`User_id`,`Passenger_name`,`Gender`,`Reservation_status`,`PNR`,`Train_no`,`SeatType`) VALUES (?,?,?,?,?,?,?);");) 
			{
				//System.out.println("updated USer:"+statement);
				statement.setInt(1, t.getuid());
				statement.setString(2, t.getpName());
				statement.setString(3, t.getpGender());
				statement.setInt(4, t.getStatus());
				statement.setInt(5, t.getpnr());
				statement.setInt(6, t.getId());
				statement.setString(7, t.getpSeatType());
				

				rowUpdated = statement.executeUpdate() > 0;
			}
			
			return rowUpdated;
		}
		
		//get me last pnr
		public void getLastPNR() throws SQLException {
			
			try (Connection connection = getConnection();
					// insert
					PreparedStatement statement = connection.prepareStatement("SELECT PNR FROM passenger order by PNR desc limit 1;");) 
			{
				

				 ResultSet rs=statement.executeQuery();
				 if(rs.next()) {
					 this.pnr=rs.getInt(1);
					 System.out.println("pnr"+this.pnr);
				 }
			}
			
		}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			getLastPNR();
			getSeatStatus();
		
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("avail seats = "+this.Availability_of_seats);
		RequestDispatcher dispatcher = null;
	
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id"); 
		ArrayList<Ticket> pl = new ArrayList<>();
		for (int i=0;i<ipno;i++) {
			String nameId ="n"+i;
			String gId ="g"+i;
//			Passenger p = new Passenger();
//			p.setName(request.getParameter(nameId));
//			p.setGender(request.getParameter(gId));
//			pl.add(p);
			
			Ticket t = new Ticket();
			t.setp_Name(request.getParameter(nameId));
			t.setp_Gender(request.getParameter(gId));
			t.setp_ResStatus(1);
			t.setpSeatType(seatClass);
			t.setu_Id(id);
			t.setId(itno);
			//add pnr
			t.setp_PNR(++this.pnr);
			pl.add(t);
			
			
		}
		
		try {
			boolean b= updateTrain();
			for(int i=0;i<pl.size();i++) {
				
				boolean ba=BookTicket(pl.get(i));

			}
			request.setAttribute("status","success");
			dispatcher=request.getRequestDispatcher("booking.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			request.setAttribute("status","failed");
			e1.printStackTrace();
		}
		
		
		//--------------------------------fetch detail from passenger form---------
		
		//-------------------------------------database code-----------------------------------
		
	}

}
