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
        <h1 align="center">記帳趣</h1>
        <p>
            <label class="label_input">帳號：</label>
            <asp:TextBox ID="user_acc" runat="server" Width="250" placeholder="請輸入帳號" required="required"></asp:TextBox>
        </p>
        <br />
        <p>
            <label class="label_input">密碼：</label>
            <asp:TextBox ID="user_pwd" runat="server" Width="250" TextMode="Password" placeholder="請輸入密碼" required="required"></asp:TextBox>
        </p>
        <br />
        <a href="forget_pwd.aspx">忘記密碼</a>
        <br />
        <p>&nbsp;&nbsp;<asp:Button ID="forget_pwd" runat="server" Text="登入" Width="290" Height="30" /></p>
        <br />
        <br />
        <h5 align="center" style="margin-top: -10px;">or</h5>
        <br />
        <p>&nbsp;&nbsp;<asp:Button ID="register" runat="server" Text="我要註冊" Width="290" Height="30" /></p>
    </form>
</body>
</html>
