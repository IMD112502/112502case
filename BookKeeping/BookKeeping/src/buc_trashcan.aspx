﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buc_trashcan.aspx.cs" Inherits="_BookKeeping.buc_trashcan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>垃圾桶</title>
</head>

<body class="trashcan_body">
    <form class="tra_form" id="form1" runat="server">
        <div class="trashcan">
            <asp:Label ID="cant_buy" runat="server" Text="不能買_______" font-size="XX-Large" ></asp:Label><br />
            <asp:Label ID="because" runat="server" Text="因為" font-size="XX-Large" ></asp:Label><br />

        </div>
        <input class="trashcan_button" id="Submit1" type="submit" value="知道了" />
        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" PostBackUrl="~/src/bucket_list.aspx" />
    </form>
</body>
</html>