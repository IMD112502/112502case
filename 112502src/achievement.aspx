<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="_112502src.achievement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>成就</title>
    <style type ="text/css" >
        body{
            width:800px;
            height:600px;
            margin:0 auto;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;">
            <h1><asp:Label ID="Label1" runat="server" Text="成就" Font-Size="Larger" Height="50px"></asp:Label></h1>
            <p>
                <asp:Button ID="Button1" runat="server" Text="已完成" Style ="margin-right:20px; margin-bottom:50px;" />
                <asp:Button ID="Button2" runat="server" Text="未完成"  />
            </p>
            </div>
            <div>
               <p>
                <asp:Image ID="Image1" runat="server" ImageUrl="images/img001.png" Height="200px" Width="200px" ImageAlign="Left"  />
                <asp:Label runat="server" Text="記帳小幫手" Font-Size="X-Large" ForeColor="#00CC66" Style= "margin-left:100px;" /></asp:Label>
                <br />
                <asp:Label runat="server" Text="累計記帳10次" Font-Size="Large" Style="margin-left:100px;" ></asp:Label>
                <br />
                   <asp:Button ID="Button3" runat="server" Text="領取" style="margin-left:400px; " Height="50px" Width="50px" />
                <br />
                   <asp:Literal ID="Literal1" runat="server"><progress value="10" max="100" style ="margin-left:100px;"></progress></asp:Literal><%--literal控制項可以寫html語法--%>
                
                   
            </p>
            <div style =" margin-left: 700px; margin-right: auto;margin-top:500px;  " >
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/img002.png" Height="50px" Width="50px" />
            </div>
            
        
            
            
          
            

        
    </form>
</body>
</html>
