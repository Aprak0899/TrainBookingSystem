<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="project.Train"%>
<%
ArrayList<Train> td = (ArrayList<Train>) request.getAttribute("trainData");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Railways</title>
<link rel="stylesheet" href="/css/main.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />

<style>
section {
	padding: 60px 0;
}

#landing {
	background-image: url("images/home.jpg");
	height: 100vh;
}

#f1 {
	width: 300px;
	margin: 0 auto;
	text-align: center;
	padding-top: 50px;
}

.value-button {
	display: inline-block;
	border: 1px solid #ddd;
	margin: 0px;
	width: 40px;
	height: 20px;
	text-align: center;
	vertical-align: middle;
	padding: 11px 0;
	background: #eee;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.value-button:hover {
	cursor: pointer;
}

#f1 #decrease {
	margin-right: -4px;
	border-radius: 8px 0 0 8px;
}

#f1 #increase {
	margin-left: -4px;
	border-radius: 0 8px 8px 0;
}

#f1 #input-wrap {
	margin: 0px;
	padding: 0px;
}

input#number {
	text-align: center;
	border: none;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	margin: 0px;
	width: 40px;
	height: 40px;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#landing {
	background-image: url("images/home.jpg");
	height: 100vh;
}
</style>
<link rel="stylesheet" href="css/profile.css" />
</head>
<body>
	<script src="js/main.js"></script>
	<%
	if (request.getAttribute("status") != null) {
	%>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<%
	} else {
	%>
	<input type="hidden" id="status" value="a">
	<%
	}
	%>
	<div id="landing">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-light pt-4 pb-4"
			style="background-color: white; opacity: 0.6">
			<div class="container-xxl">
				<!-- navbar brand / title -->
				<a class="navbar-brand" href="index.jsp"> <span
					class="text-secondary fw-bold"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							fill="currentColor" class="bi bi-train-freight-front-fill"
							viewBox="0 0 16 16">
                <path
								d="M5.736 0a1.5 1.5 0 0 0-.67.158L1.828 1.776A1.5 1.5 0 0 0 1 3.118v5.51l2-.6V5a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3.028l2 .6v-5.51a1.5 1.5 0 0 0-.83-1.342L10.936.158A1.5 1.5 0 0 0 10.264 0H5.736ZM15 9.672l-5.503-1.65A.5.5 0 0 0 9.353 8H8.5v8h4a2.5 2.5 0 0 0 2.5-2.5V9.672ZM7.5 16V8h-.853a.5.5 0 0 0-.144.021L1 9.672V13.5A2.5 2.5 0 0 0 3.5 16h4Zm-1-14h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1ZM12 5v2.728l-2.216-.665A1.5 1.5 0 0 0 9.354 7H8.5V5H12ZM7.5 5v2h-.853a1.5 1.5 0 0 0-.431.063L4 7.728V5h3.5Zm-4 5a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1Zm9 0a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1ZM5 13a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm7 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z" />
              </svg> Railways
				</span>
				</a>
				<!-- toggle button for mobile nav -->
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#main-nav"
					aria-controls="main-nav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- navbar links -->
				<div
					class="collapse navbar-collapse justify-content-end align-center"
					id="main-nav">
					<ul class="navbar-nav">
						<%
						if (session.getAttribute("name") == null) {
						%>
						<li class="nav-item"><a class="nav-link"
							href="registration.jsp">Sign Up</a></li>
						<li class="nav-item"><a class="nav-link" href="login.jsp">Loign</a></li>
						<%
						}
						%>
						<%
						if (session.getAttribute("name") != null) {
						%>
						<li class="nav-item">

							<form method="get" action="BookingHistory">
								<div class="form-group form-button">

									<input type="hidden" name="bh" id="signin" class="form-submit"
										value="bh" />
									<li class="nav-item nav-link"><input
										class="btn btn-secondary" type="submit" name="bha" id="signin"
										value="BookingHistory" /></li>

								</div>
							</form>
						</li>
						<li class="nav-item">
						<li class="nav-item nav-link"><input class="btn btn-success"
							type="submit" onClick="trainB()"
							value="<%=session.getAttribute("name")%>" /></li>
						</li>
						<li class="nav-item">
						<li class="nav-item nav-link"><input class="btn btn-danger"
							type="submit" onClick="logout()" value="LogOut" /></li>
						</li>


						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>


		<!-- search  -->

		<br>
		<div class="row justify-content-center">
			<div class="col-lg-8 list-group-item px-4 rounded"
				style="background-color: white; opacity: 0.7">

				<br>
				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<form method="post" action="search">
							<div class="row content justify-content-center">
								<div class="row content justify-content-center col-sm-6 ">
									<div class="col-sm-5 ">
										<input id="src" name="src" type="text" placeholder="Source"
											required="required"
											<%if (request.getAttribute("src") != null) {%>
											value="<%=request.getAttribute("src")%>" <%}%>>
									</div>
									<div
										class="col-sm-2 d-flex justify-content-center align-items-center"
										id="alter" onclick="rev()">

										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-left-right"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z" />
</svg>

									</div>
									<div class="col-sm-5 ">


										<input id="dest" name="dest" type="text"
											placeholder="Destination" required="required"
											<%if (request.getAttribute("dest") != null) {%>
											value="<%=request.getAttribute("dest")%>" <%}%>>
									</div>
								</div>


								<div class="col-sm-2 ">
									<input id="date" required="required" name="date" type="Date"
										placeholder="dd-mm-yy">
								</div>



								<div class=" col-sm-2 ">
									<select id="class" name="class">
										<option value="label">Class</option>
										<option value="AC">AC</option>
										<option value="Sleeper">Sleeper</option>
									</select>
								</div>
								<input type="hidden" name="flag" value="search" />
								<div class="col-sm-2">
									<button type="submit">Modify Search</button>
								</div>

							</div>

						</form>
					</div>

					<!-- </div> -->
				</div>
				<br>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-lg-8 px-4 rounded row justify-content-center"
				style="background-color: white; opacity: 0.7">
				<div class="col-sm-3">
					<form method="post" action="search">
						<div class="form-group form-button">


							<li class="nav-item nav-link"><input
								class="btn btn-secondary" type="submit" name="flag" id="signin"
								value="Sort by travel time" /></li>

						</div>
					</form>
				</div>
				<div class="col-sm-3">

					<form method="post" action="search">
						<div class="form-group form-button">


							<li class="nav-item nav-link"><input
								class="btn btn-secondary" type="submit" name="flag" id="signin"
								value="Sort by arrival time" /></li>

						</div>
					</form>
				</div>
				<div class="col-sm-3">

					<form method="post" action="search">
						<div class="form-group form-button">


							<li class="nav-item nav-link"><input
								class="btn btn-secondary" type="submit" name="flag" id="signin"
								value="Sort by seat Availability" /></li>

						</div>
					</form>
				</div>
			</div>
		</div>

		<br>


		<!-- train list -->


		<div class="row justify-content-center">
			<div class="col-lg-8 list-group-item px-4 rounded"
				style="background-color: white; opacity: 0.7">
				<%
				if (td != null) {
					for (int i = 0; i < td.size(); i++) {
				%>
				<div class="row content">
					<%
					int t = td.get(i).getDuration();
					int hours = t / 60;
					int minutes = t % 60;
					String time = hours + ":" + minutes;
					%>

					<p class="col-sm-6 ">

						<%=td.get(i).getName()%>
						(
						<%=td.get(i).getId()%>
						)
					</p>
					<p class="col-sm-6 ">

						-----
						<%=time%>
						-----
					</p>
				</div>

				<div class="row content">
					<p class="col-sm-3 ">
						Dept time ::
						<%=td.get(i).getDeparture()%></p>
					<p class="col-sm-3 "><%=request.getAttribute("src")%></p>
					<p class="col-sm-3 ">
						Arrival time ::
						<%=td.get(i).getArrival()%></p>
					<p class="col-sm-3 "><%=request.getAttribute("dest")%></p>


					<div class="row content">
						<div class="col-sm-9 ">
							<select id="c<%=i%>" name="class">
								<%
								if (td.get(i).getACSeat() > 0) {
								%>
								<option value="AC">AC
									<%=td.get(i).getACSeat()%></option>
								<%
								}
								%>
								<%
								if (td.get(i).getNACSeat() > 0) {
								%>
								<option value="Sleeper">Sleeper
									<%=td.get(i).getNACSeat()%></option>
								<%
								}
								%>
							</select>
						</div>

						<%
						if (session.getAttribute("id") != null) {
						%>
						<button type="submit" class="btn btn-primary bn col-sm-3 "
							data-bs-toggle="modal" data-bs-target="#reg-modal" id="<%=i%>"
							name="<%=td.get(i).getId()%>">Book Now</button>
						<%
						} else {
						%>
						<button type="submit" class="btn btn-primary bn col-sm-3 "
							onClick="login()">Book Now</button>
						<%
						}
						%>
					</div>

				</div>
				<hr>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>

	<!-- modal itself -->
	<div class="modal fade" id="reg-modal" tabindex="-1"
		aria-labelledby="modal-title" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal-title">Add passengers</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<label for="modal-email" class="form-label">select total
						number of passengers:</label>
					<form id="f1" method="get" action="bookTicket">
						<input type="hidden" name="tid" id="tid" value=""> <input
							type="hidden" name="tno" id="tno" value=""> <input
							type="hidden" name="c" id="c" value="">
						<div class="value-button" id="decrease" onclick="decreaseValue()"
							value="Decrease Value">-</div>
						<input type="number" name="pno" id="number" value="0" />
						<div class="value-button" id="increase" onclick="increaseValue()"
							value="Increase Value">+</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- contact form -->


	<!-- form-control, form-label, form-select, input-group, input-group-text -->


	<!-- profile -->
	<!-- <div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="modal-title" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal-title">Add passengers</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="popup">
						<div class="card">
							<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
								alt="..." />
							<h1>Aman Singh</h1>
							<p>ID:101</p>
							<p>Email:aman@gmail.com</p>
							<p>Phone:1234567890</p>
						</div>
						<button type="button" class="hide" onclick="trainC()">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div> -->

	<%-- <section class="bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-4 mb-sm-5">
					<div class="card card-style1 border-0">
						<div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
							<div class="row align-items-center">
								<div class="col-lg-6 mb-4 mb-lg-0">
									<%
									if (new String((String) session.getAttribute("gender")).matches("F")) {
										System.out.println("Female");
									%>

									<img src="https://bootdey.com/img/Content/avatar/avatar3.png"
										alt="..." />
									<%
									} else if (new String((String) session.getAttribute("gender")).matches("M")) {
									%>
									<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
										alt="..." />
									<%
									} else {
									System.out.println("other" + session.getAttribute("gender"));
									%>
									<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
										alt="..." />
									<%
									}
									%>
								</div>
								<div class="col-lg-6 px-xl-10">
									<div
										class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded"
										style="width: 100%;">
										<h3 class="h2 text-white mb-0 d-flex justify-content-center"><%=session.getAttribute("name")%>
										</h3>
										<!-- <span class="text-primary">Coach</span> -->
									</div>
									<ul class="list-unstyled mb-1-9">
										<!--  <li class="mb-2 mb-xl-3 display-28">
                                        <span class="display-26 text-secondary me-2 font-weight-600">Position:</span>
                                        Coach
                                    </li> -->
										<li class="mb-2 mb-xl-3 display-28"><span
											class="display-26 text-secondary me-2 font-weight-600">Full
												Name:</span> <%=session.getAttribute("name")%> <%=session.getAttribute("lname")%>
										</li>
										<li class="mb-2 mb-xl-3 display-28"><span
											class="display-26 text-secondary me-2 font-weight-600">Id:</span>
											<%=session.getAttribute("id")%></li>
										<li class="mb-2 mb-xl-3 display-28"><span
											class="display-26 text-secondary me-2 font-weight-600">Email:</span>
											<%=session.getAttribute("email")%></li>

										<li class="display-28"><span
											class="display-26 text-secondary me-2 font-weight-600">Phone:</span>
											<%=session.getAttribute("mobile")%></li>
									</ul>
									<button class="btn btn-primary" routerLink="/dashboard">
										go back</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> --%>

	<!-- profile  -->
	<%
	if (session.getAttribute("gender") != null) {
	%>
	<div>
		<div class="form-popup" id="user-profile">
			<div class="popup">
				<div class="card">
					<%
					if (new String((String) session.getAttribute("gender")).matches("M")) {
					%>
					<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
						alt="..." />
					<%
					} else if (new String((String) session.getAttribute("gender")).matches("F")) {
					%>
					<img src="https://bootdey.com/img/Content/avatar/avatar3.png"
						alt="..." />
					<%
					} else {
					%>
					<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
						alt="..." />
					<%
					}
					%>
					<h1><%=session.getAttribute("name")%>
						<%=session.getAttribute("lname")%></h1>
					<p>
						ID:<%=session.getAttribute("id")%></p>
					<p>
						Email:<%=session.getAttribute("email")%></p>
					<p>
						Phone:<%=session.getAttribute("mobile")%></p>
				</div>
				<button type="button" class="hide" onclick="trainC()">Close</button>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("status").value;
		if(status=="success"){
			console.log("success");
		    swal("congrats","Ticket Booked SuccessFully","success");
		}
		if(status=="failed"){
			console.log("fail");
		    swal("Sorry","Booking ticket failed","error");
		}
		if(status=="invalid_date"){
			console.log("fail");
		    swal("Sorry","please enter date","error");
		}
		
		</script>

	<script>
	//alter
	function rev() {
        var src = document.getElementById("src");
        var dest = document.getElementById("dest");
        console.log(src.value);
        var srcda = src.value;
        var destda = dest.value;
        console.log(dest.value);
        src.value = destda;
        dest.value = srcda;
      }
    //for profile
    function trainB(){
        document.getElementById("user-profile").style.display = "flex";
      }
    //
      const tooltips = document.querySelectorAll(".tt");
      tooltips.forEach((t) => {
        new bootstrap.Tooltip(t);
      });
      
      function increaseValue() {
    	  var value = parseInt(document.getElementById('number').value, 10);
    	  value = isNaN(value) ? 0 : value;
    	  value++;
    	  document.getElementById('number').value = value;
    	}

    	function decreaseValue() {
    	  var value = parseInt(document.getElementById('number').value, 10);
    	  value = isNaN(value) ? 0 : value;
    	  value < 1 ? value = 1 : '';
    	  value--;
    	  document.getElementById('number').value = value;
    	}
    	//
    	function logout(){
    	        document.location.href='logout';

    	}
    	function login(){
    		document.location.href = "login.jsp";
    	}
    	//
    	 function alterValue(){
    		//get val from src
    		var src= document.getElementById("src").value;
    		console.log(src);
    		//get val from dest
    		var dest= document.getElementById("dest").value;
    		console.log(dest);
    		//set src val to dest and vice versa
    	}
    	//
    	
        var num = document.getElementsByClassName("bn");
    	var selectedId;
    	var tno;
    	var classId;
		for(var i=0;i<num.length;i++){
			num[i].addEventListener('click',(b)=>{ 
				
				//get id of the selected button
				selectedId=b.target.id;
				//get id of the gender dropdown
				classId="c"+selectedId;
				
				//once you have gender dropdown id => then get value for that genderdropdown
				var value = document.getElementById(classId).value;
				//ac or sleeper => this value needs to be passed to modal
				console.log(value);
				//so train number is assigned to button name
				tno=b.target.name;
				//103
				console.log(tno);
				//c+0 for 1st button ...
				console.log(classId);
				var inputF = document.getElementById("tid");
	            inputF.setAttribute('value', selectedId);
	            
	            var inputTid = document.getElementById("tno");
	            inputTid.setAttribute('value', tno);
	            //seat
	            var inputClass = document.getElementById("c");
	            inputClass.setAttribute('value', value);
	            
	           
	            console.log(inputF,inputTid,inputClass);
			})
		}
    	//set attribute in modal
    	
        
    </script>
</body>
</html>