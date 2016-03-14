<%@ Page Language="C#" AutoEventWireup="true" CodeFile="passwordRecovery.aspx.cs" Inherits="passwordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
<script>
    function alertMessage1() {
        alert('Your password has been sent to your email address.');
    }
    function alertMessage2() {
        alert('Your account email cannot be verified.');
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id ="banner">
         <img class="banner"  src="Images/images.jpg" />
         </div>
     <div id="recovery">
         <h2>Password Recovery</h2>
         <asp:Label ID="Email" runat="server" Text="Email Address"></asp:Label>
         <asp:TextBox ID="EmailText" runat="server" width="300px" AutoPostBack="false" OnTextChanged="EmailText_TextChanged" />
          <asp:Button id="recoverpassword" Text="Recover Password" OnClick="recoverpassword_OnClick" runat="server" /><br />
         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a href="Default.aspx">Go Back to Main Page</a>
     </div>
    </div>
    </form>
</body>
</html>
