package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServlet
 */
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//--------------------------------fetch detail from registration.jsp form---------
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		String umobile = request.getParameter("contact");
		
		System.out.println(gender);		
		String reupwd = request.getParameter("re_pass");
		RequestDispatcher dispatcher = null;
		
		//--------------------------------------------serverSide validation------------------------------
		
		if(fname==null||fname.equals("")) {
			request.setAttribute("status","invalidName");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		
		//last name can be null
		
		if(uemail==null||uemail.equals("")) {
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(upwd==null||upwd.equals("")) {
			request.setAttribute("status","invalidPswd");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}else if(!upwd.equals(reupwd)) {
			request.setAttribute("status","invalidCNFPswd");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		//System.out.println("mob len= "+umobile.length());
		if(umobile==null||umobile.equals("")) {
			request.setAttribute("status","invalidMobile");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}else if(umobile.length()!=10) {
			request.setAttribute("status","invalidMobileLength");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		
		//-------------------------------------database code-----------------------------------
		
		Connection con = null;
		dispatcher=request.getRequestDispatcher("registration.jsp");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainbookingsystem?useSSL=false","root","root");
			PreparedStatement pst = con.prepareStatement("insert into user(FirstName,LastName,Gender,Mobile,Email,Password) values(?,?,?,?,?,?) ");
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, gender);
			pst.setString(4, umobile);
			pst.setString(5, uemail);
			pst.setString(6, upwd);
			
			int rowCount = pst.executeUpdate();
			
			if(rowCount>0) {
				request.setAttribute("status","success");
			}else {
				request.setAttribute("status","failed");
			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			request.setAttribute("status","duplicate");
			dispatcher.forward(request, response);
			//System.out.println("error duplicate");
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
