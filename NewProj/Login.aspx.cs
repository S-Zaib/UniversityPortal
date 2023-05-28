using System;
using System.Configuration;
using System.Data.SqlClient;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButLogin_Click(object sender, EventArgs e)
    {
        string username_cs = username.Value;
        string password_cs = password.Value;
        string role_cs = role.Value;

        if (ValidateUser(username_cs, password_cs, role_cs))
        {
            Session["UserID"] = getUserID(username_cs, password_cs, role_cs);
            Session["UserName"] = username_cs;

            if (role_cs == "3")
                Response.Redirect("Admin.aspx");
            else if (role_cs == "1")
                Response.Redirect("Faculty.aspx");
            else if (role_cs == "2")
                Response.Redirect("Student.aspx");
        }
        else
        {
            LblMsg.Text = "Invalid User Name or Password";
        }
    }

    private bool ValidateUser(string username, string password, string role_cs)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password AND RoleID = @Role";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);
            command.Parameters.AddWithValue("@Role", role_cs);

            connection.Open();
            int count = (int)command.ExecuteScalar();
            return count > 0;
        }
    }
    private int getUserID(string username, string password, string role_cs)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT UserID FROM Users WHERE Username = @Username AND Password = @Password AND RoleID = @Role";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);
            command.Parameters.AddWithValue("@Role", role_cs);
            connection.Open();
            int userID = (int)command.ExecuteScalar();
            return userID;
        }
    }

}