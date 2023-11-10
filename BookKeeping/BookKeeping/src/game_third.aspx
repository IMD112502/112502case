<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_third.aspx.cs" Inherits="BookKeeping.src.game_third" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>題型三-買文具</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="ThirdGamePanel1" runat="server"><%--遊戲三之一--%>
            <div class="GameLeft3_1"><%--左半邊題目--%>
                <div class="SisQ"><asp:Image ID="Image9" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_sis.png"/><span>X<%# Eval("pass_amount") %></span></div> 
                <div class="GlueQ"><asp:Image ID="Image10" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_glue.png"/><span>X<%# Eval("pass_amount") %></span></div> 
                <div class="CorQ"><asp:Image ID="Image11" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_cor.png"/><span>X<%# Eval("pass_amount") %></span></div> 
                <div class="RulerQ"><asp:Image ID="Image12" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_ruler.png"/><span>X<%# Eval("pass_amount") %></span></div> 

                <div class="RedQ"><asp:Image ID="Image13" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_red.png"/><span>X<%# Eval("pass_amount") %></span></div> 
                <div class="GreenQ"><asp:Image ID="Image14" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_green.png"/><span>X<%# Eval("pass_amount") %></span></div> 
                <div class="BlueQ"><asp:Image ID="Image15" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_blue.png"/><span>X<%# Eval("pass_amount") %></span></div> 
                <div class="BlackQ"><asp:Image ID="Image16" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_black.png"/><span>X<%# Eval("pass_amount") %></span></div> 
            </div>

            <div class="Stationery"><%--文具區--%>
                <asp:Image class="draggable" ID="Redd" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_red2.png"/>
                <asp:Image class="draggable" ID="Greenn" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_green2.png"/>
                <asp:Image class="draggable" ID="Bluee" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_blue2.png"/>
                <asp:Image class="draggable" ID="Blackk" runat="server" Height="240px" Width="155px" ImageUrl="images/game/game3_black2.png"/>
                </br>
                <asp:Image class="draggable" ID="Siss" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_sis2.png"/>
                <asp:Image class="draggable" ID="Gluee" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_glue2.png"/>
                <asp:Image class="draggable" ID="Corr" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_cor2.png"/>
                <asp:Image class="draggable" ID="Rulerr" runat="server" Height="130px" Width="160px" ImageUrl="images/game/game3_ruler2.png"/>
            </div>

            <div class="ShoppingCart" id="ShoppingCart">
                <asp:Label ID="ShoppingCartText" runat="server" Text="Label" Style="font-size: 100px;">購物車</asp:Label>
            </div><%--購物車--%>

            <asp:Image ID="Trolley" runat="server" ImageUrl="images/game/game_trolley.png"/>
            <asp:Button class="ButtonStyle3 ButtonSize3" ID="Correct1" runat="server" Text="V"/>

            <script type="text/javascript">
                document.addEventListener('DOMContentLoaded', function () {
                    var draggableElements = document.querySelectorAll('.draggable');
                    var ShoppingCart = document.getElementById('ShoppingCart');

                    draggableElements.forEach(function (draggable) {
                        draggable.addEventListener('dragstart', function (event) {
                            // 把拖曳的照片clone下來
                            var draggedElement = event.target.cloneNode(true);

                            // 把clone下的圖片加到'dragged-image'類別裡
                            draggedElement.classList.add('dragged-image');

                            // 把clone下的圖片加到body裡
                            document.body.appendChild(draggedElement);

                            // 設定拖曳和放下
                            event.dataTransfer.setData('text/plain', draggedElement.id);
                        });

                        draggable.addEventListener('dragend', function (event) {
                            // 滑鼠放開後要移除拖曳中的圖片
                            var draggedElement = document.querySelector('.dragged-image');
                            if (draggedElement) {
                                draggedElement.parentNode.removeChild(draggedElement);
                            }
                        });
                    });

                    ShoppingCart.addEventListener('dragover', function (event) {
                        event.preventDefault();
                    });

                    ShoppingCart.addEventListener('drop', function (event) {
                        event.preventDefault();
                        var data = event.dataTransfer.getData('text/plain');
                        var draggedElement = document.getElementById(data);

                        if (draggedElement && draggedElement.classList.contains('draggable')) {
                            // 把正在拖曳的照片放到結帳區
                            var clonedElement = draggedElement.cloneNode(true);
                            clonedElement.classList.add('draggable-item');
                            clonedElement.addEventListener('click', function () {
                            // 移除點擊的元素
                            clonedElement.parentNode.removeChild(clonedElement);
                            });
                            ShoppingCart.appendChild(clonedElement);
                        }
                    });
                });
            </script>
        </asp:Panel>

        <asp:Panel ID="ThirdGamePane2" runat="server" Visible="false" ><%--遊戲三之二--%>
            <div class="GameLeft3_2"><%--左半邊題目--%>
                <p id="TotalMoney">一共是<span id="TotalMoney2"><%# Eval("pass_amount") %>&nbsp;&nbsp;&nbsp;&nbsp;</span>元</p> <%--結帳金額--%>
                <asp:Image ID="Clerk" runat="server" ImageUrl="images/game/game_clerk2.png"/>
                <asp:Button class="ButtonStyle3 ButtonSize2" ID="Correct2" runat="server" Text="完成"/>

                <div class="Checkout" id="Checkout">
                    <asp:Label ID="Label9" runat="server" Text="Label" Style="font-size: 80px; ">結帳區</asp:Label>
                </div>
            </div>
            
            <div class="Wallet"> <%--右半邊錢包--%>
                <asp:Image class="draggable" ID="Thousand" runat="server" alt="money1000" draggable="true" ImageUrl="images/game/money_1000.png"/>
                <asp:Image class="draggable" ID="FiveHundred" runat="server" alt="money500" draggable="true" ImageUrl="images/game/money_500.png"/>
                <asp:Image class="draggable" ID="Hundred" runat="server" alt="money100" draggable="true" ImageUrl="images/game/money_100.png"/>
                <asp:Image class="draggable" ID="Fifty" runat="server" alt="money50" draggable="true" ImageUrl="images/game/money_50.png"/>
                <asp:Image class="draggable" ID="Ten" runat="server" alt="money10" draggable="true" ImageUrl="images/game/money_10.png"/>
                <asp:Image class="draggable" ID="Five" runat="server" alt="money5" draggable="true" ImageUrl="images/game/money_5.png"/>
                <asp:Image class="draggable" ID="One" runat="server" alt="money1" draggable="true" ImageUrl="images/game/money_1.png"/>
            </div>

            <script type="text/javascript">
                document.addEventListener('DOMContentLoaded', function () {
                    var draggableElements = document.querySelectorAll('.draggable');
                    var Checkout = document.getElementById('Checkout');

                    draggableElements.forEach(function (draggable) {
                        draggable.addEventListener('dragstart', function (event) {
                            // 把拖曳的照片clone下來
                            var draggedElement = event.target.cloneNode(true);

                            // 把clone下的圖片加到'dragged-image'類別裡
                            draggedElement.classList.add('dragged-image');

                            // 把clone下的圖片加到body裡
                            document.body.appendChild(draggedElement);

                            // 設定拖曳和放下
                            event.dataTransfer.setData('text/plain', draggedElement.id);
                        });

                        draggable.addEventListener('dragend', function (event) {
                            // 滑鼠放開後要移除拖曳中的圖片
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
                            // 把正在拖曳的照片放到結帳區
                            var clonedElement = draggedElement.cloneNode(true);
                            clonedElement.classList.add('draggable-item');
                            clonedElement.addEventListener('click', function () {
                            // 移除點擊的元素
                            clonedElement.parentNode.removeChild(clonedElement);
                            });
                            Checkout.appendChild(clonedElement);
                        }
                    });
                });
            </script>
        </asp:Panel>
    </form>
</body>
</html>
