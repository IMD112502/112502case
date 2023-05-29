<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_list_add.aspx.cs" Inherits="_BookKeeping.bucket_list_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望新增</title>
</head>
<body class="buc_add_body">
    <form class="buc_add_form" id="form1" runat="server">
        <div class="buc_add">
            <div class="word">
                <asp:Label ID="wish_user" runat="server" Text="______想要"></asp:Label><br />
                <asp:TextBox ID="wish_textbox" PlaceHolder="請輸入您的願望" runat="server"></asp:TextBox>
            </div>
            <div class="buc_add_button">
                <asp:Button class="button_style button_size2" ID="BucAdd" runat="server" Text="確認" Onclick="Submit_Click"/>
                <asp:Button class="button_style button_size2" ID="BucUnadd" runat="server" Text="取消" />
            </div>
        </div>
        

        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" PostBackUrl="~/src/bucket_list.aspx" />
    </form>
</body>
</html>