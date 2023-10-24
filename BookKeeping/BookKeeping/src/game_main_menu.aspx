<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_main_menu.aspx.cs" Inherits="BookKeeping.src.game_main_menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>小遊戲主畫面</title>
</head>
<body class="GameMenuBody">
    <form id="form1" runat="server">
        <asp:Label class="GameTitle" ID="Label1" runat="server" Text="Label">小遊戲</asp:Label>
        <div>
            <div class="FirstGame">
                <asp:ImageButton ID="JuniorGameButton" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_first_menu.aspx" /><br>
                <asp:Label class="SJGameTitle" ID="Label2" runat="server" Text="Label">認識錢幣</asp:Label>
            </div>   
            <div class="SecondGame">
                <asp:ImageButton ID="SeniorGameButton" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_second_menu.aspx" /><br>
                <asp:Label class="SJGameTitle" ID="Label3" runat="server" Text="Label">買文具</asp:Label>
            </div>
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
