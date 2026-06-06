<%@ Page Title="Membership"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Membership.aspx.cs"
Inherits="Emerald.Membership" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<section class="about-section">

<div class="container">

<h2>Membership Application</h2>

<p>
Apply to become an Emerald Fairways member.
</p>

<br />

<asp:TextBox
ID="txtName"
runat="server"
CssClass="form-control"
placeholder="Full Name">
</asp:TextBox>

<br /><br />

<asp:TextBox
ID="txtEmail"
runat="server"
CssClass="form-control"
placeholder="Email Address">
</asp:TextBox>

<br /><br />

<asp:TextBox
ID="txtPhone"
runat="server"
CssClass="form-control"
placeholder="Phone Number">
</asp:TextBox>

<br /><br />

<asp:DropDownList
    ID="ddlMembership"
    runat="server"
    CssClass="form-control">

    <asp:ListItem Text="Gold Membership"
        Value="Gold Membership"></asp:ListItem>

    <asp:ListItem Text="Platinum Membership"
        Value="Platinum Membership"></asp:ListItem>

    <asp:ListItem Text="Corporate Membership"
        Value="Corporate Membership"></asp:ListItem>

</asp:DropDownList>

<br /><br />

<asp:Button
ID="btnApply"
runat="server"
Text="Apply Now"
CssClass="btn-gold"
OnClick="btnApply_Click" />

<br /><br />

<asp:Label
ID="lblMessage"
runat="server">
</asp:Label>

</div>

</section>

</asp:Content>
