package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PNRServlet
 */
public class PNRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PNRServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get pnr
		String pnrStr =request.getParameter("pnr");
		RequestDispatcher dispatcher = null;
		if(pnrStr==null||pnrStr.equals("")) {
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
			//send redirect
			dispatcher.forward(request, response);
		}
		int pnr = Integer.valueOf(pnrStr);
		
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainbookingsystem?allowPublicKeyRetrieval=true&useSSL=false","root","root");
			//works
			PreparedStatement pstmt = con.prepareStatement(" select *  from  train as t join passenger as p on p.Train_no=t.Train_no where p.PNR = ? ; ");
			pstmt.setInt(1, pnr);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				request.setAttribute("pnr_no", rs.getInt(18));
				request.setAttribute("t_no", rs.getInt(1));
				request.setAttribute("t_name", rs.getString(2));
				request.setAttribute("name", rs.getString(15));
				request.setAttribute("status", rs.getInt(17));
				request.setAttribute("gender", rs.getString(16));
				request.setAttribute("seat", rs.getString(20));
				
				dispatcher=request.getRequestDispatcher("pnr.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("index.jsp");
				
			}
			
			
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			request.setAttribute("status", "failed");
			dispatcher=request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		}
		
		
	}

}
