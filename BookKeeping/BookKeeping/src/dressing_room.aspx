<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dressing_room.aspx.cs" Inherits="BookKeeping.src.dressing_room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>更衣室</title>
</head>
<body class="c_background">
    <form id="DreForm" runat="server">
        <div class="cloth">
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
            <input id="top" class="button_style DreButtonSize" type="button" value="上衣" />
            <input id="pents" class="button_style DreButtonSize" type="button" value="下身"/>
            <input id="dress" class="button_style DreButtonSize" type="button" value="套裝" />
            <input id="hat" class="button_style DreButtonSize" type="button" value="帽子" />
            <input id="shoes" class="button_style DreButtonSize" type="button" value="鞋子" />
            <input id="socks" class="button_style DreButtonSize" type="button" value="襪子" />
            <input id="eyes" class="button_style DreButtonSize" type="button" value="眼睛" />
            <input id="mouth" class="button_style DreButtonSize" type="button" value="嘴巴" />
            <input id="hair" class="button_style DreButtonSize" type="button" value="頭髮" />
            <input id="earring" class="button_style DreButtonSize" type="button" value="飾品" />
        </div>

        <div class="DreButton" style="width: 410px; height: 90px;">
            <input id="DreCancel" class="button_style button_size2" type="button" value="取消修改" style="font-size: 20px;"/>
            <input id="DreConfirm" class="button_style button_size2" type="button" value="確認更換" style="font-size: 20px;"/>
		    <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px"  PostBackUrl="~/src/main.aspx" />
        </div>
    </form>
</body>
</html>
