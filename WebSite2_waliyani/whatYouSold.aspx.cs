using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class whatYouSold : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = (User)Session["currentUser"];
        UserName.Text = u.Name.ToString();
        UserEmail.Text = u.EmailAddress.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select t.isbn,date_sold,title,buyprice FROM waliyania_WADfl15_Transactions t,Walyania_WADfl15_BookInfo b WHERE t.isbn=b.ISBN and t.email_address =@username", con);
        cmd.Parameters.AddWithValue("@username", u.EmailAddress.ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    public void Main_OnClick(Object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", true);
    }

    public void Sell_OnClick(Object sender, EventArgs e)
    {
        Response.Redirect("display.aspx", true);
    }
}