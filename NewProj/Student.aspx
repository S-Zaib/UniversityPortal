<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student" %>

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

          .panel {
            background-color: white;
            border-radius: 10px;
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

            h4{
                padding-left: 0%;
                margin-left: 0%;
                text-align: start;
            }
            
            div.pricing-plan h4, p{
                padding-left: 0%;
                margin-left: 0%;
                text-align: start;
            }
          }
    </style>

    <title>Student</title>
</head>
<body>
    <form id="stuform" runat="server">
    <nav id="mainNavbar" class="navigation navbar navbar-dark bg-body-tertiary navbar-expand-md py-0 fixed-top">
        <a href="#" class="navbar-brand">FAST NU</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse flex-column align-items-end justify-content-end" id="navLinks">
          <ul class="navbar-nav">
            <li class="navbar-item">
                <a href="Student.aspx" class="nav-link">Home</a>
            </li>
            <li class="navbar-item">
              <a href="SView/TeacherEvaluationForm.aspx" class="nav-link">Teacher Evaluation</a>
            </li>
            <li class="navbar-item">
              <a href="SView/CourseRegistration.aspx" class="nav-link" onclick="openForm()">Register Course</a>
            </li>
            <li class="navbar-item">
              <a href="SView/Attendance.aspx" class="nav-link">Attendence</a>
            </li>
            <li class="navbar-item">
              <a href="SView/Marks_Std.aspx" class="nav-link">Marks</a>
            </li>
            <li class="navbar-item">
              <asp:LinkButton ID="ButLogout" class="nav-link" runat="server" Text="Log Out" OnClick="ButLogout_Click"></asp:LinkButton>
            </li>
          </ul>
        </div>
      </nav>

      <!--Home-->
        <div class="panel pricing-table">
            <div id="UniversityInfo" class="pricing-plan">
                <h4>University Information</h4>
                <hr style="border: solid 2px">
                <p>University Name: FAST-NUCES</p>
                <p>University Address: 46, Block B, Faisal Town, Lahore, Punjab</p>
                <p>University Contact: 0300-1234567</p>
            </div>
            <div class="pricing-plan">
                <h4>Student Information</h4>
                <hr style="border: solid 2px">
                <!-- Reapeter to show student info-->
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <p>Student Name: <%#Eval("Name") %></p>
                        <p>Student ID: <%#Eval("StudentID") %></p>
                        <p>Student Batch: <%#Eval("Batch") %></p>
                        <p>Student Section: <%#Eval("Section") %></p>
                        <p>Student Semester: <%#Eval("CurrentSemester") %></p>
                        <p>Student SGPA: <%#Eval("SGPA") %></p>
                        <p>Student CGPA: <%#Eval("CGPA") %></p>


                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <div class="pricing-plan">
                <h4>Contact Information</h4>
                <hr style="border: solid 2px">
                <p>Student Email:arfat@notfarjad.com</p>
                <p>Student Address:</p>
                <p>Student Contact:</p>

            </div>

            <!--ADD Attendence & CGPA bar chart if there's-->
        </div>
        </form>
</body>

</html>