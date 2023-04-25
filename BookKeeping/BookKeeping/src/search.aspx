<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="_BookKeeping.search" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <style type="text/css">
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

        .search {
            margin-left: 700px;
            margin-top: -30px;
        }

        .search_results {
            width: 400px;
            height: 50px;
            margin: 30px;
            margin-left: -100px;
            margin-top: -20px;
        }

        #Submit1 {
            margin-left: 5px;
        }

        #back {
            margin-left: 500px;
            margin-top: 110px;
        }
        .form {
        padding-top: 10px;
        padding-left: 100px;
        }

        .search {
            margin-left: 700px;
            margin-top: -30px;
        }

        .search_results {
            width: 400px;
            height: 50px;
            margin: 30px;
            margin-left: -100px;
            margin-top: -20px;
        }

        #Submit1 {
            margin-left: 5px;
        }

        #back {
            margin-left: 500px;
            margin-top: 110px;
        }
    </style>
</head>

<body>
    <div class="v-line"></div>
    <div class="date">
        <input type="button" value=" " />
        <font size="4">2023年4月</font>
        <input type="button" value=" " />
    </div>
    <div>
        <form action="" method="post">
            <table class="record" style="border-top: 2px #003153 solid; border-bottom: 2px #003153 solid; " cellpadding="8" border='0'>
                <tr>
                    <th>日期</th>
                    <th>類別</th>
                    <th>金額</th>
                </tr>
            </table>
        </form>
    </div>
    <div class="total">
        <p><b><label for="total_expenses">總收入：</label></b></p>
        <p><b><label for="total_income">總支出：</label></b></p>
    </div>
    <div class="setting">
        <p><input type="button" value="設定" /></p>
        <p><input type="button" value="任務" /></p>
    </div>
      <div class="search">
        <p><b><font size="6">搜尋</font></b></p>
        <form action="" method="post">
            <p>
                <label class="sort">類別：</label>
                <select id="Select1" style="width: 140px; height: 28px;">
                    <option>請選擇搜尋類別</option>
                    <option>願望</option>
                    <option>交通</option>
                    <option>飲食</option>
                </select>
            </p>
            <p>
                <label for="start">日期：</label>
                <input type="date" id="start" name="trip-start" style="width: 140px;"
                    value="2023-04-20"
                    min="2022-01-01" max="2024-12-31">
            </p>
            <p>
                <input id="Text1" type="text" placeholder="請輸入關鍵字" />
                <input id="Submit1" type="submit" value="查詢" />
            </p>
        </form>
        <p>搜尋結果 共 <span id="input"></span> 筆：</p>
        <script>
            document.getElementById('input').innerHTML = "0";
        </script>
        <div>
            <form action="" method="post">
                <table class="search_results" style="border-top: 2px #003153 solid; border-bottom: 2px #003153 solid; " cellpadding="8" border='0'>
                    <tr>
                        <th>日期</th>
                        <th>類別</th>
                        <th>金額</th>
                    </tr>
                </table>
            </form>
        </div>
        <p>
            <input id="back" type="button" value="返回" />
        </p>
    </div>
</body>
</html>