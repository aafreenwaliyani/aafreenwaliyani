<%@ Page Language="C#" AutoEventWireup="true" CodeFile="display.aspx.cs" Inherits="display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
    <script type="text/javascript">
        function alertMessage() {
            alert('Sorry! The ISBN number you entered is not found in our database');
        }

        function alertMessage1() {
            alert('Thank you for your business.\n Your account will be updated after we receive the book.\n A confirmation email has been sent to the email address in our file.');
        }
        function alertMessage3() {
            alert(' The ISBN must be in a 999-999999999 format');
        }
        function alertMessage4() {
            alert(' You have already sold this book');
        }
        function ChangeContents()
        {
           // document.getElementById

        }
    </script>
</head>
<body style="background-color:lightblue">
    <form id="form1" runat="server">
    
    
     <div id ="bannerdisplay">
         <img class="banner"  src="Images/images.jpg" />
         </div>
        <div id ="detaildisplay">
        <table align="center">
             <tr>
               <td>
            <asp:Label ID="lblIsbnNo" runat="server" Text="ISBN Number:"></asp:Label> 
            <asp:TextBox ID="IsbnNo" runat="server" width="470px"/> 
            <asp:Button id="Button2" Text="Check another ISBN" OnClick="Button2_OnClick" runat="server" /></td></tr>
       
          <tr style="align-content:center"> <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Image ID="BookImage" runat="server" imagealign="Middle"/></td></tr>
      
                  <tr> <td> <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>
             <asp:TextBox ID="Title" runat="server" width="530px" /></td></tr>
            <tr>
                  <td> <asp:Label ID="lblAuthor" runat="server" Text="Author:"></asp:Label> 
             <asp:TextBox ID="Author" runat="server" width="515px" /></td></tr>
            <tr>
                  <td> <asp:Label ID="lblPrice" runat="server" Text="Buy Price:"></asp:Label>
            <asp:TextBox ID="Price" runat="server" width="500px" /></td></tr>
            
           <tr> <td> <asp:Button id="Button3" Text="Sell This Book" OnClick="Button3_OnClick" runat="server" Enabled="false" />
            <asp:Button id="Button4" Text="No Thanks" OnClick="Button4_OnClick" runat="server" /></td></tr>
     </table>
        </div>
    
    </form>
</body>
</html>
