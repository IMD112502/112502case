<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="_BookKeeping.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="box">
                <div class="container">
                    <div class="form">
                        <h1>註冊帳號</h1>
                        <div>
                            <p>使用者ID(UserID):</p>
                            <asp:TextBox ID="text1" runat="server" Width="150px"
                                PlaceHolder="請輸入ID"></asp:TextBox>
                        </div>
                        <div>
                            <p>姓名(Name):</p>
                            <asp:TextBox ID="TextBox1" runat="server" Width="150px"
                                PlaceHolder="請輸入姓名"></asp:TextBox>
                        </div>
                        <div>
                            <p>電子信箱(Gmail)</p>
                            <asp:TextBox ID="TextBox2" runat="server" Width="150px"
                                PlaceHolder="請輸入電子信箱"></asp:TextBox>
                        </div>
                        <div>
                            <p>密碼(Password):</p>
                            <asp:TextBox ID="TextBox3" runat="server" Width="150px"
                                PlaceHolder="請輸入密碼"></asp:TextBox>
                        </div>
                        <div>
                            <p>審核密碼(Y/N Password):</p>
                            <asp:TextBox ID="TextBox4" runat="server" Width="150px"
                                PlaceHolder="請輸入審核密碼"></asp:TextBox>
                        </div>
                        <div>
                            <p>性別(Gender):</p>
                            <asp:TextBox ID="TextBox5" runat="server" Width="150px"
                                PlaceHolder="性別"></asp:TextBox>
                        </div>
                        <div>
                            <p>暱稱(Nickname):</p>
                            <asp:TextBox ID="TextBox6" runat="server" Width="150px"
                                PlaceHolder="請輸入暱稱"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
