<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportSection.aspx.cs" Inherits="_Default" %>

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
  
    <title>Section Report</title>
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
    <div class="col-md" style="margin-top:100px">
        <h2>Section Report</h2>
        <div class="form-group">

            <div class="col-md-auto">
              <select id="secshun" name="secshun" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                <option selected value="-1">-- Choose Section --</option>
                <asp:Repeater ID="SectionList" runat="server">
                    <ItemTemplate>
        <option value="<%#  Eval("SectionID") %>"><%#  Eval("SectionName") %></option>
                    </ItemTemplate>
                </asp:Repeater>

              </select>
            </div>
            <table>
                <tr>
<td>
                        <asp:LinkButton ID="LoadReport" class="btn btn-outline-success btn-md" onclick="LoadSection" runat="server" Text="Load"></asp:LinkButton>
                    </td>
<td>
                        <asp:LinkButton ID="Home" class="btn btn-outline-success btn-md" onclick="GoHome" runat="server" Text="Back"></asp:LinkButton>
                </td>
    <td>
    <input value='Print' class="btn btn-outline-success btn-md" type='button' onclick='handlePrint()' />

                </td>            
    </tr>
            </table>
         

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Name </th>
                        <th>Registration Number</th>
                    </tr>
</thead>
                <asp:Repeater ID="REPORT2" runat="server">

                    <ItemTemplate>
                        <tr>
                            <td><%#  Eval("Name") %></td>
                            <td><%#  Eval("RegistrationNumber") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
               

        </div>
        
    </div>
    <script type="text/javascript">
          const handlePrint = () => {
              var actContents = document.body.innerHTML;
              document.body.innerHTML = actContents;
              window.print();
          }
    </script>
    </form>
</body>
</html>
