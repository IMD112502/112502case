﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BookKeeping.src.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主畫面</title>
</head>
<body class="main_body">
    <form id="form1" runat="server">
        <div class="setting" style="height: 200px; width: 100px;"><%--任務&設定--%>
            <asp:ImageButton ID="setting" runat="server" ImageUrl="images/setting.png" Height="100px" Width="80px" />
            <br />
            <asp:ImageButton ID="ach" runat="server" ImageUrl="images/ach.png" Height="100px" Width="80px"  PostBackUrl="~/src/achievement.aspx" />
        </div>
        <div class="wishes" style="height: 400px; width: 500px;">
            <asp:ImageButton ID="wishes" runat="server" ImageUrl="images/main/h_b_dre.png" Height="369.6px" Width="439.2px" PostBackUrl="~/src/bucket_list.aspx" /><%--願望清單--%>
            <asp:ImageButton ID="bookkeeping" runat="server" ImageUrl="images/main/h_b_boo.png" Height="178.2px" Width="210.6px" PostBackUrl="~/src/add.aspx" /><%--記帳--%>
            <asp:ImageButton ID="game" runat="server" ImageUrl="images/main/h_b_game.png" Height="178.2px" Width="210.6px" PostBackUrl="~/src/main.aspx" /><%--記帳--%>
        </div>
        <p style="width: 390px">
            <asp:ImageButton ID="closet" runat="server" ImageUrl="images/main/h_b_clo.png"  Height="695.4px" Width="458.4px" PostBackUrl="~/src/dressing_room.aspx" /><%--衣櫥--%>
        </p>
        <asp:Image ID="pig" runat="server" ImageUrl="images/pig20.png" Height="525px" Width="750px"/>
        <asp:Image ID="person" runat="server" ImageUrl="images/person.png" Height="707px" Width="249px"/>
    </form>
</body>
</html>
