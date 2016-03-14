using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

class SoldBook
{
    private string isbnNumber;

    public string IsbnNumber
    {
        get { return isbnNumber; }
        set { isbnNumber = value; }
    }
    private string emailAddress;

    public string Title
    {
        get { return emailAddress; }
        set { emailAddress = value; }
    }
    private DateTime date_sold;

    public DateTime Date_sold
    {
        get { return date_sold; }
        set { date_sold = value; }
    } 
    public SoldBook(string a, string b ,DateTime d)
    {
        this.isbnNumber = a;
        this.emailAddress = b;
        this.date_sold=d;
    }
}

