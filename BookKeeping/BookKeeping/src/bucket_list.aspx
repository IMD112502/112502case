<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_list.aspx.cs" Inherits="_BookKeeping.bucket_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望清單</title>
</head>
<body class="BucBody">
    <form id="form1" class="BucForm" runat="server">
        <div class="WishFlex">
            <div class="PickWish">
                <asp:Button class="ButtonStyle" ID="ChangeWishButton" runat="server" Text="更換目標" />
            </div>
            <div class="BucFlexRight"></div>
            <div class="BucFlexRight"></div>
        </div>
        <asp:ImageButton ID="BucTrashcan" runat="server" ImageUrl="images/dre_gar.png" PostBackUrl="~/src/buc_trashcan.aspx" /><%--願望垃圾桶--%>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
        <asp:ImageButton ID="ReviewButton" runat="server" ImageUrl="images/review_button.png" PostBackUrl="~/src/review.aspx" />
        <asp:ImageButton ID="BucketAdd" runat="server" ImageUrl="images/buc_add_button.png" PostBackUrl="~/src/bucket_list_add.aspx" />
    </form>
</body>
</html>
