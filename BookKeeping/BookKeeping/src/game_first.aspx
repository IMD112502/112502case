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
        <asp:Panel ID="FirstGamePanel" runat="server" Visible="false">
            <div class="GameLeft"><%--左半邊題目--%>
                <asp:Label ID="question1" class="question" runat="server" Text="Label">請問下圖中為多少金額？</asp:Label></br>
                <asp:Image ID="Image1" runat="server"/>
            </div>

            <div class="GameRight"><%--右半邊答案--%>
                <asp:Button class="CoinAnsButton" ID="Ans1" runat="server" OnClick="CheckAnswer" CommandArgument="0" />
                <asp:Button class="CoinAnsButton" ID="Ans2" runat="server" OnClick="CheckAnswer" CommandArgument="1" />
                <asp:Button class="CoinAnsButton" ID="Ans3" runat="server" OnClick="CheckAnswer" CommandArgument="2" />
            </div>
        </asp:Panel>

        <asp:Panel ID="SecondGamePanel" runat="server" >
            <div class="GameLeft2"><%--左半邊題目--%>
                <asp:Label ID="question2" class="question" runat="server" Text="Label">請問下圖中總共有多少錢？</asp:Label></br>
                <div class="Thousand"><%--$1000--%>
                    <asp:Image ID="Image2" runat="server" Height="90px" Width="240px" ImageUrl="images/game/money_1000.png"/></div>
            
                <div class="FiveHundred"><%--$500--%>
                    <asp:Image ID="Image3" runat="server" Height="85px" Width="220px" ImageUrl="images/game/money_500.png"/></div>
            
                <div class="OneHundred"><%--$100--%>
                    <asp:Image ID="Image4" runat="server" Height="80px" Width="190px" ImageUrl="images/game/money_100.png"/></div>
            
                <div class="Fifty"><%--$50--%>
                    <asp:Image ID="Image5" runat="server" Height="90px" Width="90px" ImageUrl="images/game/money_50.png"/></div>
           
                <div class="Ten"><%--$10--%>
                    <asp:Image ID="Image6" runat="server" Height="80px" Width="80px" ImageUrl="images/game/money_10.png"/></div>
            
                <div class="Five"><%--$5--%>
                    <asp:Image ID="Image7" runat="server" Height="75px" Width="75px" ImageUrl="images/game/money_5.png"/></div> 

                <div class="One"><%--$1--%>
                    <asp:Image ID="Image8" runat="server" Height="65px" Width="65px" ImageUrl="images/game/money_1.png"/></div> 
            </div>

            <div class="GameRight2"><%--右半邊答案--%>
                <asp:Button class="CoinAnsButton" ID="Ans4" runat="server"  />
                <asp:Button class="CoinAnsButton" ID="Ans5" runat="server"  />
                <asp:Button class="CoinAnsButton" ID="Ans6" runat="server"  />
            </div>
            </asp:Panel>
        <asp:Panel ID="ThirdGamePanel1" runat="server" ><%--遊戲三--%>
            <div class="GameLeft3_1"><%--左半邊題目--%>
                <div class="SisQ"><asp:Image ID="Image9" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_sis.png"/><asp:Label ID="Label1" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
                <div class="GlueQ"><asp:Image ID="Image10" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_glue.png"/><asp:Label ID="Label2" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
                <div class="CorQ"><asp:Image ID="Image11" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_cor.png"/><asp:Label ID="Label3" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
                <div class="RulerQ"><asp:Image ID="Image12" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_ruler.png"/><asp:Label ID="Label4" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 

                <div class="RedQ"><asp:Image ID="Image13" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_red.png"/><asp:Label ID="Label5" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
                <div class="GreenQ"><asp:Image ID="Image14" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_green.png"/><asp:Label ID="Label6" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
                <div class="BlueQ"><asp:Image ID="Image15" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_blue.png"/><asp:Label ID="Label7" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
                <div class="BlackQ"><asp:Image ID="Image16" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_black.png"/><asp:Label ID="Label8" runat="server" Text="Label" Style="font-size: 50px;">X1</asp:Label></div> 
            </div>

            <div class="Stationery"><%--文具區--%>
                <asp:ImageButton ID="Red" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_red2.png"/>
                <asp:ImageButton ID="Green" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_green2.png"/>
                <asp:ImageButton ID="Blue" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_blue2.png"/>
                <asp:ImageButton ID="Black" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_black2.png"/>
                </br>
                <asp:ImageButton ID="Sis" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_sis2.png"/>
                <asp:ImageButton ID="Glue" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_glue2.png"/>
                <asp:ImageButton ID="Cor" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_cor2.png"/>
                <asp:ImageButton ID="Ruler" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_ruler2.png"/>
            </div><%--架子--%>

            <div class="ShoppingCart"></div><%--購物車--%>

            <asp:Image ID="Trolley" runat="server" ImageUrl="images/game/game_trolley.png"/>
        </asp:Panel>

        <asp:Panel ID="ThirdGamePane2" runat="server" Visible="false"><%--遊戲三--%>
            <div class="GameLeft3_2"><%--左半邊題目--%>

            </div>
        </asp:Panel>
        <asp:Button class="ButtonStyle3 ButtonSize3" ID="Correct" runat="server" Text="V"/>

        <!-- 進度條 -->
        <div class="GameProgress" id="GameProgressBar" runat="server" style='<%# Eval("ProgressBarStyle") %>'></div>


        <asp:Label ID="GameProgress" class="GameProgressText" runat="server" Text='<%# Eval("ProgressText") %>' ></asp:Label>
		<asp:Button class="ButtonStyle3 ButtonSize1" ID="LeaveGame" runat="server" Text="結束遊戲" PostBackUrl="~/src/game_menu.aspx" />
        <asp:Label ID="randomNum" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
