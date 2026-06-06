<%@ Page Title="Admin Dashboard"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminDashboard.aspx.cs"
Inherits="Emerald.AdminDashboard" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="dashboard-page">

    <h1 class="dashboard-title">
        Admin Dashboard
    </h1>

  <div class="dashboard-cards">

    <div class="dashboard-card">
        <h3>Total Members</h3>
        <asp:Label ID="lblMembers"
            runat="server"
            Text="0">
        </asp:Label>
    </div>

    <div class="dashboard-card">
        <h3>Applications</h3>
        <asp:Label ID="lblApplications"
            runat="server"
            Text="0">
        </asp:Label>
    </div>

    <div class="dashboard-card">
        <h3>Events</h3>
        <asp:Label ID="lblEvents"
            runat="server"
            Text="0">
        </asp:Label>
    </div>

    <div class="dashboard-card">
        <h3>Bookings</h3>
        <asp:Label ID="lblBookings"
            runat="server"
            Text="0">
        </asp:Label>
    </div>

</div>

    <!-- ADMIN BUTTONS -->

    <div class="admin-links">

        <a href="AdminEvents.aspx" class="admin-btn">
            📅 Manage Events
        </a>

        <a href="AdminMembers.aspx" class="admin-btn">
            👥 Manage Members
        </a>

        <a href="AdminBookings.aspx" class="admin-btn">
            ⛳ Manage Bookings
        </a>

        <a href="AdminGallery.aspx" class="admin-btn">
            🖼 Gallery
        </a>

           

    </div>

</div>

</asp:Content>