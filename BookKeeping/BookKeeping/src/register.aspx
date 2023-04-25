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
                            <h2><asp:TextBox ID="TextBox1" runat="server" Width="350px" Height="30px" style ="margin-bottom:10px; padding-left:10px;" 
                                PlaceHolder="請輸入ID" ValidationGroup="register"></asp:TextBox></h2>
                        </div>

                        <asp:requiredfieldvalidator id="RequiredFieldValidator3"
                              controltovalidate="TextBox1"
                              validationgroup="register"
                              errormessage="請輸入ID"
                              runat="Server">
                        </asp:requiredfieldvalidator>

                        <div>
                            <p>姓名(Name):</p>
                            <h2><asp:TextBox ID="TextBox2" runat="server" Width="350px" Height="30px" required="required" style ="margin-bottom:10px;  padding-left:10px;"
                                PlaceHolder="請輸入姓名"></asp:TextBox></h2>
                        </div>
                        <div>
                            <p>電子信箱(Gmail)</p>
                                <h2>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="350px" Height="30px" required="required" style ="margin-bottom:10px;  padding-left:10px;"
                                    PlaceHolder="請輸入電子信箱"></asp:TextBox>

                                </h2>
                        </div>
                        <div>
                            <p>密碼(Password):<asp:Label ID="Label1" runat="server"></asp:Label>
                            </p>
                                <h2>
                                    <asp:TextBox ID="TextBox4" runat="server" Width="350px" Height="30px" required="required" style ="margin-bottom:10px;  padding-left:10px;"
                                    PlaceHolder="請輸入密碼" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                                </h2>
                        </div>
                        <div>
                            <p>密碼確認(Confirm Password):</p>
                                <h2>
                                    <asp:TextBox ID="TextBox6" runat="server" Width="350px" Height="30px" required="required" style ="margin-bottom:10px;  padding-left:10px;"
                                    PlaceHolder="請輸入密碼"></asp:TextBox>
                                </h2>
                        </div>
                        <div>
                            <p>審核密碼(Y/N Password):</p>
                                <h2>
                                    <asp:TextBox ID="TextBox5" runat="server" Width="350px" Height="30px" required="required" style ="margin-bottom:10px;  padding-left:10px;"
                                    PlaceHolder="請輸入審核密碼"></asp:TextBox>

                                </h2>
                        </div>
                        <div>
                            <p>性別(Gender):</p>                    
                                <div class="check">
                                    <p>                                    
                                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="gendergroup" OnCheckedChanged="RadioButton1_CheckedChanged" Text="男生(Boy)" />
                                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gendergroup" OnCheckedChanged="RadioButton2_CheckedChanged" Text="女生(Girl)" />
                                    </p>
                                </div>
                        </div>
                        <div>
                            <p>暱稱(Nickname):</p>
                                <h2>        
                                    <asp:TextBox ID="TextBox7" runat="server" Width="350px" Height="30px" style ="margin-bottom:15px;  padding-left:10px;"
                                    PlaceHolder="請輸入暱稱"></asp:TextBox>
                                </h2>

                                <div class="button">
                                    <asp:Button ID="Button1" runat="server" Text="返回(back)"  OnClick="Button1_Click" Height="35px" Width="95px"/> 
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="確認(confirm)" Height="35px" Width="98px" ValidationGroup="register" causesvalidation="true"/>

                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
