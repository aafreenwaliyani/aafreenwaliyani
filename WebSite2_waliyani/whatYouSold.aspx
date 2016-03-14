<%@ Page Language="C#" AutoEventWireup="true" CodeFile="whatYouSold.aspx.cs" Inherits="whatYouSold" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
</head>
<body style="background-color: khaki">
    <form id="form1" runat="server">
        <div>
            <div id="banner">
                <br />
                <img class="banner" src="Images/images.jpg" />
            </div>
            <div id="userInfo">
                User Name:
             <asp:Label ID="UserName" runat="server"> </asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
             User Email Address:
             <asp:Label ID="UserEmail" runat="server"> </asp:Label>
            </div>
            <div id="UserDetail">
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                    PageSize="10" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2" CellPadding="5" CellSpacing="5" GridLines="None" Width="100%" Font-Names="Palatino"
                    ForeColor="Snow">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black"></FooterStyle>

                    <HeaderStyle ForeColor="Snow"
                        BackColor="OliveDrab"
                        Font-Bold="true"></HeaderStyle>


                    <Columns>
                        <asp:BoundField ItemStyle-Width="150px" DataField="isbn" HeaderText="ISBN" ReadOnly="true" ItemStyle-BackColor="OrangeRed" HeaderStyle-BackColor ="OliveDrab" ControlStyle-BackColor="Gainsboro"/>
                        <asp:BoundField ItemStyle-Width="150px" DataField="title" HeaderText="TITLE" ReadOnly="true" ItemStyle-BackColor="OrangeRed" HeaderStyle-BackColor ="OliveDrab" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="date_sold" HeaderText="DATE SOLD" ReadOnly="true" ItemStyle-BackColor="OrangeRed" HeaderStyle-BackColor ="OliveDrab"/>
                        <asp:BoundField ItemStyle-Width="150px" DataField="buyprice" HeaderText="BUY PRICE" ReadOnly="true" ItemStyle-BackColor="OrangeRed" HeaderStyle-BackColor ="OliveDrab" />
                    </Columns>

                </asp:GridView>

            </div> <center>
            <div id="buttons">
                    
            </div>
            <asp:Button id="Main" Text="Go to Main Page"  OnClick="Main_OnClick" runat="server" CssClass="centerButton"/>
            <asp:Button id="Sell" Text="Sell another Book"  OnClick="Sell_OnClick" runat="server" CssClass="centerButton" />
                    
            </center>
        </div>
    </form>

</body>
</html>

