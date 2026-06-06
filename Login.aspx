<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="Emerald.Login" %>

<!DOCTYPE html>

<html>

<head runat="server">

    <title>Login | Emerald Fairways</title>

    <link href="CSS/styles.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500;700&family=Montserrat:wght@300;400;500&display=swap"
          rel="stylesheet" />

</head>

<body class="login-body">

<form id="form1" runat="server">

    <div class="login-container">

        <div class="login-card">

            <h1>Emerald Fairways</h1>

            <p class="login-subtitle">
                Members & Administration Portal
            </p>

            <asp:TextBox
                ID="txtUsername"
                runat="server"
                CssClass="login-input"
                placeholder="Username">
            </asp:TextBox>

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="login-input"
                placeholder="Password">
            </asp:TextBox>

            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Sign In"
                CssClass="login-button"
                OnClick="btnLogin_Click" />

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="login-error">
            </asp:Label>

        </div>

    </div>

</form>

</body>

</html>