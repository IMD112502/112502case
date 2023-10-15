<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_password.aspx.cs" Inherits="BookKeeping.bucket_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>審核密碼</title>
</head>
<body>
    <form class="BucForm" id="form1" runat="server">
        <div class="BMemo MemoStyle">
            <div class="BucWord">
                <br /><br />
                <label style="font-size:40px;">家長審核密碼</label>
                <br />
                <asp:TextBox class="TextBoxStyle" ID="UserPwd" runat="server" Width="250" Height="35" TextMode="Password" placeholder="請輸入密碼" Font-Size="13"></asp:TextBox>
                <br />
                <a id="RevForgetPwd" class="RevForgetPwd" runat="server" style="font-size:18px;" href="forget_bucket_pwd.aspx">忘記密碼</a>
                <br />
                <asp:Label style="font-size:20px;" ID="ErrorMessageLabel" runat="server" Text="" />
                <br />
                <asp:Label ID="question" runat="server" Text="安全問題" Visible="false"></asp:Label>
                <br />
                <asp:DropDownList ID="securityQuestion" runat="server" Visible="false" CssClass="DropDownStyle" Width="250px">
                    <asp:ListItem Text="請選擇問題" Value="" />
                    <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                    <asp:ListItem Text="請問你住在哪裡" Value="2" />
                </asp:DropDownList>
                <br />
                <asp:TextBox class="TextBoxStyle" ID="securityAnswer" runat="server" Width="250" Height="35" placeholder="請輸入答案" Font-Size="13"></asp:TextBox>

                <p><asp:Button class="BucButton ButtonStyle ButtonSize2" ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="確認" /></p>
                <p><asp:Button class="BucButton ButtonStyle3 ButtonSize2" ID="Button1" runat="server" Text="設定密碼" PostBackUrl="~/src/bucket_password_set.aspx"/></p>
            </div>
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" />
    </form>
</body>
</html>
