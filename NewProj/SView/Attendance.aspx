<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
      rel="stylesheet"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
      integrity="sha512-..."
      crossorigin="anonymous"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"
      integrity="sha512-..."
      crossorigin="anonymous"
    ></script>
    <title>View and Update Attendance</title>
    <style>
      /* Add your CSS styling here */
      body {
        font-family: Arial, sans-serif;
      }

      h2 {
        color: #333;
      }

      .attendance-table {
        width: 100%;
        border-collapse: collapse;
      }

      .attendance-table th,
      .attendance-table td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ccc;
      }

      .attendance-table th {
        background-color: #f2f2f2;
        font-weight: bold;
      }

      .attendance-table tr:hover {
        background-color: #f9f9f9;
      }

      .attendance-table .present {
        color: green;
        font-weight: bold;
      }

      .attendance-table .absent {
        color: red;
        font-weight: bold;
      }

      .update-btn {
        padding: 5px 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      .update-btn:hover {
        background-color: #0056b3;
      }
      body {
        background-color: #3c4f76;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }
      .box {
        border-radius: 3px;
        background-color: #ff5733;
        border: 2px solid white;
        padding: 20px;
        flex-basis: 30%;
      }

      .parent-box {
        border-radius: 3px;
        background-color: #ff5733;
        border: 2px solid white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
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
        background-color: #383f51;
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
    </style>
  </head>
  <body>
      <form id="atten" runat="server">
    <nav
      id="mainNavbar"
      class="navigation navbar navbar-dark bg-body-tertiary navbar-expand-md py-0 fixed-top"
    >
      <a href="#" class="navbar-brand">FAST NU</a>
      <button
        class="navbar-toggler"
        data-toggle="collapse"
        data-target="#navLinks"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div
        class="collapse navbar-collapse flex-column align-items-end justify-content-end"
        id="navLinks"
      >
        <ul class="navbar-nav">
          <li class="navbar-item">
            <a href="../Student.aspx" class="nav-link">Home</a>
          </li>
          <li class="navbar-item">
            <a href="TeacherEvaluationForm.aspx" class="nav-link"
              >Teacher Evaluation</a
            >
          </li>
          <li class="navbar-item">
            <a
              href="CourseRegistration.aspx"
              class="nav-link"
              onclick="openForm()"
              >Register Course</a
            >
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
    <form id="formAttendence">
      <div>
        <h2>View Attendance</h2>
        <table class="attendance-table">
            <div class="container mt-5 panel">
                <div class="row">
                  <div class="col-md-4">
                    <label
                      for="courseSelect"
                      class="form-label form-select form-select-lg mb-3"
                      >Select Course:</label
                    >
                     <!--DropDown menu for courses-->

                   <select id="getCourse" name="getCourse" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">

                                    <option selected value="-1">--Select--</option>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                <option value="<%#  Eval("CourseID") %>"><%#  Eval("CourseCode") %>, <%#  Eval("CourseName") %></option>
                            </ItemTemplate>
                        </asp:Repeater>
                </select>
                      <asp:LinkButton ID="Show" class="btn btn-outline-success btn-md" onclick="updateAttendance" runat="server" Text="Show"></asp:LinkButton>
               
                  </div>
                </div>
                
              </div>
          <tr>
              <th>Course Code</th>
            <th>Course Name</th>
            <th>Date</th>
            <th>Status</th>

          </tr>
          <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
              <tr>
                  <td><%# Eval("CourseCode") %></td>
                <td><%# Eval("CourseName") %></td>
                <td><%# Eval("SessionDate", "{0:MM/dd/yyyy}") %></td>
<td>
    <%# Convert.ToBoolean(Eval("isPresent")) ? "<span class='present'>Present</span>" : "<span class='absent'>Absent</span>" %>
</td>



               
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
      </div>
    </form>
    

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"
      integrity="sha512-..."
      crossorigin="anonymous"
    ></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var courseSelect = document.getElementById("courseSelect");
        var marksDisplay = document.getElementById("marksDisplay");

        courseSelect.addEventListener("change", function () {
          var selectedCourse = courseSelect.value;
          marksDisplay.innerText = "Marks for " + selectedCourse;
        });
      });
    </script>
          </form>
  </body>
</html>

