using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Emerald
{
    public partial class AdminTestimonials :
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
                LoadTestimonials();
            }
        }

        private void LoadTestimonials()
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    "SELECT * FROM Testimonials ORDER BY TestimonialID DESC",
                    con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvTestimonials.DataSource = dt;
                gvTestimonials.DataBind();
            }
        }

        protected void btnAdd_Click(
            object sender,
            EventArgs e)
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                string query =
                @"INSERT INTO Testimonials
                (
                    CustomerName,
                    Position,
                    TestimonialText
                )
                VALUES
                (
                    @Name,
                    @Position,
                    @Review
                )";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@Name",
                    txtName.Text);

                cmd.Parameters.AddWithValue(
                    "@Position",
                    txtPosition.Text);

                cmd.Parameters.AddWithValue(
                    "@Review",
                    txtReview.Text);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            txtName.Text = "";
            txtPosition.Text = "";
            txtReview.Text = "";

            LoadTestimonials();
        }

        protected void gvTestimonials_RowDeleting(
            object sender,
            System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id =
                Convert.ToInt32(
                gvTestimonials.DataKeys[e.RowIndex].Value);

            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlCommand cmd =
                    new SqlCommand(
                    "DELETE FROM Testimonials WHERE TestimonialID=@ID",
                    con);

                cmd.Parameters.AddWithValue(
                    "@ID",
                    id);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            LoadTestimonials();
        }
    }
}