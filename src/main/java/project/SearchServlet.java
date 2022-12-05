package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ArrayList<Train> trainDetails;
	private static String src;
	private static String dest;
	private static String travelClass;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private int fixDate(String d) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < d.length(); i++) {
			if (d.charAt(i) != '-') {
				sb.append(d.charAt(i));
			}
		}
		return Integer.valueOf(sb.toString());
	}

	// ==============sort by duration===============================

	protected void sortByDuration() {

		Collections.sort(trainDetails, Train.DurComparator);
	}

	// ==============sort by arrival===============================

	protected void sortByArrival() {

		Collections.sort(trainDetails, Train.DeptComparator);
	}

	// ==============sort by seat availability===============================

	protected void sortBySeatAvailability() {
		if (this.travelClass.matches("AC")) {
			Collections.sort(trainDetails, Train.AcComparator);
		} else {
			Collections.sort(trainDetails, Train.NacComparator);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// check if sort or search
		RequestDispatcher dispatcher = null;
		String flag = request.getParameter("flag");

		if (flag != null) {

			if (flag.matches("Sort by travel time")) {
				// sort by duration
				sortByDuration();
				request.setAttribute("src", this.src);
				request.setAttribute("dest", this.dest);
				request.setAttribute("trainData", trainDetails);
				dispatcher = request.getRequestDispatcher("booking.jsp");
				dispatcher.forward(request, response);
			} else if (flag.matches("Sort by arrival time")) {
				// sort by arrival

				sortByArrival();
				request.setAttribute("src", this.src);
				request.setAttribute("dest", this.dest);
				request.setAttribute("trainData", trainDetails);
				dispatcher = request.getRequestDispatcher("booking.jsp");
				dispatcher.forward(request, response);
			} else if (flag.matches("Sort by seat Availability")) {
				sortBySeatAvailability();
				request.setAttribute("src", this.src);
				request.setAttribute("dest", this.dest);
				request.setAttribute("trainData", trainDetails);
				dispatcher = request.getRequestDispatcher("booking.jsp");
				dispatcher.forward(request, response);
			} else {
				// pura neeche ka code

				// --------------------------------fetch detail from login.jsp form---------
				System.out.println("index works");
				
				this.src = request.getParameter("src");
				this.dest = request.getParameter("dest");
				String date = request.getParameter("date");
				this.travelClass = request.getParameter("class");

				System.out.println("src = " + src + " dest = " + dest + " date = " + date + " class = " + travelClass);

				// --------------------------------------------serverSide validation------------------------------

				if (src == null || src.equals("")) {
					request.setAttribute("status", "invalid_src");
					dispatcher = request.getRequestDispatcher("booking.jsp");
					// send redirect
					dispatcher.forward(request, response);
				}

				if (dest == null || dest.equals("")) {
					request.setAttribute("status", "invalid_dest");
					dispatcher = request.getRequestDispatcher("booking.jsp");
					// send redirect
					dispatcher.forward(request, response);
				}

				if (travelClass == null || travelClass.equals("")) {
					request.setAttribute("status", "invalilPswd");
					dispatcher = request.getRequestDispatcher("booking.jsp");
					dispatcher.forward(request, response);
				}
				if (date == null || date.equals("")) {
					request.setAttribute("status", "invalid_date");
					request.setAttribute("src", this.src);
					request.setAttribute("dest", this.dest);
					dispatcher = request.getRequestDispatcher("booking.jsp");
					dispatcher.forward(request, response);
				}

				int d = fixDate(date);
				// -------------------------------------database
				// code-----------------------------------
				trainDetails = new ArrayList<>();
				Connection con = null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/trainbookingsystem?allowPublicKeyRetrieval=true&useSSL=false",
							"root", "root");
					// works
					PreparedStatement pstmt = con.prepareStatement(
							" select * from train join routes on train.Route_id=routes.Route_id where routes.From_city= ? and Routes.To_city= ? and Train.date_of_passing= ? ; ");
					pstmt.setString(1, this.src);
					pstmt.setString(2, this.dest);
					pstmt.setInt(3, d);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						Train t = new Train();
						t.setId(rs.getInt(1));
						t.setName(rs.getString(2));
						t.setArrival(rs.getTime(3).toString());
						t.setDeparture(rs.getTime(4).toString());
						t.setDuration(rs.getInt(5));
						t.setAvailSeat(rs.getInt(6));
						t.setNACSeat(rs.getInt(7));
						t.setACSeat(rs.getInt(8));
						t.setFareGeneral(rs.getInt(9));
						t.setFareAC(rs.getInt(10));
						trainDetails.add(t);
					}

					System.out.println("size of list = " + trainDetails.size());

					request.setAttribute("src", this.src);
					request.setAttribute("dest", this.dest);

					request.setAttribute("trainData", trainDetails);
					dispatcher = request.getRequestDispatcher("booking.jsp");
					System.out.println(
							"src = " + src + " dest = " + dest + " date = " + date + " class = " + travelClass);

					dispatcher.forward(request, response);

				} catch (Exception e) {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
					e.printStackTrace();
				}
			}
		}
	}

}
