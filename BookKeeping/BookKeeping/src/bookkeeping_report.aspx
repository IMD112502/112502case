<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookkeeping_report.aspx.cs" Inherits="_BookKeeping.bookkeeping_report" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>記帳圖表</title>
</head>

<body class="BookBody">
	<form runat="server">
	<div class="BookContent">
		<div class="BookLeft">
			<div class="BookDate">
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button1" runat="server" Text="<" OnClick="MinusMonth_Click" CommandArgument="minus" />
				<asp:Label ID="Label1" runat="server"></asp:Label>
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button2" runat="server" Text=">" OnClick="PlusMonth_Click" CommandArgument="plus" />
			</div>

			<div class="BookTable">
				<asp:GridView class="Gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="num">

				<Columns>
					<asp:TemplateField HeaderText="日期">
						<ItemTemplate>
							<asp:Label ID="num" runat="server" Text='<%# Eval("num") %>' Visible="false"></asp:Label>
							<asp:Label ID="date" runat="server" Text='<%# Eval("date", "{0:yyyy-MM-dd}") %>'></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtdate" runat="server" Text='<%# Bind("date", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="類別">
						<ItemTemplate>
							<asp:Label ID="class" runat="server" Text='<%# Eval("class") %>'></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtclass" runat="server" Text='<%# Bind("class") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="花費">
						<ItemTemplate>
							<asp:Label ID="cost" runat="server" Text='<%# Eval("cost") %>'></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtcost" runat="server" Text='<%# Bind("cost") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField HeaderText="備註">
						<ItemTemplate>
							<asp:Label ID="mark" runat="server" Text='<%# Eval("mark") %>'></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtmark" runat="server" Text='<%# Bind("mark") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>

					<asp:TemplateField>
						<ItemTemplate>
							<asp:Button ID="btnEdit" runat="server" Text="編輯" CommandName="Edit" ToolTip="Edit" CommandArgument='<%# Eval("date") %>' />
							<asp:Button ID="btnDelete" runat="server" Text="刪除" CommandName="Delete" CommandArgument='<%# Eval("date") %>' OnClientClick="return confirm('確定要刪除該筆資料嗎？');" />
						</ItemTemplate>
						<EditItemTemplate>
							<asp:Button ID="btnSave" runat="server" Text="儲存" CommandName="Update" ToolTip="Update" CommandArgument='<%# Eval("date") %>' />
							<asp:Button ID="btnCancel" runat="server" Text="取消" CommandName="Cancel" ToolTip="Cancel" CommandArgument='<%# Eval("date") %>' />
						</EditItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
				<%--<asp:GridView class="Gridview" ID="GridView1" runat="server" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundField DataField="date" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"/>
						<asp:BoundField DataField="class" HeaderText="類別"/>
						<asp:BoundField DataField="cost" HeaderText="金額" />
						<asp:BoundField DataField="mark" HeaderText="備註"/>
					</Columns>
				</asp:GridView>--%>
			</div>

			<%--<div class="BookTotal">
				<asp:Label ID="Label2" runat="server" Text="總收入__元"></asp:Label>
				<asp:Label ID="Label3" runat="server" Text="總支出__元"></asp:Label>
			</div>--%>
		</div>

		<div class="BookRight">
		<asp:ImageButton class="BookmarkDown AddBookmark" ID="ImageButton2" runat="server" ImageUrl="images/boo/boo_button_add2.png" PostBackUrl="~/src/bookkeeping_add.aspx" />
		<asp:ImageButton class="BookmarkDown SearchBookmark" ID="ImageButton3" runat="server" ImageUrl="images/boo/boo_button_ser2.png" PostBackUrl="~/src/bookkeeping_search.aspx" />
		<asp:ImageButton class="BookmarkUp ReportBookmark" ID="ImageButton4" runat="server" ImageUrl="images/boo/boo_button_rep1.png" PostBackUrl="~/src/bookkeeping_report.aspx" />
		<h1 class="BookTitle">圖表分析</h1>
		<div class="BookChange">
			<asp:Chart ID="Chart1" runat="server">
				<Series>
					<asp:Series Name="Series1" ChartType="Pie">
						
					</asp:Series>
				</Series>
				<ChartAreas>
					<asp:ChartArea Name="ChartArea1"></asp:ChartArea>
				</ChartAreas>
			</asp:Chart>
		</div>
		</div>
	</div>
		<asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
	</form>
</body>
</html>