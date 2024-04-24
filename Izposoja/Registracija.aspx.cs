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
    public partial class Registracija : System.Web.UI.Page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistracija_Click(object sender, EventArgs e)
        {
            if(UporabnikObstaja())
            {
                registracijaObvestilo.Text = "Uporabnik s tem e-naslovom že obstaja.";
                registracijaObvestilo.ForeColor = System.Drawing.Color.Red;
            }
            else
                vpisiNovegaUporabnika();
        }

        void vpisiNovegaUporabnika()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //povezava

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[Uporabniki] ([UporIme],[Ime],[Priimek],[eNaslov],[Geslo]) " +
                "VALUES ('" + txtUpIme.Text + "', '" + txtIme.Text + "', '" + txtPriimek.Text + "', '" + txtEnaslov.Text + "', '" + txtGeslo.Text + "' )", con);

                cmd.ExecuteNonQuery();   //izvede
                con.Close();

                registracijaObvestilo.ForeColor = System.Drawing.Color.Green;
                registracijaObvestilo.Text = "Čestitam " + txtIme.Text + "!";
                registracijaObvestilo.Text = registracijaObvestilo.Text + " <br/> Uspešno si se registriral/-a kot " + txtUpIme.Text + "!";

                txtUpIme.Text = txtIme.Text = txtPriimek.Text = txtEnaslov.Text = "";

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool UporabnikObstaja()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //povezava

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //preko adapterja napolnemo tabelo s select poizvedbo:
                SqlCommand cmd = new SqlCommand("SELECT * from Uporabniki where eNaslov='" + txtEnaslov.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);  
                DataTable dt = new DataTable();     //tabela
                da.Fill(dt);

                if (dt.Rows.Count >=1)  // če vnos obstaja
                {
                   return true;
                }
                else
                {
                    registracijaObvestilo.Text = "Uporabnik že obstaja!";
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