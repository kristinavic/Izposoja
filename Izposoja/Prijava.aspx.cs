using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Globalization;
using System.Configuration;
using Microsoft.AspNet.FriendlyUrls;

namespace IzposojaKnjig
{
    // Log in page
    public partial class Prijava : System.Web.UI.Page
    {
        //static string connectionString = @"Data Source=.\sqlexpress;Initial Catalog=Izposoja;Integrated Security=True";

        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["access"] != null)
                {
                    Response.Redirect("Mojprofil.aspx");
                }
        }


        protected void btnPrijava_Click(object sender, EventArgs e)    // btn Log in
        {
            try
            {   // admin login
                if (txtUpIme.Text == "admin")
                {
                    SqlConnection con = new SqlConnection(strdbcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("select * from Users where Username='" + txtUpIme.Text + "' and Password='" + txtGesloPrijava.Text + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader(); //dr is connectet with DB, executes query

                    if (dr.HasRows) //wrong username/password has no rows 
                    {
                        while (dr.Read())
                        {
                            Response.Write("<script>alert('Login for " + dr.GetValue(0).ToString() + " successful!'); </script>");

                            Session["username"] = dr.GetValue(0).ToString();   //session za uporabnika iz 0-tega stolpca tabele Users
                            Session["access"] = "admin";
                        }
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        PrijavaObvestilo.Text = "Wrong data!";
                    }
                }
                else
                {
                    // login for anyone else
                    SqlConnection con = new SqlConnection(strdbcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("select * from Users where Username='" + txtUpIme.Text + "' and Password='" + txtGesloPrijava.Text + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader(); //dr is connectet with DB, executes query

                    if (dr.HasRows) //wrong username/password has no rows 
                    {
                        while (dr.Read())
                        {
                            Response.Write("<script>alert('Login for " + dr.GetValue(0).ToString() + " successful!'); </script>");

                            Session["username"] = dr.GetValue(0).ToString();   //session for user from 0-column from Users
                            Session["access"] = "user";
                        }
                        Response.Redirect("Mojprofil.aspx");
                    }
                    else
                    {
                        PrijavaObvestilo.Text = "Wrong data!";
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}