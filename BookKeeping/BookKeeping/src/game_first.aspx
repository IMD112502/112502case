<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_first.aspx.cs" Inherits="BookKeeping.src.game_first" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>題型一-認識錢幣</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="CoinLearningLeft"><%--左半邊題目--%>
            <asp:Label ID="question" runat="server" Text="Label">請問下圖中為多少金額？</asp:Label></br>
            <asp:Image ID="Image1" runat="server" ImageUrl="images/game/money_100.png"/>
        </div>

        <div class="CoinLearningRight"><%--右半邊答案--%>
            <asp:Button class="CoinAnsButton" ID="Ans1" runat="server" Text="10元" />
            <asp:Button class="CoinAnsButton" ID="Ans2" runat="server" Text="100元" />
            <asp:Button class="CoinAnsButton" ID="Ans3" runat="server" Text="500元" />
        </div>
        <!-- 進度條 -->
         <div class="GameProgress">
            <div class="GameProgress-bar" style='<%# Eval("ProgressBarStyle") %>'></div>
         </div>
         <asp:Label ID="GameProgress" class="GameProgressText" runat="server" Text="1/7" ></asp:Label>
		<asp:Button class="ButtonStyle3 ButtonSize1" ID="LeaveGame" runat="server" Text="結束遊戲" PostBackUrl="~/src/game_menu.aspx" />
    </form>
</body>
</html>
