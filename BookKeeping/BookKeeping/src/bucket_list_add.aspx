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
    <form class="buc_add_form" id="form1" runat="server">
        <div class="buc_add">
            <asp:Label ID="wish_user" runat="server" Text="______想要" font-size="XX-Large" ></asp:Label><br />
            <asp:TextBox ID="wish_textbox" PlaceHolder="請輸入您的願望" runat="server" Height="40px" Width="230px"></asp:TextBox><br/>
            
        </div>
        <asp:Button class="buc_add_button" ID="submit" runat="server" Text="確認" Onclick="Submit_Click"/>
        <asp:Button class="buc_add_button" ID="reset" runat="server" Text="取消" />

        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" />
    </form>
</body>
</html>