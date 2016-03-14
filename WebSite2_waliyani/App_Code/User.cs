using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{




    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private string addressLine1;

    public string AddressLine1
    {
        get { return addressLine1; }
        set { addressLine1 = value; }
    }
    private string addressLine2;

    public string AddressLine2
    {
        get { return addressLine2; }
        set { addressLine2 = value; }
    }
    private string city;

    public string City
    {
        get { return city; }
        set { city = value; }
    }
    private string zip;

    public string Zip
    {
        get { return zip; }
        set { zip = value; }
    }
    private string state;

    public string State
    {
        get { return state; }
        set { state = value; }
    }
    private string emailAddress;

    public string EmailAddress
    {
        get { return emailAddress; }
        set { emailAddress = value; }
    }
    private string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    private SoldBook[] soldBooks;
   

    internal SoldBook[] SoldBooks
    {
        get { return soldBooks; }
        set { soldBooks = value; }
    }
    public User(string a, string b, string c, string d, string e, string f, string g, string h)
    {
        this.name = a;
        this.addressLine1 = b;
        this.addressLine2 = c;
        this.city = d;
        this.zip = e;
        this.state = f;
        this.emailAddress = g;
        this.password = h;
      

    }
    public User(String a, string b)
    {
        this.emailAddress = a;
        this.name = b;
    }
    
   

    public User()
    {
        // TODO: Complete member initialization
    }
}


