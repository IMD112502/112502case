<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_list.aspx.cs" Inherits="_BookKeeping.bucket_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望清單</title>
    <style type="text/css">
        #form1 {
            height: 600px;
            margin-top: 0px;
        }
    </style>
</head>
<body class="buc_body">
    <form id="form1" runat="server">
        <div class="wishes1" style="width: 130px; height: 130px">
            <asp:Label class="b_Label1" runat="server" Font-Size="X-Large" Height="40px" Text="機器人" Width="95px"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="400元"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="設定為目標" />
        </div>
        <div class="wishes2" style="width: 130px; height: 130px">
            <asp:Label class="b_Label1" runat="server" Font-Size="X-Large" Height="40px" Text="電動車" Width="95px"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="500元"></asp:Label>
            <br />
            <asp:Button ID="Button2" runat="server" Text="設定為目標" />
        </div>
        <div class="wishes3" style="width: 130px; height: 130px">
            <asp:Label class="b_Label1" runat="server" Font-Size="X-Large" Height="40px" Text="拼圖" Width="95px"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="350元"></asp:Label>
            <br />
            <asp:Button ID="Button3" runat="server" Text="設定為目標" />
        </div>
        <div class="wishes4" style="width: 180px; height: 180px">
            <asp:Label class="b_Label2" runat="server" Font-Size="X-Large" Height="40px" Width="160px" Text="積木" style="margin-top: 0px"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="350元"></asp:Label>
            <br />
            <asp:Button ID="Button4" runat="server" Text="更換目標" />
        </div>
        <div style="width: 235px; height: 152px">
            <asp:Image ID="pig" runat="server" /><%--小豬撲滿--%>
        </div>
        <asp:ImageButton ID="ImageButton2" runat="server" Height="16px" Width="16px" /><%--願望垃圾桶--%>
        <asp:ImageButton class="back1" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="50px" width="50px" /><%--返回鍵--%>
        <div class="review" style="width: 160px; height: 160px"><%--審核區--%>
            <asp:Label ID="Label5" runat="server" Text="Label">審核區</asp:Label>
        </div>
    </form>
</body>
</html>
