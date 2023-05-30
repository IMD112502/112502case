<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="_BookKeeping.edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>記帳編輯</title>
    <style type="text/css">
    </style>
</head>

<body class="BookBody">
	<form runat="server">
	<div class="BookContent">
		<div class="BookLeft">
			<div class="BookDate">
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button1" runat="server" Text="<" />
				<asp:Label ID="Label1" runat="server" Text="2023年5月"></asp:Label>
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button2" runat="server" Text=">" />
			</div>

			<div class="BookTable">
				<asp:GridView class="Gridview" ID="GridView1" runat="server" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundField DataField="date" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"/>
						<asp:BoundField DataField="class" HeaderText="類別" />
						<asp:BoundField DataField="cost" HeaderText="金額" />
					</Columns>
				</asp:GridView>
			</div>

			<div class="BookTotal">
				<asp:Label ID="Label2" runat="server" Text="總收入__元"></asp:Label>
				<asp:Label ID="Label3" runat="server" Text="總支出__元"></asp:Label>
			</div>
		</div>

		<div class="BookRight">
		<asp:ImageButton class="BookmarkDown AddBookmark" ID="ImageButton2" runat="server" ImageUrl="images/boo/boo_button_add2.png" PostBackUrl="~/src/add.aspx" />
		<asp:ImageButton class="BookmarkDown SearchBookmark" ID="ImageButton3" runat="server" ImageUrl="images/boo/boo_button_ser2.png" PostBackUrl="~/src/search.aspx" />
		<asp:ImageButton class="BookmarkDown ReportBookmark" ID="ImageButton4" runat="server" ImageUrl="images/boo/boo_button_rep2.png" PostBackUrl="~/src/report.aspx" />
		<h1 class="BookTitle">編輯</h1>
		<div class="BookChange">
			<div class="SortContainer">
				<p>選擇類別</p>
				<br />
				<div class="RadioButtons">
					<label class="SortRadio">
						<input type="radio" name="radio" value="願望" checked="checked" />
						<span class="RadioBtn">
							<i>v</i>
							<div class="SortIcon" style="background:url('images/c_dre.png');">
								<i></i>
								<h3>願望</h3>
							</div>
						</span>
					</label>
					<label class="SortRadio">
						<input type="radio" name="radio" value="飲食" />
						<span class="RadioBtn">
							<i>v</i>
							<div class="SortIcon">
								<i></i>
								<h3>飲食</h3>
							</div>
						</span>
					</label>
					<label class="SortRadio">
						<input type="radio" name="radio" value="娛樂"/>
						<span class="RadioBtn">
							<i>v</i>
							<div class="SortIcon">
								<i></i>
								<h3>娛樂</h3>
							</div>
						</span>
					</label>
					<label class="SortRadio">
						<input type="radio" name="radio" value="其他"/>
						<span class="RadioBtn">
							<i>v</i>
							<div class="SortIcon">
								<i></i>
								<h3>其他</h3>
							</div>
						</span>
					</label>
				</div>
			</div>
			<br />
			<br />
			<asp:Label ID="Label4" runat="server" Text="日期"></asp:Label>
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
			<asp:Label ID="Label5" runat="server" Text="金額"></asp:Label>
			<asp:TextBox class="TextBoxStyle" type="text" ID="TextBox1" runat="server"></asp:TextBox>
			<br />
			<br />
			<asp:Label ID="Label6" runat="server" Text="備註"></asp:Label>
			<asp:TextBox class="TextBoxStyle" type="text" ID="TextBox2" runat="server"></asp:TextBox>
			<br />
			<br />
			<br />
			<input class="ButtonStyle ButtonSize1" type="reset" value="重新輸入" />
			<asp:Button class="ButtonStyle ButtonSize1" ID="Button4" runat="server" Text="確定修改" />
		</div>
		</div>
	</div>
		<asp:ImageButton class="Back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
	</form>
</body>
</html>








