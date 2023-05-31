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
            <asp:Label ID="DreTitle" runat="server" Font-Bold="True" Font-Italic="False" Text="上衣"></asp:Label>

            <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" style="margin-left:30px; margin-top:30px;" ImageUrl="images\cloth\top\top_1.png"/>
            <asp:Image ID="Image2" runat="server" Height="200px" Width="200px" style="margin-left:30px; margin-top:30px;" ImageUrl="images\cloth\top\top_2.png"/>
            <asp:Image ID="Image3" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_3.png"/>
            <asp:Image ID="Image4" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_4.png"/>
            <asp:Image ID="Image5" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_5.png"/>
            <asp:Image ID="Image6" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_6.png"/>
        </div>

        <div class="SortButton">
            <input id="Hair" class="ButtonStyle DreButtonSize" type="button" value="頭髮" />
            <input id="Face" class="ButtonStyle DreButtonSize" type="button" value="表情" />
            <input id="Top" class="ButtonStyle DreButtonSize " type="button" value="上衣" />
            <input id="Pents" class="ButtonStyle DreButtonSize" type="button" value="下著"/>
            <input id="Dress" class="ButtonStyle DreButtonSize" type="button" value="套裝" />
            <input id="Shoes" class="ButtonStyle DreButtonSize" type="button" value="鞋子" />
            <input id="Hat" class="ButtonStyle DreButtonSize" type="button" value="帽子" />
            <input id="Earring" class="ButtonStyle DreButtonSize" type="button" value="飾品" />
        </div>

        <div class="DreButton">
            <input id="DreCancel" class="ButtonStyle ButtonSize2" type="button" value="取消修改" />
            <input id="DreConfirm" class="ButtonStyle ButtonSize2" type="button" value="確認更換" />
		    <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
        </div>
    </form>
</body>
</html>
