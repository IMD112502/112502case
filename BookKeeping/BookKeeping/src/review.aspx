﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="BookKeeping.src.review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>審核區</title>
</head>
<body class="review_body">
    <form class="rev_form" id="form1" runat="server">
        <div class="reviewing">
            <div class="word">
                <asp:Label runat="server" Text="小明想要黏土組, " font-size="40px" ></asp:Label><br />
                <asp:Label runat="server" Text="可以嗎><？" font-size="40px" ></asp:Label><br />
            </div>
        </div>
        <div class="review_button">
            <%--<asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem ID="yes" runat="server" Text="可以, 要存____元喔！" />
                <asp:listitem ID="no" runat="server" Text="不可以, 原因："/>
            </asp:RadioButtonList>
            <asp:TextBox type="reason" ID="Textbox1" placeholder="請輸入審核不通過的原因" runat="server" height="30px" width="250px"></asp:TextBox>--%>
        </div>
        <input class="dre_button" id="review_Submit1" type="submit" value="確認" style="height: 50px; width: 100px;" />
        <asp:ImageButton class="rev_back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" />
    </form>

</body>
</html>
