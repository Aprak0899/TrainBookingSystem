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
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private int fixDate(String d){
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<d.length();i++){
            if(d.charAt(i)!='-'){
                sb.append(d.charAt(i));
            }
        }
        return Integer.valueOf(sb.toString());
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//--------------------------------fetch detail from login.jsp form---------
		
		String src=request.getParameter("src");
		String dest=request.getParameter("dest");
		String date=request.getParameter("date");
		String travelClass=request.getParameter("class");
		
		RequestDispatcher dispatcher = null;
		HttpSession session= request.getSession();
		System.out.println("src = "+src+" dest = "+dest+" date = "+date+" class = "+travelClass);
				
		//--------------------------------------------serverSide validation------------------------------
		
		if(src==null||src.equals("")) {
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
			//send redirect
			dispatcher.forward(request, response);
		}
		
		if(dest==null||dest.equals("")) {
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
			//send redirect
			dispatcher.forward(request, response);
		}
		
		if(travelClass==null||travelClass.equals("")) {
			request.setAttribute("status","invalilPswd");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if(date==null||date.equals("")) {
			request.setAttribute("status","invalilPswd");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
			
		int d=fixDate(date);
		//-------------------------------------database code-----------------------------------
		ArrayList<Train> trainDetails = new ArrayList<>();
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainbookingsystem?allowPublicKeyRetrieval=true&useSSL=false","root","root");
			//works
			PreparedStatement pstmt = con.prepareStatement(" select Train.Train_no,Train.Train_name,Train.Arrival_time,Train.Departure_time ,Train.Duration from train join routes on train.Route_id=routes.Route_id where routes.From_city= ? and Routes.To_city= ? and Train.date_of_passing= ? ; ");
			pstmt.setString(1, src);
			pstmt.setString(2, dest);
			pstmt.setInt(3, d);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Train t= new Train();
				t.setId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setArrival(rs.getTime(3).toString());
				t.setDeparture(rs.getTime(4).toString());
				t.setDuration(rs.getInt(5));
				trainDetails.add(t);
			}
			System.out.println("size of list = "+trainDetails.size());
			request.setAttribute("trainData", trainDetails);
			dispatcher=request.getRequestDispatcher("booking.jsp");
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			request.setAttribute("status", "failed");
			dispatcher=request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		}
	}

}
