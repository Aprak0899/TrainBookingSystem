<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p> <%= request.getParameter("tid") %> </p>
<p> <%= request.getParameter("pno") %> </p>

<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="post" action="bookTicket" class="register-form" >
						<% for(int i=0;i<Integer.valueOf(request.getParameter("pno"));i++){
							//System.out.println(i);
						
							%>
						
							<div class="modal-body">
				              <label for="modal-email" class="form-label"
				                >Your Name:</label>
				              <input
				                type="text"
				                class="form-control"
				                id="modal-email"
				                name="n<%=i %>"
				                placeholder="e.g. aditya"
				              />
				              <label for="modal-email" class="form-label">Your Gender:</label>
				                <select name="g<%=i %>" id="gender">
												<option value="M" selected>Male</option>
												<option value="F">Female</option>
												<option value="O">other</option>
											</select>
				            </div>
				            <%} %>
				            
				            <div class="modal-footer">
				              <button type="submit" class="btn btn-primary">Submit</button>
				            </div>
				            
						</form>
					</div>

</body>
</html>