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
        <asp:Panel ID="SecondGamePanel" runat="server" Visible="false"><%--遊戲二--%>
            <div class="GameLeft2"><%--左半邊題目--%>
                <asp:Label ID="question2" class="question" runat="server" Text="Label">請問下圖中總共有多少錢？</asp:Label></br>
                <div class="Thousand"><%--$1000--%>
                    <asp:Panel ID="Panel1000" runat="server"></asp:Panel>
                </div>
            
                <div class="FiveHundred"><%--$500--%>
                    <asp:Panel ID="Panel500" runat="server"></asp:Panel>
                </div>
            
                <div class="OneHundred"><%--$100--%>
                    <asp:Panel ID="Panel100" runat="server"></asp:Panel>
                </div>
            
                <div class="Fifty"><%--$50--%>
                    <asp:Panel ID="Panel50" runat="server"></asp:Panel>
                </div>
           
                <div class="Ten"><%--$10--%>
                    <asp:Panel ID="Panel10" runat="server"></asp:Panel>
                </div>
            
                <div class="Five"><%--$5--%>
                    <asp:Panel ID="Panel5" runat="server"></asp:Panel>
                </div>

                <div class="One"><%--$1--%>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                </div> 
            </div>

            <div class="GameRight2"><%--右半邊答案--%>
                <asp:Button class="CoinAnsButton" ID="Ans4" runat="server" OnClick="CheckAnswer" CommandArgument="4" />
                <asp:Button class="CoinAnsButton" ID="Ans5" runat="server" OnClick="CheckAnswer" CommandArgument="5" />
                <asp:Button class="CoinAnsButton" ID="Ans6" runat="server" OnClick="CheckAnswer" CommandArgument="6" />
            </div>
            </asp:Panel>

        
        

        <!-- 進度條 -->
        <div class="GameProgress">
            <div class="GameProgressBar" style='<%# Eval("ProgressBarStyle") %>'></div>
        </div>                        

        <asp:Label ID="GameProgress" class="GameProgressText" runat="server" Text='<%# Eval("ProgressText") %>' ></asp:Label>
		<asp:Button class="ButtonStyle3 ButtonSize1" ID="LeaveGame" runat="server" Text="結束遊戲" OnClick="LeaveGame_Click" />
        <asp:Label ID="randomNum" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="correctcnt" runat="server" Text="0"></asp:Label><%--紀錄答對題數--%>
    </form>
</body>
</html>
