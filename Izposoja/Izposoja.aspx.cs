using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Izposoja
{
    public partial class _Izposoja : System.Web.UI.Page
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
                    GridViewIzposojeneKnjige.DataBind();
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnIDKnjige_Click(object sender, EventArgs e)
        {
            pridobiPodatke();
        }

        protected void btnIzposodi_Click(object sender, EventArgs e)
        {
            if (knjigaObstaja() && ClanObstaja())
            {
                if (izposojaObstaja())
                {
                    IzposojaObvestilo.Text = "Uporabnik že ima to knjigo.";
                }
                else
                 izdajaKnjige();
            }
            else
                IzposojaObvestilo.Text = "Napačni podatki!";

        }

        protected void btnVrni_Click(object sender, EventArgs e)
        {
            if (knjigaObstaja() && ClanObstaja())
            {
                if (izposojaObstaja())
                {
                    vrniKnjigo();
                }
                else
                    IzposojaObvestilo.Text = "Ni vnosa!";
            }
            else
                IzposojaObvestilo.Text = "Napačni podatki!";

        }


        void vrniKnjigo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Delete from EvidencaPosoje WHERE KnjigaID='" + txtKnjigaID.Text + "' AND UporIme='" + txtUporIme.Text + "'", con);
                int result = cmd.ExecuteNonQuery(); //shrani rezultat pobrisanih vrstic

                if (result > 0)
                {
                    IzposojaObvestilo.Text = "Knjiga vrnjena!";

                    GridViewIzposojeneKnjige.DataBind();
                    con.Close();
                }
                else
                {
                    IzposojaObvestilo.Text = "Napaka!";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void izdajaKnjige()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO EvidencaPosoje (UporIme,Ime,Priimek,KnjigaID,Naslov,DatumIzposoje) " +
                    "VALUES ('"+ txtUporIme.Text + "', '"+ txtIme.Text+"', '" + txtPriimek.Text+"', '"+ txtKnjigaID.Text+"', '"+ txtNaslov.Text+"', '" + txtDatumPosoje.Text+"')", con);

                cmd.ExecuteNonQuery();
                con.Close();

                IzposojaObvestilo.ForeColor = System.Drawing.Color.Green;
                IzposojaObvestilo.Text = "Knjiga izposojena!";

                GridViewIzposojeneKnjige.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool knjigaObstaja()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Knjige where KnjigaID='" + txtKnjigaID.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1) 
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
                return false;
            }
        }


        bool ClanObstaja()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                /// - za Ime
                SqlCommand cmd = new SqlCommand("select Ime, Priimek from Uporabniki where UporIme='" + txtUporIme.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                return false;
            }
        }

        bool izposojaObstaja()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from EvidencaPosoje where UporIme='" + txtUporIme.Text + "' and KnjigaID='"+txtKnjigaID.Text+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                return false;
            }
        }


        void pridobiPodatke()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // - za Naslov preko IDKnjige
                SqlCommand cmd = new SqlCommand("select Naslov from Knjige where KnjigaID='" + txtKnjigaID.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >=1) // če je pravi ID
                {
                    txtNaslov.Text = dt.Rows[0]["Naslov"].ToString(); //0-ta vrstica, stolpec Naslov
                }
                else
                {
                    IzposojaObvestilo.Text = "Napačen ID kjige!";
                }


                // - za Ime
                cmd = new SqlCommand("select Ime, Priimek from Uporabniki where UporIme='" + txtUporIme.Text + "' ", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1) // če je pravi ID
                {
                    txtIme.Text = dt.Rows[0]["Ime"].ToString(); //0-ta vrstica, stolpec Ime
                    txtPriimek.Text = dt.Rows[0]["Priimek"].ToString(); //0-ta vrstica, stolpec Ime
                }
                else
                {
                    IzposojaObvestilo.Text = "Napačno uporabniško ime!";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}