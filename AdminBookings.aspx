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
            Manage golf course reservations
        </p>

    </div>

    <div class="admin-table-wrapper">

        <asp:GridView
            ID="gvBookings"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="luxury-grid"
            DataKeyNames="BookingID"
            OnRowCommand="gvBookings_RowCommand">

            <Columns>

                <asp:BoundField
                    DataField="BookingID"
                    HeaderText="ID" />

                <asp:BoundField
                    DataField="FullName"
                    HeaderText="Member Name" />

                <asp:BoundField
                    DataField="EmailAddress"
                    HeaderText="Email" />

                <asp:BoundField
                    DataField="BookingDate"
                    HeaderText="Date" />

                <asp:BoundField
                    DataField="BookingTime"
                    HeaderText="Time" />

                <asp:BoundField
                    DataField="NumberOfPlayers"
                    HeaderText="Players" />

                <asp:BoundField
                    DataField="BookingStatus"
                    HeaderText="Status" />

                <asp:TemplateField HeaderText="Actions">

                    <ItemTemplate>

                        <asp:Button
                            ID="btnApprove"
                            runat="server"
                            Text="Approve"
                            CommandName="Approve"
                            CommandArgument='<%# Eval("BookingID") %>'
                            CssClass="approve-btn" />

                        <asp:Button
                            ID="btnReject"
                            runat="server"
                            Text="Reject"
                            CommandName="Reject"
                            CommandArgument='<%# Eval("BookingID") %>'
                            CssClass="reject-btn" />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

</div>

</asp:Content>