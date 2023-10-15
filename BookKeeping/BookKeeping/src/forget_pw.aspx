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
        <h1 class="LogTitle">重設密碼</h1>
        <div class="ForgetPwdText">
            <div class="RegTextBlock">
            <p>安全問題
            <asp:DropDownList class = "DropDownList TextBoxStyle" ID="secretQuestion" runat="server" CssClass="DropDownStyle" Width="265px" Height="40px" style ="margin-top:10px; padding-left:10px;">
                <asp:ListItem Text="請選擇問題1" Value="" />
                <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                <asp:ListItem Text="請問你住在哪裡" Value="2" />
            </asp:DropDownList>
            </p>

            <p>回答問題
            <asp:TextBox class="TextBoxStyle" ID="secretAnswer" runat="server" Width="250px" Height="30px" style ="margin-top:10px; padding-left:10px;" placeholder="請輸入答案"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSecretAnswer" runat="server" ControlToValidate="secretAnswer" InitialValue="" style="font-size:15px;" ErrorMessage="請填寫答案" ForeColor="Red" />
            </p>

            <%--<asp:Label style="font-size:25px" ID="account" runat="server" Text="輸入帳號"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="enteraccount" runat="server" Width="250px" Height="30px" style ="margin-top:10px; padding-left:10px;" placeholder="請輸入帳號"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEnterAccount" runat="server" ControlToValidate="enteraccount" InitialValue="" ErrorMessage="請填寫帳號" ForeColor="Red" />--%>

            <p>電子信箱
            <asp:TextBox class="TextBoxStyle" ID="emailans" runat="server" Width="250px" Height="30px" style ="padding-left:10px;" placeholder="請輸入電子信箱"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmailAns" runat="server" ControlToValidate="emailans" InitialValue="" style="font-size:15px;" ErrorMessage="請填寫電子信箱" ForeColor="Red" />
            </p>

            <p>重設密碼
            <asp:TextBox class="TextBoxStyle" ID="newanswer" runat="server" Width="250px" Height="30px" style ="padding-left:10px;" placeholder="請輸入新密碼"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNewAnswer" runat="server" ControlToValidate="newanswer" InitialValue="" style="font-size:15px;" ErrorMessage="請填寫新密碼" ForeColor="Red" />
            </p>

            <p>確認密碼
            <asp:TextBox class="TextBoxStyle" ID="TextBox1" runat="server" Width="250px" Height="30px" style ="padding-left:10px;" placeholder="請輸入新密碼"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="newanswer" InitialValue="" style="font-size:15px;" ErrorMessage="請再次填寫新密碼" ForeColor="Red" />
            </p>

    
            <asp:Label style="font-size:20px;" ID="ErrorMessage" runat="server" Text="" />

            <br />
            <div>
                <asp:Button class="ButtonStyle3 ButtonSize1" ID="ReturnButton" runat="server" Text="返回" OnClick="ReturnButton_Click" CausesValidation="false" />
                <asp:Button class="ButtonStyle3 ButtonSize1" ID="Button2" runat="server" OnClick="Comfirm_Click" Text="確認" />
            </div>
        </div>
        </div>
    </form>
</body>
</html>
