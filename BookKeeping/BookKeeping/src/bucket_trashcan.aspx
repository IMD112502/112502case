<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_trashcan.aspx.cs" Inherits="_BookKeeping.bucket_trashcan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望垃圾桶</title>
</head>

<body>
    <form class="BucForm" id="form1" runat="server">
        <div class="BMemo MemoStyle">
            <div class="BucWord">
                <asp:Label ID="CantBuy" runat="server" Text="不能買_______"></asp:Label><br />
                <asp:Label ID="Cause" runat="server" Text="因為"></asp:Label><br />
            </div>
            <input class="TraButton ButtonStyle ButtonSize2" id="Submit1" type="submit" value="知道了" />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" />
        <div class="LastNext">
            <div><asp:Button class="ButtonStyle LastNextSize" ID="Last" runat="server" Text="<" /></div><%--上一個願望--%>
            <div><asp:Button class="ButtonStyle LastNextSize" ID="Next" runat="server" Text=">" /></div><%--下一個願望--%>
        </div>
    </form>
</body>
</html>