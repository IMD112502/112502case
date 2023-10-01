<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="avatar.aspx.cs" Inherits="BookKeeping.src.avatar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>設定</title>
</head>
<body class="SetBody">
    <form class="SetForm" id="form1" runat="server">
        <h1 class="SetTitle">選擇頭像</h1>
        <asp:Button class="ButtonStyle ButtonSize2" ID="Clear" runat="server" Text="清除頭像" PostBackUrl="~/src/avatar.aspx"/>
        <asp:ImageButton class="AvatarSmall" ID="ImageButton2" runat="server" style="top:30%; left:13%;" ImageUrl="images/avatar/ava_1.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton3" runat="server" style="top:30%; left:25%;" ImageUrl="images/avatar/ava_2.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton4" runat="server" style="top:30%; left:37%;" ImageUrl="images/avatar/ava_3.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton5" runat="server" style="top:30%; left:49%;" ImageUrl="images/avatar/ava_4.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton6" runat="server" style="top:50%; left:13%;" ImageUrl="images/avatar/ava_5.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton7" runat="server" style="top:50%; left:25%;" ImageUrl="images/avatar/ava_6.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton8" runat="server" style="top:50%; left:37%;" ImageUrl="images/avatar/ava_7.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton9" runat="server" style="top:50%; left:49%;" ImageUrl="images/avatar/ava_8.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton10" runat="server" style="top:70%; left:13%;" ImageUrl="images/avatar/ava_9.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton11" runat="server" style="top:70%; left:25%;" ImageUrl="images/avatar/ava_10.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton12" runat="server" style="top:70%; left:37%;" ImageUrl="images/avatar/ava_11.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:ImageButton class="AvatarSmall" ID="ImageButton13" runat="server" style="top:70%; left:49%;" ImageUrl="images/avatar/ava_12.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:Image class="Ava" ID="Ava" runat="server" ImageUrl="images/avatar/ava_girl.png" />
        <asp:Button class="ButtonStyle ButtonSize3" ID="Xx" runat="server" Text="X" PostBackUrl="~/src/main.aspx"/>
        <asp:Button class="ButtonStyle ButtonSize2" ID="GoBack" runat="server" Text="返回" PostBackUrl="~/src/setting_edit.aspx"/>
        <asp:Button class="ButtonStyle ButtonSize2" ID="EditOk" runat="server" Text="確定更換" PostBackUrl="~/src/setting_edit.aspx"/>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
    </form>
</body>
</html>
