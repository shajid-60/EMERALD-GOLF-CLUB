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
    CssClass="luxury-grid"
    DataKeyNames="ApplicationID"
    OnRowCommand="gvMembers_RowCommand">

    <Columns>

        <asp:BoundField DataField="ApplicationID" HeaderText="ID" />
        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
        <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />
        <asp:BoundField DataField="MembershipType" HeaderText="Membership" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:BoundField DataField="ApplicationDate" HeaderText="Applied On" />

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>

                <asp:Button
                    ID="btnApprove"
                    runat="server"
                    Text="Approve"
                    CommandName="Approve"
                    CommandArgument='<%# Eval("ApplicationID") %>'
                    CssClass="approve-btn" />

                <asp:Button
                    ID="btnReject"
                    runat="server"
                    Text="Reject"
                    CommandName="Reject"
                    CommandArgument='<%# Eval("ApplicationID") %>'
                    CssClass="reject-btn" />

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>

    </div>

</div>

</asp:Content>