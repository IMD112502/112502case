<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bucket_record.aspx.cs" Inherits="BookKeeping.src.bucket_record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>願望兌換紀錄</title>
</head>
<body>
    <form class="BucForm" id="form1" runat="server">
        <div class="YMemo MemoStyle">
            <asp:Label ID="Label1" runat="server" style="font-size:40px; font-weight: bold;" Text="願望兌換紀錄"></asp:Label><br />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/bucket_list.aspx" />
    </form>
</body>
</html>
