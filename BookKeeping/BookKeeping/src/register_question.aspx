<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register_question.aspx.cs" Inherits="_BookKeeping.register_question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>註冊</title>
</head>
<body class="LogBody">
    <form class="LogForm" id="form1" runat="server">
        <h1 class="LogTitle">註冊帳號</h1>
        <div class="RegText">
            <div class="RegTextBlock">
                <br />
                <br />
                <p>密碼
                    <asp:TextBox class="TextBoxStyle" ID="RegPwd" runat="server" Width="250px" Height="30px" TextMode="Password" style ="margin-bottom:10px;  padding-left:10px;" PlaceHolder="請輸入密碼" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                </p>

                <p>確認密碼
                    <asp:TextBox class="TextBoxStyle" ID="ReRegPwd" runat="server" Width="250px" Height="30px" TextMode="Password" style ="margin-bottom:10px;  padding-left:10px;" PlaceHolder="請再次輸入密碼"></asp:TextBox>
                </p>
                <p>安全問題
                    <asp:DropDownList class="DropDownStyle" ID="Question1" runat="server" Width="265px" Height="40px" style ="margin-bottom:10px;  padding-left:10px;">
                        <asp:ListItem Text="請選擇問題" Value="" />
                        <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                        <asp:ListItem Text="請問你住在哪裡?" Value="2" />
                    </asp:DropDownList>
                </p>
                <p>回答問題
                    <asp:TextBox class="TextBoxStyle" ID="Answer1" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px;  padding-left:10px;" placeholder="請輸入答案"></asp:TextBox>
                </p>
            </div>       
            <div class="RegButton">
                <asp:Button class="ButtonStyle3 ButtonSize1" ID="Button1" runat="server" Text="返回"  OnClick="Button1_Click" PostBackUrl="register.aspx"/> 
                <asp:Button class="ButtonStyle3 ButtonSize1" ID="Button2" runat="server" OnClick="Button2_Click" Text="確認" ValidationGroup="register"  />
            </div>
        </div>
    </form>
</body>
</html>
