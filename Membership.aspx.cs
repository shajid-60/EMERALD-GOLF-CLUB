using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Emerald
{
    public partial class Membership : System.Web.UI.Page
    {
        protected void Page_Load(
            object sender,
            EventArgs e)
        {

        }

        protected void btnApply_Click(
            object sender,
            EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblMessage.Text =
                    "Please complete all required fields.";

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }

            try
            {
                string connectionString =
                    ConfigurationManager
                    .ConnectionStrings["GolfClubDBConnection"]
                    .ConnectionString;

                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                    @"INSERT INTO MembershipApplications
                    (
                        FullName,
                        EmailAddress,
                        PhoneNumber,
                        MembershipType,
                        Status,
                        ApplicationDate
                    )
                    VALUES
                    (
                        @FullName,
                        @Email,
                        @Phone,
                        @Membership,
                        'Pending',
                        GETDATE()
                    )";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue(
                        "@FullName",
                        txtName.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Email",
                        txtEmail.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Phone",
                        txtPhone.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Membership",
                        ddlMembership.SelectedValue);

                    con.Open();

                    cmd.ExecuteNonQuery();

                    lblMessage.Text =
                        "✓ Membership application submitted successfully.";

                    lblMessage.ForeColor =
                        System.Drawing.Color.LimeGreen;

                    ClearForm();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error: " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";

            txtEmail.Text = "";

            txtPhone.Text = "";

            ddlMembership.SelectedIndex = 0;
        }
    }
}