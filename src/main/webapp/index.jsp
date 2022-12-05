
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Railways</title>
	<link rel="stylesheet" href="/css/main.min.css"  />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     
    <style>
      section {
        padding: 60px 0;
      }
      #landing {
        background-image: url("images/home.jpg");
        height: 100vh;
      }
    </style>
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
            <a class="navbar-brand" href="#intro">
              <span class="text-secondary fw-bold">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-train-freight-front-fill" viewBox="0 0 16 16">
                  <path d="M5.736 0a1.5 1.5 0 0 0-.67.158L1.828 1.776A1.5 1.5 0 0 0 1 3.118v5.51l2-.6V5a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3.028l2 .6v-5.51a1.5 1.5 0 0 0-.83-1.342L10.936.158A1.5 1.5 0 0 0 10.264 0H5.736ZM15 9.672l-5.503-1.65A.5.5 0 0 0 9.353 8H8.5v8h4a2.5 2.5 0 0 0 2.5-2.5V9.672ZM7.5 16V8h-.853a.5.5 0 0 0-.144.021L1 9.672V13.5A2.5 2.5 0 0 0 3.5 16h4Zm-1-14h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1ZM12 5v2.728l-2.216-.665A1.5 1.5 0 0 0 9.354 7H8.5V5H12ZM7.5 5v2h-.853a1.5 1.5 0 0 0-.431.063L4 7.728V5h3.5Zm-4 5a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1Zm9 0a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1ZM5 13a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm7 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"/>
                </svg>
                Railways
              </span>
            </a>
            <!-- toggle button for mobile nav -->
            <button
              class="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#main-nav"
              aria-controls="main-nav"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="navbar-toggler-icon"></span>
            </button>
  
            
          </div>
        </nav>
      
        <div class="row justify-content-center" style="margin-top: 15%">
          <div class="col-lg-8 list-group-item px-4 rounded" style="background-color: white; opacity: 0.7">
            
            <!-- <div
              class="list-group-item py-3"
              style="background-color: white; opacity: 0.7"
            > -->
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Book Tickets</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">PNR Status</button>
                </li>
              </ul>
              <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                
                    <form method="post" action="search">
                        <ul>
                            <b class="fsize"> 
                            From 
                            <input id="src" name="src" type="text" placeholder="Origin Station" required="required" > 
                            </b>
                            <b class="fsize"> To <input id="dest" name="dest" type="text" placeholder="Destination Station" required="required">  </b>
                            <b class="fsize">  Date <input id="date" name="date" type="Date" placeholder="dd-mm-yy" >  </b>
                            <label class="fsize"><strong> Class </strong> </label>
                                <select id="class" name="class">
                      
                                 <option value="AC">AC</option>
                                 <option value="Sleeper">Sleeper</option> 
                                 </select>
                           
                        </ul>
                        <input type="hidden" name="flag" value="search" />
                        <button type="submit">Book Tickets </button>
                    </form>
                    
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                
         
                
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <form method="post" action="pnr">
                        <ul>
                            <b class="fsize"> 
                            pnr no. 
                            <input id="pnr" name="pnr" type="text" placeholder="Enter PNR" required="required" > 
                            </b>
                            <button type="submit" >Submit </button>
                           
                        </ul>
                         
                        
                    </form>
                </div>
                </div>
              <!-- </div> -->
            </div>
          </div>
        </div>
      </div>
  
      <!-- pricing plans -->
      <section id="pricing" class="bg-light">
        <div class="container-lg">
          <div class="text-center">
            <h2>Incredible India !</h2>
            <p class="lead text-muted">
              One of the oldest civilisations in the world, India is a mosaic of multicultural experiences. With a rich heritage and myriad attractions, the country is among the most popular tourist destinations in the world.
            </p>
          </div>
  
         <div class="row my-5 g-0 align-items-center justify-content-center">
            <div class="col-8 col-lg-4 col-xl-3">
              <div class="card border-0">
                <div class="card-body text-center py-4">
                  <h4 class="card-title">Bangalore</h4>
                  <!--  -->
                  <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="images/b1.jpg" style="height: 200;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/b2.jpg" style="height: 200;"" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/b3.jpg" style="height: 200;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
                  
                  <!--  -->
                  <br>
                  <p class="lead card-subtitle">One State Many Worlds !</p>
                  <p class="display-5 my-4 text-primary fw-bold">
                    <span>&#8377</span>2,999
                  </p>
                  <p class="card-text mx-5 text-muted d-none d-lg-block">
                   The bustling metropolis beckons vacationers primarily with its scenic, lush green spaces that have earned it the nickname, 'Garden City.
                  </p>
                  <a href="#" class="btn btn-outline-primary btn-lg mt-3" onClick="travel('bangalore')">
                    Travel Now
                  </a>
                </div>
              </div>
            </div>
  
            <div class="col-9 col-lg-4">
              <div class="card border-primary border-2">
                <div class="card-header text-center text-primary">
                  Most Popular
                </div>
                <div class="card-body text-center py-5">
                  <h4 class="card-title">Delhi</h4>
                  <!--  -->
                  <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="images/d1.jpg" style="height: 250;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/d2.jpg" style="height: 250;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/d3.jpg" style="height: 250;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
                  
                  <!--  -->
                  <br>
                  <p class="lead card-subtitle">Dilli Hain Hum !</p>
                  <p class="display-4 my-4 text-primary fw-bold"><span>&#8377</span>1,999</p>
                  <p class="card-text mx-5 text-muted d-none d-lg-block">
                    Delhi is of great historical significance as an important commercial, transport, and cultural hub, as well as the political centre of India.
                  </p>
                  <a href="#" class="btn btn-outline-primary btn-lg mt-3" onClick="travel('delhi')">
                    Travel Now
                  </a>
                </div>
              </div>
            </div>
  
            <div class="col-8 col-lg-4 col-xl-3">
              <div class="card border-0">
                <div class="card-body text-center py-4">
                  <h4 class="card-title">Hyderabad</h4>
                 
                  <!--  -->
                  <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="images/h001.jpg" style="height: 200;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/h03.jpg" style="height: 200;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
    <img src="images/h4.jpg" style="height: 200;" class="d-block w-100 rounded" alt="...">
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
                  
                  <!--  -->
                  <br>
                  <p class="lead card-subtitle">It's all in it !</p>
                  <p class="display-5 my-4 text-primary fw-bold"><span>&#8377</span>4,999</p>
                  <p class="card-text mx-5 text-muted d-none d-lg-block">
                    Hyderabad is known as The City of Pearls, as once it was the only global centre for trade of large diamonds, emeralds and natural pearls.
                  </p>
                  <a href="#" class="btn btn-outline-primary btn-lg mt-3" onClick="travel('hyderabad')">
                    Travel Now
                  </a>
                </div>
              </div>
            </div>
          </div>
          </div>
        <!-- end container -->
      </section>
  
      <!-- contact form -->
      <!-- form-control, form-label, form-select, input-group, input-group-text -->
   
  
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("status").value;
		if(status=="logout"){
			console.log("success");
		    swal("congrats","You have successfully logged out","success");
		}
		
		
	</script>
     
     
      <script>
      //date
      

      const date = new Date();

      let day = date.getDate();
      let month = date.getMonth() + 1;
      let year = date.getFullYear();
      //let currentDate = `${year}-${month}-${day}`;
      let currentDate = new Date().toJSON().slice(0, 10);
      var d = document.getElementById("date");
      console.log(currentDate);
      let ld = new Date(date.getFullYear(), date.getMonth(), date.getDay() + 11)
        .toJSON()
        .slice(0, 10);
      console.log(ld);
      d.setAttribute("min", currentDate);
      d.setAttribute("value", currentDate);
      d.setAttribute("max", ld);
      
      //
      
      function travel(x){
    	  console.log("hi");
    	  var dest = document.getElementById("dest");
    	  dest.value=x;
      }
      
      
        const tooltips = document.querySelectorAll(".tt");
        tooltips.forEach((t) => {
          new bootstrap.Tooltip(t);
        });
      </script>
  </body>
</html>
