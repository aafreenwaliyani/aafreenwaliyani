<%@ Page Language="C#" AutoEventWireup="true" CodeFile="isbn.aspx.cs" Inherits="isbn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id ="banner">
         <img class="banner"  src="Images/images.jpg" />
    </div>
         <div id="isbnno">
         <h1 id = "bookisbn">How do I find my book's ISBN</h1>
         <p>Your books ISBN number can usually be found on the back of the book above the barcode.</p><br />
         <img src="Images/isbn.PNG" align="middle"/>
         <br />
         <p>An ISBN can be a 10 or 13 digit number and easyas123 pricing tool accepts both. If your book does not  have a barcode or a sticker is covering the barcode you can usually find the ISBN inside of the 
            front title page were you would find publisher information. Books published before 1970 do not have ISBN numbers and we cannot buy them.
         </p>
         
          

<input type="button" onclick="location.href = 'Default.aspx';" value="Back to Main Page" />

    </div>
    </form>
</body>
</html>
