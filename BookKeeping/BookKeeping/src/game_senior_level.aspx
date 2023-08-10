<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_senior_level.aspx.cs" Inherits="BookKeeping.src.game_senior_level" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>3-4年級關卡</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label class="SJGameLevelTitle" ID="Label1" runat="server" Text="Label">關卡</asp:Label>
        <div class="SGameLevelFlex" >
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton2" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton3" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton4" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton5" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton6" runat="server" ImageUrl="images/dre_add_memo.png"/>
            
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton7" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton8" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton9" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton10" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton11" runat="server" ImageUrl="images/dre_add_memo.png"/>
            
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton12" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton13" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton14" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton15" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton16" runat="server" ImageUrl="images/dre_add_memo.png"/>
            
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton17" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton18" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton19" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton20" runat="server" ImageUrl="images/dre_add_memo.png"/>
            <asp:ImageButton class="SGameLevelButton" ID="ImageButton21" runat="server" ImageUrl="images/dre_add_memo.png"/>
        </div>
        <div class="SLevelLastNext">
            <div><asp:Button class="ButtonStyle LastNextSize" ID="Last" runat="server" Text="<" /></div><%--上一頁關卡--%>
            <div><asp:Button class="ButtonStyle LastNextSize" ID="Next" runat="server" Text=">" /></div><%--下一頁關卡--%>
        </div>

        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/game_senior_menu.aspx" />
    </form>
</body>
</html>
