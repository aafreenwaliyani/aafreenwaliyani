using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Collections;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //youraccount.Visible = false;
        HyperLink1.Enabled = false;
        HyperLink2.Enabled = false;
        List<User> allUsersList = Application["AllUserList"] as List<User>;
       if(Session["currentUser"] == null)
        {

            
            Panel1.Visible = true;
        }
        else
       {
           HyperLink1.Enabled = true;
           HyperLink2.Enabled = true;
         
           Panel2.Visible = true;
           User u = (User)Session["currentUser"];
           Label1.Text =  u.Name + " Logged in";
       }
    }


    public void Button1_OnClick(Object sender, EventArgs e)
    {

        Regex rgs = new Regex(@"^978[-][0-9]{10}$");
        String txt = Text1.Text;
        if (txt.Equals(""))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage1();", true);
        }
        else if (!rgs.IsMatch(txt))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage2();", true);

        }
        else
        {
            List<Books> books = Application["Books"] as List<Books>;
            foreach (Books book in books)
            {
                //  foreach (Books obj in Application["books"])
                //  {

                if (txt.Equals(book.Isbn)) //(!string.IsNullOrEmpty(Text1.Text))//(txt.Equals(Session["Isbn"]))
                {
                    //   ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true)
                    Session["Isbn"] = Text1.Text;
                    Response.Redirect("display.aspx", true);


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage3();", true);

                }
            }

        }
    }
}
