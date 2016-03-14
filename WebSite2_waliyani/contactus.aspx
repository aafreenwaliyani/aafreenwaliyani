<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
    <script type="text/javascript">
        var xmlDoc;
        var xmlhttp;
        function loadXMLDoc()
        {
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = readData;
            xmlhttp.open("GET", "contactUs.xml", true);
        xmlhttp.send();
        }
        function readData()
        {
            if (xmlhttp.readyState == 4)
            {
                xmlDoc = xmlhttp.responseXML;
                var items = xmlDoc.getElementsByTagName("info");
                var nextValue1 = items[0].getAttribute("contact-phone");
                var nextValue2 = items[0].getAttribute("contact-email");
                var nextValue3 = items[0].getAttribute("address-street");
                var nextValue4 = items[0].getAttribute("address-city");
                var nextValue5 = items[0].getAttribute("address-state");
                var nextValue6 = items[0].getAttribute("address-zip");
                document.getElementById("Label2").innerHTML = nextValue1;
                document.getElementById("Label4").innerHTML = nextValue2;
                var nextValue7 = nextValue3 + ' ' + nextValue4 + ' ' + nextValue5 + ' ' + nextValue6;
                document.getElementById("Label6").innerHTML = nextValue7;

            }
        }
</script>

</head>
<body onload="loadXMLDoc()">
    <form id="form1" runat="server">
    <div>
     <div id ="banner1">
         <img class="banner1"  src="Images/images.jpg" align="middle" />
         </div>

       <div id="Contact">
           <div id ="myDiv">

            <table align ="center">
               <tr>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Contact Phone &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></asp:Label>
                   </td>
                  <td>
                   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                  </td>
               </tr>
               <tr>
                   <td>
                    <asp:Label ID="Label3" runat="server" Text="Contact E-mail"></asp:Label>
                   </td>
                  <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                  </td>
               </tr>
               <tr>
                   <td>
                    <asp:Label ID="Label5" runat="server" Text="Mailing Address"></asp:Label>
                   </td>
                  <td>
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                  </td>
               </tr> 

           </table>

 <p style="text-align: center;"><input type="button" onclick="location.href = 'Default.aspx';" value="Back to Main Page" /></p>
           

       </div>
    </div>
    </form>
</body>
</html>