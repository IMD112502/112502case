<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="_BookKeeping.review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>審核區</title>
</head>
<body class="review_body">
    <form id="form1" runat="server">
        <div class="review">
            <asp:Label ID="cant_buy" runat="server" Text="______想要" font-size="X-Large" ></asp:Label><br />
            <asp:Label ID="because" runat="server" Text="___________, 可以嗎><？" font-size="X-Large" ></asp:Label><br />
        </div>
        <div class="review_button">
            <asp:RadioButton ID="RadioButton1" runat="server" />可以, 要存____元喔！<br />
            <asp:RadioButton ID="RadioButton2" runat="server" />不可以, 原因：<br />
            <asp:TextBox ID="TextBox1" placeholder="請輸入審核不通過的原因" runat="server" height="30px" width="250px"></asp:TextBox>
        </div>
        <input id="review_Submit1" type="submit" value="確認" style="height: 50px; width: 50px;" />
        <asp:ImageButton class="back1" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="50px" width="50px" />
    </form>
</body>
</html>
