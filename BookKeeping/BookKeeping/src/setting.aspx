﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setting.aspx.cs" Inherits="BookKeeping.src.setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>設定</title>
</head>
<body class="SetBody">
    <form class="SetForm" id="form1" runat="server">
        <h1 class="SetTitle">個人資料</h1>
        <div class="SetContent">
            <p>
                <label>姓名</label>
                <asp:Label ID="name" runat="server"></asp:Label>
            </p>
            <p>
                <label>暱稱 </label>
                <asp:Label ID="nickname" runat="server"></asp:Label>
            </p>
            <p>
                <label>性別 </label>
                <asp:Label ID="gender" runat="server"></asp:Label>
            </p>
            <p>
                <label>帳號 </label>
                <asp:Label ID="account" runat="server"></asp:Label>
            </p>
            <p>
                <label>生日 </label>
                <asp:Label ID="birthdate" runat="server" ></asp:Label>
            </p>
        </div>
        <asp:Image class="Ava" ID="Ava" runat="server" ImageUrl="images/avatar/ava_girl.png" />
        <asp:Button class="ButtonStyle ButtonSize3" ID="Xx" runat="server" Text="X" PostBackUrl="~/src/main.aspx"/>
        <asp:Button class="ButtonStyle ButtonSize2" ID="Logout" OnClick="Logout_Click" runat="server" Text="登出" PostBackUrl="~/src/login.aspx"/>
        <asp:Button class="ButtonStyle ButtonSize2" ID="EditOk" runat="server" Text="修改資料" PostBackUrl="~/src/setting_edit.aspx"/>
    </form>
</body>
</html>
