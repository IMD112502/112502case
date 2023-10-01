<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setting_edit.aspx.cs" Inherits="BookKeeping.src.setting_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>設定</title>
</head>
<body class="SetBody">
    <form class="SetForm" id="form2" runat="server">
        <h1 class="SetTitle">個人資料</h1>
        <div class="SetContent">
            <p>
                <label>姓名 </label>
                <asp:TextBox class="SetTextBoxStyle" ID="SetName" runat="server" placeholder="原姓名"></asp:TextBox>
            </p>
            <p>
                <label>暱稱 </label>
                <asp:TextBox class="SetTextBoxStyle" ID="SetNickname" runat="server" placeholder="原暱稱"></asp:TextBox>
            </p>
            <p>
                <label>性別 </label>            
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="gendergroup" OnCheckedChanged="RadioButton1_CheckedChanged" Text="男生" />
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gendergroup" OnCheckedChanged="RadioButton2_CheckedChanged" Text="女生" />
            </p>
            <p>
                <label>帳號 </label>
                <asp:TextBox class="SetTextBoxStyle" ID="TextBox1" runat="server" placeholder="原帳號"></asp:TextBox>
            </p>
            <p>
                <label>生日 </label>
                <asp:TextBox class="SetTextBoxStyle" ID="TextBox2" runat="server" Width="100px" placeholder="0000"></asp:TextBox>
                <label>/</label>
                <asp:TextBox class="SetTextBoxStyle" ID="TextBox3" runat="server" Width="50px" placeholder="00"></asp:TextBox>
                <label>/</label>
                <asp:TextBox class="SetTextBoxStyle" ID="TextBox4" runat="server" Width="50px" placeholder="00"></asp:TextBox>
            </p>
        </div>
        <asp:ImageButton class="Avatar" ID="Avatar" runat="server" ImageUrl="images/avatar/ava_girl.png" PostBackUrl="~/src/avatar.aspx" />
        <asp:Button class="ButtonStyle ButtonSize3" ID="Xx" runat="server" Text="X" PostBackUrl="~/src/main.aspx"/>
        <asp:Button class="ButtonStyle ButtonSize2" ID="GoBack" runat="server" Text="返回" PostBackUrl="~/src/setting.aspx"/>
        <asp:Button class="ButtonStyle ButtonSize2" ID="EditOk" runat="server" Text="確認修改" PostBackUrl="~/src/setting.aspx"/>
        <asp:ImageButton class="Back" ID="ImageButton2" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" /><%--返回鍵--%>
    </form>
</body>
</html>
