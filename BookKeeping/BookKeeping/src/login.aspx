<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_BookKeeping.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>記帳趣 登入</title>
</head>

<body class="log_body">
    <form class="log_form" id="form1" runat="server">
        <h1 class="log_tit" align="center">記帳趣</h1>
        <div class="log_text">
        <p>
            <label style="font-size:30px;">帳號</label>
            <asp:TextBox ID="user_acc" runat="server" Width="250" Height="35" placeholder="請輸入帳號" required="required" Font-Size="13"></asp:TextBox>
        </p>
        <br />
        <p>
            <label style="font-size:30px;">密碼</label>
            <asp:TextBox ID="user_pwd" runat="server" Width="250" Height="35" TextMode="Password" placeholder="請輸入密碼" required="required" Font-Size="13"></asp:TextBox>
        </p>
        <br />
        <a href="forget_pwd.aspx">忘記密碼</a>
        </div>
        <br />
        <br />
        <div class="log_button_block">
        <p>&nbsp;&nbsp;<asp:Button class="log_button" ID="login_button" runat="server" Text="登入" Width="300" Height="35" Font-Size="13" /></p>
        <br />
        <h5 align="center" style="margin-top: -10px; margin-bottom:10px;">or</h5>
        <p>&nbsp;&nbsp;<asp:Button class="log_button" ID="register" runat="server" Text="我要註冊！" Width="300" Height="35" Font-Size="13" href="register.aspx" /></p>
        </div>
    </form>
</body>
</html>
