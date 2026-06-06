using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Emerald
{
    public partial class AdminGallery :
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
                LoadGallery();
            }
        }

        private void LoadGallery()
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlDataAdapter da =
                    new SqlDataAdapter(
                    "SELECT * FROM Gallery",
                    con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvGallery.DataSource = dt;

                gvGallery.DataBind();
            }
        }

        protected void btnUpload_Click(
            object sender,
            EventArgs e)
        {
            if (!fuImage.HasFile)
                return;

            string fileName =
                Path.GetFileName(
                fuImage.FileName);

            string folder =
                Server.MapPath("~/Uploads/");

            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            string fullPath =
                Path.Combine(folder, fileName);

            fuImage.SaveAs(fullPath);

            string dbPath =
                "Uploads/" + fileName;

            using (SqlConnection con =
                new SqlConnection(conString))
            {
                string query =
                @"INSERT INTO Gallery
                (
                    ImageTitle,
                    ImagePath
                )
                VALUES
                (
                    @Title,
                    @Path
                )";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@Title",
                    txtTitle.Text);

                cmd.Parameters.AddWithValue(
                    "@Path",
                    dbPath);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            LoadGallery();
        }

        protected void gvGallery_RowDeleting(
            object sender,
            System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id =
                Convert.ToInt32(
                gvGallery.DataKeys[e.RowIndex].Value);

            using (SqlConnection con =
                new SqlConnection(conString))
            {
                SqlCommand cmd =
                    new SqlCommand(
                    "DELETE FROM Gallery WHERE GalleryID=@ID",
                    con);

                cmd.Parameters.AddWithValue(
                    "@ID",
                    id);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            LoadGallery();
        }
    }
}