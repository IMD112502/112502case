﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookkeeping_search.aspx.cs" Inherits="_BookKeeping.bookkeeping_search" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>記帳查詢</title>
</head>

<body class="BookBody">
    <form id="form1" runat="server">
        <div class="BookContent">
		<div class="BookLeft">
			<div class="BookDate">
				<%--<asp:Button class="ButtonStyle DateButtonSize" ID="Button1" runat="server" Text="<" OnClick="MinusMonth_Click" CommandArgument="minus" />
				<asp:Label ID="Label1" runat="server"></asp:Label>
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button2" runat="server" Text=">" OnClick="PlusMonth_Click" CommandArgument="plus" />--%>
<%--				<asp:Button class="ButtonStyle EditButton" ID="Button4" runat="server" Text="編輯" OnClick="PlusMonth_Click" PostBackUrl="~/src/bookkeeping_edit.aspx" />--%>
			</div>

			<div class="BookTable">
				<asp:GridView class="Gridview" ID="SearchView" runat="server" AutoGenerateColumns="False" DataKeyNames="num" >
					<Columns>
						<asp:BoundField DataField="date" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"/>
						<asp:BoundField DataField="class" HeaderText="類別"/>
						<asp:BoundField DataField="cost" HeaderText="金額" />
						<asp:BoundField DataField="mark" HeaderText="備註"/>
					</Columns>
				</asp:GridView>
			</div>

			<%--<div class="BookTotal">
				<asp:Label ID="Label2" runat="server" Text="總收入__元"></asp:Label>
				<asp:Label ID="Label3" runat="server" Text="總支出__元"></asp:Label>
			</div>--%>
		</div>

        <div class="BookRight">
			<asp:ImageButton class="BookmarkDown AddBookmark" ID="ImageButton3" runat="server" ImageUrl="images/boo/boo_button_add2.png" PostBackUrl="~/src/bookkeeping_add.aspx" />
			<asp:ImageButton class="BookmarkUp SearchBookmark" ID="ImageButton4" runat="server" ImageUrl="images/boo/boo_button_ser1.png" PostBackUrl="~/src/bookkeeping_search.aspx" />
			<asp:ImageButton class="BookmarkDown ReportBookmark" ID="ImageButton5" runat="server" ImageUrl="images/boo/boo_button_rep2.png" PostBackUrl="~/src/bookkeeping_report.aspx" />
		<h1 class="BookTitle">查詢</h1>
        <div class="BookChange">
            <div class="SortContainer">
				<asp:DropDownList ID="DropDownList1" runat="server">
					<asp:ListItem Text="---" Value="all"  />
					<asp:ListItem Text="願望" Value="願望"  />
					<asp:ListItem Text="飲食" Value="飲食" />
					<asp:ListItem Text="娛樂" Value="娛樂" />
					<asp:ListItem Text="其他" Value="其他" />

				</asp:DropDownList>
				</div>
			</div>
			<br />
			<br />
			<asp:Label ID="Label2" runat="server" Text="日期"></asp:Label>
			<input type="date" id="Start" name="date"
               value="2023-04-20"
               min="2022-01-01" max="" />
			<script>
                document.getElementById("Start").value = '<%= DateTime.Now.ToString("yyyy-MM-dd") %>';
                var today = new Date().toISOString().split('T')[0];
                document.getElementById("Start").max = today;
            </script>
			<br />
			<br />
            <asp:Label ID="Label10" runat="server" Text="查詢"></asp:Label>
            <asp:TextBox class="TextBoxStyle" ID="TxtBox" type="text" runat="server" placeholder="請輸入關鍵字"></asp:TextBox>
            <br />
			<br />
			<asp:Button class="ButtonStyle ButtonSize1" ID="Button3" runat="server" Text="查詢" OnClick="Search_Click"/>
            
        </div>
        </div>
		<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
		<asp:ImageButton class="Back" ID="ImageButton2" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
