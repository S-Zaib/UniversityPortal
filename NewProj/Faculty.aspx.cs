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
        //show courses

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT F.UserID, F.Name AS FacultyName, C.CourseID, C.CourseCode, C.CourseName FROM Faculty F INNER JOIN CourseAllocation CA ON F.FacultyID = CA.FacultyID INNER JOIN Courses C ON CA.CourseID = C.CourseID WHERE F.UserID = @Userid";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Userid", Session["UserID"]);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable coursesData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            coursesData.Load(reader);
            // Bind the DataTable to the Repeater control
            Repeater1.DataSource = coursesData;
            Repeater1.DataBind();
            Repeater2.DataSource = coursesData;
            Repeater2.DataBind();
            reader.Close();
        }
    }

    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Login.aspx");
    }
    //loging out function for <a> tag
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Login.aspx");
    }
    //Marks Distribution Submit Button
    protected void ButMDSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO MarkDistribution (AssignmentWeightage, FinalExamWeightage, Sessional1, Sessional2, QuizWeightage, ProjectWeightage, CourseID) VALUES (@AssignmentWeightage, @FinalExamWeightage, @Sessional1, @Sessional2, @QuizWeightage, @ProjectWeightage, @CourseID)";
            SqlCommand command = new SqlCommand(query, connection);

            string selectedCourseID = string.Empty;


            // Check if a course is selected in the dropdown menu
            if (Request.Form["ddlCourse"] != null)
            {
                selectedCourseID = Request.Form["ddlCourse"];
            }
            else
            {
                Response.Write("Please select a course");
                return;
            }

            // Set the parameter values
            command.Parameters.AddWithValue("@AssignmentWeightage", Request.Form["Assignment"]);
            command.Parameters.AddWithValue("@FinalExamWeightage", Request.Form["Final"]);
            command.Parameters.AddWithValue("@Sessional1", Request.Form["Sessional1"]);
            command.Parameters.AddWithValue("@Sessional2", Request.Form["Sessional2"]);
            command.Parameters.AddWithValue("@QuizWeightage", Request.Form["Quiz"]);
            command.Parameters.AddWithValue("@ProjectWeightage", Request.Form["Project"]); // Replace with the appropriate value if available
            command.Parameters.AddWithValue("@CourseID", selectedCourseID); // Replace with the appropriate value if available
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                // Data has been successfully inserted
            }
            catch (Exception ex)
            {
                // display the error
                Response.Write(ex.Message);
            }
        }
    }


}