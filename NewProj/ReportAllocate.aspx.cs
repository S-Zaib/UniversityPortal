using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        //shwo course report
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT c.CourseCode,  c.CourseName,  c.CreditHours,  sec.SectionName,  f.Name AS Instructor,  coord.Name AS Coordinator FROM  Courses c  INNER JOIN Sections sec ON c.CourseID = sec.CourseID  INNER JOIN CourseInstructors ci ON sec.SectionID = ci.SectionID  INNER JOIN Faculty f ON ci.FacultyID = f.FacultyID  INNER JOIN CourseAllocation cal ON c.CourseID = cal.CourseID  INNER JOIN Faculty coord ON cal.CoordinatorID = coord.FacultyID;";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable coursesData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            coursesData.Load(reader);
            // Bind the DataTable to the Repeater control
            REPORT3.DataSource = coursesData;
            REPORT3.DataBind();
            reader.Close();
        }

    }
    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void GoHome(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
}