<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Faculty.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <%-- <head runat="server">--%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />

    <!-- Custom CSS -->
    <style>
.box{
  text-align: center;
}

nav{
  background-color: #383F51;
}

body{
  background-color: #3C4F76;
}

select{
  padding: 0.5em 4em 0.5em 4em; 
}

nav ul a{
  color: Black;
  text-decoration: none;
  font-size: 1em;
  padding: 10px;
  margin: 10px;
  border-radius: 5px;
  transition: .3s linear;
}

nav ul a:hover{
  background-color: #04AA6D;
  color: white;
}

.container {
    max-width: 800px;
}

.Distribution {
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  padding: 20px;
  background-color: #f2f2f2;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align: center;
}

.Distribution h2 {
  margin-top: 0;
}

.Distribution label,
.Distribution input {
  display: block;
  width: 100%;
  margin-bottom: 10px;
}

.Distribution input[type="submit"] {
  padding: 10px;
  background-color: #3498db;
  color: #fff;
  border: none;
  cursor: pointer;
}

  /* Optional: Adjust button styles */
  .btn-reset {
    margin-right: 10px;
  }


    .panel {
        align-self: center;
        background-color: white;
        border-radius: 30%;
        padding: 15px 25px;
        width: 100%;
        max-width: 960px;
        display: flex;
        flex-direction: column;
        text-align: center;
        text-transform: uppercase;
      }

      .pricing-plan {
        padding: 15px 25px;
        border-bottom: 1px solid #e1f1ff;
      }

      .pricing-plan:last-child {
        border-bottom: none;
      }

      .pricing-img {
        margin-bottom: 25px;
        max-width: 100%;
      }

      .pricing-header {
        color: #888;
        font-weight: 600;
        letter-spacing: 1px;
      }

      .pricing-features {
        margin: 50px 0 25px;
        color: #016ff9;
      }

      .pricing-features-item {
        font-weight: 600;
        letter-spacing: 1px;
        font-size: 12px;
        line-height: 1.5p;
        padding: 15px 0;
        border-top: 1px solid #e1f1ff;
      }

      .pricing-features-item:last-child {
        border-top: 1px solid #e1f1ff;
      }

      .pricing-price {
        color: #016ff9;
        display: block;
        font-size: 32px;
        font-weight: 700px;
      }

      .pricing-button {
        border: 1px solid #9dd1ff;
        border-radius: 10px;
        color: #348efe;
        display: inline-block;
        padding: 15px 35px;
        text-decoration: none;
        margin: 25px 0;
        transition: background-color 200ms ease-in-out;
      }

      .pricing-button:hover,
      .pricing-button:focus {
        background-color: #e1f1ff;
      }

      .pricing-button.is-featured:hover,
      .pricing-button.is-featured:focus {
        background-color: #269aff;
        color: white;
      }

      @media (max-width: 90px) {
        .panel {
          flex-direction: row;
        }

        .pricing-plan {
          border-bottom: none;
          border-right: 1px solid #e1f1ff;
          padding: 25px 50px;
          padding-left: 1%;
        }

        .pricing-plan:last-child {
          border-right: none;
        }

        h4 {
          padding-left: 0%;
          margin-left: 0%;
          text-align: start;
        }

        div.pricing-plan h4,
        p {
          padding-left: 0%;
          margin-left: 0%;
          text-align: start;
        }
      }





    </style>

    <title>Faculty Interface</title>
</head>




    
<body runat="server">
    <form id="workaroundforASPX" runat="server">
    <nav id="mainNavbar" class="navbar navbar-dark bg-body-tertiary navbar-expand-md py-0 fixed-top">
        <a href="#" class="navbar-brand">FAST NU</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse flex-column align-items-end justify-content-end" id="navLinks">
            <ul class="navbar-nav">
                <li class="navbar-item">
                    <a href="#" class="nav-link" onclick="openForm()">Marks Distribution</a>
                </li>
                <li class="navbar-item">
                    <a href="#" class="nav-link" onclick="openAttendanceform(event)"
              >Attendance Management</a
            >
                </li>
                <li class="navbar-item">
                    <a href="#reports" class="nav-link" onclick="">Grades and Reports</a>
                </li>
                <li class="navbar-item">
                    
                        <asp:LinkButton ID="ButLogout" class="nav-link" runat="server" Text="Log Out" OnClick="ButLogout_Click"></asp:LinkButton>
                    

                </li>
            </ul>
        </div>
    </nav>

    <!-- Mini Marks Distribution Form -->
    <div id="miniDistributionForm" class="Distribution">
        <h2 class="text-center h2">Marks Distribution</h2>
        <form id="marksDistForm">
            <div class="col-md-auto">
              <select id="ddlCourse" name="ddlCourse" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                <option selected value="-1">Open this select menu</option>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
        <option value="<%#  Eval("CourseID") %>"><%#  Eval("CourseName") %></option>
                    </ItemTemplate>
                </asp:Repeater>

              </select>
            </div>
            <div class="form-row input-group input-group-sm mb-3">
          <div class="col-md-auto">
            <label class="input-group-text" for="Assignment"
              >1 Assignemnt:</label
            >
          </div>
          <div class="col-md">
            <input
              type="number"
              class="form-control"
              id="Assignment"
              name="Assignment"
              min="0"
              max ="100"
              placeholder="0-100"
            />
          </div>
        </div>
        <div class="form-row input-group input-group-sm mb-3">
          <div class="col-md-auto">
            <label class="input-group-text" for="Final"
              >2 Final:</label
            >
          </div>
          <div class="col-md">
            <input
              type="number"
              class="form-control"
              id="Final"
              name="Final"
              min="0"
              max ="100"
              placeholder="0-100"
            />
          </div>
        </div>
        <div class="form-row input-group input-group-sm mb-3">
          <div class="col-md-auto">
            <label class="input-group-text" for="Quiz"
              >3 Quiz:</label
            >
          </div>
          <div class="col-md">
            <input
              type="number"
              class="form-control"
              id="Quiz"
              name="Quiz"
              min="0"
              max ="100"
              placeholder="0-100"
            />
          </div>
        </div>
        <div class="form-row input-group input-group-sm mb-3">
          <div class="col-md-auto">
            <label class="input-group-text" for="Sessional-I"
              >4 Sessional-I:</label
            >
          </div>
          <div class="col-md">
            <input
              type="text"
              class="form-control"
              id="Sessional1"
              name="Sessional1"
              min="0"
              max ="100"
              placeholder="0-100"
            />
          </div>
        </div>
        <div class="form-row input-group input-group-sm mb-3">
          <div class="col-md-auto">
            <label class="input-group-text" for="Sessional-II"
              >5 Sessional-II:</label
            >
          </div>
          <div class="col-md">
            <input
              type="text"
              class="form-control"
              id="Sessional2"
              name="Sessional2"
              min="0"
              max ="100"
              placeholder="0-100"
            />
          </div>

        </div>
            <div class="form-row input-group input-group-sm mb-3">
          <div class="col-md-auto">
            <label class="input-group-text" for="Project"
              >5 Project:</label
            >
          </div>
          <div class="col-md">
            <input
              type="text"
              class="form-control"
              id="Project2"
              name="Project"
              min="0"
              max ="100"
              placeholder="0-100" 
            />
          </div>

        </div>
        <div class="row">
          <div class="col">
            <button type="button" class="btn btn-outline-warning btn-md" onclick="resetForm()">Reset to Default Values</button>
          </div>
          <div class="col">

                        <asp:LinkButton ID="SaveMD" class="btn btn-outline-success btn-md" onclick="ButMDSubmit_Click" runat="server" Text="Save"></asp:LinkButton>

          </div>
        </div>
        </form>
        <button type="button" class="btn btn-danger btn-sm" onclick="closeForm()">Cancel</button>
    </div>

        <!--Marking Attendence-->
    <div id="miniAttendanceform" class="Distribution">
      <h2 class="text-center h2">Mark Attendance</h2>
      <form action="">
        <div class="form-row input-group input-group-sm mb-3">
          <select
            id="ChooseSection"
            class="form-select form-select-lg mb-3 p-2"
            aria-label=".form-select-lg example"
          >
            <option selected>Choose Section</option>
            <option value="Section1">Section 1</option>
            <option value="Section2">Section 2</option>
            <option value="Section3">Section 3</option>
          </select>
        </div>
        <label>Students:</label>
        <div class="form-row input-group input-group-sm mb-3">
          <div id="studentList">
            <!-- Student list will be populated here -->
            <table>
              <tr>
                <td>
                <span>Student 1</span>
                <input
                  type="checkbox"
                  id="student1"
                  name="student1"
                  data-student="Student 1"
                />
                </td>
              </tr>
              <tr>
                <td>
                <span>Student 2</span>
                <input type="checkbox" id="student2" name="student2"
                data-student="Student 2"/>
                </td>
              </tr>
              <tr>
                <td>
                <span>Student 3</span>
                <input
                  type="checkbox"
                  id="student3"
                  name="student3"
                  data-student="Student 3"
                />
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div>
          <button type="submit" onclick="close()">Submit</button>
        </div>
      </form>
    </div>


    <div class="container mt-5 p-3">
      <h1 class="pt-3">Welcome, 
        <%= Session["UserName"] %>
      </h1>
        
      <hr style="border: solid 3px">

      <h3>Assigned Courses</h3>
      <ul>
        <!-- Get from .aspx.cs file-->
          <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
              <li><%# Eval("CourseName") %></li>
            </ItemTemplate>
        </asp:Repeater>
      </ul>
        <!--Report Generation-->
      <div id="reports" class="panel pricing-table mt-5">
        <div class="pricing-plan">
          <h4>Reports</h4>

          <ul class="pricing-features" style="list-style: none">
            <li class="pricing-features-item">
              <a href="#">Attendance Sheet Report</a>
            </li>
            <li class="pricing-features-item">
              <a hred="#">Evaluation Report</a>
            </li>
            <li class="pricing-features-item">
              <a href="#">Grades Report</a>
            </li>
            <li class="pricing-features-item">
              <a href="#">Count of Grades Report</a>
            </li>
            <li class="pricing-features-item">
              <a href="ReportFeedback.aspx">Student Feedback Report</a>
            </li>
          </ul>
        </div>
      </div>
    </div>


    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-Zd7DST5l6FxYB1kgmMc46M99E4vBaCggpXQnjc/4vb2lzM5giu4SuLB4yMMc3fnd" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6Zr5z9TN4XnXt4y1bIq8qagkuFxFfi2JRgtx+OrI" crossorigin="anonymous"></script>

    <script>
        function openForm() {
            document.getElementById("miniDistributionForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("miniDistributionForm").style.display = "none";
        }

        function resetForm() {

            document.getElementById("Assignment").value = "";
            document.getElementById("Final").value = "";
            document.getElementById("Quiz").value = "";
            document.getElementById("Sessional-I").value = "";
            document.getElementById("Sessional-II").value = "";
            document.getElementById("Project").value = "";

        }

        function saveForm() {

            var Assignment = document.getElementById("Assignment").value;
            var Final = document.getElementById("Final").value;
            var Quiz = document.getElementById("Quiz").value;
            var SessionalI = document.getElementById("Sessional-I").value;
            var SessionalII = document.getElementById("Sessional-II").value;
            var Project = document.getElementById("Project").value;
            // Perform any desired operations with the form values (e.g., save to a database)



            alert("Form saved successfully!");
        }

       /* < !-- for marking Attendance-- >*/
        function openAttendanceform() {
            document.getElementById("miniAttendanceform").style.display = "block";
        }
        function closeAttendanceform() {
            document.getElementById("miniAttendanceform").style.display = "none";
        }
        // Attach an event listener to the section dropdown to populate the student list when the selection changes
        document
            .getElementById("section")
            .addEventListener("change", populateStudentList);

        
        $(document).ready(function () {
            // Form submission
            $("form").submit(function (e) {
                e.preventDefault();
                // Get form data
                var formData = {
                    evalName1: $("#evalName1").val(),
                    weightage1: $("#weightage1").val(),
                    evalName2: $("#evalName2").val(),
                    weightage2: $("#weightage2").val(),
                    evalName3: $("#evalName3").val(),
                    weightage3: $("#weightage3").val(),
                    evalName4: $("#evalName4").val(),
                    weightage4: $("#weightage4").val()
                };

                // Perform form validation
                if (validateForm(formData)) {
                    // Submit the form data to the server or perform further processing
                    // You can use AJAX to send the data to the server
                    console.log(formData);
                    // Close the form
                    closeForm();
                }
            });
        });

        function validateForm(formData) {
            // Perform validation for each field
            if (formData.evalName1.trim() === "") {
                alert("Please enter a name for evaluation 1.");
                return false;
            }
            if (formData.weightage1 === "") {
                alert("Please enter the weightage for evaluation 1.");
                return false;
            }
            // Add more validation for other fields if needed

            // If all validations pass, return true
            return true;
        }
    </script>
        </form>
</body>
    