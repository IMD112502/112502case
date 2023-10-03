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
           <%--   願望區--%>
            <asp:Repeater ID="Wish_Repeater" runat="server" OnItemCommand="Repeater_ItemCommand">
            <ItemTemplate>
                <div>
                    <span><%# Eval("d_name") %></span>
                    <span><%# Eval("pass_amount") %></span>
                    <asp:Button ID="DeleteButton" runat="server" Text="刪除" CommandName="DeleteWish" CommandArgument='<%# Eval("d_num") %>' />
            <asp:Button ID="RedeemButton" runat="server" Text="兌換" CommandName="RedeemWish" CommandArgument='<%# Eval("d_num") %>' Visible='<%# IsRedeemVisible(Eval("pass_amount")) %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:ImageButton ID="BucTrashcan" runat="server" ImageUrl="images/dre_gar.png" PostBackUrl="~/src/bucket_trashcan.aspx" /><%----願望垃圾桶--%>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" /><%----返回鍵--%>
        <asp:ImageButton ID="ReviewButton" runat="server" ImageUrl="images/review_button.png" PostBackUrl="~/src/bucket_password.aspx" />
        <asp:Button class="ButtonStyle ButtonSize1" ID="RecordButton" runat="server" Text="歷史紀錄" PostBackUrl="~/src/bucket_record.aspx" />
        <asp:ImageButton ID="BucketAdd" runat="server" ImageUrl="images/buc_add_button.png" PostBackUrl="~/src/bucket_add.aspx" />
    </form>
</body>
</html>
