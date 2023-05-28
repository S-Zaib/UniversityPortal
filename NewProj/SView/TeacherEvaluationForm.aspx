<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherEvaluationForm.aspx.cs" Inherits="SView_TeacherEvaluationForm" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Teacher Assessment Form</title>

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
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
    />

    <style>
      ul,
      ol {
        list-style: none;
      }
      div input{
        padding: 4em 4em 4em 4em;
      }
      body{
        background-color: #3C4F76;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }
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
      <form id="teacherform" runat="server">
    <!--Navigation bar-->
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

    <!--Form-->

    <form class="container">
      <div class="main m-5 ml-6 p-3 container">
        <ul>
          <div>
            <h2>Teacher Assessment Form</h2>
          </div>
        </ul>
        <div class="mb-3">
          <label for="date" class="form-label">Date:</label>
          <input
            type="date"
            id="date"
            name="date"
            class="form-control"
            required
          />
        </div>

        <div class="row mb-3">
          <div class="col">
            <label for="first-name" class="form-label">First Name:</label>
            <input
              type="text"
              id="first-name"
              name="first-name"
              class="form-control"
              required
            />
          </div>
          <div class="col">
            <label for="last-name" class="form-label">Last Name:</label>
            <input
              type="text"
              id="last-name"
              name="last-name"
              class="form-control"
              required
            />
          </div>
        </div>

        <div class="mb-3">
          <label for="subject" class="form-label">Subject:</label>
          <input
            type="text"
            id="subject"
            name="subject"
            class="form-control"
            required
          />
        </div>

        <div class="mb-3">
          <label for="schedule" class="form-label">Schedule:</label>
          <input
            type="text"
            id="schedule"
            name="schedule"
            class="form-control"
            required
          />
        </div>

        <div class="mb-3">
          <label for="room-number" class="form-label">Room Number:</label>
          <input
            type="text"
            id="room-number"
            name="room-number"
            class="form-control"
            required
          />
        </div>

        <div class="mb-3">
          <label for="school-year" class="form-label">School Year:</label>
          <input
            type="text"
            id="school-year"
            name="school-year"
            class="form-control"
            required
          />
        </div>

        <p>
          Please fill out the form in evaluating your instructor for the
          semester. After completion, please press the submit button.
        </p>

        <h2>For reference, the metrics are as follows:</h2>
        <table class="table">
          <thead>
            <tr>
              <th>Metric</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Appearance and Personal Presentation*</td>
              <td>
                <input type="radio" name="appearance" value="1" required />
              </td>
              <td>
                <input type="radio" name="appearance" value="2" required />
              </td>
              <td>
                <input type="radio" name="appearance" value="3" required />
              </td>
              <td>
                <input type="radio" name="appearance" value="4" required />
              </td>
              <td>
                <input type="radio" name="appearance" value="5" required />
              </td>
            </tr>
            <tr>
              <td>Professional Practices *</td>
              <td>
                <input
                  type="radio"
                  name="professional-practices"
                  value="1"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="professional-practices"
                  value="2"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="professional-practices"
                  value="3"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="professional-practices"
                  value="4"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="professional-practices"
                  value="5"
                  required
                />
              </td>
            </tr>
            <tr>
              <td>Teaching Methods*</td>
              <td>
                <input
                  type="radio"
                  name="teaching-methods"
                  value="1"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="teaching-methods"
                  value="2"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="teaching-methods"
                  value="3"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="teaching-methods"
                  value="4"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="teaching-methods"
                  value="5"
                  required
                />
              </td>
            </tr>
            <tr>
              <td>Disposition Towards Students*</td>
              <td>
                <input
                  type="radio"
                  name="disposition-towards-students"
                  value="1"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="disposition-towards-students"
                  value="2"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="disposition-towards-students"
                  value="3"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="disposition-towards-students"
                  value="4"
                  required
                />
              </td>
              <td>
                <input
                  type="radio"
                  name="disposition-towards-students"
                  value="5"
                  required
                />
              </td>
            </tr>
          </tbody>
        </table>

        <div class="mb-3">
          <label for="comments" class="form-label">Comments:</label>
          <textarea
            id="comments"
            name="comments"
            class="form-control"
            rows="4"
            cols="50"
          ></textarea>
        </div>

        <input type="submit" value="Submit" class="btn btn-primary" />
      </div>
    </form>
          </form>
  </body>
</html>
