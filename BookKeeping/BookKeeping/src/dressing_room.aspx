<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dressing_room.aspx.cs" Inherits="BookKeeping.src.dressing_room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>更衣室</title>
</head>
<body class="DreRoomBackground">
    <form id="DreForm" runat="server">
        <div class="Cloth">
            <asp:Image ID="DrePersom" runat="server" ImageUrl="images/person.png" Height="707px" Width="249px"/>
            <asp:Label ID="DreTitle" runat="server" Font-Bold="True" Font-Italic="False" Text="頭部"></asp:Label>

            <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" style="margin-left:30px; margin-top:30px;" ImageUrl="images\cloth\top\top_1.png"/>
            <asp:Image ID="Image2" runat="server" Height="200px" Width="200px" style="margin-left:30px; margin-top:30px;" ImageUrl="images\cloth\top\top_2.png"/>
            <asp:Image ID="Image3" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_3.png"/>
            <asp:Image ID="Image4" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_4.png"/>
            <asp:Image ID="Image5" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_5.png"/>
            <asp:Image ID="Image6" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_6.png"/>
        </div>

        <div class="SortButton">
            <input id="Head" class="ButtonStyle3 DreButtonSize" type="button" value="頭部" />
            <input id="Body" class="ButtonStyle3 DreButtonSize" type="button" value="身體" />
        </div>

        <div class="DreButton">
            <input id="DreCancel" class="ButtonStyle3 ButtonSize2" type="button" value="取消修改" />
            <input id="DreConfirm" class="ButtonStyle3 ButtonSize2" type="button" value="確認更換" />
		    <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
        </div>
    </form>
</body>
</html>
