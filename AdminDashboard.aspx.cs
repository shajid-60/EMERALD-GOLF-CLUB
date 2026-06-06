using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Emerald
{
    public partial class AdminDashboard :
        System.Web.UI.Page
    {
        string conString =
            ConfigurationManager
            .ConnectionStrings["GolfClubDBConnection"]
            .ConnectionString;

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (Session["Role"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("IndexWebForm.aspx");
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                con.Open();

                lblMembers.Text =
                    new SqlCommand(
                    "SELECT COUNT(*) FROM Members",
                    con).ExecuteScalar().ToString();

                lblApplications.Text =
                    new SqlCommand(
                    "SELECT COUNT(*) FROM MembershipApplications",
                    con).ExecuteScalar().ToString();

                lblEvents.Text =
                    new SqlCommand(
                    "SELECT COUNT(*) FROM Events",
                    con).ExecuteScalar().ToString();

                lblBookings.Text =
                    new SqlCommand(
                    "SELECT COUNT(*) FROM TeeTimeBookings",
                    con).ExecuteScalar().ToString();
            }
        }
    }
}