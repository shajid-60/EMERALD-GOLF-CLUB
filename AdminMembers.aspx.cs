using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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