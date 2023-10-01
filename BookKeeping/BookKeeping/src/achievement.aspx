<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="_BookKeeping.achievement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>成就</title>
    <style>
        /* 添加進度條的樣式 */
        .progress {
            width: 30%;
            height: 20px;
            background-color: #ccc;
            position: relative;
        }

        .progress-bar {
            width: 0;
            height: 100%;
            background-color: #4CAF50;
        }
    </style>
</head>
<body class="AchBody">
    <form id="Form1" runat="server">

        <div class="AchHeader">
            <h1><asp:Label class="AchTopTitle" ID="Label1" runat="server" Text="成就"></asp:Label></h1>
            <div class="AchTopButton">
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button1" runat="server" Text="已完成" style="margin-left:-160px;"/>
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button2" runat="server" Text="未完成" />
            </div>
        </div>

        <%--<div class="AchContent">
            <ul>
                <li>
                  <asp:Image ID="Image1" runat="server" ImageUrl="images/clothing1.png" />
                  <asp:Label class="AchTit" runat="server" Text="記帳小達人" ></asp:Label>
                  <br />
                  <asp:Label class="AchCon" ID="AchCon1" runat="server" Text="累計記帳11次" ></asp:Label>
                  <asp:Label class="count" ID ="count1" runat="server" ></asp:Label>
                  <br />
                  <asp:Button class="AchButtonGet ButtonStyle" ID="Button3" runat="server" Text="領取" />
                  <br />
                  <div class="Literal">
                  <asp:Literal ID="Literal1" runat="server"><progress value="10" max="100" style ="margin-left:50px;"></progress></asp:Literal>
                </div>
                    </li>--%>
                
               <asp:Repeater ID="TaskRepeater" runat="server">
                <ItemTemplate>
                    <div>
                        <!-- 左側圖片（可自行添加圖片的URL） -->
                        <img src="your_image_url.jpg" alt="Task Image" />

                        <!-- 任務主題 -->
                        <h3><%# Eval("TaskName") %></h3>

                        <!-- 任務內容 -->
                        <p><%# Eval("TaskDescription") %></p>

                        <!-- 進度條 -->
                        <div class="progress">
                            <div class="progress-bar" style='<%# Eval("ProgressBarStyle") %>'></div>
                        </div>

                        <!-- 領取按鈕（僅在達成條件時顯示） -->
                        <asp:Button  class="AchButtonGet ButtonStyle"  ID="ClaimButton" runat="server" Text="領取" CommandName="ClaimTask" CommandArgument='<%# Eval("TaskID") %>' Visible='<%# Convert.ToBoolean(Eval("IsTaskCompleted")) %>' OnClick="ClaimButton_Click" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
