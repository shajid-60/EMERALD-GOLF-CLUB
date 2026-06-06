using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Emerald
{
    public partial class AdminBookings :
        System.Web.UI.Page
    {
        string cs =
            ConfigurationManager
            .ConnectionStrings["GolfClubDBConnection"]
            .ConnectionString;

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    @"SELECT *
                      FROM TeeTimeBookings
                      ORDER BY BookingID DESC",
                    con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }
    }
}