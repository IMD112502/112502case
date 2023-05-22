<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_list.aspx.cs" Inherits="_BookKeeping.bucket_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望清單</title>
</head>
<body class="buc_body">
    <form id="form1" class="buc_form" runat="server">
        <div class="wishes1">
            <div class="word1">
            <asp:Label runat="server" Text="機器人"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="400元"></asp:Label>
            </div>
        </div>  
        <div class="wishes2">
            <div class="word1">
                <asp:Label runat="server" Text="電動車"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Text="500元"></asp:Label>
            </div>
        </div>
        <div class="wishes3">
            <div class="word1">
                <asp:Label runat="server" Text="拼圖" ></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server" Text="350元"></asp:Label>
            </div>
        </div>
        <div class="wishes4">
            <div class="word1">
                <asp:Label runat="server" Text="娃娃" ></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" Text="350元"></asp:Label>
            </div>
        </div>
        <div class="wishes5">
            <div class="word1">
                <asp:Label runat="server" Text="芭比娃娃" ></asp:Label>
                <br />
                <asp:Label ID="Label7" runat="server" Text="350元"></asp:Label>
            </div>
        </div>
        <div class="wishes6">
            <div class="word1">
                <asp:Label runat="server" Text="小汽車" ></asp:Label>
                <br />
                <asp:Label ID="Label8" runat="server" Text="350元"></asp:Label>
            </div>
        </div>
        <div class="wishes7">
            <div class="word1">
                <asp:Label class="b_Label1" runat="server" Text="籃球" ></asp:Label>
                <br />
                <asp:Label ID="Label9" runat="server" Text="350元"></asp:Label>
            </div>
            <div class="wishes8">
            <div class="word1">
                <asp:Label class="b_Label1" runat="server" Text="黏土組" ></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="100元"></asp:Label>
            </div>
        </div>
        <div class="pick_wish">
            <div class="word_pick">
                <asp:Label runat="server" Text="積木" ></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server" Text="350元"></asp:Label>
                <br />
                <asp:Button ID="change_wish" runat="server" Text="更換目標" />
                </div>
        </div>
        <asp:ImageButton ID="b_trashcan" runat="server" ImageUrl="images/dre_gar.png" weight="160.8px" Height="259.8px" PostBackUrl="~/src/buc_trashcan.aspx" /><%--願望垃圾桶--%>
        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="50px" width="50px" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
        <div class="review" style="width: 160px; height: 160px"><%--審核區--%>
            <div class="word_review">
                <asp:Label ID="Label5" runat="server" Text="審核區"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
