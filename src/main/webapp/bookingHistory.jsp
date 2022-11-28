<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %> 
  <%@ page import="project.Train" %> 
  <%@ page import="project.Ticket" %>  
  <% ArrayList<Ticket> tl =(ArrayList<Ticket>)request.getAttribute("list") ; 
  %>   
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<a href="booking.jsp" class="navbar-brand"> Railway </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Booking History</h3>
			<hr>
			
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Gender</th>
						<th>Train no.</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<% 
				if(tl!=null){
				System.out.println("from jsp = "+tl.size()); 
				
				for(int i=0;i<tl.size();i++){
					
				%>
						<tr>
							<td><%= tl.get(i).getpName() %> </td>
							<td><%= tl.get(i).getpGender() %> </td>
							<td><%= tl.get(i).getpnr() %>  </td>
							<td><%= tl.get(i).getStatus() %></td>
							
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<% if(tl.get(i).getStatus()!=0) {%>
								<a href="update?id=<%= i %> ">Cancel ticket</a>
								<%}else{
									%>
									Expired
									<%} %>
							
							</td>
						</tr>
						
				<%
				}} %>
		
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>