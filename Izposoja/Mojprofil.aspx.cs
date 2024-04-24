using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Izposoja
{
    public partial class Mojprofil : System.Web.UI.Page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    spremembaObvestilo.Text = "Prijava potekla, prijavi se ponovno.";
                    Response.Redirect("Prijava.aspx");
                }
                else
                {
                    MojeIzposojeneKnjige();

                    if (!Page.IsPostBack)
                    {
                        PoodatkiOprofilu();
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnSpremeni_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    spremembaObvestilo.Text = "Prijava potekla, prijavi se ponovno.";
                    Response.Redirect("Prijava.aspx");
                }
                else
                {
                    SpremeniPodatkeProfila();
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void SpremeniPodatkeProfila()
        {
            string geslo = string.Empty;

            if (txtNovoGeslo.Text.Trim() == "")  //če je polje za novo geslo prazno, gesla ne želim spreminjati
            {
                geslo = txtStaroGeslo.Text;
            }
            else
            {
                geslo = txtNovoGeslo.Text.Trim();
            }


            try
            {
                SqlConnection con = new SqlConnection(strdbcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update Uporabniki set UporIme='" +txtUpIme.Text+ "',Ime='" +txtIme.Text+ "',Priimek='" +txtPriimek.Text+ "',eNaslov='" +txtEnaslov.Text+ "',Geslo='" +geslo+ "' WHERE UporIme='" + Session["username"].ToString()+ "'  ", con);
                //SqlCommand cmd = new SqlCommand("update Uporabniki set UporIme=@UporIme,Ime=@Ime,Priimek=@Priimek,eNaslov=@eNaslov,Geslo=@Geslo WHERE UporIme='" + Session["username"].ToString()+ "'  ", con);

                int rezultat = cmd.ExecuteNonQuery(); //vrača effected rows in shrano v rezultat
                con.Close();

                if (rezultat > 0) //če vpliva na vsaj 1 vrstico
                {
                    spremembaObvestilo.Text = "Podatki uspešno spremenjeni!";
                    PoodatkiOprofilu();
                    MojeIzposojeneKnjige();
                }
                else
                {
                    spremembaObvestilo.Text = "Napačen vnos!";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void PoodatkiOprofilu()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Uporabniki where UporIme='" + Session["username"].ToString() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtUpIme.Text = dt.Rows[0]["UporIme"].ToString();
                txtIme.Text = dt.Rows[0]["Ime"].ToString();
                txtPriimek.Text = dt.Rows[0]["Priimek"].ToString();
                txtEnaslov.Text = dt.Rows[0]["eNaslov"].ToString();
                txtUpIme2.Text = dt.Rows[0]["UporIme"].ToString();

            }
            catch (Exception ex)
            {

            }

        }

        void MojeIzposojeneKnjige()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from EvidencaPosoje where UporIme='" + Session["username"].ToString() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewMojeIzposojene.DataSource = dt;
                GridViewMojeIzposojene.DataBind();

            }
            catch (Exception ex)
            {
                
            }
        }
    }
}