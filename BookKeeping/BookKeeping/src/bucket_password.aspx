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
                <label style="font-size:30px;">家長審核密碼</label>
                <br />
                <asp:TextBox class="TextBoxStyle" ID="UserPwd" runat="server" Width="250" Height="35" TextMode="Password" placeholder="請輸入密碼" Font-Size="13"></asp:TextBox>
                <br />
                <p>&nbsp;&nbsp;<asp:Button class="ButtonStyle" ID="LoginButton" runat="server" Text="確認" Width="100" Height="35" Font-Size="13" PostBackUrl="~/src/bucket_review.aspx"/></p>
            </div>
        </div>
    </form>
</body>
</html>
