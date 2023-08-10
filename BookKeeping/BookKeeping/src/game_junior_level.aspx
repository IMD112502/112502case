<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_junior_level.aspx.cs" Inherits="BookKeeping.src.game_junior_level" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>1-2年級關卡</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label class="SJGameLevelTitle" ID="Label1" runat="server" Text="Label">關卡</asp:Label>
        <div class="JGameLevelFlex1">
            <div class="JGameLevelFlex2">
                <asp:ImageButton class="JGameLevelButton" ID="ImageButton1" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/.aspx"/>
                <asp:ImageButton class="JGameLevelButton" ID="ImageButton2" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/.aspx"/>
                <asp:ImageButton class="JGameLevelButton" ID="ImageButton3" runat="server" ImageUrl="images/dre_add_memo.png" PostBackUrl="~/src/.aspx"/>
            </div>
            <asp:Label ID="JGameLevel" runat="server" Text="Label">請選擇想要遊玩的難度</asp:Label>
        </div>
        <asp:ImageButton class="Back" ID="ImageButton4" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/game_junior_menu.aspx" />
    </form>
</body>
</html>
