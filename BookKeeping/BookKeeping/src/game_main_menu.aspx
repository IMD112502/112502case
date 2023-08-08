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
        <asp:Label class="GameTopTitle" ID="Label1" runat="server" Text="Label">小遊戲</asp:Label>
        <div class="GameFlex">
            <div class="JuniorGame">
                <asp:ImageButton ID="JuniorGameButton" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_junior_menu.aspx" /><br>
                <asp:Label class="SJGameTitle" ID="Label2" runat="server" Text="Label">買水果</asp:Label><br>
                <asp:Label ID="Label4" style="font-size: 25px; color: black;" runat="server" Text="Label">(適合1~2年級的小朋友)</asp:Label>
            </div>   
            <div class="SeniorGame">
                <asp:ImageButton ID="SeniorGameButton" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/game_senior_menu.aspx" /><br>
                <asp:Label class="SJGameTitle" ID="Label3" runat="server" Text="Label">答打怪物</asp:Label><br>
                <asp:Label ID="Label5" style="font-size: 25px; color: black;" runat="server" Text="Label">(適合3~4年級的小朋友)</asp:Label>
            </div>
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
