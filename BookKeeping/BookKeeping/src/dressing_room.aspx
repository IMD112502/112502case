<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dressing_room.aspx.cs" Inherits="BookKeeping.src.dressing_room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>更衣室</title>
    <style type="text/css">
        #Button2 {
            height: 60px;
            width: 100px;
        }
        #Button1 {
            height: 60px;
            width: 100px;
        }
    </style>
</head>
<body class="c_background">
    <form id="form1" runat="server">
        <div class="settinggg" style="height: 200px; width: 100px;"><%--任務&設定--%>
            <asp:ImageButton ID="setting" runat="server" ImageUrl="images/setting.png" Height="100px" Width="100px" />
            <br />
            <asp:ImageButton ID="ach" runat="server" ImageUrl="images/ach.png" Height="100px" Width="100px" />
        </div>
        <div class="cloth" style="height: 880px; width: 515px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="55px" Height="50px" Text="上衣" Style="padding-left: 20px; color:blanchedalmond;"></asp:Label>
            <asp:Image ID="pbhair" runat="server" ImageUrl="images\cloth\backhair\backhair_5.png"/>
            <asp:ImageButton ID="bbb" runat="server" ImageUrl="images\cloth\body.png"/>
            <asp:Image ID="sss" runat="server" ImageUrl="images\cloth\shoes\shoes_3.png"/>
            <asp:Image ID="ppp" runat="server" ImageUrl="images\cloth\bottom\bottom_4.png"/>
            <asp:Image ID="ccc" runat="server" ImageUrl="images\cloth\top\top_6.png"/>
            <asp:Image ID="hhh" runat="server" ImageUrl="images\cloth\hands.png"/>
            <asp:Image ID="pshair" runat="server" ImageUrl="images\cloth\sideburns\sideburns_2.png"/>
            <asp:Image ID="pfhair" runat="server" ImageUrl="images\cloth\fringe\fringe_3.png"/>
            <asp:Image ID="peyes" runat="server" ImageUrl="images\cloth\eyes\eyes_1.png"/>
            <asp:Image ID="eeyes" runat="server" ImageUrl="images\cloth\eyebrows\eyebrows_4.png"/>
            <asp:Image ID="pmouth" runat="server" ImageUrl="images\cloth\mouth\mouth_2.png"/>
            <asp:Image ID="pglasses" runat="server" ImageUrl="images\cloth\glasses\glasses_4.png"/>


            <input id="top" class="c_button" type="button" value="上衣" />
            <input id="pents" class="c_button" type="button" value="下身"/>

            <br />
            <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" style="margin-left:30px; margin-top:30px;" ImageUrl="images\cloth\top\top_1.png"/>
            <asp:Image ID="Image2" runat="server" Height="200px" Width="200px" style="margin-left:30px; margin-top:30px;" ImageUrl="images\cloth\top\top_2.png"/>
            <input id="dress" class="c_button" type="button" value="套裝" />
            <input id="hat" class="c_button" type="button" value="帽子" />

            <br />
            <asp:Image ID="Image3" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_3.png"/>
            <asp:Image ID="Image4" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_4.png"/>
            <input id="shoes" class="c_button" type="button" value="鞋子" />
            <input id="socks" class="c_button" type="button" value="襪子" />

            <br />
            <asp:Image ID="Image5" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_5.png"/>
            <asp:Image ID="Image6" runat="server" Height="200px" Width="200px" style="margin-left:30px;" ImageUrl="images\cloth\top\top_6.png"/>
            <input id="eyes" class="c_button" type="button" value="眼睛" />
            <input id="mouth" class="c_button" type="button" value="嘴巴" />
            <input id="hair" class="c_button" type="button" value="頭髮" />
            <input id="earring" class="c_button" type="button" value="飾品" />
        </div>
        <div>
        </div>
        <div class="sssright" style="width: 410px; height: 90px;">
            <input id="aa" class="c_button" type="button" value="取消修改" style="font-size: 20px;"/>
            <input id="bb" class="c_button" type="button" value="確認更換" style="font-size: 20px;"/>
		    <asp:ImageButton class="backk" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px"  PostBackUrl="~/src/main.aspx" />
        </div>
    </form>
</body>
</html>

