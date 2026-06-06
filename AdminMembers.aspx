<%@ Page Title="Membership Applications"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminMembers.aspx.cs"
Inherits="Emerald.AdminMembers" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="admin-page-wrapper">

    <div class="admin-header">

        <h1>
            Membership Applications
        </h1>

        <p>
            Review and manage club membership applications
        </p>

    </div>

    <div class="admin-table-wrapper">

        <asp:GridView
            ID="gvMembers"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="luxury-grid">

            <Columns>

                <asp:BoundField
                    DataField="ApplicationID"
                    HeaderText="ID" />

                <asp:BoundField
                    DataField="FullName"
                    HeaderText="Full Name" />

                <asp:BoundField
                    DataField="EmailAddress"
                    HeaderText="Email" />

                <asp:BoundField
                    DataField="PhoneNumber"
                    HeaderText="Phone" />

                <asp:BoundField
                    DataField="MembershipType"
                    HeaderText="Membership" />

                <asp:BoundField
                    DataField="Status"
                    HeaderText="Status" />

                <asp:BoundField
                    DataField="ApplicationDate"
                    HeaderText="Applied On" />

            </Columns>

        </asp:GridView>

    </div>

</div>

</asp:Content>