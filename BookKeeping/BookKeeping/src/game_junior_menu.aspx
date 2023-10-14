<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_junior_menu.aspx.cs" Inherits="BookKeeping.src.game_junior_menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>1-2年級遊戲主頁</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label class="SJGameTopTitle" ID="Label1" runat="server" Text="Label">買水果</asp:Label>
        <div class="SJGameMain">
			<asp:Button class="ButtonStyle3 ButtonSize1" ID="Button1" runat="server" Text="開始遊戲" PostBackUrl="~/src/game_junior_level.aspx" />
            <asp:Button class="ButtonStyle3 ButtonSize1" ID="Button2" runat="server" Text="遊戲介紹" />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/game_main_menu.aspx" />
    </form>
</body>
</html>
