<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dressing_room.aspx.cs" Inherits="BookKeeping.src.dressing_room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>更衣室</title>
</head>
<body class="DreRoom">
    <form id="DreForm" runat="server">
        <div class="Cloth"> <%--左區塊--%>
            <asp:ImageButton ID="cloth1" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g1.png" OnClientClick="return setPreviewImage('images/cloth/body_g1.png');" />

            <asp:ImageButton ID="cloth2" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g2.png" OnClientClick="return setPreviewImage('images/cloth/body_g2.png');" />

            <asp:ImageButton ID="cloth3" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g3.png" OnClientClick="return setPreviewImage('images/cloth/body_g3.png');" />
        </div>

        <div class="DrePerson">
            <asp:Image ID="now" runat="server" ImageUrl="images/person.png" Height="360px" Width="310px" ClientIDMode="Static"/>

        </div>

        <div class="Pet"> <%--右區塊--%>

        </div>

        <div class="DreButton">
<%--            <input id="DreCancel" class="ButtonStyle3 ButtonSize2" type="button" value="取消修改" />
            <input id="DreConfirm" class="ButtonStyle3 ButtonSize2" type="button" value="確認更換" />--%>
            <asp:Button ID="btnCancel" runat="server" Text="取消修改" OnClientClick="return cancelChanges();" Enabled="false" />
            <asp:Button ID="btnConfirm" runat="server" Text="確認修改" OnClick="btnConfirm_Click" Enabled="false" />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />

        <asp:HiddenField ID="hiddenClothingID" runat="server" />

        <script type="text/javascript">
            function setPreviewImage(imagePath) {
                var nowImage = document.getElementById("now");
                nowImage.src = imagePath;

                // 設定隱藏字段的值為user所選的衣服ID
                document.getElementById('<%= hiddenClothingID.ClientID %>').value = imagePath;

                // 启用确认修改按钮
                var confirmButton = document.getElementById('<%= btnConfirm.ClientID %>');
                var cancelButton = document.getElementById('<%= btnCancel.ClientID %>');
                confirmButton.disabled = false;
                cancelButton.disabled = false;

                return false; // 阻止頁面刷新
            }
        </script>
    </form>
</body>
</html>
