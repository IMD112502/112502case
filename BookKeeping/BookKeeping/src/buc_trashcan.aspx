<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buc_trashcan.aspx.cs" Inherits="_BookKeeping.buc_trashcan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>垃圾桶</title>
    <style type="text/css">
        #Text1 {
            height: 60px;
        }
    </style>
</head>
<body class="trashcan_body">
    <form   class="tra_form" id="form1" runat="server">
        <div class="trashcan">
            <asp:Label ID="cant_buy" runat="server" Text="不能買_______" font-size="XX-Large" ></asp:Label><br />
            <asp:Label ID="because" runat="server" Text="因為：" font-size="XX-Large" ></asp:Label><br />
            <textarea name="mytext" rows="5" cols="30"></textarea>
        </div>
        <div class="trashcan_button">
            <input class="dre_button" id="Submit1" type="submit" value="知道了" style="height: 40px; width: 70px;" />
        </div>
        <asp:ImageButton class="back1" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="50px" width="50px" />
    </form>
</body>
</html>