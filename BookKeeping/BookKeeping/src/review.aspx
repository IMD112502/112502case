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
        <div><asp:Button ID="Button1" runat="server" Text="<" style="height: 50px; width: 50px; font-size: 45px;" CommandArgument="minus" OnClick="ChangeWish_Click"/></div><%--上一個願望--%>
        <div class="reviewing">
            <div class="word">
                <asp:Label ID="label1" runat="server" Text="" font-size="40px" ></asp:Label>
                <asp:Label ID="label2" runat="server" Text="" font-size="40px" ></asp:Label><br />
                <asp:Label ID="label3" runat="server" Text="" font-size="40px" ></asp:Label><br />
            </div>
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass ="review_button">
        <%--<div class="review_button">--%>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" RepeatLayout="Flow">
                <asp:ListItem ID="yes" runat="server" Text="可以, 要存____元喔！" Value="y"/>
                <asp:listitem ID="no" runat="server" Text="不可以, 原因：" Value="n" Selected="True" />
            </asp:RadioButtonList>
            <asp:TextBox type="reason" ID="Textbox1" placeholder="請輸入審核不通過的原因" runat="server" height="30px" width="250px" Visible="false"></asp:TextBox>
        <%--</div>--%></asp:Panel>
        <asp:Button ID="Button3" runat="server" Text="確認" Cssclass ="dre_button" Height="50px" Width="100px" OnClick="Submit_Click" />
        <%--<input class="dre_button" id="review_Submit1" type="submit" value="確認" style="height: 50px; width: 100px;" />--%>
        <asp:ImageButton class="rev_back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" height="80px" width="80px" />
        <div><asp:Button ID="Button2" runat="server" Text=">" height="50px" width="50px" Style="font-size:45px;"  CommandArgument= "plus" OnClick="ChangeWish_Click"/></div><%--下一個願望--%>
    </form>

</body>
</html>
