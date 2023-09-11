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
        <div id="Target_Space" class="WishFlex" runat="server" >
            <asp:Label ID="TotalAmountLabel" runat="server" CssClass="TotalAmountLabelStyle"></asp:Label>
            <asp:Label ID="test" runat="server"  ></asp:Label>
            <asp:Panel ID="Target_Background" runat="server" CssClass="PickWish" Visible="false">
                <asp:Panel ID="Panel3" runat="server" CssClass="ContentFlexLeft">
                <asp:Label ID="Label5" runat="server" Text="目標"   Width="150px" Font-Size="XX-Large" ></asp:Label>
                    <asp:Panel ID="Panel0" runat="server" BorderStyle="Dashed">
                <asp:Label ID="Label6" runat="server" Text="玩具車"   Width="150px" Font-Size="XX-Large"></asp:Label>
                <asp:Label ID="Label0" runat="server" Text="200元"   Width="150px" Font-Size="XX-Large"></asp:Label>
                        </asp:Panel>
                <asp:Button class="ButtonStyle" ID="ChangeWishButton" runat="server" Text="更換目標" />
                     </asp:Panel>
            </asp:Panel>

                <%--目標願望--%>
             <asp:Panel ID="Tbg" runat="server" CssClass="PickWish">
                <asp:Panel ID="Tcontent" runat="server" CssClass="ContentFlexLeft">
                <asp:Label ID="Ttitle" runat="server" Text="目標" CssClass="PickWishTitle"></asp:Label>
                <asp:Label ID="Tname" runat="server" Text="Label" CssClass="PickWishText"></asp:Label>
                 <asp:Label ID="Tamount" runat="server" Text="Label" CssClass="PickWishText"></asp:Label>
                        </asp:Panel>
            </asp:Panel>
            
              <%--非目標願望1--%>
            <asp:Panel ID="Utbg1" runat="server" CssClass="BucFlexRight">
                <asp:Panel ID="Utcontent1" runat="server" CssClass="ContentFlexRight">
                <asp:Label ID="Utname1" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large" ></asp:Label>
                <asp:Label ID="Utamount1" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Button" Height="30px" Width ="100px"/>
                    </asp:Panel>
            </asp:Panel>

            <%--非目標願望2--%>
             <asp:Panel ID="Utbg2" runat="server" CssClass="BucFlexRight">
                <asp:Panel ID="Utcontent2" runat="server" CssClass="ContentFlexRight">
                <asp:Label ID="Utname2" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large" ></asp:Label>
                <asp:Label ID="Utamount2" runat="server" Text="Label"   Width="150px" Font-Size="XX-Large"></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="Button" Height="30px" Width ="100px"/>
                    </asp:Panel>
            </asp:Panel>
            </div>

        <asp:ImageButton ID="BucTrashcan" runat="server" ImageUrl="images/dre_gar.png" PostBackUrl="~/src/bucket_trashcan.aspx" /><%--願望垃圾桶--%>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
        <asp:ImageButton ID="ReviewButton" runat="server" ImageUrl="images/review_button.png" PostBackUrl="~/src/bucket_review.aspx" />
        <asp:Button class="ButtonStyle ButtonSize1" ID="RecordButton" runat="server" Text="兌換紀錄" PostBackUrl="~/src/bucket_record.aspx" />
        <asp:ImageButton ID="BucketAdd" runat="server" ImageUrl="images/buc_add_button.png" PostBackUrl="~/src/bucket_add.aspx" />
    </form>
</body>
</html>
