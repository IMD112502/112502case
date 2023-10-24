<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_first_level.aspx.cs" Inherits="BookKeeping.src.game_first_level" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>關卡一關卡總覽</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label class="GameLevelTitle" ID="Label1" runat="server" Text="Label">關卡</asp:Label>
        <div class="GameLevel" >
            <asp:ImageButton class="GameLevelButton" ID="ImageButton2" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_coin_learning.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton3" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_coin_learning.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton4" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_coin_learning.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton5" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton6" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton7" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton8" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton9" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton10" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
            <asp:ImageButton class="GameLevelButton" ID="ImageButton11" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_playing.aspx"/>
        </div>

        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/game_second_menu.aspx" />
    </form>
</body>
</html>
