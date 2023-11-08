<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_menu.aspx.cs" Inherits="BookKeeping.src.game_menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>關卡一主選單</title>
</head>
<body class="GameMenuBody">
    <form id="form1" runat="server">
        <asp:Label class="GameTitle" ID="Label1" runat="server" Text="Label">小遊戲</asp:Label>
        <div class="GameMain">
			<asp:Button class="ButtonStyle3 ButtonSize1" ID="Button1" runat="server" Text="開始遊戲" PostBackUrl="~/src/game_first.aspx" />
            <asp:Button class="ButtonStyle3 ButtonSize1" ID="Button2" runat="server" Text="遊戲介紹" />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
