<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="_BookKeeping.achievement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>成就</title>
    <style>
       
        /* 定義任務容器 */
        .task-container {
            display: flex; /* 使用 Flexbox 佈局 */
            align-items: center; /* 垂直置中對齊 */
            margin-bottom: 20px; /* 底邊距，控制每個任務之間的間距 */
        }

        /* 左側圖片 */
        .task-image {
            flex: 1; /* 占用可用空間的一部分，使圖片在左側 */
            width: 180px; /* 指定圖片的寬度 */
            height: 155px; /* 指定圖片的高度 */
            object-fit: cover; /* 調整圖片以填滿指定的寬度和高度 */
        }

        /* 任務內容 */
        .task-content {
            flex: 2.3; /* 占用可用空間的一部分，使任務內容在中間 */
            padding: 10px; /* 內邊距，增加內容區塊的間距 */
        }

        /* 進度條 */
        .progress {
            width: 250px;
            height: 20px;
            background-color: #ccc;
            border: 1px solid #333;
        }

        .progress-bar {
            width: 50%; /* 進度條的填充寬度（根據任務完成進度設定） */
            height: 100%;
            background-color: #007bff;
        }

        /* 領取按鈕 */
        .claim-button {
            flex: 0.5; /* 占用可用空間的一部分，使按鈕在右側 */
            text-align: center; /* 文字置中 */
            width:5px;
            height:50%;
            
        }
    </style>
</head>
<body class="AchBody">
    <form id="Form1" runat="server">

        <div class="AchHeader">
            <h1><asp:Label class="AchTopTitle" ID="Label1" runat="server" Text="成就"></asp:Label></h1>
            <div class="AchTopButton">
                <asp:Button class="ButtonStylePick ButtonSize1" ID="Button1" runat="server" Text="未完成" style="margin-left:-160px;"/>
                <asp:Button class="ButtonStyle ButtonSize1" ID="Button2" runat="server" Text="已完成"  PostBackUrl="~/src/finishAch.aspx"/>
            </div>
        </div>

        <%--<div class="AchContent">
            <ul>
                <li>
                  <asp:Image ID="Image1" runat="server" ImageUrl="images/cloth/head_g1.png" />
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
         <div class="AchContent">
    <asp:Repeater ID="TaskRepeater" runat="server">
        <ItemTemplate>
            <div class="task-container">
                <!-- 左側圖片 -->
                <asp:Image CssClass="task-image" ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText="Task Image" Width="180" Height="155" />

                <!-- 任務內容 -->
                <div class="task-content">
                    <!-- 任務主題 -->
                    <h3 style="font-size: 25px;"><%# Eval("TaskName") %></h3>
                    <!-- 任務內容 -->
                    <p><%# Eval("TaskDescription") %></p>
                    <!-- 進度條 -->
                    <div class="progress">
                        <div class="progress-bar" style='<%# Eval("ProgressBarStyle") %>'></div>
                    </div>
                </div>

                <!-- 領取按鈕（僅在達成條件時顯示） -->
                <asp:Button CssClass="ButtonStyle3 ButtonSize2 claim-button" ID="ClaimButton" runat="server" Text="領取" CommandName="ClaimTask" CommandArgument='<%# Eval("TaskID") %>' Visible='<%# Convert.ToBoolean(Eval("IsTaskCompleted")) %>' OnClick="ClaimButton_Click" style='<%# Convert.ToBoolean(Eval("IsTaskCompleted")) ? "" : "display:none;" %>' />

            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

        <asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
