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

        //load sections
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT SectionID, SectionName FROM Sections";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable sectionsData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            sectionsData.Load(reader);
            // Bind the DataTable to the Repeater control
            SectionList.DataSource = sectionsData;
            SectionList.DataBind();
            reader.Close();
        }


        //shwo course report
        string connectionString1 = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString1))
        {
            string query = "SELECT s.Name, s.RegistrationNumber FROM Students s JOIN StudentsSections ss ON s.StudentID = ss.StudentID JOIN Sections sec ON ss.SectionID = sec.SectionID WHERE sec.SectionID = @SectionID ORDER BY s.RegistrationNumber ASC;";
            SqlCommand command = new SqlCommand(query, connection);

            string selectedSection = string.Empty;

            if (Request.Form["getSection"] != null)
            {
                selectedSection = Request.Form["getSection"];
            }
            else
            {
                Response.Write("Please select a section");
                return;
            }

            command.Parameters.AddWithValue("@SectionID", selectedSection);



            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable coursesData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            coursesData.Load(reader);
            // Bind the DataTable to the Repeater control
            REPORT2.DataSource = coursesData;
            REPORT2.DataBind();
            reader.Close();
        }
    }
    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void LoadSection(object sender, EventArgs e)
    {
        string connectionString1 = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString1))
        {
            string query = "SELECT s.Name, s.RegistrationNumber FROM Students s JOIN StudentsSections ss ON s.StudentID = ss.StudentID JOIN Sections sec ON ss.SectionID = sec.SectionID WHERE sec.SectionID = @SectionID ORDER BY s.RegistrationNumber ASC;";
            SqlCommand command = new SqlCommand(query, connection);

            string selectedSection = string.Empty;

            if (Request.Form["secshun"] != null)
            {
                selectedSection = Request.Form["secshun"];
            }
            else
            {
                Response.Write("Please select a section");
                return;
            }

            command.Parameters.AddWithValue("@SectionID", selectedSection);



            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable coursesData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            coursesData.Load(reader);
            // Bind the DataTable to the Repeater control
            REPORT2.DataSource = coursesData;
            REPORT2.DataBind();
            reader.Close();
        }
    }

    protected void GoHome(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
}