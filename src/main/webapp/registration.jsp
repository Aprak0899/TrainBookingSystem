<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SignUp</title>

     
    <style>
      
      #landing {
        background-image: url("images/home.jpg");
        
        height: 130vh;
      }
    </style>
<!-- Font Icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/css/main.min.css"  />

    
<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	
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

	<div class="row" style="opacity: 0.8">
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