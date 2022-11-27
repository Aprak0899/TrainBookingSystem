<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form</title>

<!-- Font Icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/css/main.min.css"  />

    
<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="fname" id="fname" placeholder="Enter First Name" required="required"/>
							</div>
							<div class="form-group">
								<label for="name">
									<i class="zmdi zmdi-account material-icons-name"></i>
								</label> 
								<input type="text" name="lname" id="lname" placeholder="Enter last Name" required="required"/>
							</div>
							
							<!--  <div class="form-group">
							<div class="dropdown">
							  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							    Select Gender
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							    <li class="dropdown-item">Male</li>
							    <li class="dropdown-item">Female</li>
							    <li class="dropdown-item">Other</li>
							  </ul>
							  
							</div>
							 -->
							 
							<div class="form-group">
							
							<label for="gender"> Select you gender</label>
							<br>
							<br>
							<select name="gender" id="gender">
								<option value="none" selected>Gender</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
								<option value="O">other</option>
							</select>
							
							</div>

							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Enter Email" required="required"/>
							</div>
							
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Enter Password" required="required"/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Confirm your password" required="required"/>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Enter Contact no" required="required"/>
							</div>
						
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.png" alt="sign up image" width="300" height="400">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already a
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("status").value;
		if(status=="success"){
			console.log("success");
		    swal("congrats","account created","success");
		}
		if(status=="duplicate"){
			console.log("success");
		    swal("Sorry","Account already exist","error");
		}
		if(status=="invalidName"){
		    swal("Sorry","Please Enter UserName","error");
		}
		if(status=="invalidEmail"){
		    swal("Sorry","Please Enter Email","error");
		}
		if(status=="invalidPswd"){
		    swal("Sorry","Please Enter Password","error");
		}
		if(status=="invalidCNFPswd"){
		    swal("Sorry","Password do not match","error");
		}
		if(status=="invalidMobile"){
		    swal("Sorry","Please Enter mobile","error");
		}
		if(status=="invalidMobileLength"){
		    swal("Sorry","Invalid mobile length","error");
		}
		
	</script>

</body>
</html>