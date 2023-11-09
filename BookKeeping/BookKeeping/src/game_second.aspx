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
                <asp:Panel ID="Panel1000" runat="server">
                </asp:Panel>
              </div>
            
            <div class="FiveHundred"><%--$500--%>
                <asp:Panel ID="Panel500" runat="server">
                </asp:Panel>
              </div>
            
            <div class="OneHundred"><%--$100--%>
                <asp:Panel ID="Panel100" runat="server">
                </asp:Panel>
              </div>
            
            <div class="Fifty"><%--$50--%>
                <asp:Panel ID="Panel50" runat="server">
                </asp:Panel>
             </div>
           
            <div class="Ten"><%--$10--%>
                <asp:Panel ID="Panel10" runat="server">
                </asp:Panel>
            </div>
            
            <div class="Five"><%--$5--%>
                <asp:Panel ID="Panel5" runat="server">
                </asp:Panel>
            </div>

            <div class="One"><%--$1--%>
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
            </div>

        <div class="GameRight2"><%--右半邊答案--%>
            <asp:Button class="CoinAnsButton" ID="Ans4" runat="server" OnClick="CheckAnswer" CommandArgument="4" />
            <asp:Button class="CoinAnsButton" ID="Ans5" runat="server" OnClick="CheckAnswer" CommandArgument="5" />
            <asp:Button class="CoinAnsButton" ID="Ans6" runat="server" OnClick="CheckAnswer" CommandArgument="6" />

        </div>
        <!-- 進度條 -->
         <div class="GameProgress">
            <div class="GameProgress-bar" style='<%# Eval("ProgressBarStyle") %>'></div>
         </div>
         <asp:Label ID="GameProgress" class="GameProgressText" runat="server" Text='<%# Eval("ProgressText") %>' ></asp:Label>
		<asp:Button class="ButtonStyle3 ButtonSize1" ID="LeaveGame" runat="server" Text="結束遊戲" PostBackUrl="~/src/game_menu.aspx" />
            <asp:Label ID="randomNum" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
