<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="_BookKeeping.add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" type="text/css" href="bookkeeping.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>記帳-新增</title>
    <style type="text/css">
    </style>
</head>

<body style="height: 572px">
    <form id="form1" runat="server">
        <div class="book_left">
            <asp:Button ID="date_left1" runat="server" Height="30px" Width="20px" OnClick="date_left1_Click" />
            <asp:Label ID="date" runat="server" Text="2023年4月" Font-Bold="True"></asp:Label>
            <asp:Button ID="date_right1" runat="server" Height="30px" Width="20px" />
            
            <div class="total">
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
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="新增"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="日期："></asp:Label>
            <asp:TextBox ID="startDate" runat="server" type="date" min="2022-01-01" max="2024-12-31"></asp:TextBox>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="金額："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="24px" style="margin-top: 5px" Width="150px"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="元"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <input id="Reset1" type="reset" value="取消" />
            <input id="Submit1" type="submit" value="新增" />
        </div>
        <asp:ImageButton ID="back" runat="server" Height="50px" Width="50px" />
    </form>
</body>
</html>








