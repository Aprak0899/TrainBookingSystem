package project;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//--------------------------------fetch detail from login.jsp form---------
		
		String uemail=request.getParameter("username");
		String upwd=request.getParameter("password");
		RequestDispatcher dispatcher = null;
		HttpSession session= request.getSession();
		
		//--------------------------------------------serverSide validation------------------------------
		
		if(uemail==null||uemail.equals("")) {
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
			//send redirect
			dispatcher.forward(request, response);
		}
		if(upwd==null||upwd.equals("")) {
			request.setAttribute("status","invalilPswd");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		//-------------------------------------database code-----------------------------------
		
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainbookingsystem?allowPublicKeyRetrieval=true&useSSL=false","root","root");
			//works
			PreparedStatement pstmt = con.prepareStatement(" select * from user where Email=? and Password=? ");
			pstmt.setString(1, uemail);
			pstmt.setString(2, upwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				session.setAttribute("name", rs.getString("FirstName"));
				session.setAttribute("lname", rs.getString("LastName"));
				session.setAttribute("id", rs.getInt("User_id"));
				session.setAttribute("mobile", rs.getString("Mobile"));
				session.setAttribute("email", rs.getString("Email"));
				session.setAttribute("gender", rs.getString("Gender"));
				dispatcher=request.getRequestDispatcher("booking.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			request.setAttribute("status", "failed");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		}
	}

}



