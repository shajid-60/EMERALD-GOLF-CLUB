<%@ Page Title="Manage Testimonials"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminTestimonials.aspx.cs"
Inherits="Emerald.AdminTestimonials" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="admin-container">

    <h1 class="page-title">
        Manage Testimonials
    </h1>

    <div class="event-form">

        <asp:TextBox
            ID="txtName"
            runat="server"
            CssClass="form-control"
            placeholder="Member Name">
        </asp:TextBox>

        <asp:TextBox
            ID="txtPosition"
            runat="server"
            CssClass="form-control"
            placeholder="Position / Membership Type">
        </asp:TextBox>

        <asp:TextBox
            ID="txtReview"
            runat="server"
            CssClass="form-control"
            TextMode="MultiLine"
            Rows="6"
            placeholder="Write testimonial">
        </asp:TextBox>

        <asp:Button
            ID="btnAdd"
            runat="server"
            Text="Add Testimonial"
            CssClass="admin-btn"
            OnClick="btnAdd_Click" />

    </div>

    <asp:GridView
        ID="gvTestimonials"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="TestimonialID"
        CssClass="admin-grid"
        OnRowDeleting="gvTestimonials_RowDeleting">

        <Columns>

            <asp:BoundField
                DataField="CustomerName"
                HeaderText="Name" />

            <asp:BoundField
                DataField="Position"
                HeaderText="Position" />

            <asp:BoundField
                DataField="TestimonialText"
                HeaderText="Review" />

            <asp:CommandField
                ShowDeleteButton="True" />

        </Columns>

    </asp:GridView>

</div>

</asp:Content>