<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_password_set.aspx.cs" Inherits="BookKeeping.bucket_password_set" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>審核密碼設定</title>
</head>
<body>
    <form class="BucForm" id="form1" runat="server">
        <div class="BMemo MemoStyle">
            <div class="BucWord">
                <label style="font-size:35px;">請設定4~6位數審核密碼</label>
                <br />
                <br />
                <p style="font-size:25px;">設定審核密碼
                <asp:TextBox class="TextBoxStyle" ID="UserPwd" runat="server" Width="180" Height="30" style ="margin-bottom:10px; padding-left:10px;" TextMode="Password" placeholder="請輸入審核密碼" ></asp:TextBox>
                </p>
                <p style="font-size:25px;">確認審核密碼
                <asp:TextBox class="TextBoxStyle" ID="TextBox1" runat="server" Width="180" Height="30" style ="margin-bottom:10px; padding-left:10px;" TextMode="Password" placeholder="請再次輸入審核密碼" ></asp:TextBox>
                </p>
                <p style="font-size:25px;">安全問題
                <asp:DropDownList class="DropDownStyle" ID="securityQuestion" runat="server" Width="245" Height="40" style ="margin-bottom:10px; padding-left:10px;">
                    <asp:ListItem Text="請選擇問題" Value="" />
                    <asp:ListItem Text="請問您的出生地在哪?" Value="1" />
                    <asp:ListItem Text="請問你住在哪裡" Value="2" />
                </asp:DropDownList>
                </p>
                <p style="font-size:25px;">回答問題
                <asp:TextBox class="TextBoxStyle" ID="securityAnswer" runat="server" Width="235" Height="30" style ="margin-bottom:10px; padding-left:10px;" placeholder="請輸入答案" ></asp:TextBox>
                </p>
                <p><asp:Button class="BucButton2 ButtonStyle ButtonSize2" ID="LoginButton" runat="server" Text="確認" PostBackUrl="~/src/bucket_password.aspx" /></p>
            </div>
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" />
    </form>
</body>
</html>
