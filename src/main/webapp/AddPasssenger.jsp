<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

    <style type="text/css">
    #landing {
        background-image: url("images/home.jpg");
        height: 100vh;
      }
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
        </style> 

</head>
<body id="landing">
	


		
		
		

	<form method="post" class="form-style-9" id="f" style="opacity: 0.8">
      <button
        type="button"
        class="btn btn-primary bn col-sm-6 field-split align-left"
        id="nop"
        name="nop"
        onclick="add()"
      >
        add passengers
      </button>
        <p class="display-4 my-4 text-primary fw-bold" >
        <span>&#8377 </span> <span id="totalCost"><%=request.getAttribute("fare")%></span>
        </p>
      <hr />
      

      <div id="c">
        <div
          class="copy col-lg-12 px-4 rounded row justify-content-center"
          id="cl0"
        >
          <h2>Passenger Details : 1</h2>

          <label for="modal-email" class="form-label">Name:</label>

          <input
            type="text"
            class="form-control field-style field-split align-left"
            name="name"
            placeholder="passenger name"
            value=""
          />

          <label
            for="modal-email"
            class="form-label field-style field-split align-right"
            >Gender:</label
          >

          <select name="gender">
            <option value="M" selected>Male</option>
            <option value="F">Female</option>
            <option value="O">other</option>
          </select>

          <button type="button" class="btn btn-danger" onclick="del(this.id)">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-trash3-fill"
              viewBox="0 0 16 16"
            >
              <path
                d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"
              />
            </svg>
          </button>
          <br />
          <hr />
        </div>

        <!--clone here -->
      </div>
   

      <div class="modal-footer">
        <br />
      </div>

      <button type="button" onclick="setparam()">done</button>
      <button disabled type="submit" class="btn btn-primary" id="fsb">
        Submit
      </button>
    </form>

	<script>
	var totalCost=<%=request.getAttribute("fare")%>;
	var costPerHead=<%=request.getAttribute("fare")%>;
	
	console.log("tc= ",totalCost );
	function addFare(){
		totalCost+=costPerHead;
		 let n = document.getElementById("totalCost");
	     n.innerHTML=totalCost;
		console.log("tc= ",totalCost );
	}
	function delFare(){
		if(totalCost!=<%=request.getAttribute("fare")%>){
			totalCost-=costPerHead;
			 let n = document.getElementById("totalCost");
		     n.innerHTML=totalCost;
		}
		
		console.log("tc= ",totalCost );
	}
	
	 var base = "cl";
     var delBtn = "btn";
     var i = 0;

     function add() {
    	 
    	 addFare();
       // i starts with 1
       console.log("add");
       const node = document.getElementById("cl0");
       const clone = node.cloneNode(true);
       ++i;
       clone.setAttribute("id", base.concat(i));
       var cl = clone.children[5];
       console.log(cl);
       cl.setAttribute("id", delBtn.concat(i));
       var headTag = clone.children[0];
       headTag.innerHTML = `Passenger Details : ${i + 1}`;
       console.log("ht", headTag);
       document.getElementById("c").appendChild(clone);
     }

		var passInfo = [];
		//pushes data to array when the button is pressed
		//this should be linked with add pass button
		function seeData() {
			var num = document.getElementsByClassName("copy");
			console.log(num);
			passInfo = [];
			for (var i = 0; i < num.length; i++) {
				console.log(num[i]);
				var name = num[i].children[2].value;
				var gender = num[i].children[4].value;

				var obj = {
					name : name,
					gender : gender,
				};
				passInfo.push(obj);
			}
			console.log(passInfo);
		}

		function del(id) {
			
			delFare();
			console.log("array", passInfo);
			console.log("clicked", id);
			let indexToDelete = id.charAt(id.length - 1);
			console.log("id = ", indexToDelete);
			//delete object from the array

			passInfo.splice(indexToDelete, 1);
			//remove the node
			//for this get parent node //now remove that node
			var x = document.getElementById(id).parentElement.remove();
			console.log("parent element", x);
			--i;
			console.log(passInfo);
		}

		function setparam() {
			var fsb = document.getElementById("fsb")
					.removeAttribute("disabled");
			seeData();
			var obj = {
				data : passInfo
			};
			var arrStr = encodeURIComponent(JSON.stringify(obj));
			var url = "bookTicket?array=" + arrStr;
			var form = document.getElementById("f");
			form.setAttribute("action", url);
		}
	</script>
</body>
</html>
