<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_add.aspx.cs" Inherits="_BookKeeping.bucket_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望新增</title>
</head>
<body>
    <form class="BucForm" id="form1" runat="server">
        <div class="YMemo MemoStyle">
            <div class="BucWord">
                <asp:Label ID="WishUser" runat="server" Text="______想要"></asp:Label><br />
                <asp:TextBox class="TextBoxStyle" ID="WishTextbox" PlaceHolder="請輸入你的願望" runat="server" height="40px" width="250px" Font-Size="30px" style="margin-top: 50px;"></asp:TextBox>
            </div>
            <div class="BucAddButton">
                <asp:Button class="ButtonStyle ButtonSize2" ID="BucAdd" runat="server" Text="確認" Onclick="Submit_Click"/>
                <asp:Button class="ButtonStyle ButtonSize2" ID="BucUnadd" runat="server" Text="取消" PostBackUrl="~/src/bucket_list.aspx" />
            </div>
        </div>
        

        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" />
    </form>
</body>
</html>