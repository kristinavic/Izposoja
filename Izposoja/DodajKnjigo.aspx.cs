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
                    GridViewBooks.DataBind();
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnDodaj_Click(object sender, EventArgs e)    // btn add
        {
            if (KnjigaObstaja())
            {
                DodajKnjigoObvestilo.ForeColor = System.Drawing.Color.Red;
                DodajKnjigoObvestilo.Text = "Book already exists.";
            }
            else
                DodajNovoKnjigo();
        }

        protected void btnSpremeni_Click(object sender, EventArgs e)  // btn change
        {
            spremeniKnjigo();
        }

        protected void btnBrisi_Click(object sender, EventArgs e)      //btn delete
        {
            izbrisiKnjigo();  
        }

        protected void btnNajdiKnjigo_Click(object sender, EventArgs e)   // btn find book
        {
            isciIDKnjige();
        }

        void izbrisiKnjigo()        //delete book
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

                    SqlCommand cmd = new SqlCommand("DELETE from Books WHERE BookID='" + txtIDKnjige.Text + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    DodajKnjigoObvestilo.Text = "Book deleted!";

                    GridViewBooks.DataBind();

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
                    //check selected genres
                    string zvrst = "";

                    foreach (int i in ListBoxZvrst.GetSelectedIndices())
                    {
                        zvrst = zvrst + ListBoxZvrst.Items[i] + ",";
                    }
                    zvrst = zvrst.Remove(zvrst.Length - 1);


                    //picture filepath saved in variable 
                    string filepath = "~/bookcovers";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    if (filename == "" || filename == null)  //if we don't change picture
                    {
                        filepath = img_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("bookcovers/" + filename));
                        filepath = "~/bookcovers/" + filename;     //new picture name
                    }


                    //connection with database
                    SqlConnection con = new SqlConnection(strdbcon);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE Books SET Title=@Title,  Author=@Author, PublicationYear=@PublicationYear, Genre=@Genre, Owner=@Owner, Description=@Description, Picture=@Picture WHERE BookID='" + txtIDKnjige.Text+"'   ", con);
                    cmd.Parameters.AddWithValue("@Title", txtNaslov.Text);
                    cmd.Parameters.AddWithValue("@Author", txtAvtor.Text);
                    cmd.Parameters.AddWithValue("@PublicationYear", txtLeto.Text.ToString());
                    cmd.Parameters.AddWithValue("@Genre", zvrst);
                    cmd.Parameters.AddWithValue("@Owner", txtLastnik.Text);
                    cmd.Parameters.AddWithValue("@Description", txtOpis.Text);
                    cmd.Parameters.AddWithValue("@Picture", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();

                    DodajKnjigoObvestilo.Text = "Book data are now changed!";
                    txtIDKnjige.Text = txtNaslov.Text = txtAvtor.Text = txtLeto.Text = txtLastnik.Text = txtOpis.Text = string.Empty;
                    GridViewBooks.DataBind();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                DodajKnjigoObvestilo.ForeColor = System.Drawing.Color.Red;
                DodajKnjigoObvestilo.Text = "Wrong entry!";
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
                SqlCommand cmd = new SqlCommand("SELECT * from Books WHERE BookID='" + txtIDKnjige.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtLastnik.Text = dt.Rows[0]["Owner"].ToString(); //row 0 and column with name
                    txtNaslov.Text = dt.Rows[0]["Title"].ToString();
                    txtAvtor.Text = dt.Rows[0]["Author"].ToString();
                    txtLeto.Text = dt.Rows[0]["PublicationYear"].ToString();
                    txtOpis.Text = dt.Rows[0]["Description"].ToString();


                    //listbox - genre
                    ListBoxZvrst.ClearSelection();

                    string[] zvrst = dt.Rows[0]["Genre"].ToString().Split(','); //where it is, it breaks string

                    for (int i = 0; i < zvrst.Length; i++) //executes as many times as there are genres at the book
                    {
                        for (int j = 0; j < ListBoxZvrst.Items.Count; j++) //checks every element of listbox
                        {
                            if (ListBoxZvrst.Items[j].ToString() == zvrst[i]) // if matching, it selects it
                            {
                                ListBoxZvrst.Items[j].Selected = true;
                            }
                        }
                    }

                    //link za sliko
                    img_filepath = dt.Rows[0]["Picture"].ToString();
                }
                else
                {
                    DodajKnjigoObvestilo.ForeColor = System.Drawing.Color.Red;
                    DodajKnjigoObvestilo.Text = "Can't find the book.";
                }

            }
            catch (Exception ex)
            {

            }

        }

        bool KnjigaObstaja()   // book exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //connection

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //through adapter you fill datatable with select query: 
                SqlCommand cmd = new SqlCommand("SELECT * from Books where BookID='" + txtIDKnjige.Text + "' OR Title='" + txtNaslov.Text + "' ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();     
                da.Fill(dt);

                if (dt.Rows.Count >= 1)  //if book exists
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

        void DodajNovoKnjigo()          // add new book
        {
            try
            {
                string zvrst = "";

                //select multiple genres
                foreach (int i in ListBoxZvrst.GetSelectedIndices() )
                {
                    zvrst = zvrst + ListBoxZvrst.Items[i] + ",";  // genre and selected genre at [i] position
                }
                zvrst = zvrst.Remove(zvrst.Length - 1);  //deletes comma (,)


                //fileupload
                string filepath = "~/bookcovers/";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);  // through FileUpload1 in .aspx the name of the picture (FileName) gets saved in 'filename' 
                FileUpload1.SaveAs(Server.MapPath("bookcovers/" + filename));   //path to the saved picture
                filepath = "~/bookcovers/" + filename;  // location + the rest of the name 


                SqlConnection con = new SqlConnection(strdbcon);  

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //preko adapterja napolnemo tabelo s select poizvedbo:
                SqlCommand cmd = new SqlCommand("INSERT INTO Books (BookID,Title,Author,PublicationYear,Genre,Owner,Description,Picture) " +
                    "VALUES ('" + txtIDKnjige.Text+ "', '" + txtNaslov.Text + "', '"+ txtAvtor.Text + "', '"+ txtLeto.Text.ToString() + "','"+ zvrst + "', '"+ txtLastnik.Text + "', '"+ txtOpis.Text + "',  '"+ filepath + "') ", con);
                
                cmd.ExecuteNonQuery();
                con.Close();
                DodajKnjigoObvestilo.Text = "Book added!";
                txtIDKnjige.Text = txtNaslov.Text = txtAvtor.Text = txtLeto.Text = txtLastnik.Text = txtOpis.Text = string.Empty;
                GridViewBooks.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}