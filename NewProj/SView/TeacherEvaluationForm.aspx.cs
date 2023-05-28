using System;

public partial class SView_TeacherEvaluationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserName"] = null;
        Response.Redirect("../Login.aspx");
    }
}