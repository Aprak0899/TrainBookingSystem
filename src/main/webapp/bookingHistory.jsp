<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %> 
  <%@ page import="project.Train" %> 
  <%@ page import="project.Ticket" %>  
  <% ArrayList<Ticket> tl =(ArrayList<Ticket>)request.getAttribute("list") ; 
  %>   
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BookingHistory</title>
	<link rel="stylesheet" href="/css/main.min.css"  />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
      section {
        padding: 60px 0;
      }
      #landing {
        background-image: url("images/home.jpg");
        height: 115vh;
      }
    </style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
<div id="landing">
        <!-- navbar -->
        <nav
          class="navbar navbar-expand-md navbar-light pt-4 pb-4"
          style="background-color: white; opacity: 0.6"
        >
          <div class="container-xxl">
            <!-- navbar brand / title -->
            <a class="navbar-brand" href="booking.jsp">
              <span class="text-secondary fw-bold">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-train-freight-front-fill" viewBox="0 0 16 16">
                  <path d="M5.736 0a1.5 1.5 0 0 0-.67.158L1.828 1.776A1.5 1.5 0 0 0 1 3.118v5.51l2-.6V5a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3.028l2 .6v-5.51a1.5 1.5 0 0 0-.83-1.342L10.936.158A1.5 1.5 0 0 0 10.264 0H5.736ZM15 9.672l-5.503-1.65A.5.5 0 0 0 9.353 8H8.5v8h4a2.5 2.5 0 0 0 2.5-2.5V9.672ZM7.5 16V8h-.853a.5.5 0 0 0-.144.021L1 9.672V13.5A2.5 2.5 0 0 0 3.5 16h4Zm-1-14h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1ZM12 5v2.728l-2.216-.665A1.5 1.5 0 0 0 9.354 7H8.5V5H12ZM7.5 5v2h-.853a1.5 1.5 0 0 0-.431.063L4 7.728V5h3.5Zm-4 5a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1Zm9 0a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1ZM5 13a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm7 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"/>
                </svg>
                Railways
              </span>
            </a>

          </div>
        </nav>
      
	<br>

		<div class="modal-dialog modal-xl modal-dialog-scrollable style="background-color: white; opacity: 0.6"">
		  <div class="modal-content">
			<div class="modal-body">
				  <div class="row">
			  
		  
	  
			  <div class="scroll-data" style="background-color: white; opacity: 0.6">
				  <h3 cl>Booking History</h3>
				  <hr>
				  
				  <br>
				  <table class="table table-bordered">
					  <thead>
						  <tr>
							  <th>Name</th>
							  <th>Gender</th>
							  <th>PNR</th>
							  <th>Train name</th>
							  <th>Actions</th>
						  </tr>
					  </thead>
					  <tbody>
					  
					  <% 
					  if(tl!=null && tl.size()!=0){
					  System.out.println("from jsp = "+tl.size()); 
					  
					  for(int i=0;i<tl.size();i++){
						  
					  %>
							  <tr>
								  <td><%= tl.get(i).getpName() %> </td>
								  <td><%= tl.get(i).getpGender() %> </td>
								  <td><%= tl.get(i).getpnr() %>  </td>
								  <td><%= tl.get(i).getName() %></td>
								  
								  <td>
									  &nbsp;&nbsp;&nbsp;&nbsp; 
									  <% if(tl.get(i).getStatus()==1) {%>
									  <form method="get" action="BookingHistory?id=">
											<div class="form-group form-button">
											<input type="hidden" name="id" id="signin" class="form-submit" value="<%= i %>" />
										  <input type="submit" name="tag" id="signin" class="form-submit btn btn-danger" value="cancel ticket" />
										  </div>
										</form>
									  
									  <%}else if(tl.get(i).getStatus()==0){
										  %>
										  Canceled
										  <%}else{%>
										  Expired
										  <% }%>
								  
								  </td>
							  </tr>
							  
					  <%
					  }} %>
			  
					  </tbody>
	  
				  </table>
				 
			  </div>
		  </div>
			</div>	
		  
		</div>
	  </div>
	</div>
</body>
</html>