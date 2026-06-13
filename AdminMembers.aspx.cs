using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Emerald
{
    public partial class AdminMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMembers();
            }
        }

        protected void gvMembers_RowCommand(object sender,
    GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" ||
                e.CommandName == "Reject")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                string status =
                    e.CommandName == "Approve"
                    ? "Approved"
                    : "Rejected";

                string connStr =
                    ConfigurationManager
                    .ConnectionStrings["GolfClubDBConnection"]
                    .ConnectionString;

                using (SqlConnection con =
                    new SqlConnection(connStr))
                {
                    string query =
                    @"UPDATE MembershipApplications
              SET Status=@Status
              WHERE ApplicationID=@ID";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            string cs =
            ConfigurationManager
            .ConnectionStrings["GolfClubDBConnection"]
            .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da =
                new SqlDataAdapter(
                "SELECT * FROM MembershipApplications ORDER BY ApplicationDate DESC",
                con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvMembers.DataSource = dt;

                gvMembers.DataBind();
            }
        }
    }
}