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
    public partial class Prijava : System.Web.UI.Page
    {
        //static string connectionString = @"Data Source=.\sqlexpress;Initial Catalog=Izposoja;Integrated Security=True";

        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dostop"] != null)
                {
                    Response.Redirect("Mojprofil.aspx");
                }
        }


        protected void btnPrijava_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUpIme.Text == "kristina")
                {
                    SqlConnection con = new SqlConnection(strdbcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("select * from Uporabniki where UporIme='" + txtUpIme.Text + "' and Geslo='" + txtGesloPrijava.Text + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader(); //dr je povezan z DB, izvede query

                    if (dr.HasRows) //napačen vnos gesla/up.imena ne bo imel vrstic
                    {
                        while (dr.Read())
                        {
                            Response.Write("<script>alert('Prijava uporabnika " + dr.GetValue(0).ToString() + " uspešna!'); </script>");

                            Session["username"] = dr.GetValue(0).ToString();   //session za uporabnika iz 0-tega stolpca tabele Uporabniki
                            Session["dostop"] = "admin";
                        }
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        PrijavaObvestilo.Text = "Napačni podatki!";
                    }
                }
                else
                {
                    SqlConnection con = new SqlConnection(strdbcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("select * from Uporabniki where UporIme='" + txtUpIme.Text + "' and Geslo='" + txtGesloPrijava.Text + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader(); //dr je povezan z DB, izvede query

                    if (dr.HasRows) //napačen vnos gesla/up.imena ne bo imel vrstic
                    {
                        while (dr.Read())
                        {
                            Response.Write("<script>alert('Prijava uporabnika " + dr.GetValue(0).ToString() + " uspešna!'); </script>");

                            Session["username"] = dr.GetValue(0).ToString();   //session za uporabnika iz 0-tega stolpca tabele Uporabniki
                            Session["dostop"] = "user";
                        }
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        PrijavaObvestilo.Text = "Napačni podatki!";
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