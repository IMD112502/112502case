<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="_BookKeeping.add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
	<link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>記帳 新增</title>
	<style>
        
	</style>
</head>

<body class="boo_body">
	<form runat="server">
	<div class="book_content">
		<div class="boo_left">
			<div class="boo_date">
				<button class="boo_date_button" style="width: 20px; height: 20px;"><</button>
				<p style="font-size:30px;">2023年4月</p>
				<button class="boo_date_button" style="width: 20px; height: 20px;">></button>
			</div>
			<div class="boo_table_block">
					<table class="boo_table" cellpadding="8" border="0">
						<tr>
							<th>日期</th>
							<th>類別</th>
							<th>金額</th>
							<th>備註</th>
						</tr>
						<tr>
							<td>04/01</td>
							<td>願望</td>
							<td>+$20</td>
							<td></td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/01</td>
							<td>願望</td>
							<td>+$20</td>
							<td></td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/01</td>
							<td>願望</td>
							<td>+$20</td>
							<td></td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/01</td>
							<td>願望</td>
							<td>+$20</td>
							<td></td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr><tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr><tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
						<tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr><tr>
							<td>04/02</td>
							<td>娛樂</td>
							<td>-$100</td>
							<td>湯姆熊</td>
						</tr>
					</table>
			</div>
			<div class="boo_total">
				<p><label id="total-expenses-label" for="total-expenses">總收入__元</label></p>
				<p><label id="total-income-label" for="total-income">總支出__元</label></p>
			</div>
		</div>

		<div class="boo_right">
		<h1 style="text-align: center; margin-top: 20px;">新增</h1>
		<div class="boo_add">
			<div class="main-container">
				<p>選擇類別</p>
				<br />
				<div class="radio-buttons">
					<label class="custom-radio">
						<input type="radio" name="radio" checked />
						<span class="radio-btn">
							<i class="las la-check">v</i>
							<div class="hobbies-icon" style="background:url('images/c_dre.png');">
								<i class="las la-biking"></i>
								<h3>願望</h3>
							</div>
						</span>
					</label>
					<label class="custom-radio">
						<input type="radio" name="radio" />
						<span class="radio-btn"
							><i class="las la-check">v</i>
							<div class="hobbies-icon">
								<i class="las la-futbol"></i>
								<h3>飲食</h3>
							</div>
						</span>
					</label>
					<label class="custom-radio">
						<input type="radio" name="radio" />
						<span class="radio-btn"
							><i class="las la-check">v</i>
							<div class="hobbies-icon">
								<i class="las la-table-tennis"></i>
								<h3>娛樂</h3>
							</div>
						</span>
					</label>
					<label class="custom-radio">
						<input type="radio" name="radio" />
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
			<label for="start">日期：</label>
			<input type="date" id="start" name="trip-start" value="2023-04-20" min="2022-01-01" max="2024-12-31">
			<br />
			<br />
			<label for="cost">金額：</label>
			<input type="text" id="cost" name="cost" required>
			<br />
			<br />
			<br />
			<input type="reset" value="重置" />
			<input type="submit" value="新增" />
		</div>
		</div>
	</div>
	</form>
</body>
</html>








