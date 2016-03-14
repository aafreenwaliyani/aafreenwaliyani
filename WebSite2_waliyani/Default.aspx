<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
    <script type="text/javascript">
        function alertMessage1() {
            alert(' The ISBN is required field');
        }
        function alertMessage2() {
            alert(' The ISBN must be in a 999-999999999 format');
        }
        function alertMessage3() {
            alert(' The ISBN is not found in the database');
        }
    </script>
    <style type="text/css">
        #Button1 {
            width: 77px;
            margin-left: 74px;
        }

        #Text1 {
        }

        .auto-style1 {
            height: 113px;
            width: 171px;
        }

        /**/
        .auto-style2 {
            width: 243px;
        }

        .auto-style3 {
            width: 174px;
        }

        .auto-style4 {
            width: 256px;
        }

        .auto-style5 {
            width: 259px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">

            <div id="banner">
                <img class="banner" src="Images/images.jpg" />
            </div>

            <div id="nav">
                <div style="height: 50px; width: 100%">
                    <table width="100%">
                        <tr style="background-color: olive">
                            <td height="50px">
                                <a href="faq.aspx">FAQ's</a>

                            </td>
                            <td>
                                <a href="contactus.aspx">Contact Us</a>
                            </td>
                            <td>
                                <asp:HyperLink
                                    ID="HyperLink1"
                                    runat="server"
                                    Text="Your Account"
                                    NavigateUrl="~/yourAccount.aspx">
                                </asp:HyperLink>

                            </td>
                            <td>
                                <asp:HyperLink
                                    ID="HyperLink2"
                                    runat="server"
                                    Text="What You Sold"
                                    NavigateUrl="~/whatYouSold.aspx">
                                </asp:HyperLink>
                            </td>
                            <asp:Panel ID="Panel1" runat="server" Visible="false">
                                <td style="background-color: mediumspringgreen">
                                    <a href="registration.aspx">Register</a>

                                </td>
                                <td style="background-color: mediumspringgreen">
                                    <a href="registration.aspx">Login</a>
                                </td>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Visible="false">

                                <td style="background-color: mediumspringgreen">
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />

                                    <a href="logout.aspx">Logout </a>

                                </td>

                            </asp:Panel>
                        </tr>
                    </table>

                </div>

                <div id="ISBN">
                    <h2>Want to do a quick check on how much dollar you could get?</h2>
                    <h1>Enter ISBN Number:<font color="red">*</font>
                        <!--<input id="Text1" type="text" /><input id="Button1" type="button" value="Get Quote" />-->
                        <asp:TextBox ID="Text1" runat="server" Width="218px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" runat="server" ControlToValidate="Text1"></asp:RequiredFieldValidator>

                        <%--                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Text1" ValidationExpression="/((978[\--– ])?[0-9][0-9]{10})/"   Display="dynamic"></asp:RegularExpressionValidator>--%>

                        <!--   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Text1" 
            ErrorMessage="Sorry. The ISBN number you entered is not valid" ValidationExpression="\d{3}-\d{10}"  Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            -->

                        <asp:Button ID="Button1" Text="Get Quote" OnClick="Button1_OnClick" runat="server" /></h1>
                    <h4>What is ISBN number? <a href="isbn.aspx">Click Here</a></h4>
                </div>

                <div id="banner2">
                    <img class="banner2" src="Images/banner.jpg" />
                </div>

                <div id="Ads1">
                    <h3>Worry about shipping cost? We pay for your shipping. Yes!!</h3>
                    <h3>We have paid millions of $$$$$$</h3>
                </div>

                <div id="Ads2">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <img src="Images/chceck.jpg" height="50" width="50" /></td>
                            <td>
                                <h4><u>Price:</u> We update our price continuously to offer the best price online! </h4>
                            </td>
                            <td>
                                <img src="Images/chceck.jpg" height="50" width="50" /></td>
                            <td>
                                <h4><u>Free Shipping:</u> We always offer free shipping. Print the label and you are done!</h4>
                            </td>
                            <td>
                                <img src="Images/chceck.jpg" height="50" width="50" /></td>
                            <td>
                                <h4><u>Fast Payment:</u> We pay fast! All payments are processed within three business days of your item arriving!</h4>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div id="finance">
                    <table style="width: 100%">
                        <tr style="background-color: maroon">
                            <td class="auto-style4">
                                <img src="Images/visa.png" /></td>
                            <td class="auto-style5">
                                <img src="Images/mastercard.jpg" /></td>
                            <td class="auto-style2">
                                <img src="Images/discover.png" /></td>
                            <td class="auto-style3">
                                <img src="Images/paypal.jpg" /></td>
                            <td>
                                <img src="Images/american express.jpg" /></td>
                        <%--</tr>--%>
                    </table>
                    <div id="Adrotator">
<%--                       // <asp:AdRotator id="Ads" runat="server"  AdvertisementFile="~/XMLFile.xml"/>--%>
                        <table style="width: 100%">
            <tr>
                <td>
                    <asp:ScriptManager ID="smanager" runat="server" />
                    <asp:Timer runat="server" ID="timer1" Interval="20"></asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/XMLFile.xml"  />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                     
                </td>
                <td style="margin-left: 400px">
                      
                    <asp:Timer runat="server" ID="timer2" Interval="20"></asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                             <asp:AdRotator ID="AdRotator2" runat="server" AdvertisementFile="~/XMLFile2.xml"  />
                        </ContentTemplate>
                    </asp:UpdatePanel>    
                                  
                </td>
                <td style="margin-left: 800px">
                           
                    <asp:Timer runat="server" ID="timer3" Interval="20"></asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer3" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                          <asp:AdRotator ID="AdRotator3" runat="server" AdvertisementFile="~/XMLFile3.xml" />
                        </ContentTemplate>
                    </asp:UpdatePanel>  
                </td>
            </tr>
        </table>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
