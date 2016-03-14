using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yourAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = (User)Session["currentUser"];
        if (Session["currentUser"] != null)
        {
         

            name.Text = u.Name.ToString();
            email.Text = u.EmailAddress.ToString();
        }


    }
    public void backToMain_OnClick(Object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", true);
    }
    public void update_OnClick(Object sender, EventArgs e)
    {
        User u = (User)Session["currentUser"];
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        


        try
        {
            string theStatement = "Update waliyania__WADfl15_UserInfo set AddressLine1=@add,password=@pass,addressLine2=@add2,city=@city,state=@state,zip=@zip where email_address =@a";

            SqlCommand sqlCommand = new SqlCommand(theStatement, conn);
            sqlCommand.Parameters.AddWithValue("@add", address1.Text);
            sqlCommand.Parameters.AddWithValue("@pass", pwd.Text);
            sqlCommand.Parameters.AddWithValue("@add2", address2.Text);
            sqlCommand.Parameters.AddWithValue("@city", city.Text);
            sqlCommand.Parameters.AddWithValue("@state", StateList.Text);
            sqlCommand.Parameters.AddWithValue("@a", u.EmailAddress.ToString());
            sqlCommand.Parameters.AddWithValue("@zip", zip.Text);

            conn.Open();
            sqlCommand.ExecuteNonQuery();

        }
        finally
        {
            conn.Close();
            Response.Redirect("yourAccount.aspx", true);
            ScriptManager.RegisterStartupScript(this, GetType(),"alertMessage", "alertMessage1();", true);

        }

    }
    public void updateToMain_OnClick(Object sender, EventArgs e)
    {
        User u = (User)Session["currentUser"];
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);



        try
        {
            string theStatement = "Update waliyania__WADfl15_UserInfo set AddressLine1=@add,password=@pass,addressLine2=@add2,city=@city,state=@state,zip=@zip where email_address =@a";

            SqlCommand sqlCommand = new SqlCommand(theStatement, conn);
            sqlCommand.Parameters.AddWithValue("@add", address1.Text);
            sqlCommand.Parameters.AddWithValue("@pass", pwd.Text);
            sqlCommand.Parameters.AddWithValue("@add2", address2.Text);
            sqlCommand.Parameters.AddWithValue("@city", city.Text);
            sqlCommand.Parameters.AddWithValue("@state", StateList.Text);
            sqlCommand.Parameters.AddWithValue("@a", u.EmailAddress.ToString());
            sqlCommand.Parameters.AddWithValue("@zip", zip.Text);

            conn.Open();
            sqlCommand.ExecuteNonQuery();

        }
        finally
        {
            conn.Close();
            Response.Redirect("Default.aspx", true);

        }
    }
}