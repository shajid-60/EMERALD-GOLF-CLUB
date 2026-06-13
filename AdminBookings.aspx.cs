using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Emerald
{
    public partial class AdminBookings : System.Web.UI.Page
    {
        string connStr =
            ConfigurationManager
            .ConnectionStrings["GolfClubDBConnection"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            using (SqlConnection con =
                new SqlConnection(connStr))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    "SELECT * FROM TeeTimeBookings ORDER BY BookingDate DESC",
                    con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }

        protected void gvBookings_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" ||
                e.CommandName == "Reject")
            {
                int bookingID =
                    Convert.ToInt32(e.CommandArgument);

                string status =
                    e.CommandName == "Approve"
                    ? "Approved"
                    : "Rejected";

                using (SqlConnection con =
                    new SqlConnection(connStr))
                {
                    string query =
                    @"UPDATE TeeTimeBookings
                      SET BookingStatus=@Status
                      WHERE BookingID=@ID";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue(
                        "@Status",
                        status);

                    cmd.Parameters.AddWithValue(
                        "@ID",
                        bookingID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadBookings();
            }
        }
    }
}