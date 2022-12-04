<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <div class="signin-form">
      <button
        type="submit"
        class="btn btn-primary bn col-sm-3"
        id="nop"
        name="nop"
        onclick="add()"
      >
        add passengers
      </button>

      <h2 class="form-title">Sign In</h2>
      <form method="post" class="register-form" id="f">
      
        <div id="c">
          <div class="copy" id="cl0">
            <br />

            <label for="modal-email" class="form-label">Your Name:</label>

            <input
              type="text"
              class="form-control"
              name="name"
              placeholder="e.g. aditya"
              value=""
            />

            <label for="modal-email" class="form-label">Your Gender:</label>

            <select name="gender">
              <option value="M" selected>Male</option>
              <option value="F">Female</option>
              <option value="O">other</option>
            </select>

            <button type="button" onclick="del(this.id)">del</button>
            <br />
          </div>
          <!--clone here -->
        </div>
      

        <div class="modal-footer">
          <button disabled type="submit" class="btn btn-primary" id="fsb">
            Submit
          </button>
        </div>
      </form>
      <button onclick="setparam()">done</button>
      <button disabled onclick="seeData()">Copy</button>
    </div>

    <script>
      var base = "cl";
      var delBtn = "btn";
      var i = 0;
      function add() {
        // i starts with 1
        console.log("add");
        const node = document.getElementById("cl0");
        const clone = node.cloneNode(true);
        ++i;
        clone.setAttribute("id", base.concat(i));
        var cl = clone.children[5];
        console.log(cl);
        cl.setAttribute("id", delBtn.concat(i));
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
            name: name,
            gender: gender,
          };
          passInfo.push(obj);
        }
        console.log(passInfo);
      }

      function del(id) {
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
        var fsb = document.getElementById("fsb").removeAttribute("disabled");
        seeData();
        var obj = { data: passInfo };
        var arrStr = encodeURIComponent(JSON.stringify(obj));
        var url = "bookTicket?array=" + arrStr;
        var form = document.getElementById("f");
        form.setAttribute("action", url);
      }
    </script>
  </body>
</html>
