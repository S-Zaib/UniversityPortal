<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>

    <style>
        /* Styles here */
        <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
      }

      h1 {
        text-align: center;
      }

      form {
        max-width: 300px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }


      label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
      }

      input[type="text"],
      input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      select {
        width: 100%;
        padding: 8px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      input[type="submit"]:hover {
        background-color: #45a049;
      }
    </style>
  
</head>
<body>
    <h1>Login</h1>
    <form method="post" runat="server">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" runat="server" textmode="username" required /><br /><br />
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" runat="server" textmode="password" required /><br /><br />
        
        <label for="role">Role:</label>
        <select id="role" name="role" runat="server">
            <option value="2">Student</option>
            <option value="3">Academic Officer</option>
            <option value="1">Faculty</option>
        </select><br /><br />

        <asp:Button ID="ButLogin" runat="server" Text="Login" OnClick="ButLogin_Click" />

        <asp:Label ID="LblMsg" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
