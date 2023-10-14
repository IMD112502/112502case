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
            <asp:Label style="font-size:25px" ID="Label3" runat="server" Text="問題"></asp:Label>         
            <asp:DropDownList class = "DropDownList TextBoxStyle" ID="secretQuestion" runat="server" CssClass="DropDownStyle" Height="25px" Width="200px">
                <asp:ListItem Text="請選擇問題1" Value="" />
                <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                <asp:ListItem Text="請問你住在哪裡" Value="2" />
            </asp:DropDownList>
            <br />
            <asp:Label style="font-size:25px" ID="Label4" runat="server" Text="答案"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="secretAnswer" runat="server" Height="25px" Width="193px" placeholder="請輸入答案"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSecretAnswer" runat="server" ControlToValidate="secretAnswer" InitialValue="" ErrorMessage="請填寫答案" ForeColor="Red" />

            <br />
            <asp:Label style="font-size:25px" ID="account" runat="server" Text="帳號"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="enteraccount" runat="server" Height="25px" Width="193px" placeholder="請輸入帳號"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEnterAccount" runat="server" ControlToValidate="enteraccount" InitialValue="" ErrorMessage="請填寫帳號" ForeColor="Red" />

            <br />
            <asp:Label style="font-size:25px" ID="enteremail" runat="server" Text="電子信箱"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="emailans" runat="server" Height="25px" Width="193px" placeholder="請輸入電子信箱"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmailAns" runat="server" ControlToValidate="emailans" InitialValue="" ErrorMessage="請填寫電子信箱" ForeColor="Red" />


            <br />
            <asp:Label style="font-size:25px" ID="newpassword" runat="server" Text="新密碼"></asp:Label>  
            <asp:TextBox class="TextBoxStyle" ID="newanswer" runat="server" Height="25px" Width="193px" placeholder="請輸入新密碼"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNewAnswer" runat="server" ControlToValidate="newanswer" InitialValue="" ErrorMessage="請填寫新答案" ForeColor="Red" />


            <br />
            <asp:Label style="font-size:20px;" ID="ErrorMessage" runat="server" Text="" />

            <br />
            <div class="ForgetPwdButton">
                <asp:Button class="ButtonStyle ButtonSize1" ID="ReturnButton" runat="server" Text="返回" OnClick="ReturnButton_Click" CausesValidation="false" />
 
                <br />
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button2" runat="server" OnClick="Comfirm_Click" Text="確認" />
            </div>


        </div>
    </form>
</body>
</html>
