<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game_third.aspx.cs" Inherits="BookKeeping.src.game_third" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>題型三-認識錢幣</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
         <asp:Panel ID="ThirdGamePanel1" runat="server"><%--遊戲三之一--%>
            <div class="GameLeft3_1"><%--左半邊題目--%>
                <div class="SisQ" draggable="true" id='<%# Eval("SisRandomNumber") %>'>
                        <asp:Image ID="Image9" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_sis.png" />
                        <span><%# Eval("SisRandomNumber") %></span>
                    </div>

                    <div class="GlueQ" draggable="true" id='<%# Eval("GlueRandomNumber") %>'>
                        <asp:Image ID="Image10" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_glue.png" />
                        <span><%# Eval( "GlueRandomNumber") %></span>
                    </div>

                    <div class="CorQ" draggable="true" id='<%# Eval("CorRandomNumber") %>'>
                        <asp:Image ID="Image11" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_cor.png" />
                        <span><%# Eval("CorRandomNumber") %></span>
                    </div>

                    <div class="RulerQ" draggable="true" id='<%# Eval("RulerRandomNumber") %>'>
                        <asp:Image ID="Image12" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_ruler.png" />
                        <span><%# Eval("RulerRandomNumber") %></span>
                    </div>

                    <div class="RedQ" draggable="true" id='<%# Eval("RedRandomNumber") %>'> 
                        <asp:Image ID="Image13" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_red.png" />
                        <span><%# Eval("RedRandomNumber") %></span>
                    </div>

                    <div class="GreenQ" draggable="true" id='<%# Eval("GreenRandomNumber") %>'>
                        <asp:Image ID="Image14" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_green.png" />
                        <span><%# Eval("GreenRandomNumber") %></span>
                    </div>

                    <div class="BlueQ" draggable="true" id='<%# Eval("BlueRandomNumber") %>'>
                        <asp:Image ID="Image15" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_blue.png" />
                        <span><%# Eval("BlueRandomNumber") %></span>
                    </div>

                    <div class="BlackQ" draggable="true" id='<%# Eval("BlackRandomNumber") %>'>
                        <asp:Image ID="Image16" runat="server" Height="168px" Width="88px" ImageUrl="images/game/game3_black.png" />
                        <span><%# Eval("BlackRandomNumber") %></span>
                    </div>
            </div>
              </asp:Panel>
         </ItemTemplate>
        </asp:Repeater>

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
            <asp:Button class="ButtonStyle3 ButtonSize3" ID="Correct1" runat="server" Text="V" OnClientClick="checkCart()"/>
               <asp:Label ID="ResultLabel" runat="server" Text="" />

            <script type="text/javascript">
                var itemQuantities = {
                    "Redd": 0,
                    "Greenn": 0,
                    "Bluee": 0,
                    "Blackk": 0,
                    "Siss": 0,
                    "Gluee": 0,
                    "Corr": 0,
                    "Rulerr": 0,
                };

                window.onload = function () {
                    var draggableElements = document.querySelectorAll('.draggable');
                    var ShoppingCart = document.getElementById('ShoppingCart');
                    console.log('題目數量：', questionQuantities);

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

                    ShoppingCart.addEventListener('dragover', function (event) {
                        event.preventDefault();
                    });

                    ShoppingCart.addEventListener('drop', function (event) {
                        event.preventDefault();
                        var data = event.dataTransfer.getData('text/plain');
                        var draggedElement = document.getElementById(data);
                        console.log("拖曳的為" + draggedElement.id);

                        if (draggedElement && draggedElement.classList.contains('draggable')) {
                            if (isNaN(itemQuantities[draggedElement.id])) {
                                itemQuantities[draggedElement.id] = 0;
                            }

                            itemQuantities[draggedElement.id]++;
                            console.log(itemQuantities[draggedElement.id]);

                            var clonedElement = draggedElement.cloneNode(true);
                            clonedElement.classList.add('draggable-item');
                            clonedElement.addEventListener('click', function () {
                                clonedElement.parentNode.removeChild(clonedElement);
                                if (!isNaN(itemQuantities[draggedElement.id])) {
                                    itemQuantities[draggedElement.id]--;
                                }
                            });
                            ShoppingCart.appendChild(clonedElement);
                        }
                    });
                };

                function checkCart() {
                    var itemsInCart = document.querySelectorAll('.draggable-item');
                    console.log('購物車中的物品：');

                    itemsInCart.forEach(function (item) {
                        var itemName = item.id;
                        console.log(itemName + ' - 數量: ' + itemQuantities[itemName]);
                    });

                    var correct = true;

                    for (var itemName in questionQuantities) {
                        if (questionQuantities.hasOwnProperty(itemName)) {
                            var questionQuantity = questionQuantities[itemName];
                            var itemQuantity = itemQuantities[itemName] || 0;

                            console.log(itemName + ' - 預期數量: ' + questionQuantity + ', 實際數量: ' + itemQuantity);

                            if (itemQuantity !== questionQuantity) {
                                correct = false;
                                break;
                            }
                        }
                    }

                    if (correct) {
                        alert('文具數量正確！');
                    } else {
                        alert('文具數量不正確，請檢查！');
                    }
                }
            </script>
    </form>
</body>
</html>