<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookkeeping_search.aspx.cs" Inherits="_BookKeeping.bookkeeping_search" %>
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
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button1" runat="server" Text="<" />
				<asp:Label ID="Label2" runat="server" Text="2023年4月"></asp:Label>
				<asp:Button class="ButtonStyle DateButtonSize" ID="Button2" runat="server" Text=">" />
			</div>

            <div class="BookTable">
                <asp:GridView class="Gridview" ID="GridView2" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="date" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"/>
						<asp:BoundField DataField="class" HeaderText="類別" />
						<asp:BoundField DataField="cost" HeaderText="金額" />
                    </Columns>
                </asp:GridView>
            </div>

			<div class="BookTotal">
				<asp:Label ID="Label3" runat="server" Text="總收入__元"></asp:Label>
				<asp:Label ID="Label4" runat="server" Text="總支出__元"></asp:Label>
			</div>
		</div>

        <div class="BookRight">
			<asp:ImageButton class="BookmarkDown AddBookmark" ID="ImageButton3" runat="server" ImageUrl="images/boo/boo_button_add2.png" PostBackUrl="~/src/bookkeeping_add.aspx" />
			<asp:ImageButton class="BookmarkUp SearchBookmark" ID="ImageButton4" runat="server" ImageUrl="images/boo/boo_button_ser1.png" PostBackUrl="~/src/bookkeeping_search.aspx" />
			<asp:ImageButton class="BookmarkDown ReportBookmark" ID="ImageButton5" runat="server" ImageUrl="images/boo/boo_button_rep2.png" PostBackUrl="~/src/bookkeeping_report.aspx" />
		<h1 class="BookTitle">查詢</h1>
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
			<asp:Label ID="Label1" runat="server" Text="日期"></asp:Label>
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
            <asp:TextBox class="TextBoxStyle" ID="TextBox4" type="text" runat="server" placeholder="請輸入關鍵字"></asp:TextBox>
            <br />
			<br />
			<asp:Button class="ButtonStyle ButtonSize1" ID="Button3" runat="server" Text="查詢" />
            
        </div>
        </div>
        </div>
		<asp:ImageButton class="Back" ID="ImageButton2" runat="server" ImageUrl="images/back.png" PostBackUrl="~/src/main.aspx" />
    </form>
</body>
</html>
