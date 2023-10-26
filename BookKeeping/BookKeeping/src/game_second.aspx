<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_second.aspx.cs" Inherits="BookKeeping.src.game_second" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>題型二-算錢幣</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="GameLeft2"><%--左半邊題目--%>
            <asp:Label ID="question" runat="server" Text="Label">請問下圖中總共有多少錢？</asp:Label></br>
            <div class="Thousand"><%--$1000--%>
                <asp:Image ID="Image1" runat="server" Height="90px" Width="240px" ImageUrl="images/game/money_1000.png"/></div>
            
            <div class="FiveHundred"><%--$500--%>
                <asp:Image ID="Image2" runat="server" Height="85px" Width="220px" ImageUrl="images/game/money_500.png"/></div>
            
            <div class="OneHundred"><%--$100--%>
                <asp:Image ID="Image3" runat="server" Height="80px" Width="190px" ImageUrl="images/game/money_100.png"/></div>
            
            <div class="Fifty"><%--$50--%>
                <asp:Image ID="Image4" runat="server" Height="90px" Width="90px" ImageUrl="images/game/money_50.png"/></div>
           
            <div class="Ten"><%--$10--%>
                <asp:Image ID="Image5" runat="server" Height="80px" Width="80px" ImageUrl="images/game/money_10.png"/></div>
            
            <div class="Five"><%--$5--%>
                <asp:Image ID="Image6" runat="server" Height="75px" Width="75px" ImageUrl="images/game/money_5.png"/></div> 

            <div class="One"><%--$1--%>
                <asp:Image ID="Image7" runat="server" Height="65px" Width="65px" ImageUrl="images/game/money_1.png"/></div> 
        </div>

        <div class="GameRight2"><%--右半邊答案--%>
            <asp:Button class="CoinAnsButton" ID="Ans4" runat="server"  />
            <asp:Button class="CoinAnsButton" ID="Ans5" runat="server"  />
            <asp:Button class="CoinAnsButton" ID="Ans6" runat="server"  />
        </div>
        <!-- 進度條 -->
         <div class="GameProgress">
            <div class="GameProgress-bar" style='<%# Eval("ProgressBarStyle") %>'></div>
         </div>
         <asp:Label ID="GameProgress" class="GameProgressText" runat="server" Text='<%# Eval("ProgressText") %>' ></asp:Label>
		<asp:Button class="ButtonStyle3 ButtonSize1" ID="LeaveGame" runat="server" Text="結束遊戲" PostBackUrl="~/src/game_menu.aspx" />
    </form>
</body>
</html>
