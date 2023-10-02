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
            <asp:DropDownList class = "DropDownList TextBoxStyle" ID="Question1" runat="server" CssClass="DropDownStyle" Height="25px" Width="200px">
                <asp:ListItem Text="請選擇問題1" Value="" />
                <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                <asp:ListItem Text="請問你住在哪裡" Value="2" />
            </asp:DropDownList>
            

            <br />
            <asp:Label style="font-size:25px" ID="Label4" runat="server" Text="答案一"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="Answer1" runat="server" Height="25px" Width="193px"></asp:TextBox>
            <br />
            <asp:Label style="font-size:25px" ID="Label1" runat="server" Text="問題二"></asp:Label>         
            <asp:DropDownList class = "DropDownList TextBoxStyle" ID="Question2" runat="server" CssClass="DropDownStyle" Height="25px" Width="200px">
                <asp:ListItem Text="請選擇問題2" Value="" />
                <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                <asp:ListItem Text="請問你住在哪裡" Value="2" />
            </asp:DropDownList>
            <br />
            <asp:Label style="font-size:25px" ID="Label6" runat="server" Text="答案二"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="Answer2" runat="server" Height="25px" Width="193px"></asp:TextBox>
            <br />
            <br />
            <div class="ForgetPwdButton">
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button1" runat="server" Text="返回" PostBackUrl="login.aspx"/> 
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button2" runat="server" Text="確認" />
            </div>
        </div>
    </form>
</body>
</html>
