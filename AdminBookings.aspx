<%@ Page Title="Manage Bookings"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminBookings.aspx.cs"
Inherits="Emerald.AdminBookings" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="admin-page-wrapper">

    <div class="admin-header">

        <h1>
            Tee Time Bookings
        </h1>

        <p>
            Manage golf course reservations and schedules.
        </p>

    </div>

    <div class="admin-table-wrapper">

        <asp:GridView
            ID="gvBookings"
            runat="server"
            CssClass="luxury-grid"
            AutoGenerateColumns="True">

        </asp:GridView>

    </div>

</div>

</asp:Content>