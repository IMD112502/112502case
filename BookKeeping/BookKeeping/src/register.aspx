<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="_BookKeeping.register" %>

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
                <p>帳號
                    <asp:TextBox class="TextBoxStyle" ID="RegAcc" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px; padding-left:10px;" PlaceHolder="請輸入帳號" ValidationGroup="register"></asp:TextBox>
                </p>

                <p>姓名
                    <asp:TextBox class="TextBoxStyle" ID="RegName" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px; padding-left:10px;" PlaceHolder="請輸入姓名"></asp:TextBox>
                </p>

                <p>暱稱
                    <asp:TextBox class="TextBoxStyle" ID="RegNickname" runat="server" Width="250px" Height="30px" style ="margin-bottom:15px;  padding-left:10px;" PlaceHolder="請輸入暱稱"></asp:TextBox>
                </p>

                <p>電子信箱
                    <asp:TextBox class="TextBoxStyle" ID="Email" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px;  padding-left:10px;" PlaceHolder="請輸入電子信箱"></asp:TextBox>
                </p>

                <div class="RegGender">
                    <p>性別&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                             
                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="gendergroup" OnCheckedChanged="RadioButton1_CheckedChanged" Text="男生" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gendergroup" OnCheckedChanged="RadioButton2_CheckedChanged" Text="女生" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </p>
                </div>

                <p>密碼
                    <asp:TextBox class="TextBoxStyle" ID="RegPwd" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px;  padding-left:10px;" PlaceHolder="請輸入密碼" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                </p>

                <p>確認密碼
                    <asp:TextBox class="TextBoxStyle" ID="ReRegPwd" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px;  padding-left:10px;" PlaceHolder="請再次輸入密碼"></asp:TextBox>
                </p>

                <p>願望審核密碼
                    <asp:TextBox class="TextBoxStyle" ID="YNPwd" runat="server" Width="250px" Height="30px" style ="margin-bottom:10px;  padding-left:10px;" PlaceHolder="請輸入密碼"></asp:TextBox>
                </p>

                <p>選擇問題1
                    <asp:DropDownList ID="Question1" runat="server" CssClass="DropDownStyle" Width="250px">
                        <asp:ListItem Text="請選擇問題1" Value="" />
                        <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                        <asp:ListItem Text="請問你住在哪裡" Value="2" />
                    </asp:DropDownList>
                </p>

                <p>回答問題
                    <asp:TextBox ID="Answer1" runat="server" CssClass="TextBoxStyle" Width="250px" Height="30px" placeholder="請輸入答案"></asp:TextBox>
                </p>

                <p>選擇問題2
                    <asp:DropDownList ID="Question2" runat="server" CssClass="DropDownStyle" Width="250px">
                        <asp:ListItem Text="請選擇問題2" Value="" />
                        <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                        <asp:ListItem Text="請問你住在哪裡" Value="2" />
                    </asp:DropDownList>
                </p>

                <p>回答問題
                    <asp:TextBox ID="Answer2" runat="server" CssClass="TextBoxStyle" Width="250px" Height="30px" placeholder="請輸入答案"></asp:TextBox>
                </p>


            </div>       
            <div class="RegButton">
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button1" runat="server" Text="返回"  OnClick="Button1_Click" PostBackUrl="login.aspx"/> 
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button2" runat="server" OnClick="Button2_Click" Text="確認" ValidationGroup="register"  />
            </div>
        </div>
    </form>
</body>
</html>
