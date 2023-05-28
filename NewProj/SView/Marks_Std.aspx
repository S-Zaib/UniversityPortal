<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Marks_Std.aspx.cs" Inherits="Marks_Std" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
    integrity="sha512-..." crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js" integrity="sha512-..."
    crossorigin="anonymous"></script>


    
    <style>
        body {
            background-color: #3C4F76;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
          }
        .box {
            border-radius: 3px;
            background-color: #FF5733;
            border: 2px solid white;
            padding: 20px;
            flex-basis: 30%;
        }
      
      
      
          .box h4 {
            color: white;
            margin-top: 0;
          }
      
          .box nav ul li {
            list-style: none;
          }
      
          .box nav ul li a {
            color: white;
            text-decoration: none;
          }
      
          nav {
            background-color: #383F51;
          }
      
          .navigation ul a {
            color: Black;
            text-decoration: none;
            font-size: 1em;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            transition: 0.3s linear;
          }
      
          nav ul a:hover {
            background-color: #04aa6d;
            color: white;
          }

          .panel {
            background-color: #005E7C;
            border-radius: 10px;
            padding: 15px 25px;
            width: 100%;
            max-width: 960px;
   
          }
      
    </style>

    <title>Student-Marks</title>
</head>
<body>
    <form id="marksFORM" runat="server">
    <nav id="mainNavbar" class="navigation navbar navbar-dark bg-body-tertiary navbar-expand-md py-0 fixed-top">
        <a href="#" class="navbar-brand">FAST NU</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse flex-column align-items-end justify-content-end" id="navLinks">
          <ul class="navbar-nav">
            <li class="navbar-item"><a href="../Student.aspx" class="nav-link">Home</a></li>
            <li class="navbar-item">
              <a href="TeacherEvaluationForm.aspx" class="nav-link">Teacher Evaluation</a>
            </li>
            <li class="navbar-item">
              <a href="CourseRegistration.aspx" class="nav-link" onclick="openForm()">Register Course</a>
            </li>
            <li class="navbar-item">
              <a href="Attendance.aspx" class="nav-link">Attendence</a>
            </li>
            <li class="navbar-item">
              <a href="Marks_Std.aspx" class="nav-link">Marks</a>
            </li>
            <li class="navbar-item">
              <asp:LinkButton ID="ButLogout" class="nav-link" runat="server" Text="Log Out" OnClick="ButLogout_Click"></asp:LinkButton>
            </li>
          </ul>
        </div>
      </nav>

      <div class="container mt-5 panel">
        <div class="row">
          <div class="col-md-4">
            <label for="courseSelect" class="form-label form-select form-select-lg mb-3">Select Course:</label>
            <!--DropDown menu for courses-->

                   <select id="getCourse" name="getCourse" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">

                                    <option selected value="-1">--Select--</option>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                <option value="<%#  Eval("CourseID") %>"><%#  Eval("CourseCode") %>, <%#  Eval("CourseName") %></option>
                            </ItemTemplate>
                        </asp:Repeater>
                </select>
               <asp:LinkButton ID="Show" class="btn btn-outline-success btn-md" onclick="showMarks" runat="server" Text="Show"></asp:LinkButton>
               
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-md-4">
            <h5>Marks</h5>
            
                 <table class="table table-striped table-hover">
                  <tr>
                  <td>MarksObtained</td>
                <td>EvaluationTypeName</td>
               
              </tr>
                     <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                  <tr>
                  <td><%# Eval("MarksObtained") %></td>
                <td><%# Eval("EvaluationTypeName") %></td>
               
              </tr>
                  </ItemTemplate>
          </asp:Repeater>
                  </table>
            
              
          </div>
        </div>
      </div>
    
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js" integrity="sha512-..." crossorigin="anonymous"></script>
      <script>
        document.addEventListener("DOMContentLoaded", function() {
          var courseSelect = document.getElementById("courseSelect");
          var marksDisplay = document.getElementById("marksDisplay");
    
          courseSelect.addEventListener("change", function() {
            var selectedCourse = courseSelect.value;
            marksDisplay.innerText = "Marks for " + selectedCourse;
          });
        });
      </script>
      </form>
</body>
</html>
