using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class passwordRecovery : System.Web.UI.Page
{
    bool b;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void recoverpassword_OnClick(object sender, EventArgs e)
    {
        if (b == true)
        {
            string s = EmailText.Text;
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select email_address,password FROM waliyania__WADfl15_UserInfo WHERE email_address =@username", con);
            cmd.Parameters.AddWithValue("@username", s);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow rows in dt.Rows)
                {
                    User u = new User() { EmailAddress = Convert.ToString(rows[0]), Password = Convert.ToString(rows[1]) };
                    Session["password"] = u;
                   
                }
            }
            User u1 = (User)Session["password"];
            MailMessage mailmessage = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com";
            smtp.UseDefaultCredentials = false;
           // MailAddress from = new MailAddress("");
            MailAddress from = new MailAddress("osheen123w@gmail.com");
            MailAddress to = new MailAddress(u1.EmailAddress.ToString());
            mailmessage.From = from;
            mailmessage.To.Add(to);
            mailmessage.Subject = "Your password has been recovered!";
            mailmessage.Body = "Dear Customer, <br/> You are receiving this email because you requested for password recovery.<br/>Your current password is '" + u1.Password.ToString() + "'<br/><br/>Thank you.<br/>Easyas123.com ";
            mailmessage.IsBodyHtml = true;
            
            {
                smtp.Credentials = new System.Net.NetworkCredential("osheen123w@gmail.com", "Password123#");
                smtp.EnableSsl = true;
                smtp.Send(mailmessage);
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage1();", true);

            //MailMessage mailMessage = new MailMessage();
           
            //mailMessage.To.Add(u1.EmailAddress.ToString());
            //mailMessage.From = new MailAddress("akshaygiramkar90@gmail.com");
            //mailMessage.Subject = "ASP.NET e-mail test";
            //mailMessage.Body = "Your Password is :" + u1.Password.ToString();
            //SmtpClient smtpClient = new SmtpClient();
            //smtpClient.Host = "smtp.gmail.com";
            //smtpClient.Credentials = new System.Net.NetworkCredential("akshaygiramkar90@gmail.com", "Eksingham90");
            //smtpClient.EnableSsl = true;
            //smtpClient.Port = 587;
            
           
            //smtpClient.UseDefaultCredentials = true;
            //smtpClient.Send(mailMessage);
           // Response.Redirect("~/Default.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage2();", true);

        }

    }
    protected void EmailText_TextChanged(object sender, EventArgs e)
    {

        string s = EmailText.Text;
       
        if (isExistingEmail(s))
        {
            b = true;

        }
        else
        {
            b = false;
        }
    }
    public bool isExistingEmail(string s)
    {
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

}