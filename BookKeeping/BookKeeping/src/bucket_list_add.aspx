<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_list_add.aspx.cs" Inherits="_BookKeeping.bucket_list_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望清單-新增</title>
    <style type="text/css">        
    </style>
</head>
<body class="buc_add_body">
    <form id="form1" runat="server">
        <div class="bucket_add">
            <asp:Label ID="wish_user" runat="server" Text="______想要" font-size="XX-Large" ></asp:Label><br />
            <asp:TextBox ID="wish_textbox" PlaceHolder="請輸入您的願望" runat="server" Height="40px" Width="230px"></asp:TextBox>
        </div>
        <div class="buc_add_button">
            <asp:Button ID="Submit" runat="server" Text="確認" style="height: 50px; width: 50px;" OnClick="Submit_Click"/>
            <input id="Reset1" type="reset" value="取消" style="height: 50px; width: 50px;" />
        </div>
        <asp:ImageButton class="back1" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="50px" width="50px" />
    </form>
</body>
</html>