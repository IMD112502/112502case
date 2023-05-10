<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BookKeeping.src.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主畫面</title>
</head>
<body class="main_body">
    <form id="form1" runat="server">
        <div class="setting" style="height: 200px; width: 100px;"><%--任務&設定--%>
            <asp:ImageButton ID="setting" runat="server" ImageUrl="images/setting.png" Height="100px" Width="100px" />
            <br />
            <asp:ImageButton ID="ach" runat="server" ImageUrl="images/ach.png" Height="100px" Width="100px" />
        </div>
        <div class="wishes" style="height: 400px; width: 500px;">
            <asp:ImageButton ID="wishes" runat="server" ImageUrl="images/h_b_dre.png" Height="400px" Width="500px"/><%--願望清單--%>
            <asp:ImageButton ID="bookkeeping" runat="server" ImageUrl="images/h_b_boo.png" Height="100px" Width="200px"/><%--記帳--%>
        </div>
        <p style="width: 390px">
            <asp:ImageButton ID="closet" runat="server" ImageUrl="images/h_b_clo.png" Height="700px" Width="470px" /><%--衣櫥--%>
        </p>
        <asp:Image ID="pig" runat="server" ImageUrl="images/pig20.png" Height="525px" Width="750px"/>
    </form>
</body>
</html>
