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
        <asp:Label ID="title" class="SystemTitle" runat="server" Text="記帳趣" ></asp:Label>
        <div class="Setting"><%--使用者設定--%>
            <asp:ImageButton ID="Setting" runat="server" ImageUrl="images/main/user_set.png" PostBackUrl="~/src/setting.aspx"/>
        </div>
        <div class="ClosetDiv">
            <asp:ImageButton ID="Closet" runat="server" ImageUrl="images/main/home_clo.png" PostBackUrl="~/src/dressing_room.aspx" /><%--衣櫥--%>
        </div>
        <div class="WishesDiv">
            <asp:ImageButton ID="Wishes" runat="server" ImageUrl="images/main/home_dre.png" PostBackUrl="~/src/bucket_list.aspx" /><%--願望清單--%>
        </div>
        <div class="RightDiv">
            <div class="AchDiv">
                <asp:ImageButton ID="Ach" runat="server" ImageUrl="images/main/home_ach.png" PostBackUrl="~/src/achievement.aspx" />
            </div>
            <div class="DeskDiv">
                <div class="BookkeepingDiv">
                    <asp:ImageButton ID="Bookkeeping" runat="server" ImageUrl="images/main/home_boo.png" PostBackUrl="~/src/bookkeeping_add.aspx" /><%--記帳--%>
                </div>
                <div class="GameDiv">
                    <asp:ImageButton ID="Game" runat="server" ImageUrl="images/main/home_game.png" PostBackUrl="~/src/game_main_menu.aspx" /><%--記帳--%>
                </div>
            </div>
        </div>

        <asp:Image ID="Pig" runat="server"   />
         <asp:Label ID="PigProgress" class="PigText" runat="server" Text=" " ></asp:Label>
        <asp:Image ID="Person" runat="server" ImageUrl="images/person.png" />
    </form>
</body>
</html>
