<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BookKeeping.src.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主畫面</title>
</head>
<body class="MainBody">
    <form id="Form1" runat="server">
        <asp:Label class="SystemTitle" runat="server" Text="記帳趣" ></asp:Label>
        <div class="Setting"><%--任務&設定--%>
            <asp:ImageButton ID="Setting" runat="server" ImageUrl="images/main/setting.png" />
            <br />
            <asp:ImageButton ID="Ach" runat="server" ImageUrl="images/main/ach.png" PostBackUrl="~/src/achievement.aspx" />
        </div>
        <div class="MainRight">
            <asp:ImageButton ID="Wishes" runat="server" ImageUrl="images/main/h_b_dre.png" PostBackUrl="~/src/bucket_list.aspx" /><%--願望清單--%>
            <asp:ImageButton ID="Bookkeeping" runat="server" ImageUrl="images/main/h_b_boo.png" PostBackUrl="~/src/add.aspx" /><%--記帳--%>
            <asp:ImageButton ID="Game" runat="server" ImageUrl="images/main/h_b_game.png" PostBackUrl="~/src/main.aspx" /><%--記帳--%>
        </div>
        <p style="width: 390px">
            <asp:ImageButton ID="Closet" runat="server" ImageUrl="images/main/h_b_clo.png" PostBackUrl="~/src/dressing_room.aspx" /><%--衣櫥--%>
        </p>
        <asp:Image ID="Pig" runat="server" ImageUrl="images/main/pig/pig20.png" />
         <asp:Label class="PigText" runat="server" Text="目標已達成45/300" ></asp:Label>
        <asp:Image ID="Person" runat="server" ImageUrl="images/person.png" />
    </form>
</body>
</html>
