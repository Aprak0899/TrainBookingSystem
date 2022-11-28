
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
          <div class="col-lg-8 list-group-item px-4" style="background-color: white; opacity: 0.7">
            
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
                            <b class="fsize">  Date <input id="date" name="date" type="Date" placeholder="dd-mm-yy">  </b>
                            <label class="fsize"><strong> Class </strong> </label>
                                <select id="class" name="class">
                      
                                 <option value="AC">AC</option>
                                 <option value="Sleeper">Sleeper</option> 
                                 </select>
                           
                        </ul>
                        <button type="submit" >Book Tickets </button>
                    </form>
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                
                pnr
                
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
            <h2>Gallery</h2>
            <p class="lead text-muted">
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed quae
              ipsum rerum pariatur. Explicabo assumenda sequi odio molestias
              pariatur iure ipsum, molestiae nisi, aut aliquam in nobis! Voluptas,
              ipsam facilis.
            </p>
          </div>
  
         <div class="row my-5 g-0 align-items-center justify-content-center">
            <div class="col-8 col-lg-4 col-xl-3">
              <div class="card border-0">
                <div class="card-body text-center py-4">
                  <h4 class="card-title">Darjeeling</h4>
                  <p class="lead card-subtitle">Must visit</p>
                  <p class="display-5 my-4 text-primary fw-bold">
                    <span>&#8377</span>12,999
                  </p>
                  <p class="card-text mx-5 text-muted d-none d-lg-block">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Mollitia, vitae magni! Repellat commodi a fuga corporis saepe
                    dolorum.
                  </p>
                  <a href="#" class="btn btn-outline-primary btn-lg mt-3">
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
                  <h4 class="card-title">Manali</h4>
                  <p class="lead card-subtitle">Must visit</p>
                  <p class="display-4 my-4 text-primary fw-bold"><span>&#8377</span>18,999</p>
                  <p class="card-text mx-5 text-muted d-none d-lg-block">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Mollitia, vitae magni! Repellat commodi a fuga corporis saepe
                    dolorum.
                  </p>
                  <a href="#" class="btn btn-outline-primary btn-lg mt-3">
                    Travel Now
                  </a>
                </div>
              </div>
            </div>
  
            <div class="col-8 col-lg-4 col-xl-3">
              <div class="card border-0">
                <div class="card-body text-center py-4">
                  <h4 class="card-title">Coorg</h4>
                  <p class="lead card-subtitle">Must visit</p>
                  <p class="display-5 my-4 text-primary fw-bold"><span>&#8377</span>24,999</p>
                  <p class="card-text mx-5 text-muted d-none d-lg-block">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Mollitia, vitae magni! Repellat commodi a fuga corporis saepe
                    dolorum.
                  </p>
                  <a href="#" class="btn btn-outline-primary btn-lg mt-3">
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
      
      <!-- get updates / modal trigger -->
      <section class="bg-light">
        <div class="container">
          <div class="text-center">
            <h2>Stay in The Loop</h2>
            <p class="lead">Get the latest updates as they happen...</p>
          </div>
          <div class="row justify-content-center">
            <div class="col-md-8 text-center">
              <p class="text-muted my-4">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero
                exercitationem voluptatibus porro, hic asperiores fuga illo
                voluptates obcaecati deleniti veritatis sunt saepe quasi deserunt
                ex ipsum. Est possimus, aspernatur, vitae eligendi rem odit
                quaerat, ipsum pariatur ratione maxime delectus fuga minus
                accusamus dolores iusto maiores accusantium cumque magnam placeat
                quia!
              </p>
              <button
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#reg-modal"
              >
                Register for Updates
              </button>
            </div>
          </div>
        </div>
      </section>
  
      <!-- modal itself -->
      <div
        class="modal fade"
        id="reg-modal"
        tabindex="-1"
        aria-labelledby="modal-title"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modal-title">Get the Latest Updates</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <p>
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis,
                exercitationem laboriosam nihil minus voluptatibus harum aliquam
                consequatur pariatur inventore dignissimos illum excepturi ratione
                ipsum sit iusto alias eligendi fugit laborum?
              </p>
              <label for="modal-email" class="form-label"
                >Your email address:</label
              >
              <input
                type="text"
                class="form-control"
                id="modal-email"
                placeholder="e.g. aditya@example.com"
              />
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Submit</button>
            </div>
          </div>
        </div>
      </div>
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     
      <script>
        const tooltips = document.querySelectorAll(".tt");
        tooltips.forEach((t) => {
          new bootstrap.Tooltip(t);
        });
      </script>
  </body>
</html>
