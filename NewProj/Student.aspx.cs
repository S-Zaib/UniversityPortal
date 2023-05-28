using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //load data from students table
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        //show Information
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT Students.Name, Students.StudentID, Students.Batch, Sections.SectionName AS Section, Students.CurrentSemester, Students.SGPA, Students.CGPA FROM Students INNER JOIN StudentsSections ON Students.StudentID = StudentsSections.StudentID INNER JOIN Sections ON StudentsSections.SectionID = Sections.SectionID WHERE Students.StudentID = 3;";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@userid", Session["UserID"]);
            connection.Open();
            //only single row is expected
            SqlDataReader reader = command.ExecuteReader();
            //store data in a datatable
            System.Data.DataTable studentData = new System.Data.DataTable();
            studentData.Load(reader);
            //bind data to the repeater
            Repeater1.DataSource = studentData;
            Repeater1.DataBind();
            reader.Close();

        }
    }
    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Login.aspx");
    }
}