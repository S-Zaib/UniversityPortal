<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseRegistration.aspx.cs" Inherits="CourseRegistration" %>


<!DOCTYPE html>
<html>
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
  
    <title>Student-Register Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #333;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        #courseDetails,
        #sectionSelection {
            margin-top: 20px;
        }

        .course-info,
        .section-info {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .course-info h3,
        .section-info h3 {
            margin-top: 0;
            margin-bottom: 10px;
            color: #333;
        }
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
      
          .parent-box {
            border-radius: 3px;
            background-color: #FF5733;
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
    
    </style>
</head>
<body>
    <form id="formregdrop1" runat="server">
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
    <div class="container">
        <h2>Course Registration</h2>
        <div class="form-group">
            <label for="txtSearch">Select Course:</label>
            <!--DropDown menu for courses-->

                   <select id="getCourse" name="getCourse" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">

                                    <option selected value="-1">--Select--</option>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                <option value="<%#  Eval("CourseID") %>"><%#  Eval("CourseCode") %>, <%#  Eval("CourseName") %></option>
                            </ItemTemplate>
                        </asp:Repeater>
                </select>


        </div>
        <div>
            <form id="regdrop">
                <asp:LinkButton ID="Register" class="btn btn-outline-success btn-md" onclick="ButRegister_Click" runat="server" Text="Register"></asp:LinkButton>
                <asp:LinkButton ID="Drop" class="btn btn-outline-success btn-md" onclick="ButDrop_Click" runat="server" Text="Drop"></asp:LinkButton>
            </form>
        </div>
    </div>
    <script src="scripts.js"></script>
    </form>
</body>
</html>

