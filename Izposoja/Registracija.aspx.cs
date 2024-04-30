using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Izposoja
{
    //registration page
    public partial class Registracija : System.Web.UI.Page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistracija_Click(object sender, EventArgs e)
        {
            if(UporabnikObstaja())  //user exists
            {
                registracijaObvestilo.Text = "User with this e-mail address already exists.";
                registracijaObvestilo.ForeColor = System.Drawing.Color.Red;
            }
            else
                vpisiNovegaUporabnika();  // register new user
        }

        void vpisiNovegaUporabnika()  // register new user
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon); 

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[Users] ([Username],[Name],[Surname],[email],[Password]) " +
                "VALUES ('" + txtUpIme.Text + "', '" + txtIme.Text + "', '" + txtPriimek.Text + "', '" + txtEnaslov.Text + "', '" + txtGeslo.Text + "' )", con);

                cmd.ExecuteNonQuery();
                con.Close();

                registracijaObvestilo.ForeColor = System.Drawing.Color.Green;
                registracijaObvestilo.Text = "Congratulations " + txtIme.Text + "!";
                registracijaObvestilo.Text = registracijaObvestilo.Text + " <br/> You have successfully registered as " + txtUpIme.Text + "!";

                txtUpIme.Text = txtIme.Text = txtPriimek.Text = txtEnaslov.Text = "";

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool UporabnikObstaja()  // user exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon); 

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //through adapter we fill datable with select query: 
                SqlCommand cmd = new SqlCommand("SELECT * from Users where email='" + txtEnaslov.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);  
                DataTable dt = new DataTable();    
                da.Fill(dt);

                if (dt.Rows.Count >=1)  // if entry exists
                {
                   return true;
                }
                else
                {
                    registracijaObvestilo.Text = "User already exists!";
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            return false;
            }

        }
    }
}