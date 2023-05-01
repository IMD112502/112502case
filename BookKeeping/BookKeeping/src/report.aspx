<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="_BookKeeping.report" %>

<!DOCTYPE html>

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
            width: 548px;
            height: 489px;
            margin-left: 0px;
            margin-bottom: 0px;
        }
        .date {
            margin-left: 225px;
            margin-top: 34px;
            width: 161px;
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
            margin-top: 290px;
            margin-left: 324px;
            margin-bottom: 3px;
        }
        .v-line {
            border-left: thick solid #000;
            height: 500px;
            left: 132%;
            margin-top: -20px;
            position: absolute;
            top: 68px;
            width: 612px;
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
    <form id="form1" runat="server">
        <div class="date">
            <button> </button>
            <font size="4">2023年4月</font>
            <button> </button>
        </div>
        <div>
            <table class="record" cellpadding="8" border="0">
                <tr>
                    <th>日期</th>
                    <th>類別</th>
                    <th>金額</th>
                </tr>
            </table>
        </div>
        <div class="total">
            <p><asp:Label ID="Label2" runat="server" Text="總收入：" Font-Bold="True"></asp:Label></p>
            <p><asp:Label ID="Label3" runat="server" Text="總支出：" Font-Bold="True"></asp:Label></p>
        </div>
    
    <div style="height: 289px; width: 665px; margin-left: 554px; margin-top: 0px">
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="報表"></asp:Label>
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="類別："></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="150px">
            <asp:ListItem>請選擇搜尋類別</asp:ListItem>
            <asp:ListItem>願望</asp:ListItem>
            <asp:ListItem>飲食</asp:ListItem>
            <asp:ListItem>交通</asp:ListItem>
        </asp:DropDownList>
        <br />
&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>