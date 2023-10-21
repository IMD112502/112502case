<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dressing_room.aspx.cs" Inherits="BookKeeping.src.dressing_room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>更衣室</title>
</head>
<body class="DreRoom">
    <form id="DreForm" runat="server">
        <div class="Cloth"> <%--左區塊--%>

        </div>

        <div class="DrePerson">
            <asp:Image ID="DrePerson" runat="server" ImageUrl="images/person.png" Height="550px" Width="200px"/>
        </div>

        <div class="Pet"> <%--右區塊--%>

        </div>

        <div class="DreButton">
            <input id="DreCancel" class="ButtonStyle3 ButtonSize2" type="button" value="取消修改" />
            <input id="DreConfirm" class="ButtonStyle3 ButtonSize2" type="button" value="確認更換" />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
