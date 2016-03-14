using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class display : System.Web.UI.Page
{
    string inert = "";
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["Isbn"] != null)
        {

            string IsbnNumber = Session["Isbn"] as string;

            displayDetails(IsbnNumber);


        }
        else
        {
            //    IsbnNo.Text = Session["Temp"];
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUserList"] as List<User>;
        if (Session["currentUser"] == null)
        {
            Button3.Enabled = false;
        }
        else
        {
            Button3.Enabled = true;
        }
        /*
        if (Session["Isbn"] != null)
        {
            string IsbnNumber = Session["Isbn"] as string;

            displayDetails(IsbnNumber);


        }
        else
        {
        //    IsbnNo.Text = Session["Temp"];
        }
         * */
    }

    public void displayDetails(String IsbnNumb)
    {
        int count = 0;
        List<Books> books = Application["Books"] as List<Books>;
        foreach (Books book in books)
        {

            if (book.Isbn.Trim() == IsbnNumb.Trim())
            {
                IsbnNo.Text = Session["Isbn"].ToString();
                Title.Text = book.Title;
                Author.Text = book.Author;
                Price.Text = (book.Buyprice).ToString();

                Title.ReadOnly = true;
                Author.ReadOnly = true;
                Price.ReadOnly = true;

                BookImage.ImageUrl = "~/Images/" + book.Isbn.Trim() + ".png";
                count = 1;
            }



        }

        if (count == 1)
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
        }
        //if (book.Isbn.Trim() != IsbnNumb.Trim())
        //  {
        //     ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
        // }


    }
    public void Button2_OnClick(Object sender, EventArgs e)
    {
        Regex rgs = new Regex(@"^978[-][0-9]{10}$");
        String txt = IsbnNo.Text;
        if (!rgs.IsMatch(txt))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage3();", true);

        }
        else
        {
            int count = 0;
            string IsbnNumb = IsbnNo.Text;
            List<Books> books = Application["Books"] as List<Books>;
            foreach (Books book in books)
            {

                if (book.Isbn.Trim() == IsbnNumb.Trim())
                {
                    count = 1;
                }



            }

            if (count == 1)
            {
                Session["Isbn"] = IsbnNo.Text;
                Response.Redirect("display.aspx");
            }
            else
            {
                IsbnNo.Text = Session["Isbn"].ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);

            }
        }
        /*
        if (!string.IsNullOrEmpty(IsbnNo.Text))
        {
            Session["Isbn"] = IsbnNo.Text;
            // displayDetails(IsbnNo.Text);
            Response.Redirect("display.aspx");
        }
        else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
            }
            */

    }

    public void Button3_OnClick(Object sender, EventArgs e)
    {
        User u = (User)Session["currentUser"];
        string s = u.EmailAddress.ToString();
        string IsbnNumber = Session["Isbn"] as string;
        if (isExistingEmail(s,IsbnNumber))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage4();", true);
        }
        else
        {

           
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO waliyania_WADfl15_Transactions VALUES (@emailAddress,@isbn,@datesold)", con);
            cmd.Parameters.AddWithValue("@emailAddress", u.EmailAddress.ToString());
            cmd.Parameters.AddWithValue("@isbn", Session["Isbn"].ToString());
            cmd.Parameters.AddWithValue("@datesold", DateTime.Now.ToShortDateString());
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage1", "alertMessage1();", true);
        }
    }
    public bool isExistingEmail(string s,String IsbnNumber)
    {
        User u = (User)Session["currentUser"];

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select email_address,isbn FROM waliyania_WADfl15_Transactions WHERE email_address =@username and isbn=@book", con);
        cmd.Parameters.AddWithValue("@username", s);
        cmd.Parameters.AddWithValue("@book", IsbnNumber);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            return true;
        }

        return false;
    }
    public void Button4_OnClick(Object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", true);
    }
}


