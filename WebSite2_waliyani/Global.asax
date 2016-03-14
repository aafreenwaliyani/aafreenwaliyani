<%@ Application Language="C#" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        
        List<Books> books = new List<Books>();
        List<User> allUsersList = new List<User>();
        List<string> isbnNumber = new List<string>();
        List<string> title = new List<string>();
        List<string> buyprice = new List<string>();

        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();


        try
        {
            string theStatement = "SELECT * from Walyania_WADfl15_BookInfo";
            System.Data.SqlClient.SqlDataAdapter bookss = new System.Data.SqlClient.SqlDataAdapter(theStatement, conn);
            System.Data.DataTable booktable = new System.Data.DataTable();
            bookss.Fill(booktable);
            foreach (System.Data.DataRow rows in booktable.Rows)
            {
                Books b = new Books()
                {
                    Isbn = Convert.ToString(rows[0]),
                    Title = Convert.ToString(rows[1]),
                    Author = Convert.ToString(rows[2]),
                    Edition = Convert.ToString(rows[3]),
                    Buyprice = Convert.ToString(rows[4])
                };
                books.Add(b);
            }
            System.Data.SqlClient.SqlDataAdapter user = new System.Data.SqlClient.SqlDataAdapter("SELECT * from waliyania__WADfl15_UserInfo", conn);
            System.Data.DataTable usertable = new System.Data.DataTable();
            user.Fill(usertable);
            foreach (System.Data.DataRow rows in usertable.Rows)
            {
                User u = new User()
                {
                    EmailAddress = Convert.ToString(rows[0]),
                    Password = Convert.ToString(rows[1]),
                    Name = Convert.ToString(rows[2]),
                    AddressLine1 = Convert.ToString(rows[3]),
                    AddressLine2 = Convert.ToString(rows[4]),
                    City = Convert.ToString(rows[5]),
                    State = Convert.ToString(rows[6]),
                    Zip = Convert.ToString(rows[7])
                };
                allUsersList.Add(u);
            }
            System.Data.SqlClient.SqlDataAdapter isb = new System.Data.SqlClient.SqlDataAdapter("SELECT ISBN from Walyania_WADfl15_BookInfo", conn);
            System.Data.DataTable isbntable = new System.Data.DataTable();
            isb.Fill(isbntable);
            foreach (System.Data.DataRow rows in isbntable.Rows)
            {
                isbnNumber.Add(rows.ToString());  
            }
            
            
            
            System.Data.SqlClient.SqlDataAdapter titles = new System.Data.SqlClient.SqlDataAdapter("SELECT title from Walyania_WADfl15_BookInfo", conn);
            System.Data.DataTable titletable = new System.Data.DataTable();
            titles.Fill(titletable);
            foreach (System.Data.DataRow rows in titletable.Rows)
            {
                title.Add(rows.ToString());
            }



            System.Data.SqlClient.SqlDataAdapter buy = new System.Data.SqlClient.SqlDataAdapter("SELECT buyprice from Walyania_WADfl15_BookInfo", conn);
            System.Data.DataTable buytable = new System.Data.DataTable();
            buy.Fill(buytable);
            foreach (System.Data.DataRow rows in buytable.Rows)
            {
                buyprice.Add(rows.ToString());
            }
            
        }
        finally
        {
            conn.Close();
        }




       



        Application["Books"] = books;
        Application["AllUsersList"] = allUsersList;
        Application["ISBNNumbers"] = isbnNumber;
        Application["Titles"] = title;
        Application["price"] = buyprice;
    }




    void Application_End(object sender, EventArgs e)
    {
        Session.Remove("currentUser");
        //  Code that runs on application shutdown
        
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
       
    }

    void Session_Start(object sender, EventArgs e)
    {

        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        Session.Remove("currentUser");
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
       
    }
       
</script>
