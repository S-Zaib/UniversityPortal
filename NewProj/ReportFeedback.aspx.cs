using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ReportFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        //load sections
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT s.Name AS StudentName, c.CourseName, f.Metric1, f.Metric2, f.Metric3, f.Metric4, f.FeedbackText FROM Feedback f JOIN Students s ON f.StudentID = s.StudentID JOIN Courses c ON f.CourseID = c.CourseID JOIN Faculty fac ON f.FacultyID = fac.FacultyID JOIN Users u ON fac.UserID = u.UserID WHERE u.UserID = @UserID;";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", Session["UserID"]);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable sectionsData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            sectionsData.Load(reader);
            // Bind the DataTable to the Repeater control
            REPORT1.DataSource = sectionsData;
            REPORT1.DataBind();
            reader.Close();
        }
    }
    protected void GoHome(object sender, EventArgs e)
    {
        Response.Redirect("Faculty.aspx");

    }

    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Login.aspx");
    }
}