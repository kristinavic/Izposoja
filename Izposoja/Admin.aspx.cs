using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Izposoja
{
    
    public partial class Admin : System.Web.UI.Page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    Response.Redirect("Prijava.aspx");
                }
                else
                {
                    GridView1.DataBind();   //poveže se z bazo
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnIzbrisiUporabnika_Click(object sender, EventArgs e)
        {
            if (UporabnikObstaja())
            {
                IzbrisiUporabnika();
                GridView1.DataBind();
            }
        }


        void IzbrisiUporabnika()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //povezava

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Uporabniki WHERE UporIme='" + txtUpIme.Text + "' ", con);

                cmd.ExecuteNonQuery();   //izvede
                con.Close();

                AdminUrejanjeObvestilo.Text = "Uporabnik " + txtUpIme.Text + " je izbrisan.";
            }
            catch (Exception ex)
            {
                AdminUrejanjeObvestilo.ForeColor = System.Drawing.Color.Red;
                AdminUrejanjeObvestilo.Text = "Uporabnika ni mogoče izbrisati. Preveri, če ima aktivne izposoje!";
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
                SqlCommand cmd = new SqlCommand("SELECT * from Uporabniki where UporIme='" + txtUpIme.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();     //tabela
                da.Fill(dt);

                if (dt.Rows.Count >= 1)  // če vnos obstaja
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void btnDodajUporabnika_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //povezava

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Uporabniki (UporIme,Ime,Priimek,eNaslov,Geslo) " +
                "VALUES ('" + txtUpIme.Text + "', '" + txtIme.Text + "', '" + txtPriimek.Text + "', '" + txtEnaslov.Text + "', '" + txtGeslo.Text + "' )", con);

                cmd.ExecuteNonQuery();   //izvede
                con.Close();

                AdminUrejanjeObvestilo.Text = " <br/> Uspešno dodan uporabnik " + txtUpIme.Text + "!";
                Page_Load(sender, e);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}