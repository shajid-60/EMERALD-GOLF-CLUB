using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Emerald
{
    public partial class AdminEvents : System.Web.UI.Page
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
                LoadEvents();
            }
        }

        private void LoadEvents()
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    "SELECT * FROM Events ORDER BY EventDate DESC",
                    con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvEvents.DataSource = dt;
                gvEvents.DataBind();
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
                @"INSERT INTO Events
                (
                    EventTitle,
                    EventDate,
                    EventDescription,
                    EventImage
                )
                VALUES
                (
                    @Title,
                    @Date,
                    @Description,
                    @Image
                )";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@Title",
                    txtTitle.Text);

                cmd.Parameters.AddWithValue(
                    "@Date",
                    txtDate.Text);

                cmd.Parameters.AddWithValue(
                    "@Description",
                    txtDescription.Text);

                cmd.Parameters.AddWithValue(
                    "@Image",
                    txtImage.Text);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            txtTitle.Text = "";
            txtDate.Text = "";
            txtDescription.Text = "";
            txtImage.Text = "";

            LoadEvents();
        }

        protected void gvEvents_RowDeleting(
            object sender,
            System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id =
                Convert.ToInt32(
                gvEvents.DataKeys[e.RowIndex].Value);

            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlCommand cmd =
                    new SqlCommand(
                    "DELETE FROM Events WHERE EventID=@ID",
                    con);

                cmd.Parameters.AddWithValue(
                    "@ID",
                    id);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            LoadEvents();
        }
    }
}