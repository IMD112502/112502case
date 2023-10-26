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
        <div class="Head" id="femaleHead"> 
            <asp:ImageButton ID="Headg1" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_g1.png" OnClientClick="return setPreviewHead('images/cloth/head_g1.png');" />
            <asp:ImageButton ID="Headg2" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_g2.png" OnClientClick="return setPreviewHead('images/cloth/head_g2.png');" />
            <asp:ImageButton ID="Headg3" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_g3.png" OnClientClick="return setPreviewHead('images/cloth/head_g3.png');" />
            <asp:ImageButton ID="Headg4" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_g4.png" OnClientClick="return setPreviewHead('images/cloth/head_g4.png');" />            
            <asp:ImageButton ID="Headg5" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_g5.png" OnClientClick="return setPreviewHead('images/cloth/head_g5.png');" />            
            <asp:ImageButton ID="Headg6" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_g6.png" OnClientClick="return setPreviewHead('images/cloth/head_g6.png');" />           
        </div>

        <div class="Head" id="maleHead">
            <asp:ImageButton ID="Headb1" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_b1.png" OnClientClick="return setPreviewHead('images/cloth/head_b1.png');" />         
            <asp:ImageButton ID="Headb2" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_b2.png" OnClientClick="return setPreviewHead('images/cloth/head_b2.png');" />            
            <asp:ImageButton ID="Headb3" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_b3.png" OnClientClick="return setPreviewHead('images/cloth/head_b3.png');" />            
            <asp:ImageButton ID="Headb4" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_b4.png" OnClientClick="return setPreviewHead('images/cloth/head_b4.png');" />            
            <asp:ImageButton ID="Headb5" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_b5.png" OnClientClick="return setPreviewHead('images/cloth/head_b5.png');" />
            <asp:ImageButton ID="Headb6" runat="server" Height="424px" Width="304px" style="margin-left:15px;" src="images/cloth/head_b6.png" OnClientClick="return setPreviewHead('images/cloth/head_b6.png');" />
        </div>

        <div class="Cloth" id="femaleClothing">
            <asp:ImageButton ID="Clothg1" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g1.png" OnClientClick="return setPreviewBody('images/cloth/body_g1.png');" />
            <asp:ImageButton ID="Clothg2" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g2.png" OnClientClick="return setPreviewBody('images/cloth/body_g2.png');" />
            <asp:ImageButton ID="Clothg3" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g3.png" OnClientClick="return setPreviewBody('images/cloth/body_g3.png');" />
            <asp:ImageButton ID="Clothg4" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g4.png" OnClientClick="return setPreviewBody('images/cloth/body_g4.png');" />
            <asp:ImageButton ID="Clothg5" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_g5.png" OnClientClick="return setPreviewBody('images/cloth/body_g5.png');" />
        </div>

        <div class="Cloth" id="maleClothing">
            <asp:ImageButton ID="Clothb1" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_b1.png" OnClientClick="return setPreviewBody('images/cloth/body_b1.png');" />
            <asp:ImageButton ID="Clothb2" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_b2.png" OnClientClick="return setPreviewBody('images/cloth/body_b2.png');" />
            <asp:ImageButton ID="Clothb3" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_b3.png" OnClientClick="return setPreviewBody('images/cloth/body_b3.png');" />
            <asp:ImageButton ID="Clothb4" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_b4.png" OnClientClick="return setPreviewBody('images/cloth/body_b4.png');" />
            <asp:ImageButton ID="Clothb5" runat="server" Height="360px" Width="310px" style="margin-left:10px; margin-top:10px;" src="images/cloth/body_b5.png" OnClientClick="return setPreviewBody('images/cloth/body_b5.png');" />
        </div>

        <div id="clothingGallery">
        <!-- 这里将显示用户拥有的衣物图像 -->
        </div>

        <div class="DrePerson">
            <asp:Image ID="NowHead" runat="server" Height="424px" Width="304px" ClientIDMode="Static"/>
            <asp:Image ID="NowBody" runat="server" Height="360px" Width="310px" ClientIDMode="Static"/>
        </div>

        <div class="Pet"> <%--右區塊--%>
            
        </div>

        <div class="DreButton">
<%--            <input id="DreCancel" class="ButtonStyle3 ButtonSize2" type="button" value="取消修改" />
            <input id="DreConfirm" class="ButtonStyle3 ButtonSize2" type="button" value="確認更換" />--%>
            <asp:Button ID="btnCancel" CssClass="ButtonStyle3 ButtonSize2" runat="server" Text="取消修改" OnClientClick="return cancelChanges();" Enabled="false" />
            <asp:Button ID="btnConfirm" CssClass="ButtonStyle3 ButtonSize2" runat="server" Text="確認修改" OnClick="BtnConfirm_Click" Enabled="false" />
        </div>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />

        <asp:HiddenField ID="hiddenBodyID" runat="server" />
        <asp:HiddenField ID="hiddenHeadID" runat="server" />
        <asp:label ID="gender" runat="server" text=""></asp:label>

        <script type="text/javascript">
            var currentBodyPath = ''; // Variable to store the currently worn body image path
            var currentHeadPath = ''; // Variable to store the currently worn head image path

            // 在页面加载时禁用按钮
            window.onload = function () {
                var confirmButton = document.getElementById('<%= btnConfirm.ClientID %>');
                var cancelButton = document.getElementById('<%= btnCancel.ClientID %>');

                var genderLabel = document.getElementById("gender");
                var userGender = genderLabel.textContent.trim();

                // 根据性别信息显示不同的服装
                if (userGender === "女生") {
                    // 显示女性服装
                    showClothing("femaleHead");
                    showClothing("femaleClothing");
                    hideClothing("maleClothing");
                    hideClothing("maleHead");
                }
                else {
                    // 显示男性服装
                    showClothing("maleHead");
                    showClothing("maleClothing");
                    hideClothing("femaleClothg");
                    hideClothing("femaleHead");
                }

                confirmButton.disabled = true;
                cancelButton.disabled = true;
            }

            function showClothing(clothingId) {
                var clothingDiv = document.getElementById(clothingId);
                clothingDiv.style.display = "block"; // 显示该服装的 div
            }

            function hideClothing(clothingId) {
                var clothingDiv = document.getElementById(clothingId);
                clothingDiv.style.display = "none"; // 隐藏该服装的 div
            }

            function setPreviewBody(imagePath) {
                var nowImage = document.getElementById("NowBody");
                nowImage.src = imagePath;

                // Check if the selected image path is different from the current body image
                if (imagePath !== currentBodyPath) {
                    currentBodyPath = imagePath; // Update the current body image path

                    // Set the hidden field value and enable the confirmation button
                    document.getElementById('<%= hiddenBodyID.ClientID %>').value = imagePath;
                    enableConfirmationButton();
                } else {
                    disableConfirmationButton();
                }

                return false; // Prevent page refresh
            }

            // Function to set the preview for head
            function setPreviewHead(imagePath) {
                var nowImage2 = document.getElementById("NowHead");
                nowImage2.src = imagePath;

                // Check if the selected image path is different from the current head image
                if (imagePath !== currentHeadPath) {
                    currentHeadPath = imagePath; // Update the current head image path

                    // Set the hidden field value and enable the confirmation button
                    document.getElementById('<%= hiddenHeadID.ClientID %>').value = imagePath;
                    enableConfirmationButton();
                } else {
                    disableConfirmationButton();
                }

                return false; // Prevent page refresh
            }

            // Enable the confirmation button
            function enableConfirmationButton() {
                var confirmButton = document.getElementById('<%= btnConfirm.ClientID %>');
                var cancelButton = document.getElementById('<%= btnCancel.ClientID %>');
                confirmButton.disabled = false;
                cancelButton.disabled = false;
            }

            // Disable the confirmation button
            function disableConfirmationButton() {
                var confirmButton = document.getElementById('<%= btnConfirm.ClientID %>');
                var cancelButton = document.getElementById('<%= btnCancel.ClientID %>');
                confirmButton.disabled = true;
                cancelButton.disabled = true;
            }
        </script>
    </form>
</body>
</html>
