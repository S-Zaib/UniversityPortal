<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <title>Admin</title>
    <style>
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

      .container {
        max-width: 800px;
      }

      .Course {
        display: none;
        position: fixed;
        z-index: 9;
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

      .Course h2 {
        margin-top: 0;
      }

      .Course label,
      .Course input {
        display: block;
        width: 100%;
        margin-bottom: 10px;
      }

      .Course input[type="submit"] {
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

      html,
      body,
      div,
      span,
      applet,
      object,
      iframe,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      p,
      blockquote,
      pre,
      a,
      abbr,
      acronym,
      address,
      big,
      cite,
      code,
      del,
      dfn,
      em,
      img,
      ins,
      kbd,
      q,
      s,
      samp,
      small,
      strike,
      strong,
      sub,
      sup,
      tt,
      var,
      b,
      u,
      i,
      center,
      dl,
      dt,
      dd,
      ol,
      ul,
      li,
      fieldset,
      form,
      label,
      legend,
      table,
      caption,
      tbody,
      tfoot,
      thead,
      tr,
      th,
      td,
      article,
      aside,
      canvas,
      details,
      embed,
      figure,
      figcaption,
      footer,
      header,
      hgroup,
      menu,
      nav,
      output,
      ruby,
      section,
      summary,
      time,
      mark,
      audio,
      video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
      }
      /* HTML5 display-role reset for older browsers */
      article,
      aside,
      details,
      figcaption,
      figure,
      footer,
      header,
      hgroup,
      menu,
      nav,
      section {
        display: block;
      }
      body {
        line-height: 1;
      }
      ol,
      ul {
        list-style: none;
      }
      blockquote,
      q {
        quotes: none;
      }
      blockquote:before,
      blockquote:after,
      q:before,
      q:after {
        content: "";
        content: none;
      }
      table {
        border-collapse: collapse;
        border-spacing: 0;
      }

      html {
        box-sizing: border-box;
        font-family: "Open Sans", sans-serif;
      }

      body {
        background-color: #3c4f76;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
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

      @media (min-width: 900px) {
        .panel {
          flex-direction: row;
        }
        .pricing-plan {
          border-bottom: none;
          border-right: 1px solid #e1f1ff;
          padding: 25px 50px;
        }
        .pricing-plan:last-child {
          border-right: none;
        }
      }

      div select {
        flex: auto;
        width: 100%;
        padding: 10px;
        margin: 10px;
        border-radius: 5px;
        transition: 0.3s linear;
        align-content: center;
      }
  </style>
</head>
<body runat="server">
    <form id="adminform1" runat="server">
    <!-- Navigation Bar -->
  <nav id="mainNavbar" class="navigation navbar navbar-dark bg-body-tertiary navbar-expand-md py-0 fixed-top">
    <a href="#" class="navbar-brand">FAST NU</a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse flex-column align-items-end justify-content-end" id="navLinks">
      <ul class="navbar-nav">
        <li class="navbar-item">
          <a href="#" class="nav-link" onclick="openAllocateForm()"
              >Allocate Instructor</a>
        </li>
        <li class="navbar-item">
          <a href="#" class="nav-link" onclick="openForm()">Add Course</a>
        </li>
        <li class="navbar-item">
          <a href="#" class="nav-link" onclick="openSectionForm()"
              >Make Sections</a>
        </li>
        <li class="navbar-item">
               <asp:LinkButton ID="ButLogout" class="nav-link" runat="server" Text="Log Out" OnClick="ButLogout_Click"></asp:LinkButton>
        </li>
      </ul>
    </div>
  </nav>

  <!-- Mini Add Course Form -->
  <div id="miniCourseForm" class="Course" runat="server">
    <h2 class="text-center h2">New Course</h2>
    <form id="CourseRegistration">
      <div class="form-row input-group input-group-sm mb-3">
        <div class="col-md-auto">
          <label class="input-group-text" for="CourseName">Course Name:</label>
        </div>
        <div class="col-md">
          <input type="text" class="form-control" id="CourseName" name="CourseName" min="0" placeholder="Course Name" />
        </div>
      </div>
      <div class="form-row input-group input-group-sm mb-3">
        <div class="col-md-auto">
          <label class="input-group-text" for="CourseCode">Course Code:</label>
        </div>
        <div class="col-md">
          <input type="text" class="form-control" id="CourseCode" name="CourseCode" placeholder="CS-123" />
        </div>
      </div>

      <div class="form-row input-group input-group-sm mb-3">
        <div class="col-md-auto">
          <label class="input-group-text" for="CreditHours">Credit Hours:</label>
        </div>
        <div class="col-md">
          <input type="number" class="form-control" id="CreditHours" name="CreditHours" min="1" />
        </div>
      </div>

      <div class="form-row input-group input-group-sm mb-3">
        <div class="col-md-auto">
          <label class="input-group-text" for="semesterNumber">Semester Number:</label>
        </div>
        <div class="col-md">
          <input type="number" class="form-control" id="semesterNumber" name="semesterNumber" min="1" max="8" />
        </div>
      </div>

      <!-- Add the rest of the evaluation rows -->



      <div class="row">
        <div class="col">
          <button type="button" class="btn btn-outline-warning btn-md" onclick="resetForm()">
            Reset to Default Values
          </button>
        </div>
        <div class="col">
                        <asp:LinkButton ID="SaveCourse" class="btn btn-outline-success btn-md" onclick="ButRegisterCourse_Click" runat="server" Text="Save"></asp:LinkButton>

        
        </div>
      </div>
    </form>

    <button onclick="closeForm()" class="btn btn-outline-danger btn-md mt-3">
      Close
    </button>
  </div>

   <!--Add Mini Allocate instructor-->
    <div id="miniAllocateForm" class="Course">
      <h2 class="text-center h2">Allocate Instructor</h2>
      <form id="solloo" action="">
        <div class="form-row input-group input-group-sm mb-3">
          <select
            id="AssignInstructor"
            class="form-select form-select-lg mb-3 p-2"
            aria-label=".form-select-lg example"
          >
            <option selected>Select Instructor</option>
            <option value="Instructor1">Instructor1</option>
            <option value="Instructor2">Instructor2</option>
            <option value="Instructor3">Instructor3</option>
            <option value="Instructor4">Instructor4</option>
          </select>
        </div>
        <div class="form-row input-group input-group-sm mb-3">
          <select
            id="AssignCourse"
            class="form-select form-select-lg mb-3 p-2"
            aria-label=".form-select-lg example"
          >
            <option selected>Select Course</option>
            <option value="Course_Instruct">Course1</option>
            <option value="Course_Instruct">Course2</option>
            <option value="Course_Instruct">Course3</option>
            <option value="Course_Instruct">Course4</option>
          </select>
        </div>
        <div class="row">
          <button
            type="button"
            class="btn btn-outline-success btn-lg ml-3"
            onclick="saveAllocateForm(event)"
          >
            Save
          </button>
        </div>
      </form>
      <button
        onclick="closeAllocateForm()"
        class="btn btn-outline-danger btn-md mt-3"
      >
        Close
      </button>
    </div>

  <!--Add Mini Section Form-->
    <div id="miniSectionForm" class="Course">
      <h2 class="text-center h2">Assign Sections</h2>
      <form id="arfatgay" action="">
        <div class="form-row input-group input-group-sm mb-3">
          <select
            id="AssignSection"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <option selected>Select Section</option>
            <option value="Section1">Section1</option>
            <option value="Section2">Section2</option>
            <option value="Section3">Section3</option>
            <option value="Section4">Section4</option>
          </select>
        </div>
        <div class="form-row input-group input-group-sm mb-3">
          <select
            id="AssignStudent"
            class="form-select form-select-lg mb-3"
            aria-label=".form-select-lg example"
          >
            <option selected>Select StudentID</option>
            <option value="StudentID1">StudentID1</option>
            <option value="StudentID2">StudentID2</option>
            <option value="StudentID3">StudentID3</option>
            <option value="StudentID4">StudentID4</option>
          </select>
        </div>
        <div class="row">
          <button
            type="button"
            class="btn btn-outline-success btn-lg ml-3"
            onclick="saveSectionForm(event)"
          >
            Save
          </button>
        </div>
      </form>
      <button
        onclick="closeSectionForm()"
        class="btn btn-outline-danger btn-md mt-3"
      >
        Close
      </button>
    </div>


  <!--Report Generation-->

  <div class="panel pricing-table">

    <div class="pricing-plan">
      
      <h2 class="pricing-header">Report Generation</h2>
      <ul class="pricing-features">
        <li class="pricing-features-item"><a href="ReportCourse.aspx">Offered Coures</a></li>
        <li class="pricing-features-item"><a href="ReportSection.aspx">Students Section</a></li>
        <li class="pricing-features-item"><a href="ReportAllocate.aspx">Course Allocated</a></li>
      </ul>
    </div>

    <div class="pricing-plan">
      
      <h2 class="pricing-header">Student Management</h2>
      <ul class="pricing-features">
        <li class="pricing-features-item"><a href="#" onclick="openAddSTDform()">Add Student</a></li>
          <li class="pricing-features-item"><a href="#" onclick="openDelSTDform()">Delete Student</a></li>
      </ul>
    </div>

    <div class="pricing-plan">
      
      <h2 class="pricing-header">Faculty Management</h2>
      <ul class="pricing-features">
        <li class="pricing-features-item"><a href="#" onclick="openAddFacform()">Add Faculty</a></li>
          <li class="pricing-features-item"><a href="#" onclick="openDelFacform()">Delete Faculty</a></li>
      </ul>
    </div>

   </div>

    <!--Add Student-->
        <div id="miniStudentAddForm" class="Course" runat="server">
            <h2 class="text-content h2">Add Student</h2>
            <form id="addstudent1form" >
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="FullName"
                    >Full Name:</label
                  >
                </div>
                <div class="col-md" runat="server">
                    <asp:TextBox ID="FullName" runat="server" CssClass="form-control"  placeholder="John Doe"></asp:TextBox>
                </div>
              </div>
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="RegistrationNumber"
                    >Registration Number:</label
                  >
                </div>
                <div class="col-md">
                  <input
                    type="text"
                    class="form-control"
                    id="RegistrationNumber1"
                    name="RegistrationNumber1"
                    placeholder="21-0123"
                      runat="server"
                  />
                </div>
              </div>
      
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="Batch"
                    >Batch:</label
                  >
                </div>
                <div class="col-md">
                  <input
                    type="number"
                    class="form-control"
                    id="Batch1"
                    name="Batch1"
                    min="1"
                      runat="server"
                  />
                </div>
              </div>
      
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="CurrentSemester"
                    >Current Semester:</label
                  >
                </div>
                <div class="col-md">
                  <input
                    type="number"
                    class="form-control"
                    id="CurrentSemester1"
                    name="CurrentSemester1"
                    min="1"
                    max="8"
                      runat="server"
                  />
                </div>
              </div>
              <!-- Add the rest of the evaluation rows -->
              <div class="row">
                <div class="col">
                  <button
                    type="button"
                    class="btn btn-outline-warning btn-md"
                    onclick="resetAddSTDForm()"
                  >
                    Reset to Default Values
                  </button>
                </div>
                <div class="col">
                     <asp:LinkButton ID="savestudent1"  class="btn btn-outline-success btn-md" runat="server" Text="Save" OnClick="AddStudent"></asp:LinkButton>

                  
                </div>
              </div>
            </form>
      
            <button onclick="closeAddSTDForm()" class="btn btn-outline-danger btn-md mt-3">
              Close
            </button>
          </div>

        <!--Delete Student by just taking their Registration number-->  
        <div id="miniStudentDeleteForm" class="Course">
            <h2 class="text-content h2">Delete Student</h2>
            <form id="nigchig123" action="">
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="RegistrationNumberDel1"
                    >Registration Number:</label
                  >
                </div>
                <div class="col-md">
                  <input
                    type="text"
                    class="form-control"
                    id="rn69"
                    name="rn69"
                    placeholder="21-0123"
                      runat="server"
                  />
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <button
                    type="button"
                    class="btn btn-outline-warning btn-md"
                    onclick="resetDelSTDForm()"
                  >
                    Reset to Default Values
                  </button>
                </div>
                <div class="col">
 <asp:LinkButton ID="DelSt" class="btn btn-outline-success btn-md" onclick="DelStudent" runat="server" Text="Delete"></asp:LinkButton>

                </div>
              </div>
            </form>
            <button onclick="closeDelSTDForm()" class="btn btn-outline-danger btn-md mt-3">
                Close
              </button>
        </div>

        <!--Add Faculty-->
        <div id="miniFacultyAddform" class="Course">
            <h2 class="text-content h2">Add Faculty</h2>
            <form id="chignig321" action="">
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="FullNameFac"
                    >Full Name:</label>
                </div>
                <div class="col-md">
                  <input
                    type="text"
                    class="form-control"
                    id="FullNameFac"
                    name="FullNameFac"
                    min="0"
                    placeholder="Joe Mama"
                  />
                </div>
              </div>
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="DepartmentName"
                    >Department Name:</label>
                </div>
                <div class="col-md">
                  <input
                    type="text"
                    class="form-control"
                    id="DepartmentName"
                    name="DepartmentName"
                    placeholder="Computing"
                  />
                </div>
              </div>
              <!-- Add the rest of the evaluation rows -->
              <div class="row">
                <div class="col">
                  <button
                    type="button"
                    class="btn btn-outline-warning btn-md"
                    onclick="resetAddFacform()"
                    >
                    Reset to Default Values
                    </button>
                </div>
                <div class="col">
                  <button
                    type="button"
                    class="btn btn-outline-success btn-md"
                    onclick="saveAddFacform()"
                    >
                    Save
                    </button>
                </div>
              </div>
            </form>
            <button onclick="closeAddFacform()" class="btn btn-outline-danger btn-md mt-3">
                Close
              </button>
        </div>

        <!--Delete Faculty by full name-->
        <div id="miniFacultyDeleteform" class="Course">
            <h2 class="text-content h2">Delete Faculty</h2>
            <form id="rigdignig21" action="">
              <div class="form-row input-group input-group-sm mb-3">
                <div class="col-md-auto">
                  <label class="input-group-text" for="FullNameFacDel"
                    >Full Name:</label>
                </div>
                <div class="col-md">
                  <input
                    type="text"
                    class="form-control"
                    id="FullNameFacDel"
                    name="FullNameFacDel"
                    min="0"
                    placeholder="Joe Mama"
                  />
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <button
                    type="button"
                    class="btn btn-outline-warning btn-md"
                    onclick="resetDelFacform()"
                    >
                    Reset to Default Values
                    </button>
                </div>
                <div class="col">
                  <button
                    type="button"
                    class="btn btn-outline-success btn-md"
                    onclick="saveDelFacform()"
                    >
                    Save
                    </button>
                </div>
              </div>
            </form>
            <button onclick="closeDelFacform()" class="btn btn-outline-danger btn-md mt-3">
                Close
              </button>
        </div>

    <!--JavaScript-->
    <script>
      function openForm() {
        document.getElementById("miniCourseForm").style.display = "block";
      }
      function resetForm() {
        // Set all input values to default (e.g., clear the fields)
        document.getElementById("CourseName").value = "";
        document.getElementById("CourseCode").value = "";
        document.getElementById("CreditHours").value = "";
        document.getElementById("semesterNumber").value = "";
      }

      function saveForm() {
        // Get the values from the input fields
        var semesterNumber = document.getElementById("CourseName").value;
        var CourseCode = document.getElementById("CourseCode").value;
        var CreditHours = document.getElementById("CreditHours").value;
        var semesterNumber = document.getElementById("semesterNumber").value;

        // Perform any desired operations with the form values (e.g., save to a database)

        // Display a success message
        alert("Form saved successfully!");
      }

      function closeForm() {
        document.getElementById("miniCourseForm").style.display = "none";
      }

        function openAllocateForm() {
            document.getElementById("miniAllocateForm").style.display = "block";
        }

        function closeAllocateForm() {
            document.getElementById("miniAllocateForm").style.display = "none";
        }

        function saveAllocateForm() {
            event.preventDefault();
            var AssignInstructor =
                document.getElementById("AssignInstructor").value;
            var AssignCourse = document.getElementById("AssignCourse").value;
            alert("Form saved successfully!");
        }

        function openSectionForm() {
            document.getElementById("miniSectionForm").style.display = "block";
        }

        function closeSectionForm() {
            document.getElementById("miniSectionForm").style.display = "none";
        }

        function saveSectionForm() {
            event.preventDefault();
            var AssignSection = document.getElementById("AssignSection").value;
            var AssignStudent = document.getElementById("AssignStudent").value;
            alert("Form saved successfully!");
        }

        function openAddSTDform() {
            document.getElementById("miniStudentAddForm").style.display = "block";
        }
        function closeAddSTDForm() {
            document.getElementById("miniStudentAddForm").style.display = "none";
        }
        function resetAddSTDForm() {
            // Set all input values to default (e.g., clear the fields)
            document.getElementById("FullName").value = "";
            document.getElementById("RegistrationNumber").value = "";
            document.getElementById("Batch").value = "";
            document.getElementById("CurrentSemester").value = "";
        }
        //function saveAddSTDForm() {
        //    // Get the values from the input fields
        //    var FullName = document.getElementById("FullName").value;
        //    var RegistrationNumber = document.getElementById("RegistrationNumber").value;
        //    var Batch = document.getElementById("Batch").value;
        //    var CurrentSemester = document.getElementById("CurrentSemester").value;

        //    // Perform any desired operations with the form values (e.g., save to a database)

        //    // Display a success message
        //    alert("Form saved successfully!");
        //}


        function openDelSTDform() {
            document.getElementById("miniStudentDeleteForm").style.display = "block";
        }
        function closeDelSTDForm() {
            document.getElementById("miniStudentDeleteForm").style.display = "none";
        }
        function resetDelSTDForm() {
            // Set all input values to default (e.g., clear the fields)
            document.getElementById("RegistrationNumberDel").value = "";
        }
        function saveDelSTDForm() {
            // Get the values from the input fields
            var RegistrationNumberDel = document.getElementById("RegistrationNumberDel").value;

            // Perform any desired operations with the form values (e.g., save to a database)

            // Display a success message
            alert("Form saved successfully!");
        }

        function openAddFacform() {
            document.getElementById("miniFacultyAddform").style.display = "block";
        }
        function closeAddFacform() {
            document.getElementById("miniFacultyAddform").style.display = "none";
        }
        function resetAddFacform() {
            document.getElementById("FullNameFac").value = "";
            document.getElementById("DepartmentName").value = "";

        }
        function saveAddFacform() {
            var FullNameFac = document.getElementById("FullNameFac").value;
            var DepartmentName = document.getElementById("DepartmentName").value;
            alert("Form saved successfully!");
        }

        function openDelFacform() {
            document.getElementById("miniFacultyDeleteform").style.display = "block";
        }
        function closeDelFacform() {
            document.getElementById("miniFacultyDeleteform").style.display = "none";
        }
        function resetDelFacform() {
            document.getElementById("FullNameFacDel").value = "";
        }
        function saveDelFacform() {
            var FullNameFacDel = document.getElementById("FullNameFacDel").value;
            alert("Form saved successfully!");
        }

      document.addEventListener("DOMContentLoaded", function () {
        var toggler = document.querySelector(".navbar-toggler");
        var target = document.querySelector(toggler.getAttribute("data-target"));
        toggler.addEventListener("click", function () {
          target.classList.toggle("show");
        });
      });
    </script>
      </form>
</body>
    
</html>
