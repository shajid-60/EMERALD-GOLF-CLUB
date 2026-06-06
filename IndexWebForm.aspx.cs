using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Emerald
{
    public partial class IndexWebForm :
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
            if (!IsPostBack)
            {
                LoadEvents();
                LoadTestimonials();
            }
        }

        private void LoadEvents()
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    "SELECT TOP 3 * FROM Events ORDER BY EventDate",
                    con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                rptEvents.DataSource = dt;
                rptEvents.DataBind();
            }
        }

        private void LoadTestimonials()
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    @"SELECT TOP 6 *
              FROM Testimonials
              ORDER BY TestimonialID DESC",
                    con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                rptTestimonials.DataSource = dt;

                rptTestimonials.DataBind();
            }
        }
    }
}