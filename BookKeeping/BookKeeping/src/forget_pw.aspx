<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget_pw.aspx.cs" Inherits="_BookKeeping.forget_pw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="bookkeeping.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>忘記密碼</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="forget_pw">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="XX-Large" Text="記帳趣"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="安全問題"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="問題一："></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="200px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="答案一："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="193px"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="問題二："></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="200px" style="margin-top: 15px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label6" runat="server" Text="答案二："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="193px" style="margin-top: 15px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
