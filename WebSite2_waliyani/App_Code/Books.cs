using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Books
/// </summary>
public class Books
{
    private string isbn;

    public string Isbn
    {
        get { return isbn; }
        set { isbn = value; }
    }
    private string title;

    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    private string author;

    public string Author
    {
        get { return author; }
        set { author = value; }
    }
    private string buyprice;
    private string edition;

    public string Edition
    {
        get { return edition; }
        set { edition = value; }
    }
    public string Buyprice
    {
        get { return buyprice; }
        set { buyprice = value; }
    }
    public Books(string p1, string p2, string p3, string p4,string p5)
    {
        // TODO: Complete member initialization
        this.isbn = p1;
        this.title = p2;
        this.author = p3;
        this.edition = p4;
        this.buyprice = p5;
    }

    public Books()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}