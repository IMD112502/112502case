﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="BookKeeping.src.review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望審核區</title>
</head>
<body>
    <form class="rev_form" id="form1" runat="server">
        <div class="reviewing">
            <div class="word">
                <asp:Label ID="label1" runat="server" Text="" font-size="40px" ></asp:Label>
                <asp:Label ID="label2" runat="server" Text="" font-size="40px" ></asp:Label><br />
                <asp:Label ID="label3" runat="server" Text="" font-size="40px" ></asp:Label><br />

                <div class="YesNo">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" RepeatDirection="Horizontal">
                        <asp:ListItem ID="yes" runat="server" Text="可以" Value="y" Selected="True" />
                        <asp:listitem ID="no" runat="server" Text="不可以" Value="n" />
                    </asp:RadioButtonList>
                </div>
                <div class="RevTextbox">
                    <asp:Panel ID="Panel2" runat="server">
                    <asp:Label ID="label4" runat="server" Text="設定目標為" font-size="30px"></asp:Label>
                    <asp:TextBox type="reason" ID="Textbox1" placeholder="請輸入金額" runat="server" height="30px" width="100px"></asp:TextBox>
                    <asp:Label ID="label5" runat="server" Text="元" font-size="30px"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                    <asp:Label ID="label6" runat="server" Text="拒絕原因：" font-size="30px" ></asp:Label><br />
                    <asp:TextBox type="reason" ID="Textbox2" placeholder="請輸入原因" runat="server" height="30px" width="250px" ></asp:TextBox>
                     </asp:Panel>
                        </div>
                <asp:Label ID="IndexCount" runat="server" Text="" Visible="false"></asp:Label> 
            </div>
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass ="review_button">
        <%--<div class="review_button">--%>
            
            
        <%--</div>--%></asp:Panel>
        <asp:Button class="dre_button button_style button_size2" ID="Button3" runat="server" Text="確認" OnClick="Submit_Click" />
        <%--<input class="dre_button" id="review_Submit1" type="submit" value="確認" style="height: 50px; width: 100px;" />--%>
        <asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" height="80px" width="80px" />
        <div class="last_next">
            <div><asp:Button class="button_style" ID="Last" runat="server" Text="<" style="height: 50px; width: 50px; font-size: 45px;" CommandArgument="minus" OnClick="ChangeWish_Click"/></div><%--上一個願望--%>
            <div><asp:Button class="button_style" ID="Next" runat="server" Text=">" style="height: 50px; width: 50px; font-size: 45px;" CommandArgument= "plus" OnClick="ChangeWish_Click"/></div><%--下一個願望--%>
        </div>
    </form>

</body>
</html>