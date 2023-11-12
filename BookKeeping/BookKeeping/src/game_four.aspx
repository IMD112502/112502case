<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_four.aspx.cs" Inherits="BookKeeping.src.game_four" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>題型一-認識錢幣</title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Panel ID="ThirdGamePanel2" runat="server" Visible="true">
            <div class="GameLeft3_2">
                 <p id="TotalMoney">一共是<span id="TotalMoney2">&nbsp;&nbsp;&nbsp;&nbsp;</span>元</p> <%--結帳金額--%>
                <asp:Image ID="Clerk" runat="server" ImageUrl="images/game/game_clerk2.png"/>
                <asp:Button class="ButtonStyle3 ButtonSize2" ID="Correct2" runat="server" Text="完成"  OnClick="Check_Click"/>

                <div class="Checkout" id="Checkout">
                    <asp:Label ID="Label9" runat="server" Text="Label" Style="font-size: 80px; ">結帳區</asp:Label>
                </div>
            </div>
            
            <div class="Wallet">
                <asp:Image class="draggable" ID="Thousand" runat="server" alt="money1000" draggable="true" ImageUrl="images/game/money_1000.png"/>
                <asp:Image class="draggable" ID="FiveHundred" runat="server" alt="money500" draggable="true" ImageUrl="images/game/money_500.png"/>
                <asp:Image class="draggable" ID="Hundred" runat="server" alt="money100" draggable="true" ImageUrl="images/game/money_100.png"/>
                <asp:Image class="draggable" ID="Fifty" runat="server" alt="money50" draggable="true" ImageUrl="images/game/money_50.png"/>
                <asp:Image class="draggable" ID="Ten" runat="server" alt="money10" draggable="true" ImageUrl="images/game/money_10.png"/>
                <asp:Image class="draggable" ID="Five" runat="server" alt="money5" draggable="true" ImageUrl="images/game/money_5.png"/>
                <asp:Image class="draggable" ID="One" runat="server" alt="money1" draggable="true" ImageUrl="images/game/money_1.png"/>
            </div>

            <script type="text/javascript">
                var totalAmountInCheckout = 0;
                var totalPaymentAmount = 0;  // 初始化需付款金額
                function updateTotalPayment() {
                    // 更新顯示需付款金額的元素
                    var totalMoneyElement = document.getElementById('TotalMoney2');
                    if (totalMoneyElement) {
                        totalMoneyElement.innerText = totalPaymentAmount;
                    }
                }

                document.addEventListener('DOMContentLoaded', function () {
                    var draggableElements = document.querySelectorAll('.draggable');
                    var Checkout = document.getElementById('Checkout');

                    draggableElements.forEach(function (draggable) {
                        draggable.addEventListener('dragstart', function (event) {
                            var draggedElement = event.target.cloneNode(true);
                            draggedElement.classList.add('dragged-image');
                            document.body.appendChild(draggedElement);
                            event.dataTransfer.setData('text/plain', draggedElement.id);
                        });

                        draggable.addEventListener('dragend', function (event) {
                            var draggedElement = document.querySelector('.dragged-image');
                            if (draggedElement) {
                                draggedElement.parentNode.removeChild(draggedElement);
                            }
                        });
                    });

                    Checkout.addEventListener('dragover', function (event) {
                        event.preventDefault();
                    });

                    Checkout.addEventListener('drop', function (event) {
                        event.preventDefault();
                        var data = event.dataTransfer.getData('text/plain');
                        var draggedElement = document.getElementById(data);

                        if (draggedElement && draggedElement.classList.contains('draggable')) {
                            var moneyValue = getMoneyValue(draggedElement.id);

                            var clonedElement = draggedElement.cloneNode(true);
                            clonedElement.classList.add('draggable-item');
                            clonedElement.addEventListener('click', function () {
                                clonedElement.parentNode.removeChild(clonedElement);
                                totalAmountInCheckout -= moneyValue;
                                updateTotalAmountLabel();
                                document.getElementById("hiddentotal").value = document.getElementById('TotalAmountLabel').innerText;
                            });
                            Checkout.appendChild(clonedElement);

                            totalAmountInCheckout += moneyValue;
                            updateTotalAmountLabel();
                            document.getElementById("hiddentotal").value = document.getElementById('TotalAmountLabel').innerText;
                            console.log('總金額:', totalAmountInCheckout);
                        }
                    });
                });
                
                function getMoneyValue(imageId) {
                    switch (imageId) {
                        case 'Thousand':
                            return 1000;
                        case 'FiveHundred':
                            return 500;
                        case 'Hundred':
                            return 100;
                        case 'Fifty':
                            return 50;
                        case 'Ten':
                            return 10;
                        case 'Five':
                            return 5;
                        case 'One':
                            return 1;
                        default:
                            return 0;
                    }
                }
                function updateTotalAmountLabel() {
                    // 更新顯示結帳區總金額的 Label 元素
                    var totalAmountLabel = document.getElementById('TotalAmountLabel');
                    if (totalAmountLabel) {
                        totalAmountLabel.innerText = totalAmountInCheckout;
                    }
                }


            </script>
        </asp:Panel>

    <%-- <%--   <div class="GameProgress" id="GameProgressBar" runat="server" style='<%# Eval("ProgressBarStyle") %>'></div>
        <asp:Label ID="GameProgress" class="GameProgressText" runat="server" Text='<%# Eval("ProgressText") %>' ></asp:Label>
        <asp:Button class="ButtonStyle3 ButtonSize1" ID="LeaveGame" runat="server" Text="結束遊戲" PostBackUrl="~/src/game_menu.aspx" />
        <asp:Label ID="randomNum" runat="server" Text="" Visible="false"><bel"></asp:Label>--%>
        <asp:Label ID="TotalAmountLabel" runat="server" Text="0" Style="font-size: 24px;" Visible="true"></asp:Label><%--紀錄目前結帳區的金額--%>
        <input type="hidden" name="hiddentotal" id="hiddentotal" value="0"/>
    </form>

</body>
</html>
