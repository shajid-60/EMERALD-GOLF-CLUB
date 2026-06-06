<%@ Page Title="Gallery Management"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminGallery.aspx.cs"
Inherits="Emerald.AdminGallery" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="gallery-admin-wrapper">

    <div class="gallery-admin-card">

        <h1 class="gallery-title">
            Gallery Management
        </h1>

        <p class="gallery-subtitle">
            Upload and manage Emerald Fairways gallery images
        </p>

        <div class="gallery-form">

            <asp:TextBox
                ID="txtTitle"
                runat="server"
                CssClass="gallery-input"
                placeholder="Image Title">
            </asp:TextBox>

            <asp:FileUpload
                ID="fuImage"
                runat="server"
                CssClass="gallery-upload" />

            <asp:Button
                ID="btnUpload"
                runat="server"
                Text="Upload Image"
                CssClass="gallery-btn"
                OnClick="btnUpload_Click" />

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="gallery-message">
            </asp:Label>

        </div>

    </div>

</div>

<div class="gallery-table-container">

    <h2 class="gallery-section-title">
        Existing Gallery Images
    </h2>

    <asp:GridView
        ID="gvGallery"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="GalleryID"
        CssClass="admin-grid"
        OnRowDeleting="gvGallery_RowDeleting">

        <Columns>

            <asp:BoundField
                DataField="GalleryID"
                HeaderText="ID" />

            <asp:BoundField
                DataField="ImageTitle"
                HeaderText="Title" />

            <asp:ImageField
                DataImageUrlField="ImagePath"
                HeaderText="Preview"
                ControlStyle-Width="180"
                ControlStyle-Height="120" />

            <asp:CommandField
                ShowDeleteButton="True" />

        </Columns>

    </asp:GridView>

</div>

</asp:Content>