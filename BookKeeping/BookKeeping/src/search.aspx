<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="_BookKeeping.search" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" type="text/css" href="bookkeeping.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>記帳-報表</title>
    <style type="text/css">
    </style>
</head>

<body style="height: 572px">
    <form id="form1" runat="server">
        <div class="book_left">
            <asp:Button ID="date_left1" runat="server" Height="30px" Width="20px" OnClick="date_left1_Click" />
            <asp:Label ID="date" runat="server" Text="2023年4月" Font-Bold="True"></asp:Label>
            <asp:Button ID="date_right1" runat="server" Height="30px" Width="20px" />

            &nbsp;<div class="total">

                <asp:Label ID="Label5" runat="server" Text="總收入"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:Label ID="Label6" runat="server" Text="元"></asp:Label>
                <br />
                <asp:Label ID="Label7" runat="server" Text="總支出"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:Label ID="Label8" runat="server" Text="元"></asp:Label>

            </div>
        </div>
        <div class="book_add">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="搜尋"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Font-Size="Large" Text="類別："></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="145px">
                <asp:ListItem>請選擇類別</asp:ListItem>
                <asp:ListItem>願望</asp:ListItem>
                <asp:ListItem>飲食</asp:ListItem>
                <asp:ListItem>交通</asp:ListItem>
            </asp:DropDownList>
            <br />
&nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Font-Size="Large" Text="關鍵字："></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" style="margin-left: 305px" Width="40px" />
            <br />
&nbsp;&nbsp;
            <asp:Label ID="Label11" runat="server" Text="搜尋結果  共"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" Height="20px" Width="29px"></asp:TextBox>
            <asp:Label ID="Label12" runat="server" Text="筆："></asp:Label>
            <br />
            <br />
        </div>
        <asp:ImageButton ID="back" runat="server" Height="50px" Width="50px" />
    </form>
</body>
</html>
