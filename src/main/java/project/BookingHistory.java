package project;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class BookingHistory
 */
public class BookingHistory extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	private String jdbcURL = "jdbc:mysql://localhost:3306/trainbookingsystem?allowPublicKeyRetrieval=true&useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "root";
	private static ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
	
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
       
	//-------------select all ticktets booked by logged in user ------------------
	
	private ArrayList<Ticket> selectAllUsers(int u_id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		ArrayList<Ticket> ticketDetails = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("select * from train join passenger on train.Train_no=passenger.Train_no where passenger.User_id= ? ");) 
		{
			preparedStatement.setInt(1, u_id);
			//System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			//System.out.println("sql has nth = "+u_id);
			//System.out.println("sql has nth");
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				//System.out.println("sql has smth");
				Ticket t= new Ticket();
				t.setp_Id(rs.getInt(13));
				t.setu_Id(rs.getInt(14));
				t.setp_Gender(rs.getString(16));
				t.setp_Name(rs.getString(15));
				t.setp_PNR(rs.getInt(18));
				t.setp_ResStatus(rs.getInt(17));
				t.setpSeatType(rs.getString(20));
				
				t.setId(rs.getInt(1));
				t.setArrival(rs.getTime(3).toString());
				t.setDeparture(rs.getTime(4).toString());
				t.setDuration(rs.getInt(5));
				t.setName(rs.getString(2));
				t.setAvailSeat(rs.getInt(6));
				t.setACSeat(rs.getInt(8));
				t.setNACSeat(rs.getInt(7));
				
				ticketDetails.add(t);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return ticketDetails;
	}
	
	//==================cancel ticket by updating passenger status to 0======================
	
	public boolean cancelTicket(Ticket t) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement("update passenger set Reservation_status = 0 where Passenger_id = ?;");) 
		{
			//System.out.println("updated USer:"+statement);
			statement.setInt(1, t.getpid());

			rowUpdated = statement.executeUpdate() > 0;
		}
		
		return rowUpdated;
	}
	
	//===================revert back train's seat availability ======================================
	
	public boolean updateTrain(Ticket t) throws SQLException {

		boolean rowUpdated;
		
		//true for Ac and false for NAC
		//System.out.println("seat = "+t.getpSeatType());
		boolean seatType=t.getpSeatType().matches("A")?true:false;
		//System.out.println("total seat = "+t.getAvailSeat()+" ac = "+t.getACSeat()+" NAC = "+t.getNACSeat()+" Is AC =  "+seatType);
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement("update train set Availability_of_seats = ?, General_seats = ?, AC_seats= ? where Train_no = ?;");) 
		{
			//System.out.println("updated USer:"+statement);
			
			statement.setInt(1, t.getAvailSeat()+1);
			if(seatType) {
				statement.setInt(2, t.getNACSeat());
				statement.setInt(3, t.getACSeat()+1);
			}else {
				//inc non ac seat
				statement.setInt(2, t.getNACSeat()+1);
				//dont increment ac seat
				statement.setInt(3, t.getACSeat());
			}
			statement.setInt(4, t.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		cancelTicket(t);
		return rowUpdated;
	}
	
	//====================== call get user conn here =======================
	
	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id"); 
		System.out.println("session user id = "+id);
		ticketList = this.selectAllUsers(id);
		System.out.println("list user = "+ticketList.size());
		System.out.println("list user = "+ticketList.get(0).getpName());
		request.setAttribute("list", ticketList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookingHistory.jsp");
		dispatcher.forward(request, response);
	}
	
	//======================  cancel ticket here =======================
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		//we need ticket object from jsp file
		int id = Integer.parseInt(request.getParameter("id"));
		if(ticketList!=null) {
			System.out.println(ticketList.get(id).getpName());
			updateTrain(ticketList.get(id));
		}
		
		response.sendRedirect("list");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getServletPath();
		System.out.println("works = "+action);
		System.out.println("action = "+action);

		System.out.println("not null");
		try {
			switch (action) {
			case "/update":
				System.out.println("works");
				updateUser(request, response);
				break;
			case "/list":
				System.out.println("works for list");
				listUser(request, response);
				break;	
			default:
//				System.out.println("works for list");
//				listUser(request, response);
				RequestDispatcher dispatcher = null;
				dispatcher=request.getRequestDispatcher("bookingHistory.jsp");
				dispatcher.forward(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
