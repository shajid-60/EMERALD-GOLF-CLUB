<%@ Page Title="Manage Events"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminEvents.aspx.cs"
Inherits="Emerald.AdminEvents" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="admin-container">

    <h1 class="page-title">
        Event Management
    </h1>

    <div class="event-form">

        <asp:TextBox
            ID="txtTitle"
            runat="server"
            CssClass="form-control"
            placeholder="Event Title">
        </asp:TextBox>

        <asp:TextBox
            ID="txtDate"
            runat="server"
            TextMode="Date"
            CssClass="form-control">
        </asp:TextBox>

        <asp:TextBox
            ID="txtDescription"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            CssClass="form-control"
            placeholder="Description">
        </asp:TextBox>

        <asp:TextBox
            ID="txtImage"
            runat="server"
            CssClass="form-control"
            placeholder="Image URL">
        </asp:TextBox>

        <asp:Button
            ID="btnAdd"
            runat="server"
            Text="Add Event"
            CssClass="admin-btn"
            OnClick="btnAdd_Click" />

    </div>

    <asp:GridView
        ID="gvEvents"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="EventID"
        CssClass="admin-grid"
        OnRowDeleting="gvEvents_RowDeleting">

        <Columns>

            <asp:BoundField
                DataField="EventTitle"
                HeaderText="Title" />

            <asp:BoundField
                DataField="EventDate"
                HeaderText="Date" />

            <asp:BoundField
                DataField="EventDescription"
                HeaderText="Description" />

            <asp:ImageField
                DataImageUrlField="EventImage"
                HeaderText="Image"
                ControlStyle-Width="120" />

            <asp:CommandField
                ShowDeleteButton="True" />

        </Columns>

    </asp:GridView>

</div>

</asp:Content>