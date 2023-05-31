<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setting.aspx.cs" Inherits="BookKeeping.src.setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>設定</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button class="ButtonStyle ButtonSize2" ID="Logout" runat="server" Text="登出" PostBackUrl="~/src/login.aspx"/>
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
    </form>
</body>
</html>
