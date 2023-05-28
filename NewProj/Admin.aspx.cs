using System;
using System.Configuration; //connection string
using System.Data.SqlClient; //sql

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
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
    //register course
    protected void ButRegisterCourse_Click(object sender, EventArgs e)
    {
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Courses (CourseID, CourseCode, CourseName, CreditHours, Semester) VALUES (@CourseID, @CourseCode, @CourseName, @CreditHours, @Semester)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CourseID", getCourseID());
                command.Parameters.AddWithValue("@CourseCode", Request.Form["CourseCode"]);
                command.Parameters.AddWithValue("@CourseName", Request.Form["CourseName"]);
                command.Parameters.AddWithValue("@CreditHours", Request.Form["CreditHours"]);
                command.Parameters.AddWithValue("@Semester", Request.Form["semesterNumber"]);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                // Optionally, redirect to another page or show a success message
            }
        }
        catch (Exception ex)
        {
            // Handle the exception or display an error message
            // You can log the exception or show an error message to the user
            // with ex.Message or ex.ToString()
        }
    }


    //get course id
    private string getCourseID()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            //get the max course id and increment it by 1
            string query = "SELECT MAX(CourseID) FROM Courses";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int courseID = (int)command.ExecuteScalar();
            courseID++;
            return courseID.ToString();
        }
    }

    //add student to database
    protected void AddStudent(object sender, EventArgs e)
    {
        //try
        //{
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Students (StudentID, UserID, Name, RegistrationNumber, Batch, CurrentSemester) values ((Select max(StudentID)+1 from Students), (Select max(UserID)+1 from Students), @Name, @RegNo, @Batch, @Semester);";
            SqlCommand command = new SqlCommand(query, connection);
            //take @name from asp:textbox with id FullName
            command.Parameters.AddWithValue("@Name", Request.Form["FullName"]);
            command.Parameters.AddWithValue("@RegNo", Request.Form["RegistrationNumber1"]);
            command.Parameters.AddWithValue("@Batch", Request.Form["Batch1"]);
            command.Parameters.AddWithValue("@Semester", Request.Form["CurrentSemester1"]);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            //connection.Open();
            //command.ExecuteNonQuery();
            //connection.Close();

            //    }
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}
        }
    }

    protected void DelStudent(object sender, EventArgs e)
    {
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Students WHERE RegistrationNumber = @rn;";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@rn", Request.Form["rn69"]);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}