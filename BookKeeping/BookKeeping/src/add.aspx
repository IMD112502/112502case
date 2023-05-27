<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="_BookKeeping.add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
	<link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>記帳新增</title>
</head>

<body class="boo_body">
	<form runat="server">
	<div class="book_content">
		<div class="boo_left">
			<div class="boo_date">
				<asp:Button class="boo_date_button" ID="Button1" runat="server" Text="<" style="width: 20px; height: 20px;" OnClick="MinusMonth_Click" CommandArgument="minus" />
				<asp:Label ID="Label1" runat="server"  style="font-size:30px;"></asp:Label>
				<asp:Button class="boo_date_button" ID="Button2" runat="server" Text=">" style="width: 20px; height: 20px;" OnClick="PlusMonth_Click" CommandArgument="plus" />
			</div>

			<div class="boo_table_block">
				<asp:GridView class="gridview" ID="GridView1" runat="server" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundField DataField="date" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"/>
						<asp:BoundField DataField="class" HeaderText="類別" />
						<asp:BoundField DataField="cost" HeaderText="金額" />
					</Columns>
				</asp:GridView>
			</div>

			<div class="boo_total">
				<asp:Label ID="Label2" runat="server" Text="總收入__元"></asp:Label>
				<asp:Label ID="Label3" runat="server" Text="總支出__元"></asp:Label>
			</div>
		</div>

		<div class="boo_right">
		<asp:ImageButton class="add_bookmark1" ID="ImageButton2" runat="server" ImageUrl="images/boo/boo_button_add1.png" height="80px" width="80px" PostBackUrl="~/src/add.aspx" />
		<asp:ImageButton class="add_bookmark2" ID="ImageButton3" runat="server" ImageUrl="images/boo/boo_button_ser2.png" height="44.27px" width="80px" PostBackUrl="~/src/search.aspx" />
		<asp:ImageButton class="add_bookmark3" ID="ImageButton4" runat="server" ImageUrl="images/boo/boo_button_rep2.png" height="44.27px" width="80px" PostBackUrl="~/src/report.aspx" />
		<h1 style="text-align: center; margin-top: 20px;">新增</h1>
		<div class="boo_add">
			<div class="c_container">
				<p>選擇類別</p>
				<br />
				<div class="radio-buttons">
					<label class="custom-radio">
						<input type="radio" name="radio" value="願望" checked="checked" />
						<span class="radio-btn">
							<i class="las la-check">v</i>
							<div class="hobbies-icon" style="background:url('images/c_dre.png');">
								<i class="las la-biking"></i>
								<h3>願望</h3>
							</div>
						</span>
					</label>
					<label class="custom-radio">
						<input type="radio" name="radio" value="飲食" />
						<span class="radio-btn"
							><i class="las la-check">v</i>
							<div class="hobbies-icon">
								<i class="las la-futbol"></i>
								<h3>飲食</h3>
							</div>
						</span>
					</label>
					<label class="custom-radio">
						<input type="radio" name="radio" value="娛樂"/>
						<span class="radio-btn"
							><i class="las la-check">v</i>
							<div class="hobbies-icon">
								<i class="las la-table-tennis"></i>
								<h3>娛樂</h3>
							</div>
						</span>
					</label>
					<label class="custom-radio">
						<input type="radio" name="radio" value="其他"/>
						<span class="radio-btn"
							><i class="las la-check">v</i>
							<div class="hobbies-icon">
								<i class="las la-ellipsis-h"></i>
								<h3>其他</h3>
							</div>
						</span>
					</label>
				</div>
			</div>
			<br />
			<br />
			<asp:Label ID="Label4" runat="server" Text="日期"></asp:Label>
			<input type="date" id="start" name="date"
               value="2023-04-20"
               min="2022-01-01" max="" />
			<script>
				document.getElementById("start").value = '<%= DateTime.Now.ToString("yyyy-MM-dd") %>';
				var today = new Date().toISOString().split('T')[0];
                document.getElementById("start").max = today;
            </script>
			<br />
			<br />
			<asp:Label ID="Label5" runat="server" Text="金額"></asp:Label>
			<asp:TextBox type="money" ID="TextBox1" runat="server"></asp:TextBox>
			<br />
			<br />
			<asp:Label ID="Label6" runat="server" Text="備註"></asp:Label>
			<asp:TextBox type="memo" ID="TextBox2" runat="server"></asp:TextBox>
			<br />
			<br />
			<br />
			<input class="reset" type="reset" value="重新輸入" />
			<asp:Button class="add" ID="Button3" runat="server" Text="確定新增" OnClick="Submit_Click" />
		</div>
		</div>
	</div>
		<asp:ImageButton class="back" ID="ImageButton1" runat="server" ImageUrl="images/back.png" height="80px" width="80px" PostBackUrl="~/src/main.aspx" />
	</form>
</body>
</html>








