<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PNR</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     

    <style type="text/css">
        .form-style-9{
            max-width: 450px;
            background: #FAFAFA;
            padding: 30px;
            margin: 50px auto;
            box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
            border-radius: 10px;
            border: 6px solid #305A72;
        }
        .form-style-9 ul{
            padding:0;
            margin:0;
            list-style:none;
        }
        .form-style-9 ul li{
            display: block;
            margin-bottom: 10px;
            min-height: 35px;
        }
        .form-style-9 ul li  .field-style{
            box-sizing: border-box; 
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box; 
            padding: 8px;
            outline: none;
            border: 1px solid #B0CFE0;
            -webkit-transition: all 0.30s ease-in-out;
            -moz-transition: all 0.30s ease-in-out;
            -ms-transition: all 0.30s ease-in-out;
            -o-transition: all 0.30s ease-in-out;
        
        }.form-style-9 ul li  .field-style:focus{
            box-shadow: 0 0 5px #B0CFE0;
            border:1px solid #B0CFE0;
        }
        .form-style-9 ul li .field-split{
            width: 49%;
        }
        .form-style-9 ul li .field-full{
            width: 100%;
        }
        
        .form-style-9 ul li input.align-right{
            float:right;
        }
        .form-style-9 ul li textarea{
            width: 100%;
            height: 100px;
        }
        .form-style-9 ul li input[type="button"], 
        .form-style-9 ul li input[type="submit"] {
            -moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
            -webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
            box-shadow: inset 0px 1px 0px 0px #3985B1;
            background-color: #216288;
            border: 1px solid #17445E;
            display: inline-block;
            cursor: pointer;
            color: #FFFFFF;
            padding: 8px 18px;
            text-decoration: none;
            font: 12px Arial, Helvetica, sans-serif;
        }
        .form-style-9 ul li input[type="button"]:hover, 
        .form-style-9 ul li input[type="submit"]:hover {
            background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
            background-color: #28739E;
        }
        #landing {
        background-image: url("images/home.jpg");
        height: 100vh;
      }
        </style>    

</head>
<body id="landing">
 <div >
        <!-- navbar -->
        <nav
          class="navbar navbar-expand-md navbar-light pt-4 pb-4"
          style="background-color: white; opacity: 0.6"
        >
          <div class="container-xxl">
            <!-- navbar brand / title -->
            <a class="navbar-brand" href="index.jsp">
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

	<div class="row">
<form class="form-style-9" style="opacity: 0.8">
        <h1>PNR Status</h1><ul>
        <li>
            PNR Number: <input type="text" name="field1" class="field-style field-split align-left" placeholder="PNR Number" disabled value="<%=request.getAttribute("pnr_no") %>"/> 
        </li>
        <li>   
            Train Number: <input type="text" name="field1" class="field-style field-split align-left" placeholder="Train Number" disabled value="<%=request.getAttribute("t_no") %>"/></li>
 
            <li>Train Name: <input type="text" name="field1" class="field-style field-split align-left" placeholder="Train Name" disabled value="<%=request.getAttribute("t_name") %>"/>

        </li>
        <li>    
           Passenger Name: <input type="text" name="field1" class="field-style field-split align-left" placeholder="Passenger Name" disabled value="<%=request.getAttribute("name") %>"/></li>

            <li> Gender: <input type="text" name="field1" class="field-style field-split align-left" placeholder="Gender" disabled value="<%=request.getAttribute("gender") %>"/>

         </li>
        <li>
            Seat Type: <input type="text" name="field1" class="field-style field-split align-left" placeholder="Seat Type" disabled value="<%=request.getAttribute("seat") %>"/></li>

           <li> Reservation Status: <input type="text" name="field3" class="field-style field-split align-left" placeholder="Reservation Status" disabled 
           
           value="<% if((int)request.getAttribute("status")==1){%>Confirmed<%}else if((int)request.getAttribute("status")==0){%>Cancelled<% }else{ %>Expired<%}%>"/>
           
        </li></ul>
        </form>
        </div>
</body>
</html>