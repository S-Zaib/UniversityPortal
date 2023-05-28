using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Marks_Std : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        //show courses

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT Courses.CourseID, Courses.CourseCode, Courses.CourseName FROM Courses INNER JOIN Sections ON Courses.CourseID = Sections.CourseID WHERE Sections.SemesterID = (SELECT CurrentSemester FROM Students WHERE UserID = @userid);";
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


        }
    }
    //display Marks
    protected void showMarks(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string selectedCourseID = Request.Form["getCourse"];
            if (Request.Form["getCourse"] != null)
            {
                selectedCourseID = Request.Form["getCourse"];
            }
            else
            {
                Response.Write("Please select a course");
                return;
            }

            string query = "SELECT EM.MarksObtained, ET.EvaluationTypeName FROM EvaluationMarks EM JOIN Students S ON EM.StudentID = S.StudentID JOIN EvaluationTypes ET ON EM.EvaluationTypeID = ET.EvaluationTypeID JOIN StudentsSections SS ON EM.StudentSectionID = SS.StudentSectionID JOIN Sections SC ON SS.SectionID = SC.SectionID JOIN Courses C ON SC.CourseID = C.CourseID JOIN Users U ON S.UserID = U.UserID WHERE U.UserID = @UserID AND C.CourseID = @CourseID;";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", Session["UserID"]);
            command.Parameters.AddWithValue("@CourseID", selectedCourseID);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            // Assuming you have retrieved the data from the SQL query and stored it in a DataTable or any other collection
            DataTable marksData = new DataTable();
            // Fill the DataTable with the data retrieved from the SQL query
            marksData.Load(reader);
            // Bind the DataTable to the Repeater control
            Repeater2.DataSource = marksData;
            Repeater2.DataBind();

        }
    }
    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("../Login.aspx");
    }
}