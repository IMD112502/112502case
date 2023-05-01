<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="_BookKeeping.achievement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>成就</title>
</head>
<body class="ach_body">
    <form id="form1" runat="server">
        <div class="ach_header">
            <h1><asp:Label class="tit" ID="Label1" runat="server" Text="成就"></asp:Label></h1>
            <div class="ach_top_button2">
                <asp:Button class="ach_top_button" ID="Button1" runat="server" Text="已完成" style="width:150px;height:30px;margin-left:-160px;"/>
                <asp:Button class="ach_top_button" ID="Button2" runat="server" Text="未完成" style="width:150px;height:30px;"/>
            </div>
        </div>

        <div class="ach_content">
            <ul>
                <li>
                  <asp:Image ID="Image1" runat="server" ImageUrl="images/clothing1.png" />
                  <asp:Label class="ach_tit" runat="server" Text="記帳小達人" ></asp:Label>
                  <br />
                  <asp:Label class="ach_con" runat="server" Text="累計記帳11次" ></asp:Label>
                  <br />
                  <asp:Button class="ach_button_get" ID="Button3" runat="server" Text="領取" />
                  <br />
                  <div class="literal">
                  <asp:Literal ID="Literal1" runat="server"><progress value="10" max="100" style ="margin-left:50px;"></progress></asp:Literal><%--literal控制項可以寫html語法--%>
                  </div>
                </li>
                <li>
                  <asp:Image ID="Image2" runat="server" ImageUrl="images/clothing2.png" />
                  <asp:Label class="ach_tit" runat="server" Text="記帳小達人" ></asp:Label>
                  <br />
                  <asp:Label class="ach_con" runat="server" Text="累計記帳20次" ></asp:Label>
                  <br />
                  <asp:Button class="ach_button_get" ID="Button4" runat="server" Text="領取" />
                  <br />
                  <div class="literal">
                  <asp:Literal ID="Literal2" runat="server"><progress value="10" max="100" style ="margin-left:50px;"></progress></asp:Literal><%--literal控制項可以寫html語法--%>
                  </div>
                </li>
                <li>
                  <asp:Image ID="Image3" runat="server" ImageUrl="images/clothing3.png" />
                  <asp:Label class="ach_tit" runat="server" Text="記帳小達人" ></asp:Label>
                  <br />
                  <asp:Label class="ach_con" runat="server" Text="累計記帳30次" ></asp:Label>
                  <br />
                  <asp:Button class="ach_button_get" ID="Button5" runat="server" Text="領取" />
                  <br />
                  <div class="literal">
                  <asp:Literal ID="Literal3" runat="server"><progress value="10" max="100" style ="margin-left:50px;"></progress></asp:Literal><%--literal控制項可以寫html語法--%>
                  </div>
                </li>
                <li>
                  <asp:Image ID="Image4" runat="server" ImageUrl="images/clothing4.png" />
                  <asp:Label class="ach_tit" runat="server" Text="記帳小達人" ></asp:Label>
                  <br />
                  <asp:Label class="ach_con" runat="server" Text="累計記帳40次" ></asp:Label>
                  <br />
                  <asp:Button class="ach_button_get" ID="Button6" runat="server" Text="領取" />
                  <br />
                  <div class="literal">
                  <asp:Literal ID="Literal4" runat="server"><progress value="10" max="100" style ="margin-left:50px;"></progress></asp:Literal><%--literal控制項可以寫html語法--%>
                  </div>
                </li>
            </ul>
        </div>
        <div class="back">
              <asp:ImageButton class="back1" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" />
        </div> 
    </form>
</body>
</html>
