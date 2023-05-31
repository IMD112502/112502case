<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget_pw.aspx.cs" Inherits="BookKeeping.src.forget_pw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>忘記密碼</title>
</head>
<body class="LogBody">
    <form class="LogForm" id="form1" runat="server">
        <h1 class="LogTitle">安全問題</h1>
        <div class="ForgetPwdText">
            <asp:Label style="font-size:25px" ID="Label3" runat="server" Text="問題一"></asp:Label>
            <asp:DropDownList class="DropDownListStyle" ID="DropDownList1" runat="server" Height="25px" Width="200px">
            </asp:DropDownList>
            <br />
            <asp:Label style="font-size:25px" ID="Label4" runat="server" Text="答案一"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="TextBox1" runat="server" Height="25px" Width="193px"></asp:TextBox>
            <br />
            <asp:Label style="font-size:25px" ID="Label5" runat="server" Text="問題二"></asp:Label>
            <asp:DropDownList class="DropDownListStyle" ID="DropDownList2" runat="server" Height="25px" Width="200px">
            </asp:DropDownList>
            <br />
            <asp:Label style="font-size:25px" ID="Label6" runat="server" Text="答案二"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="TextBox2" runat="server" Height="25px" Width="193px"></asp:TextBox>
            <br />
            <br />
            <div class="ForButton">
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button1" runat="server" Text="返回" PostBackUrl="login.aspx"/> 
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button2" runat="server" Text="確認" />
            </div>
        </div>
    </form>
</body>
</html>
