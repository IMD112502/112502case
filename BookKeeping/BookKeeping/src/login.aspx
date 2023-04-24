<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_BookKeeping.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>記帳趣登入</title>
    <style type="text/css">
        body {
            background-color: beige;
            font-family: Verdana, Arial;
            margin: 50px;
        }

        form {
            padding: 20px;
            border-style: solid;
            width: 350px;
            margin: auto;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
        <h1 align="center">記帳趣</h1>
        <p>
            <label class="label_input">帳號：</label>
            <asp:TextBox ID="user_acc" runat="server" Width="250" placeholder="請輸入帳號" required="required"></asp:TextBox>
        </p>
        <p>
            <label class="label_input">密碼：</label>
            <asp:TextBox ID="user_pwd" runat="server" Width="250" TextMode="Password" placeholder="請輸入密碼" required="required"></asp:TextBox>
        </p>
        <a href="forget_pwd.aspx">忘記密碼?</a>
        <p>&nbsp;&nbsp;<asp:Button ID="forget_pwd" runat="server" Text="登入" Width="290" Height="30" /></p>
        <h5 align="center" style="margin-top: -10px;">or</h5>
        <p>&nbsp;&nbsp;<asp:Button ID="register" runat="server" Text="我要註冊" Width="290" Height="30" /></p>
    </form>
</body>
</html>
