using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Emerald
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings["GolfClubDBConnection"].ConnectionString;

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query =
                    @"SELECT *
                      FROM Users
                      WHERE Username=@Username
                      AND PasswordHash=@Password";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@Username",
                    txtUsername.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Password",
                    txtPassword.Text.Trim());

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["Username"] =
                        dr["Username"].ToString();

                    Session["Role"] =
                        dr["RoleName"].ToString();

                    HttpCookie cookie =
                        new HttpCookie("EmeraldUser");

                    cookie["Username"] =
                        dr["Username"].ToString();

                    cookie.Expires =
                        DateTime.Now.AddDays(30);

                    Response.Cookies.Add(cookie);

                    Response.Redirect("~/IndexWebForm.aspx");
                }
                else
                {
                    lblMessage.Text =
                        "Invalid Username or Password";
                }
            }
        }
    }
}