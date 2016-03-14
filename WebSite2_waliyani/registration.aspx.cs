using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void back_OnClick(Object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", true);
    }

    public void regis_OnClick(Object sender, EventArgs e)
    {
        string s = email.Text;
        List<User> allUsersList = Application["AllUsersList"] as List<User>;
        if (isExistingEmail(s))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage1();", true);
        }
        else
        {
            //User aUser = new User();

            //aUser.Name = name.Text;
            //aUser.AddressLine1 = address1.Text;
            //aUser.AddressLine2 = address2.Text;
            //aUser.City = city.Text;
            //aUser.EmailAddress = email.Text;
            //aUser.State = StateList.Text;
            //aUser.Zip = zip.Text;
            //aUser.Password = pwd.Text;
            //allUsersList.Add(aUser);
            //Session["CurrentUser"] = aUser;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO waliyania__WADfl15_UserInfo  VALUES (@emailAddress,@password,@Name,@AddressLine1,@AddressLine2,@city,@state,@zip)", con);
            cmd.Parameters.AddWithValue("@emailAddress", email.Text);
            cmd.Parameters.AddWithValue("@password", pwd.Text);
            cmd.Parameters.AddWithValue("@Name", name.Text);
            cmd.Parameters.AddWithValue("@AddressLine1", address1.Text);
            cmd.Parameters.AddWithValue("@AddressLine2", address2.Text);
            cmd.Parameters.AddWithValue("@city", city.Text);
            cmd.Parameters.AddWithValue("@state", StateList.Text);
            cmd.Parameters.AddWithValue("@zip", zip.Text);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage2();", true);
            name.Text = "";
            address1.Text = "";
            address2.Text = "";
            city.Text = "";
            email.Text = "";
            zip.Text = "";
            pwd.Text = "";
        }
    }

    public bool isExistingEmail(string s)
    {
        //List<User> allUsersList = Application["AllUsersList"] as List<User>;
        //if (allUsersList.Count() != 0)
        //{
        //    foreach (User user in allUsersList)
        //    {
        //        if (user.EmailAddress == s)
        //        {
        //            return true;
        //        }
        //    }
        //}
        //return false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select email_address FROM waliyania__WADfl15_UserInfo WHERE email_address =@username", con);
        cmd.Parameters.AddWithValue("@username", s);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            return true;
        }
       
        return false;
        throw new NotImplementedException();
    }




    public void log_OnClick(Object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUsersList"] as List<User>;
        string s = TxtEmail.Text;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select email_address, password FROM waliyania__WADfl15_UserInfo WHERE email_address =@username", con);
        cmd.Parameters.AddWithValue("@username", TxtEmail.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            SqlCommand cmd1 = new SqlCommand("select * FROM waliyania__WADfl15_UserInfo WHERE email_address =@username1 and password=@password", con);
            cmd1.Parameters.AddWithValue("@username1", TxtEmail.Text);
            cmd1.Parameters.AddWithValue("@password", Password.Text);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                foreach (DataRow rows in dt1.Rows)
                {
                    User u = new User() { EmailAddress = Convert.ToString(rows[0]), Name = Convert.ToString(rows[2]) };
                    Session["currentUser"] = u;
                    Response.Redirect("~/Default.aspx");
                }
            }
            //if (allUsersList.Count() != 0)
            //{
            //    foreach (User user in allUsersList)
            //    {
            //        if (user.EmailAddress == s)
            //        {
            //            if (user.Password == Password.Text)
            //            {

            //                Session["currentUser"] = user;


            //                Response.Redirect("~/Default.aspx");

            //            }
            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage3();", true);

            //        }
            //    }
            //}
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage4();", true);
        }

    }
    public void frgtpwd_OnClick(Object sender, EventArgs e)
    {
        Response.Redirect("passwordRecovery.aspx", true);
    }
}

