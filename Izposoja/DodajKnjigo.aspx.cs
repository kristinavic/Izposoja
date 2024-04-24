using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Microsoft.AspNet.FriendlyUrls.Resolvers;
using System.IO;

namespace Izposoja
{
    public partial class DodajKnjigo : System.Web.UI.Page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        static string img_filepath;

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
                    GridViewKnjige.DataBind();
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnDodaj_Click(object sender, EventArgs e)
        {
            if (KnjigaObstaja())
            {
                DodajKnjigoObvestilo.ForeColor = System.Drawing.Color.Red;
                DodajKnjigoObvestilo.Text = "Knjiga že obstaja.";
            }
            else
                DodajNovoKnjigo();
        }

        protected void btnSpremeni_Click(object sender, EventArgs e)
        {
            spremeniKnjigo();
        }

        protected void btnBrisi_Click(object sender, EventArgs e)
        {
            izbrisiKnjigo();
        }

        protected void btnNajdiKnjigo_Click(object sender, EventArgs e)
        {
            isciIDKnjige();
        }

        void izbrisiKnjigo()
        {
            if (KnjigaObstaja())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strdbcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Knjige WHERE KnjigaID='" + txtIDKnjige.Text + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    DodajKnjigoObvestilo.Text = "Knjiga izbrisana!";

                    GridViewKnjige.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }
        void spremeniKnjigo()
        {
            if (KnjigaObstaja())
            {
                try
                {
                    //preverimo izbrane zvrsti
                    string zvrst = "";

                    foreach (int i in ListBoxZvrst.GetSelectedIndices())
                    {
                        zvrst = zvrst + ListBoxZvrst.Items[i] + ",";
                    }
                    zvrst = zvrst.Remove(zvrst.Length - 1);


                    //v spremenljivko shranimo pot do knjige
                    string filepath = "~/bookcovers";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    if (filename == "" || filename == null)  //če ne spreminjamo slike
                    {
                        filepath = img_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("bookcovers/" + filename));
                        filepath = "~/bookcovers/" + filename;     //novo ime nove slike
                    }


                    //povezava z bazo
                    SqlConnection con = new SqlConnection(strdbcon);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE Knjige SET Naslov=@Naslov,  Avtor=@Avtor, LetoIzdaje=@LetoIzdaje, Zvrst=@Zvrst, Lastnik=@Lastnik, Opis=@Opis, Slika=@Slika WHERE KnjigaID='"+txtIDKnjige.Text+"'   ", con);
                    cmd.Parameters.AddWithValue("@Naslov", txtNaslov.Text);
                    cmd.Parameters.AddWithValue("@Avtor", txtAvtor.Text);
                    cmd.Parameters.AddWithValue("@LetoIzdaje", txtLeto.Text.ToString());
                    cmd.Parameters.AddWithValue("@Zvrst", zvrst);
                    cmd.Parameters.AddWithValue("@Lastnik", txtLastnik.Text);
                    cmd.Parameters.AddWithValue("@Opis", txtOpis.Text);
                    cmd.Parameters.AddWithValue("@Slika", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();

                    DodajKnjigoObvestilo.Text = "Podatki o knjigi spremenjeni!";
                    txtIDKnjige.Text = txtNaslov.Text = txtAvtor.Text = txtLeto.Text = txtLastnik.Text = txtOpis.Text = string.Empty;
                    GridViewKnjige.DataBind();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                DodajKnjigoObvestilo.ForeColor = System.Drawing.Color.Red;
                DodajKnjigoObvestilo.Text = "Napačni podatki!";
            }
        }
        void isciIDKnjige()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Knjige WHERE KnjigaID='" + txtIDKnjige.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtLastnik.Text = dt.Rows[0]["Lastnik"].ToString(); //vrstica 0 in stolpec z imenom
                    txtNaslov.Text = dt.Rows[0]["Naslov"].ToString();
                    txtAvtor.Text = dt.Rows[0]["Avtor"].ToString();
                    txtLeto.Text = dt.Rows[0]["LetoIzdaje"].ToString();
                    txtOpis.Text = dt.Rows[0]["Opis"].ToString();


                    //listbox - zvrst
                    ListBoxZvrst.ClearSelection();

                    string[] zvrst = dt.Rows[0]["Zvrst"].ToString().Split(','); //kjer je , razbije string

                    for (int i = 0; i < zvrst.Length; i++) //izvede se tolikokrat, kot je naštetih zvrsti pri knjigi
                    {
                        for (int j = 0; j < ListBoxZvrst.Items.Count; j++) //preveri vse elemente listboxa
                        {
                            if (ListBoxZvrst.Items[j].ToString() == zvrst[i]) // če se ujemata, ga izbere
                            {
                                ListBoxZvrst.Items[j].Selected = true;
                            }
                        }
                    }

                    //link za sliko
                    img_filepath = dt.Rows[0]["Slika"].ToString();
                }
                else
                {
                    DodajKnjigoObvestilo.ForeColor = System.Drawing.Color.Red;
                    DodajKnjigoObvestilo.Text = "Knjige ne najdem.";
                }

            }
            catch (Exception ex)
            {

            }

        }

        bool KnjigaObstaja()
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //povezava

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //preko adapterja napolnemo tabelo s select poizvedbo:
                SqlCommand cmd = new SqlCommand("SELECT * from Knjige where KnjigaID='" + txtIDKnjige.Text + "' OR Naslov='" + txtNaslov.Text + "' ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();     //tabela
                da.Fill(dt);

                if (dt.Rows.Count >= 1)  // če knjiga obstaja
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

        void DodajNovoKnjigo()
        {
            try
            {
                string zvrst = "";

                //za izbor več zvrsti naenkrat
                foreach (int i in ListBoxZvrst.GetSelectedIndices() )
                {
                    zvrst = zvrst + ListBoxZvrst.Items[i] + ",";  // zvrst + izbrana zvrst na i-ti poziciji
                }
                zvrst = zvrst.Remove(zvrst.Length - 1);  //pobrišem vejico


                //fileupload
                string filepath = "~/bookcovers/";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);  // v filename se shrani ime slike (FileName), naložena preko FileUpload1 v .aspx
                FileUpload1.SaveAs(Server.MapPath("bookcovers/" + filename));   //pot do izbrane slike
                filepath = "~/bookcovers/" + filename;  // mapa + preostanek imena 


                SqlConnection con = new SqlConnection(strdbcon);  //povezava

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //preko adapterja napolnemo tabelo s select poizvedbo:
                SqlCommand cmd = new SqlCommand("INSERT INTO Knjige (KnjigaID,Naslov,Avtor,LetoIzdaje,Zvrst,Lastnik,Opis,Slika) " +
                    "VALUES ('" + txtIDKnjige.Text+ "', '" + txtNaslov.Text + "', '"+ txtAvtor.Text + "', '"+ txtLeto.Text.ToString() + "','"+ zvrst + "', '"+ txtLastnik.Text + "', '"+ txtOpis.Text + "',  '"+ filepath + "') ", con);
                
                cmd.ExecuteNonQuery();
                con.Close();
                DodajKnjigoObvestilo.Text = "Knjiga dodana!";
                txtIDKnjige.Text = txtNaslov.Text = txtAvtor.Text = txtLeto.Text = txtLastnik.Text = txtOpis.Text = string.Empty;
                GridViewKnjige.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}