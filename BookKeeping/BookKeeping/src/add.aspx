<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="_BookKeeping.add" %>

<html>
<head>
	<meta charset="utf-8">
	<title>Add Form</title>
	<style>
        body {
            background-color: beige;
            font-family: Verdana, Arial;
            margin: 50px;
        }
        form {
            padding-top: 10px;
            padding-left: 100px;
        }
        .date {
            margin-left: 325px;
            margin-top: 100px;
        }
        .record {
            width: 400px;
            height: 50px;
            margin: 30px;
            margin-left: 100px;
            margin-top: 10px;
            border-top: 2px #003153 solid;
            border-bottom: 2px #003153 solid;
        }
        tr {
            letter-spacing: 10px;
        }
        .total {
            margin-top: 200px;
            margin-left: 450px;
        }
        .v-line {
            border-left: thick solid #000;
            height: 500px;
            left: 50%;
            margin-top: -20px;
            position: absolute;
        }
        .setting {
            margin-left: 1200px;
            margin-top: -450px;
        }
        .add {
            margin-left: 700px;
            margin-top: -30px;
        }
        #submit-button {
            margin-left: 2px;
        }
        #back-button {
            margin-left: 500px;
        }
        #add-button {
            width: 100px;
            height: 100px;
            background-image: url(C:\Users\user\OneDrive\桌面\專題112502\112502\小雞.jpg);
        }
        #reset-button {
            width: 150px;
        }
        #total-expenses-label {
            font-weight: bold;
        }
        #total-income-label {
            font-weight: bold;
        }
		table {
			border-collapse: collapse;
		}
		td {
			height: 100px;
			width: 100px;
			border: 1px solid black;
		}
		input[type="submit"] {
			width: 100px;
			height: 100px;
			background-image: url(C:\Users\user\OneDrive\桌面\專題112502\112502\小雞.jpg);
			border: none;
		}
		input[type="date"] {
			width: 150px;
			height: 25px;
			font-size: 16px;
			border-radius: 5px;
			border: none;
			padding: 5px;
			box-shadow: 1px 1px 3px gray;
		}
		input[type="reset"], input[type="submit"], input[type="button"] {
			width: 150px;
			height: 40px;
			font-size: 16px;
			color: white;
			background-color: #2196F3;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			box-shadow: 1px 1px 3px gray;
		}
		input[type="reset"]:hover, input[type="submit"]:hover, input[type="button"]:hover {
			background-color: #0D47A1;
		}
	</style>
</head>

<body>
    <div class="v-line"></div>
    <div class="date">
        <button> </button>
        <font size="4">2023年4月</font>
        <button> </button>
    </div>
    <div>
        <form action="" method="post">
            <table class="record" cellpadding="8" border="0">
                <tr>
                    <th>日期</th>
                    <th>類別</th>
                    <th>金額</th>
                </tr>
            </table>
        </form>
    </div>
    <div class="total">
        <p><label id="total-expenses-label" for="total-expenses">總收入：</label></p>
        <p><label id="total-income-label" for="total-income">總支出：</label></p>
    </div>
    <div class="setting">
        <p><button>設定</button></p>
        <p><button>任務</button></p>
    </div>
	<div class="add">
		<h1>新增</h1>
		<form>
			<table>
				<tr>
					<td><input type="submit" value=" "></td>
					<td><input type="submit" value=" "></td>
					<td><input type="submit" value=" "></td>
				</tr>
				<tr>
					<td><input type="submit" value=" "></td>
					<td><input type="submit" value=" "></td>
					<td><input type="submit" value=" "></td>
				</tr>
			</table>
			<p>
				<label for="start">日期：</label>
				<input type="date" id="start" name="trip-start"
				       value="2023-04-20"
				       min="2022-01-01" max="2024-12-31">
			</p>
			<p>
				<label for="cost">金額：</label>
				<input type="text" id="cost" name="cost" required>
			</p>
			<p>
				<input type="reset" value="重置" />
				<input type="submit" value="新增" />
			</p>
			<p>
				<input type="button" value="返回" onclick="history.back()">
			</p>
		</form>
	</div>
</body>
</html>








