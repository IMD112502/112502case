<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buc_trashcan.aspx.cs" Inherits="_BookKeeping.buc_trashcan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望垃圾桶</title>
</head>

<body>
    <form class="tra_form" id="form1" runat="server">
        <div class="trashcan">
            <div class="word">
                <asp:Label ID="cant_buy" runat="server" Text="不能買_______" font-size="XX-Large" ></asp:Label><br />
                <asp:Label ID="because" runat="server" Text="因為" font-size="XX-Large" ></asp:Label><br />
            </div>
            <input class="trashcan_button button_style button_size2" id="Submit1" type="submit" value="知道了" />
        </div>
        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" PostBackUrl="~/src/bucket_list.aspx" />
        <div class="last_next">
            <div><asp:Button class="button_style" ID="Last" runat="server" Text="<" style="height: 50px; width: 50px; font-size: 45px;"/></div><%--上一個願望--%>
            <div><asp:Button class="button_style" ID="Next" runat="server" Text=">" style="height: 50px; width: 50px; font-size: 45px;"/></div><%--下一個願望--%>
        </div>
    </form>
</body>
</html>