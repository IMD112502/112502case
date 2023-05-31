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
                <asp:Panel ID="Panel3" runat="server" CssClass="ContentFlexLeft">
                <asp:Label ID="Label5" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large" ></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large"></asp:Label>
                <asp:Button ID="ChangeWishButton" runat="server" Text="更換目標" />
                     </asp:Panel>
            </div>
            <div class="BucFlexRight">
                <asp:Panel ID="Panel1" runat="server" CssClass="ContentFlexRight">
                <asp:Label ID="Label1" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large" ></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Button" Height="30px" Width ="100px"/>
                    </asp:Panel>
            </div>
            <div class="BucFlexRight">
                <asp:Panel ID="Panel2" runat="server" CssClass="ContentFlexRight">
                <asp:Label ID="Label3" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large" ></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large"></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="Button" Height="30px" Width ="100px"/>
                     </asp:Panel>
            </div>
        </div>
        <asp:ImageButton ID="BucTrashcan" runat="server" ImageUrl="images/dre_gar.png" weight="160.8px" Height="259.8px" PostBackUrl="~/src/buc_trashcan.aspx" /><%--願望垃圾桶--%>
        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
        <asp:ImageButton ID="ReviewButton" runat="server" ImageUrl="images/review_button.png" weight="200px" height="200px" PostBackUrl="~/src/review.aspx" />
        <asp:ImageButton ID="BucketAdd" runat="server" ImageUrl="images/buc_add_button.png" weight="80px" height="80px" PostBackUrl="~/src/bucket_list_add.aspx" />
    </form>
</body>
</html>
